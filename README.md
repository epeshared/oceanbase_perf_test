# oceanbase_perf_test

##Oceanbase reousrce configuration
创建资源单元
create resource unit sysbench_unit max_cpu 144, max_memory '60G', max_iops 128, max_disk_size 53687091200, max_session_num 64, MIN_CPU=144, MIN_MEMORY='60G', MIN_IOPS=128;
创建资源池
create resource pool sysbench_pool unit = 'sysbench_unit', unit_num = 1, zone_list=('zone1');
创建租户
create tenant sysbench_tenant resource_pool_list=('sysbench_pool'), charset=utf8mb4, replica_num=1, zone_list('zone1'), primary_zone=RANDOM, locality='F@zone1' set variables ob_compatibility_mode='mysql', ob_tcp_invited_nodes='%';

alter system set enable_auto_leader_switch=false;
alter system set enable_one_phase_commit=false;
alter system set weak_read_version_refresh_interval='5s';
alter system set system_memory ='30G';
alter system set syslog_level='PERF';
alter system set max_syslog_file_count=100;
alter system set enable_syslog_recycle='True';
alter system set trace_log_slow_query_watermark='10s';
alter system set large_query_threshold='1s';
alter system set clog_sync_time_warn_threshold='2000ms';
alter system set syslog_io_bandwidth_limit='10M';
alter system set enable_sql_audit=false;
alter system set enable_perf_event=false; 
alter system set clog_max_unconfirmed_log_count=5000;
alter system set memory_chunk_cache_size ='16G';
alter system set autoinc_cache_refresh_interval='86400s';
alter system set cpu_quota_concurrency=2;
alter system set enable_early_lock_release=false tenant=all;
alter system set  default_compress_func = 'lz4_1.0';

##把日志聚合，减小网络开销，提高并发读
alter system set _clog_aggregation_buffer_amount=4;
alter system set _flush_clog_aggregation_buffer_timeout='1ms';
set global ob_timestamp_service='GTS';
set global autocommit=ON;
set global ob_query_timeout=36000000000;
set global ob_trx_timeout=36000000000;
set global max_allowed_packet=67108864;
set global ob_sql_work_area_percentage=100;
/*
parallel_max_servers推荐设置为测试租户分配的resource unit cpu数的10倍
如测试租户使用的unit配置为：create resource unit $unit_name max_cpu 26
那么该值设置为260
parallel_server_target推荐设置为parallel_max_servers * 机器数*0.8
那么该值为260*3*0.8=624
*/
set global parallel_max_servers=1440;
set global parallel_servers_target=1152;

/* change it when number of total core > 64 */
alter system set net_thread_count = 24;
