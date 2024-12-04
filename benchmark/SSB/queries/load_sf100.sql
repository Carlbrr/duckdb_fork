-- Schema Definition
-- follows https://clickhouse.com/docs/en/getting-started/example-datasets/star-schema
-- but with adjusted data types mapped from ClickHouse -> DuckDB

CREATE OR REPLACE TABLE customer (
    c_custkey INTEGER,
    c_name VARCHAR,
    c_address VARCHAR,
    c_city VARCHAR,
    c_nation VARCHAR,
    c_region VARCHAR,
    c_phone VARCHAR,
    c_mktsegment VARCHAR
);

CREATE OR REPLACE TABLE lineorder (
    lo_orderkey INTEGER,
    lo_linenumber INTEGER,
    lo_custkey INTEGER,
    lo_partkey INTEGER,
    lo_suppkey INTEGER,
    lo_orderdate DATE, -- Changed from INTEGER
    lo_orderpriority VARCHAR,
    lo_shippriority VARCHAR,
    lo_quantity INTEGER,
    lo_extendedprice DOUBLE,
    lo_ordtotalprice DOUBLE,
    lo_discount DOUBLE,
    lo_revenue DOUBLE,
    lo_supplycost DOUBLE,
    lo_tax DOUBLE,
    lo_commitdate DATE, -- Changed from Integer
    lo_shipmode VARCHAR
);

CREATE OR REPLACE TABLE part (
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

CREATE OR REPLACE TABLE supplier (
    s_suppkey INTEGER,
    s_name VARCHAR,
    s_address VARCHAR,
    s_city VARCHAR,
    s_nation VARCHAR,
    s_region VARCHAR,
    s_phone VARCHAR
);

CREATE OR REPLACE TABLE date (
    d_datekey DATE, -- changed this
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

-- this is for sf100
COPY customer FROM 'benchmark/SSB/data/sf100/customer.tbl' (DELIMITER ',', QUOTE '"', NULL 'NULL', HEADER false);
COPY lineorder FROM 'benchmark/SSB/data/sf100/lineorder.tbl' (DELIMITER ',', QUOTE '"', NULL 'NULL', HEADER false);
COPY part FROM 'benchmark/SSB/data/sf100/part.tbl' (DELIMITER ',', QUOTE '"', NULL 'NULL', HEADER false);
COPY supplier FROM 'benchmark/SSB/data/sf100/supplier.tbl' (DELIMITER ',', QUOTE '"', NULL 'NULL', HEADER false);
COPY date FROM 'benchmark/SSB/data/sf100/date.tbl' (DELIMITER ',', QUOTE '"', NULL 'NULL', HEADER false);