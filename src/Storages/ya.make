# This file is generated automatically, do not edit. See 'ya.make.in' and use 'utils/generate-ya-make' to regenerate it.
OWNER(g:clickhouse)

LIBRARY()

PEERDIR(
    clickhouse/src/Common
    contrib/libs/sparsehash
    contrib/libs/poco/MongoDB
)


SRCS(
    AlterCommands.cpp
    ColumnDefault.cpp
    ColumnsDescription.cpp
    ConstraintsDescription.cpp
    Distributed/DirectoryMonitor.cpp
    Distributed/DistributedSettings.cpp
    Distributed/DistributedSink.cpp
    IStorage.cpp
    IndicesDescription.cpp
    JoinSettings.cpp
    KeyDescription.cpp
    LiveView/StorageLiveView.cpp
    LiveView/TemporaryLiveViewCleaner.cpp
    MemorySettings.cpp
    MergeTree/ActiveDataPartSet.cpp
    MergeTree/AllMergeSelector.cpp
    MergeTree/BackgroundJobsExecutor.cpp
    MergeTree/BoolMask.cpp
    MergeTree/DataPartsExchange.cpp
    MergeTree/DropPartsRanges.cpp
    MergeTree/EphemeralLockInZooKeeper.cpp
    MergeTree/IMergeTreeDataPart.cpp
    MergeTree/IMergeTreeDataPartWriter.cpp
    MergeTree/IMergeTreeReader.cpp
    MergeTree/IMergedBlockOutputStream.cpp
    MergeTree/KeyCondition.cpp
    MergeTree/LevelMergeSelector.cpp
    MergeTree/MergeAlgorithm.cpp
    MergeTree/MergeList.cpp
    MergeTree/MergeTreeBaseSelectProcessor.cpp
    MergeTree/MergeTreeBlockReadUtils.cpp
    MergeTree/MergeTreeData.cpp
    MergeTree/MergeTreeDataMergerMutator.cpp
    MergeTree/MergeTreeDataPartChecksum.cpp
    MergeTree/MergeTreeDataPartCompact.cpp
    MergeTree/MergeTreeDataPartInMemory.cpp
    MergeTree/MergeTreeDataPartTTLInfo.cpp
    MergeTree/MergeTreeDataPartType.cpp
    MergeTree/MergeTreeDataPartUUID.cpp
    MergeTree/MergeTreeDataPartWide.cpp
    MergeTree/MergeTreeDataPartWriterCompact.cpp
    MergeTree/MergeTreeDataPartWriterInMemory.cpp
    MergeTree/MergeTreeDataPartWriterOnDisk.cpp
    MergeTree/MergeTreeDataPartWriterWide.cpp
    MergeTree/MergeTreeDataSelectExecutor.cpp
    MergeTree/MergeTreeDataWriter.cpp
    MergeTree/MergeTreeDeduplicationLog.cpp
    MergeTree/MergeTreeIndexAggregatorBloomFilter.cpp
    MergeTree/MergeTreeIndexBloomFilter.cpp
    MergeTree/MergeTreeIndexConditionBloomFilter.cpp
    MergeTree/MergeTreeIndexFullText.cpp
    MergeTree/MergeTreeIndexGranularity.cpp
    MergeTree/MergeTreeIndexGranularityInfo.cpp
    MergeTree/MergeTreeIndexGranuleBloomFilter.cpp
    MergeTree/MergeTreeIndexMinMax.cpp
    MergeTree/MergeTreeIndexReader.cpp
    MergeTree/MergeTreeIndexSet.cpp
    MergeTree/MergeTreeIndices.cpp
    MergeTree/MergeTreeMarksLoader.cpp
    MergeTree/MergeTreeMutationEntry.cpp
    MergeTree/MergeTreeMutationStatus.cpp
    MergeTree/MergeTreePartInfo.cpp
    MergeTree/MergeTreePartition.cpp
    MergeTree/MergeTreePartsMover.cpp
    MergeTree/MergeTreeProjections.cpp
    MergeTree/MergeTreeRangeReader.cpp
    MergeTree/MergeTreeReadPool.cpp
    MergeTree/MergeTreeReaderCompact.cpp
    MergeTree/MergeTreeReaderInMemory.cpp
    MergeTree/MergeTreeReaderStream.cpp
    MergeTree/MergeTreeReaderWide.cpp
    MergeTree/MergeTreeReverseSelectProcessor.cpp
    MergeTree/MergeTreeSelectProcessor.cpp
    MergeTree/MergeTreeSequentialSource.cpp
    MergeTree/MergeTreeSettings.cpp
    MergeTree/MergeTreeSink.cpp
    MergeTree/MergeTreeThreadSelectProcessor.cpp
    MergeTree/MergeTreeWhereOptimizer.cpp
    MergeTree/MergeTreeWriteAheadLog.cpp
    MergeTree/MergeType.cpp
    MergeTree/MergedBlockOutputStream.cpp
    MergeTree/MergedColumnOnlyOutputStream.cpp
    MergeTree/PartMovesBetweenShardsOrchestrator.cpp
    MergeTree/PartitionPruner.cpp
    MergeTree/PinnedPartUUIDs.cpp
    MergeTree/ReplicatedFetchList.cpp
    MergeTree/ReplicatedMergeTreeAddress.cpp
    MergeTree/ReplicatedMergeTreeAltersSequence.cpp
    MergeTree/ReplicatedMergeTreeCleanupThread.cpp
    MergeTree/ReplicatedMergeTreeLogEntry.cpp
    MergeTree/ReplicatedMergeTreeMergeStrategyPicker.cpp
    MergeTree/ReplicatedMergeTreeMutationEntry.cpp
    MergeTree/ReplicatedMergeTreePartCheckThread.cpp
    MergeTree/ReplicatedMergeTreePartHeader.cpp
    MergeTree/ReplicatedMergeTreeQueue.cpp
    MergeTree/ReplicatedMergeTreeRestartingThread.cpp
    MergeTree/ReplicatedMergeTreeSink.cpp
    MergeTree/ReplicatedMergeTreeTableMetadata.cpp
    MergeTree/SimpleMergeSelector.cpp
    MergeTree/TTLMergeSelector.cpp
    MergeTree/checkDataPart.cpp
    MergeTree/localBackup.cpp
    MergeTree/registerStorageMergeTree.cpp
    MutationCommands.cpp
    MySQL/MySQLSettings.cpp
    PartitionCommands.cpp
    ProjectionsDescription.cpp
    ReadFinalForExternalReplicaStorage.cpp
    ReadInOrderOptimizer.cpp
    SelectQueryDescription.cpp
    SetSettings.cpp
    StorageBuffer.cpp
    StorageDictionary.cpp
    StorageDistributed.cpp
    StorageExternalDistributed.cpp
    StorageFactory.cpp
    StorageFile.cpp
    StorageGenerateRandom.cpp
    StorageInMemoryMetadata.cpp
    StorageInput.cpp
    StorageJoin.cpp
    StorageLog.cpp
    StorageLogSettings.cpp
    StorageMaterializedMySQL.cpp
    StorageMaterializedView.cpp
    StorageMemory.cpp
    StorageMerge.cpp
    StorageMergeTree.cpp
    StorageMongoDB.cpp
    StorageMongoDBSocketFactory.cpp
    StorageMySQL.cpp
    StorageNull.cpp
    StorageReplicatedMergeTree.cpp
    StorageSQLite.cpp
    StorageSet.cpp
    StorageStripeLog.cpp
    StorageTinyLog.cpp
    StorageURL.cpp
    StorageValues.cpp
    StorageView.cpp
    StorageXDBC.cpp
    System/StorageSystemAggregateFunctionCombinators.cpp
    System/StorageSystemAsynchronousMetrics.cpp
    System/StorageSystemBuildOptions.cpp
    System/StorageSystemClusters.cpp
    System/StorageSystemCollations.cpp
    System/StorageSystemColumns.cpp
    System/StorageSystemContributors.cpp
    System/StorageSystemContributors.generated.cpp
    System/StorageSystemCurrentRoles.cpp
    System/StorageSystemDDLWorkerQueue.cpp
    System/StorageSystemDataSkippingIndices.cpp
    System/StorageSystemDataTypeFamilies.cpp
    System/StorageSystemDatabases.cpp
    System/StorageSystemDetachedParts.cpp
    System/StorageSystemDictionaries.cpp
    System/StorageSystemDisks.cpp
    System/StorageSystemDistributionQueue.cpp
    System/StorageSystemEnabledRoles.cpp
    System/StorageSystemErrors.cpp
    System/StorageSystemEvents.cpp
    System/StorageSystemFormats.cpp
    System/StorageSystemFunctions.cpp
    System/StorageSystemGrants.cpp
    System/StorageSystemGraphite.cpp
    System/StorageSystemMacros.cpp
    System/StorageSystemMergeTreeSettings.cpp
    System/StorageSystemMerges.cpp
    System/StorageSystemMetrics.cpp
    System/StorageSystemModels.cpp
    System/StorageSystemMutations.cpp
    System/StorageSystemNumbers.cpp
    System/StorageSystemOne.cpp
    System/StorageSystemPartMovesBetweenShards.cpp
    System/StorageSystemParts.cpp
    System/StorageSystemPartsBase.cpp
    System/StorageSystemPartsColumns.cpp
    System/StorageSystemPrivileges.cpp
    System/StorageSystemProcesses.cpp
    System/StorageSystemProjectionParts.cpp
    System/StorageSystemProjectionPartsColumns.cpp
    System/StorageSystemQuotaLimits.cpp
    System/StorageSystemQuotaUsage.cpp
    System/StorageSystemQuotas.cpp
    System/StorageSystemQuotasUsage.cpp
    System/StorageSystemReplicas.cpp
    System/StorageSystemReplicatedFetches.cpp
    System/StorageSystemReplicationQueue.cpp
    System/StorageSystemRoleGrants.cpp
    System/StorageSystemRoles.cpp
    System/StorageSystemRowPolicies.cpp
    System/StorageSystemSettings.cpp
    System/StorageSystemSettingsProfileElements.cpp
    System/StorageSystemSettingsProfiles.cpp
    System/StorageSystemStackTrace.cpp
    System/StorageSystemStoragePolicies.cpp
    System/StorageSystemTableEngines.cpp
    System/StorageSystemTableFunctions.cpp
    System/StorageSystemTables.cpp
    System/StorageSystemUserDirectories.cpp
    System/StorageSystemUsers.cpp
    System/StorageSystemWarnings.cpp
    System/StorageSystemZeros.cpp
    System/StorageSystemZooKeeper.cpp
    System/attachSystemTables.cpp
    TTLDescription.cpp
    VirtualColumnUtils.cpp
    extractKeyExpressionList.cpp
    getStructureOfRemoteTable.cpp
    registerStorages.cpp
    transformQueryForExternalDatabase.cpp

)

END()
