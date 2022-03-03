# oceanbase_perf_test

## Performance Test Result

### sysbench
1. Read Only (TPS)<br>

| ARCH     | numactl c0    |       |
|----------|:-------------:|------:|
| SPR E0   |     16332     |       |
| ICX      |               |       |


## Oceanbase reousrce configuration
<br>
创建资源单元<br>
create resource unit sysbench_unit max_cpu 144, max_memory '60G', max_iops 128, max_disk_size 53687091200, max_session_num 64, MIN_CPU=144, MIN_MEMORY='60G', MIN_IOPS=128;<br>
创建资源池<br>
create resource pool sysbench_pool unit = 'sysbench_unit', unit_num = 1, zone_list=('zone1');<br>
创建租户<br>
create tenant sysbench_tenant resource_pool_list=('sysbench_pool'), charset=utf8mb4, replica_num=1, zone_list('zone1'), primary_zone=RANDOM, locality='F@zone1' set variables ob_compatibility_mode='mysql', ob_tcp_invited_nodes='%';<br>
<br>
alter system set enable_auto_leader_switch=false;<br>
alter system set enable_one_phase_commit=false;<br>
alter system set weak_read_version_refresh_interval='5s';<br>
alter system set system_memory ='30G';<br>
alter system set syslog_level='PERF';<br>
alter system set max_syslog_file_count=100;<br>
alter system set enable_syslog_recycle='True';<br>
alter system set trace_log_slow_query_watermark='10s';<br>
alter system set large_query_threshold='1s';<br>
alter system set clog_sync_time_warn_threshold='2000ms';<br>
alter system set syslog_io_bandwidth_limit='10M';<br>
alter system set enable_sql_audit=false;<br>
alter system set enable_perf_event=false; <br>
alter system set clog_max_unconfirmed_log_count=5000;<br>
alter system set memory_chunk_cache_size ='16G';<br>
alter system set autoinc_cache_refresh_interval='86400s';<br>
alter system set cpu_quota_concurrency=2;<br>
alter system set enable_early_lock_release=false tenant=all;<br>
alter system set  default_compress_func = 'lz4_1.0';<br>
<br>
把日志聚合，减小网络开销，提高并发读<br>
alter system set _clog_aggregation_buffer_amount=4;<br>
alter system set _flush_clog_aggregation_buffer_timeout='1ms';<br>
set global ob_timestamp_service='GTS';<br>
set global autocommit=ON;<br>
set global ob_query_timeout=36000000000;<br>
set global ob_trx_timeout=36000000000;<br>
set global max_allowed_packet=67108864;<br>
set global ob_sql_work_area_percentage=100;<br>
<br>
/*
parallel_max_servers推荐设置为测试租户分配的resource unit cpu数的10倍
如测试租户使用的unit配置为：create resource unit $unit_name max_cpu 26
那么该值设置为260
parallel_server_target推荐设置为parallel_max_servers * 机器数*0.8
那么该值为260*3*0.8=624
*/<br>
set global parallel_max_servers=1440;<br>
set global parallel_servers_target=1152;<br>

/* change it when number of total core > 64 */<br>
alter system set net_thread_count = 24;<br>

## Test script
1. numactl --cpunodebind=0 /mnt/nvme4/xtang/oceanbase-master/build_release/src/observer/observer r '127.0.0.1:3882:3881' -o __min_full_resource_pool_memory=268435456,memory_limit='80G',system_memory='4G',datafile_disk_percentage=10,enable_syslog_recycle=True,max_syslog_file_count=4 -z 'zone1' -p 3881 -P 3882 -c 1 -d '/data02/ob_data/spr_test/store' -i 'lo' -l 'ERROR' -- exited code 0
2. ../sysbench oltp_read_only.lua --mysql-host=127.0.0.1 --mysql-port=3881 --mysql-db=test --mysql-user=root@sysbench_tenant --table_size=1000000 --tables=30 --threads=64 --report-interval=10 --time=600 run


## Limit CPU and LLC usage
<br>
Here is an example of adjusting LLC size:<br>
#set a policy of using 2 ways of LLC:  <br>
pqos -e "llc:1=0x0003"<br>
<br>
#associate core with policy: <br> 
pqos -a "llc:1=0-3,48-51,24-27,72-75;"<br>
<br>
#reset to default: <br>
pqos -R<br>
<br>
#query how may associative ways of llc: <br>
getconf -a|grep CACHE<br>
