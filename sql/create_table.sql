
create sequence tb_code_sequence
minvalue 1
start with 1
increment by 1;

create table sys_organ
(
   organ_id                  varchar(10) not null primary key,
   parent_organ_id           varchar(10) not null,
   organ_name                varchar(50) not null,
   organ_level               number(10) not null,
   longitude                 number(10,2) not null,
   latitude                  number(10,2) not null
);


create table sys_employee
(
   employee_id                  varchar(20) not null primary key,
   parent_organ_id              varchar(10) not null,
   name                         varchar(50) not null,
   password                     varchar(50) not null,
   employee_type                varchar(10) not null
);


create table employee_right
(
   employee_id                   varchar(20) not null,
   view_data           			 varchar(10) not null,
   operate_report                varchar(10) not null,
   set_data_collector            varchar(10) not null,
   manage_wellworker             varchar(10) not null,
   manager_right                 varchar(10) not null
);


create table employee_operate_info
(
   uuid                   		varchar(50) not null primary key,
   employee_id                  varchar(20) not null,
   operate_type           		varchar (10) not null,
   content                      varchar(50) not null,
   operate_time                 date not null
);


create table sys_data_collector
(
   data_collector_id        varchar(20) not null primary key,
   parent_organ_id         varchar(10) not null,
   well_id           		varchar (50) not null,
   collector_state          varchar(10) not null,
   longitude                number(10,2) not null,
   latitude                 number(10,2) not null,
   lvp_factor               number(10) not null,
   liquid_offset            number(10,1) not null
);


create table wellworker_well
(
   uuid                   		varchar(50) not null primary key,
   employee_id                  varchar(20) not null,
   data_collector_id            varchar(20) not null
);


create table collect_data_01 
( 
	uuid                   number(20) not null primary key,
	data_collector_id      varchar(20) not null,
	collect_time           date not null,
	gas_temp               number(10,2) not null,
	gas_pressure           number(10) not null,
	gas_instant_flow       number(10) not null,
	gas_total_flow         number(10) not null,
	water_instant_flow     number(10) not null,
	water_total_flow       number(10) not null,
	well_top_pressure      number(10,5) not null,
	well_bottom_pressure   number(10,4) not null,
	well_bottom_temp       number(10,2) not null,
	lv_height              number(10,2) not null,
	motor_rate             number(10,2) not null,
	motor_current          number(10,1) not null
)
partition by range(collect_time) 
interval (numtodsinterval(1,'day')) 
store in (ctest)
subpartition by hash(data_collector_id) subpartitions 16
(partition p0 values less than( to_date('01-01-2012', 'dd-MM-yyyy'))
);


create table checkin_info
(
   uuid                   		varchar(50) not null primary key,
   employee_id                  varchar(20) not null,
   data_collector_id            varchar(20) not null,
   checkin_time                 date not null
);


create table checkin_task
(
   uuid                   		varchar(50) not null primary key,
   employee_id                  varchar(20) not null,
   data_collector_id            varchar(20) not null,
   start_time                   date not null,
   end_time                     date not null
);

create table illegal_data
(
   uuid                   		varchar(50) not null primary key,
   data_collector_id            varchar(20) not null,
   attack_time                     date not null
);




