#include "ExternalUserDefinedExecutableFunctionsLoader.h"

#include <DataTypes/DataTypeFactory.h>

#include <Interpreters/UserDefinedExecutableFunction.h>
#include <Interpreters/UserDefinedExecutableFunctionFactory.h>
#include <Functions/FunctionFactory.h>
#include <AggregateFunctions/AggregateFunctionFactory.h>


namespace DB
{

namespace ErrorCodes
{
    extern const int BAD_ARGUMENTS;
    extern const int FUNCTION_ALREADY_EXISTS;
}

ExternalUserDefinedExecutableFunctionsLoader::ExternalUserDefinedExecutableFunctionsLoader(ContextPtr global_context_)
    : ExternalLoader("external user defined function", &Poco::Logger::get("ExternalUserDefinedExecutableFunctionsLoader"))
    , WithContext(global_context_)
{
    setConfigSettings({"function", "name", "database", "uuid"});
    enableAsyncLoading(false);
    enablePeriodicUpdates(true);
    enableAlwaysLoadEverything(true);
}

ExternalUserDefinedExecutableFunctionsLoader::UserDefinedExecutableFunctionPtr ExternalUserDefinedExecutableFunctionsLoader::getUserDefinedFunction(const std::string & user_defined_function_name) const
{
    return std::static_pointer_cast<const UserDefinedExecutableFunction>(load(user_defined_function_name));
}

ExternalUserDefinedExecutableFunctionsLoader::UserDefinedExecutableFunctionPtr ExternalUserDefinedExecutableFunctionsLoader::tryGetUserDefinedFunction(const std::string & user_defined_function_name) const
{
    return std::static_pointer_cast<const UserDefinedExecutableFunction>(tryLoad(user_defined_function_name));
}

void ExternalUserDefinedExecutableFunctionsLoader::reloadFunction(const std::string & user_defined_function_name) const
{
    loadOrReload(user_defined_function_name);
}

ExternalLoader::LoadablePtr ExternalUserDefinedExecutableFunctionsLoader::create(const std::string & name,
    const Poco::Util::AbstractConfiguration & config,
    const std::string & key_in_config,
    const std::string &) const
{
    if (FunctionFactory::instance().hasNameOrAlias(name))
        throw Exception(ErrorCodes::FUNCTION_ALREADY_EXISTS, "The function '{}' already exists", name);

    if (AggregateFunctionFactory::instance().hasNameOrAlias(name))
        throw Exception(ErrorCodes::FUNCTION_ALREADY_EXISTS, "The aggregate function '{}' already exists", name);

    String type = config.getString(key_in_config + ".type");

    bool is_executable_pool;

    if (type == "executable")
        is_executable_pool = false;
    else if (type == "executable_pool")
        is_executable_pool = true;
    else
        throw Exception(ErrorCodes::BAD_ARGUMENTS,
            "Wrong user defined function type expected 'executable' or 'executable_pool' actual {}",
            type);

    String scipt_name_with_arguments_value = config.getString(key_in_config + ".command");

    std::vector<String> script_name_with_arguments;
    boost::split(script_name_with_arguments, scipt_name_with_arguments_value, [](char c) { return c == ' '; });

    auto script_path = script_name_with_arguments[0];
    script_name_with_arguments.erase(script_name_with_arguments.begin());

    String format = config.getString(key_in_config + ".format");
    DataTypePtr result_type = DataTypeFactory::instance().get(config.getString(key_in_config + ".return_type"));
    bool send_chunk_header = config.getBool(key_in_config + ".send_chunk_header", false);

    size_t pool_size = 0;
    size_t command_termination_timeout = 0;
    size_t max_command_execution_time = 0;
    if (is_executable_pool)
    {
        pool_size = config.getUInt64(key_in_config + ".pool_size", 16);
        command_termination_timeout = config.getUInt64(key_in_config + ".command_termination_timeout", 10);
        max_command_execution_time = config.getUInt64(key_in_config + ".max_command_execution_time", 10);

        size_t max_execution_time_seconds = static_cast<size_t>(getContext()->getSettings().max_execution_time.totalSeconds());
        if (max_execution_time_seconds != 0 && max_command_execution_time > max_execution_time_seconds)
            max_command_execution_time = max_execution_time_seconds;
    }

    ExternalLoadableLifetime lifetime;

    if (config.has(key_in_config + ".lifetime"))
        lifetime = ExternalLoadableLifetime(config, key_in_config + ".lifetime");

    std::vector<DataTypePtr> argument_types;

    Poco::Util::AbstractConfiguration::Keys config_elems;
    config.keys(key_in_config, config_elems);

    for (const auto & config_elem : config_elems)
    {
        if (!startsWith(config_elem, "argument"))
            continue;

        const auto argument_prefix = key_in_config + '.' + config_elem + '.';
        auto argument_type = DataTypeFactory::instance().get(config.getString(argument_prefix + "type"));
        argument_types.emplace_back(std::move(argument_type));
    }

    UserDefinedExecutableFunctionConfiguration function_configuration
    {
        .name = std::move(name), //-V1030
        .script_path = std::move(script_path), //-V1030
        .script_arguments = std::move(script_name_with_arguments), //-V1030
        .argument_types = std::move(argument_types), //-V1030
        .result_type = std::move(result_type), //-V1030
    };

    ShellCommandCoordinator::Configuration shell_command_coordinator_configration
    {
        .format = std::move(format), //-V1030
        .pool_size = pool_size,
        .command_termination_timeout = command_termination_timeout,
        .max_command_execution_time = max_command_execution_time,
        .is_executable_pool = is_executable_pool,
        .send_chunk_header = send_chunk_header,
        .execute_direct = true
    };

    std::shared_ptr<ShellCommandCoordinator> coordinator = std::make_shared<ShellCommandCoordinator>(shell_command_coordinator_configration);

    return std::make_shared<UserDefinedExecutableFunction>(function_configuration, coordinator, lifetime);
}

}
