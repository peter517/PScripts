
create table  report_hour
( 
	uuid                   varchar(50) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_total_flow         number(10) not null,
	water_total_flow       number(10) not null
)partition by range(collect_time) interval (numtodsinterval(1,'day')) store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);

create table  report_day
( 
	uuid                   varchar(50) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_total_flow         number(10) not null,
	water_total_flow       number(10) not null
)partition by range(collect_time) interval (numtodsinterval(1,'day')) store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);


create table  report_week
( 
	uuid                   varchar(50) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_total_flow         number(10) not null,
	water_total_flow       number(10) not null
)partition by range(collect_time) interval (numtodsinterval(1,'day')) store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);


create table  report_month
( 
	uuid                   varchar(50) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_total_flow         number(10) not null,
	water_total_flow       number(10) not null
)partition by range(collect_time) interval (numtodsinterval(1,'day')) store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);


create table  report_quarter	
( 
	uuid                   varchar(50) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_total_flow         number(10) not null,
	water_total_flow       number(10) not null
)partition by range(collect_time) interval (numtodsinterval(1,'day')) store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);

create table  report_year	
( 
	uuid                   varchar(50) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_total_flow         number(10) not null,
	water_total_flow       number(10) not null
)partition by range(collect_time) interval (numtodsinterval(1,'day')) store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);
