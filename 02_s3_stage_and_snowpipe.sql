// creating external stage( create your own bucket)
CREATE OR REPLACE STAGE SCD_DEMO.SCD2.customer_ext_stage
url = 's3://snowflake-project-bucket-urmi/stream_data'
credentials= (aws_key_id='---Your_aws_id----' aws_secret_key='---Aws_secret_key---');


CREATE OR REPLACE FILE FORMAT SCD_DEMO.SCD2.CSV
TYPE = CSV
FIELD_DELIMITER = ','
SKIP_HEADER = 1;

SHOW STAGES;
LIST @customer_ext_stage;


// CREATE PIPE = SNOWPIPE, automated data-loading service
CREATE OR REPLACE PIPE customer_s3_pipe
    auto_ingest = true
    AS 
    COPY INTO customer_raw
    FROM @customer_ext_stage
    FILE_FORMAT = CSV;

  SHOW PIPES;

SELECT count(*) FROM customer_raw;