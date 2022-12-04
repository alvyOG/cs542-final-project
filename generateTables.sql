CREATE TABLE IF NOT EXISTS "nation" (
  "n_nationkey"  INT,
  "n_name"       CHAR(25),
  "n_regionkey"  INT,
  "n_comment"    VARCHAR(152),
  "n_dummy"      VARCHAR(10));

CREATE TABLE IF NOT EXISTS "region" (
  "r_regionkey"  INT,
  "r_name"       CHAR(25),
  "r_comment"    VARCHAR(152),
  "r_dummy"      VARCHAR(10));

CREATE TABLE IF NOT EXISTS "supplier" (
  "s_suppkey"     INT,
  "s_name"        CHAR(25),
  "s_address"     VARCHAR(40),
  "s_nationkey"   INT,
  "s_phone"       CHAR(15),
  "s_acctbal"     DECIMAL(15,2),
  "s_comment"     VARCHAR(101),
  "s_dummy"       VARCHAR(10));

CREATE TABLE IF NOT EXISTS "customer" (
  "c_custkey"     INT,
  "c_name"        VARCHAR(25),
  "c_address"     VARCHAR(40),
  "c_nationkey"   INT,
  "c_phone"       CHAR(15),
  "c_acctbal"     DECIMAL(15,2),
  "c_mktsegment"  CHAR(10),
  "c_comment"     VARCHAR(117),
  "c_dummy"       VARCHAR(10));

CREATE TABLE IF NOT EXISTS "part" (
  "p_partkey"     INT,
  "p_name"        VARCHAR(55),
  "p_mfgr"        CHAR(25),
  "p_brand"       CHAR(10),
  "p_type"        VARCHAR(25),
  "p_size"        INT,
  "p_container"   CHAR(10),
  "p_retailprice" DECIMAL(15,2) ,
  "p_comment"     VARCHAR(23) ,
  "p_dummy"       VARCHAR(10));

CREATE TABLE IF NOT EXISTS "partsupp" (
  "ps_partkey"     INT,
  "ps_suppkey"     INT,
  "ps_availqty"    INT,
  "ps_supplycost"  DECIMAL(15,2),
  "ps_comment"     VARCHAR(199),
  "ps_dummy"       VARCHAR(10));

CREATE TABLE IF NOT EXISTS "orders" (
  "o_orderkey"       INT,
  "o_custkey"        INT,
  "o_orderstatus"    CHAR(1),
  "o_totalprice"     DECIMAL(15,2),
  "o_orderdate"      DATE,
  "o_orderpriority"  CHAR(15),
  "o_clerk"          CHAR(15),
  "o_shippriority"   INT,
  "o_comment"        VARCHAR(79),
  "o_dummy"          VARCHAR(10));

CREATE TABLE IF NOT EXISTS "lineitem"(
  "l_orderkey"          INT,
  "l_partkey"           INT,
  "l_suppkey"           INT,
  "l_linenumber"        INT,
  "l_quantity"          DECIMAL(15,2),
  "l_extendedprice"     DECIMAL(15,2),
  "l_discount"          DECIMAL(15,2),
  "l_tax"               DECIMAL(15,2),
  "l_returnflag"        CHAR(1),
  "l_linestatus"        CHAR(1),
  "l_shipdate"          DATE,
  "l_commitdate"        DATE,
  "l_receiptdate"       DATE,
  "l_shipinstruct"      CHAR(25),
  "l_shipmode"          CHAR(10),
  "l_comment"           VARCHAR(44),
  "l_dummy"             VARCHAR(10));

ALTER TABLE REGION ADD PRIMARY KEY (R_REGIONKEY);

ALTER TABLE NATION ADD PRIMARY KEY (N_NATIONKEY);

ALTER TABLE NATION ADD FOREIGN KEY (N_REGIONKEY) references REGION(R_REGIONKEY);

ALTER TABLE PART ADD PRIMARY KEY (P_PARTKEY);

ALTER TABLE SUPPLIER ADD PRIMARY KEY (S_SUPPKEY);

ALTER TABLE SUPPLIER ADD FOREIGN KEY (S_NATIONKEY) references NATION(N_NATIONKEY);

ALTER TABLE PARTSUPP ADD PRIMARY KEY (PS_PARTKEY,PS_SUPPKEY);

ALTER TABLE CUSTOMER ADD PRIMARY KEY (C_CUSTKEY);

ALTER TABLE CUSTOMER ADD FOREIGN KEY (C_NATIONKEY) references NATION(N_NATIONKEY);

ALTER TABLE LINEITEM ADD PRIMARY KEY (L_ORDERKEY,L_LINENUMBER);

ALTER TABLE ORDERS ADD PRIMARY KEY (O_ORDERKEY);

ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_SUPPKEY) references SUPPLIER(S_SUPPKEY);

ALTER TABLE PARTSUPP ADD FOREIGN KEY (PS_PARTKEY) references PART(P_PARTKEY);

ALTER TABLE ORDERS ADD FOREIGN KEY (O_CUSTKEY) references CUSTOMER(C_CUSTKEY);

ALTER TABLE LINEITEM ADD FOREIGN KEY (L_ORDERKEY)  references ORDERS(O_ORDERKEY);

ALTER TABLE LINEITEM ADD FOREIGN KEY (L_PARTKEY,L_SUPPKEY) references PARTSUPP(PS_PARTKEY, PS_SUPPKEY);