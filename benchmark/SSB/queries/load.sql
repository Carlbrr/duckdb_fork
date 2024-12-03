-- Schema Definition
-- follows https://clickhouse.com/docs/en/getting-started/example-datasets/star-schema
-- but with adjusted data types mapped from ClickHouse -> DuckDB

CREATE TABLE customer (
    c_custkey INTEGER,
    c_name VARCHAR,
    c_address VARCHAR,
    c_city VARCHAR,
    c_nation VARCHAR,
    c_region VARCHAR,
    c_phone VARCHAR,
    c_mktsegment VARCHAR
);

CREATE TABLE lineorder (
    lo_orderkey INTEGER,
    lo_linenumber INTEGER,
    lo_custkey INTEGER,
    lo_partkey INTEGER,
    lo_suppkey INTEGER,
    lo_orderdate INTEGER,
    lo_orderpriority VARCHAR,
    lo_shippriority VARCHAR,
    lo_quantity INTEGER,
    lo_extendedprice DOUBLE,
    lo_ordtotalprice DOUBLE,
    lo_discount DOUBLE,
    lo_revenue DOUBLE,
    lo_supplycost DOUBLE,
    lo_tax DOUBLE,
    lo_commitdate INTEGER,
    lo_shipmode VARCHAR
);

CREATE TABLE part (
    p_partkey INTEGER,
    p_name VARCHAR,
    p_mfgr VARCHAR,
    p_category VARCHAR,
    p_brand VARCHAR,
    p_color VARCHAR,
    p_type VARCHAR,
    p_size INTEGER,
    p_container VARCHAR
);

CREATE TABLE supplier (
    s_suppkey INTEGER,
    s_name VARCHAR,
    s_address VARCHAR,
    s_city VARCHAR,
    s_nation VARCHAR,
    s_region VARCHAR,
    s_phone VARCHAR
);

CREATE TABLE date (
    d_datekey INTEGER,
    d_date VARCHAR,
    d_dayofweek VARCHAR,
    d_month VARCHAR,
    d_year INTEGER,
    d_yearmonthnum INTEGER,
    d_yearmonth VARCHAR,
    d_daynuminweek INTEGER,
    d_daynuminmonth INTEGER,
    d_daynuminyear INTEGER,
    d_monthnuminyear INTEGER,
    d_weeknuminyear INTEGER,
    d_sellingseason VARCHAR,
    d_lastdayinweekfl VARCHAR,
    d_lastdayinmonthfl VARCHAR,
    d_holidayfl VARCHAR,
    d_weekdayfl VARCHAR
);

-- Load Data

-- this is only sf1 atm
COPY customer FROM 'benchmark/SSB/data/sf1/customer.tbl' (DELIMITER '|', NULL 'NULL');
COPY lineorder FROM 'benchmark/SSB/data/sf1/lineorder.tbl' (DELIMITER '|', NULL 'NULL');
COPY part FROM 'benchmark/SSB/data/sf1/part.tbl' (DELIMITER '|', NULL 'NULL');
COPY supplier FROM 'benchmark/SSB/data/sf1/supplier.tbl' (DELIMITER '|', NULL 'NULL');
COPY date FROM 'benchmark/SSB/data/sf1/date.tbl' (DELIMITER '|', NULL 'NULL');
