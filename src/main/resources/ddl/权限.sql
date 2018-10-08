/*
drop database mis
go

create database mis
go

*/

use mis
go

/*
if object_id('User', 'U') is not null
  drop table [User]
go
*/

create table [User]
(
  id numeric(19) not null,

  no nvarchar(20) not null,			    -- 用户编码, 唯一
  name nvarchar(40) not null,           -- 用户名
  password nvarchar(40) not null,       -- 密码
  email nvarchar(60) not null,          -- 邮箱
  mobile nvarchar(11) not null,         -- 手机号
  profilePhotoUrl nvarchar(100) not null,     -- 头像url
  personalStatement nvarchar(100) not null,		-- 个性介绍

  lastUpdateTime datetime not null,

  constraint PK_USER primary key(id)
)
go

create unique index UK_USER
  on [User](no)
go


/*
if object_id('Menu', 'U') is not null
  drop table Menu
go
*/

create table Menu
(
  id numeric(19) not null,

  parentMenuId numeric(19) not null,    -- 父级菜单id

  no nvarchar(20) not null,               -- 菜单编码
  name nvarchar(20) not null,
  iconUrl nvarchar(100) not null,        -- 图像
  isContent bit not null,                -- 是否目录
  level tinyint not null,                 -- 层级 1为根
  description nvarchar(100) not null,     -- 描述
  isDisplay bit not null,                -- 是否显示

  lastUpdateTime datetime not null,

  constraint PK_MENU primary key(id)
)
go

create unique index UK_MENU
  on Menu(no)
go

/*
if object_id('role', 'U') is not null
  drop table role
go
*/

create table Role
(
  id numeric(19) not null,

  no nvarchar(20) not null,
  name nvarchar(20) not null,
  description nvarchar(100) not null,

  lastUpdateTime datetime not null,

  constraint PK_ROLE primary key(id)
)
go

create unique index UK_ROLE
  on Role(no)
go

/*
if object_id('Power', 'U') is not null
  drop table Power
go
*/

create table Power
(
  id numeric(19) not null,

  menuId numeric(19) null,

  url nvarchar(100) not null,
  name nvarchar(20) not null,
  description nvarchar(100) not null,
  isDisplay bit not null,                -- 是否显示

  lastUpdateTime datetime not null,

  constraint PK_POWER primary key(id)
)
go

create unique index UK_POWER
  on Power(url)
go

/*
if object_id('UserRole', 'U') is not null
  drop table UserRole
go
*/

create table UserRole
(
  id numeric(19) not null,

  userId numeric(19) not null,
  roleId numeric(19) not null,

  lastUpdateTime datetime not null,

  constraint PK_USERROLE primary key(id)
)
go

create unique index UK_USERROLE
  on UserRole(userId, roleId)
go

/*
if object_id('RolePower', 'U') is not null
  drop table RolePower
go
*/

create table RolePower
(
  id numeric(19) not null,

  roleId numeric(19) not null,
  powerId numeric(19) not null,

  lastUpdateTime datetime not null,

  constraint PK_ROLEPOWER primary key(id)
)
go

create unique index UK_ROLEPOWER
  on RolePower(roleId, powerId)
go

/*
if object_id('RoleMenu', 'U') is not null
  drop table RoleMenu
go
*/

create table RoleMenu
(
  id numeric(19) not null,

  roleId numeric(19) not null,
  menuId numeric(19) not null,

  lastUpdateTime datetime not null,

  constraint PK_ROLE_MENU primary key(id)
)
go

create unique index uK_ROLE_MENU
  on RoleMenu(roleId, menuId)
go

