/*
if object_id('user', 'U') is not null
  drop table [user]
go
*/

create table [user]
(
  id numeric(19) not null,

  no nvarchar(20) not null,			    -- 用户编码, 唯一
  name nvarchar(40) not null,       -- 用户名
  password nvarchar(40) not null,   -- 密码
  email nvarchar(60) not null,      -- 邮箱
  mobile nvarchar(11) not null,     -- 手机号
  profile_photo_url nvarchar(100) not null,     -- 头像url
  personal_statement nvarchar(100) not null,		-- 个性介绍

  last_update_time datetime not null,

  constraint pk_user primary key(id)
)
go

create unique index uk_user
  on [user](no)
go


/*
if object_id('menu', 'U') is not null
  drop table menu
go
*/

create table menu
(
  id numeric(19) not null,

  parent_menu_id numeric(19) not null,    -- 父级菜单id

  no nvarchar(20) not null,               -- 菜单编码
  name nvarchar(20) not null,
  icon_url nvarchar(100) not null,        -- 图像
  is_content bit not null,                -- 是否目录
  level tinyint not null,                 -- 层级 1为根
  description nvarchar(100) not null,     -- 描述
  is_display bit not null,                -- 是否显示

  last_update_time datetime not null,

  constraint pk_menu primary key(id)
)
go

create unique index uk_menu
  on menu(no)
go

/*
if object_id('role', 'U') is not null
  drop table role
go
*/

create table role
(
  id numeric(19) not null,

  no nvarchar(20) not null,
  name nvarchar(20) not null,
  description nvarchar(100) not null,

  last_update_time datetime not null,

  constraint pk_role primary key(id)
)
go

create unique index uk_role
  on role(no)
go

/*
if object_id('power', 'U') is not null
  drop table power
go
*/

create table power
(
  id numeric(19) not null,

  menu_id numeric(19) null,

  url nvarchar(100) not null,
  name nvarchar(20) not null,
  description nvarchar(100) not null,
  is_display bit not null,                -- 是否显示

  last_update_time datetime not null,

  constraint pk_power primary key(id)
)
go

create unique index uk_power
  on power(url)
go

/*
if object_id('user_role', 'U') is not null
  drop table user_role
go
*/

create table user_role
(
  id numeric(19) not null,

  user_id numeric(19) not null,
  role_id numeric(19) not null,

  last_update_time datetime not null,

  constraint pk_user_role primary key(id)
)
go

create unique index uk_user_role
  on user_role(user_id, role_id)
go

/*
if object_id('role_power', 'U') is not null
  drop table role_power
go
*/

create table role_power
(
  id numeric(19) not null,

  role_id numeric(19) not null,
  power_id numeric(19) not null,

  last_update_time datetime not null,

  constraint pk_role_power primary key(id)
)
go

create unique index uk_role_power
  on role_power(role_id, power_id)
go

/*
if object_id('role_menu', 'U') is not null
  drop table role_menu
go
*/

create table role_menu
(
  id numeric(19) not null,

  role_id numeric(19) not null,
  menu_id numeric(19) not null,

  last_update_time datetime not null,

  constraint pk_role_menu primary key(id)
)
go

create unique index uk_role_menu
  on role_menu(role_id, menu_id)
go

