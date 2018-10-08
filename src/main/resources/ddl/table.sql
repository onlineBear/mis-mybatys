create database mis
go

use mis
go

-- 通用字段
/*
	create_time
	create_user_id
	modified_time
	modified_user_id
*/

-- 价格和币种有关系
-- 税率 numeric(5,3)
-- 售价 numeric(12,2) 进价 numeric(14,4)

-- 国际化 很麻烦 , 一个是很多名称要国际化, 另一个是 价格/税率 等和币种有关系的也需要做, 不做, 意义不大

create table price_group
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,		-- 这个不做国际化了

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_price_group primary key(id)
)
go

create unique index up_price_group
  on price_group(no)
go

create table price_group_goods
(
  price_group_id numeric(20) not null,
  goods_id numeric(20) not null,

  sale_price numeric(12,2) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_price_group_goods primary key(price_group_id, goods_id)
)
go

create table area_group
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_area_group primary key(id)
)
go

create unique index up_area_group
  on area_group(no)
go

create table area_group_goods
(
  area_group_id numeric(20) not null,
  goods_id numeric(20) not null,
  -- 唯一索引

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_area_group_goods primary key(area_group_id, goods_id)
)
go

create table contract_group
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_contract_group primary key(id)
)
go

create unique index up_contract_group
  on table contract_group(no)
go

create table contract_group_goods
(
  contract_group_id numeric(20) not null,
  goods_id numeric(20) not null,
  -- 唯一索引

  main_contract_id numeric(20) not null,
  provtype_id nvarchar(20) not null,
  dc_id numeric(20) null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_contract_group_goods primary key(contract_group_id, goods_id)
)
go

create table contract_group_contract
(
  contract_group_id numeric(20) not null,
  goods_id numeric(20) not null,
  contract_id numeric(20) not null,
  -- 唯一索引

  is_main_contract bit not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_contract_group_contract primary key(contract_group_id, goods_id, contract_id)
)
go

create table store
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,
  short_name nvarchar(20) not null,
  address nvarchar(100) not null,

  langitude nvarchar(20) not null,
  latitude nvarchar(20) not null,

  type_no nvarchar(10) not null,			-- head: 总部 store: 门店 warehouse: 仓库
  type_value nvarchar(10) not null,

  price_group_id numeric(20) not null,
  area_group_id numeric(20) not null,
  contract_group_id numeric(20) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_store primary key(id)
)
go

create unique index up_store
  on store(no)
go

create table category
(
  id numeric(20) not null,

  parent_id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(20) not null,
  short_name nvarchar(10) not null,
  level numeric(2) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_category primary key(id)
)
go

create unique index up_category
  on category(no)
go

create table brand
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_brand primary key(id)

)
go

create unique index up_brand
  on brand(no)
go

create table goods
(
  id numeric(20) not null,

  brand_id numeric(20) null,
  category_id numeric(20) not null,
  category_name nvarchar(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,
  short_name nvarchar(20) not null,
  spec nvarchar(20) not null,
  unit nvarchar(10) not null,
  home nvarchar(20) not null,

  type_id nvarchar(20) not null,		-- 重量商品 等

  main_barcode nvarchar(13) not null,
  pinyin_code nvarchar(40) not null,
  pack numeric(10,2) not null,
  sale_price numeric(12,2) not null,		-- 参考售价 参考售价和币种有关系, 后面可以抽出来和币种关联
  sale_tax_rate numeric(5,3) not null,	-- 销项税率 这个和币种有关系

  life_cycle_id nvarchar(20) not null,
  status_id nvarchar(20) not null,

  can_order_from_supplier bit not null,
  can_return_to_supplier bit not null,
  can_order_from_dc bit not null,
  can_return_to_dc bit not null,
  saleable bit not null,					-- 是否可销售
  is_box bit not null,					-- 是否整箱 是:整箱 否:拆零

  shelflife_min numeric(9) null,			-- 保质期 (min)
  shelflife_day numeric(4) null,			-- 保质期 (day)
  safe_stock_day numeric(5) null,
  opl_coefficient numeric(3) null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_goods primary key(id)
)
go

create unique index up_goods
  on goods(no)
go

create table barcode
(
  id numeric(20) not null,

  goods_id numeric(20) not null,

  barcode nvarchar(13) not null,
  is_main_barcode bit not null,
  qty numeric(16,3) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_barcode primary key(id)
)
go

create unique index up_barcode
  on barcode(barcode)
go

create table supplier
(
  id numeric(20) not null,

  no nvarchar(20) not null,
  name nvarchar(40) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_supplier primary key(id)
)
go

create unique index up_supplier
  on supplier(no)
go

create table contract
(
  id numeric(20) not null,

  supplier_id numeric(20) not null,

  no nvarchar(20) not null,				-- 合同编码
  trade_mode_id nvarchar(20) not null,	-- 交易方式
  effective_time datetime not null,		-- 生效时间
  expire_time datetime null,				-- 失效时间
  sign_person nvarchar(20) not null,		-- 签约人
  sign_time datetime not null,			-- 签约时间
  description nvarchar(200) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_contract primary key(id)
)
go

create unique index up_contract
  on contract(no)
go

create table contract_goods
(
  contract_id numeric(20) not null,
  goods_id numeric(20) not null,

  spec numeric(5) not null,
  buy_price numeric(14,4) not null,
  buy_tax_rate numeric(5,3) not null,
  buy_tax_pct numeric(5,3) not null,

  status_id nvarchar(20) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_contract_goods primary key(contract_id, goods_id)
)
go

create table store_goods
(
  store_id numeric(20) not null,
  goods_id numeric(20) not null,

  main_supplier_id numeric(20) not null,
  main_contract_id numeric(20) not null,
  sale_price numeric(12,2) not null,
  real_sale_price numeric(12,2) not null,
  delivery_price numeric(16,4) not null,		-- 配送价
  trade_mode_id nvarchar(20) not null,
  provtype_id nvarchar(20) not null,
  dc_id numeric(20) null,

  promo_begin_time datetime null,
  promo_end_time datetime null,
  promo_paper_no nvarchar(20) not null,

  status_id nvarchar(20) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_store_goods primary key(store_id, goods_id)
)
go

create table store_goods_supplier
(
  store_id numeric(20) not null,
  goods_id numeric(20) not null,
  supplier_id numeric(20) not null,
  -- 唯一索引

  buy_price numeric(14,4) not null,
  real_buy_price numeric(14,4) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_store_goods_supplier primary key(store_id, goods_id, supplier_id)
)
go

-- 字典表
create table dictionary_type
(
  id numeric(20) not null,

  no nvarchar(40) not null,
  name nvarchar(40) not null,
  description nvarchar(200) not null,

  can_modify bit not null,
  can_add bit not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_dictionary_type primary key(id)
)
go

create unique index up_dictionary_type
  on dictionary_type(no)
go

create table dictionary
(
  id numeric(20) not null,

  dict_type_id numeric(20) not null,

  [key] nvarchar(40) not null,					-- 唯一索引
  value nvarchar(40) not null,

  create_time datetime not null,
  create_user_id numeric(20) not null,
  modified_time datetime null,
  modified_user_id numeric(20) null,

  constraint pk_dictionary primary key(id)
)
go

create unique index up_dictionary
  on dictionary(key)
go


create table store_supplier
(
  id numeric(20) not null,
  store_id numeric(20) not null,
  supplier_id numeric(20) not null,
)
go
select * from DEV_HOADB..tSgvRelation

