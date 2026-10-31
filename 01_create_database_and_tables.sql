CREATE DATABASE IF NOT EXISTS scd_demo;
USE DATABASE scd_demo;
CREATE SCHEMA IF NOT EXISTS scd2;
USE SCHEMA scd2;
SHOW tables;


CREATE OR REPLACE TABLE customer(
    customer_id number,
    first_name varchar,
    last_name varchar,
    email varchar,
    street varchar,
    city varchar,
    state varchar,
    country varchar,
    update_timestamp timestamp_ntz default current_timestamp()
);

CREATE OR REPLACE TABLE customer_history(
    customer_id number,
    first_name varchar,
    last_name varchar,
    email varchar,
    street varchar,
    city varchar,
    state varchar,
    country varchar,
    start_time timestamp_ntz default current_timestamp(),
    end_time timestamp_ntz default current_timestamp(),
    is_current boolean
);

CREATE OR REPLACE TABLE customer_raw (
    customer_id number,
    first_name varchar,
    last_name varchar,
    email varchar,
    street varchar,
    city varchar,
    state varchar,
    country varchar
);

CREATE OR REPLACE STREAM customer_table_changes on table customer;

SHOW TABLES;
SELECT COUNT(*) FROM customer_raw;