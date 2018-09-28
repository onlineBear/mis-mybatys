if object_id('users', 'U') is not null
  drop table users
go

create table users
(
  id numeric(20) not null,

  no nvarchar(20) not null,			-- 唯一
  name nvarchar(40) not null,
  password nvarchar(40) not null,
  email nvarchar(100) not null,
  mobile nvarchar(13) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_users primary key(id)
)
go

create unique index uq_users
  on users(no)
go

if object_id('menu', 'U') is not null
  drop table menu
go

create table menu
(
  id numeric(20) not null,

  parent_menu_id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(20) not null,
  description nvarchar(200) not null,
  is_content bit not null,
  level numeric(2) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_menu primary key(id)
)
go

if object_id('role', 'U') is not null
  drop table role
go

create table role
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,
  description nvarchar(200) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_role primary key(id)
)
go

if object_id('permission', 'U') is not null
  drop table permission
go

create table permission
(
  id numeric(20) not null,

  url nvarchar(200) not null,
  name nvarchar(40) not null,
  description nvarchar(100) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_permission primary key(id)
)
go

if object_id('users_role', 'U') is not null
  drop table users_role
go

create table users_role
(
  users_id numeric(20) not null,
  role_id numeric(20) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_users_role primary key(users_id, role_id)
)
go

if object_id('role_permission', 'U') is not null
  drop table role_permission
go

create table role_permission
(
  role_id numeric(20) not null,
  permission_id numeric(20) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_role_permission primary key(role_id, permission_id)
)
go

if object_id('role_menu', 'U') is not null
  drop table role_menu
go

create table role_menu
(
  role_id numeric(20) not null,
  menu_id numeric(20) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_role_menu primary key(role_id, menu_id)
)
go
