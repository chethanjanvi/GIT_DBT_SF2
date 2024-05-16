WITH raw_data AS (
    SELECT
        *
    FROM
        AIRBNB.RAW.RAW_DATA
)
SELECT
    raw_id,
    data_content:empid::string as empid,
    data_content:personal:name::string as name,
    data_content:personal:gender::string as gender,
    data_content:personal:age::number as age,
    data_content:personal:address:streetaddress::string as streetaddress,
    data_content:personal:address:city::string as city,
    data_content:personal:address:state::string as state,
    data_content:personal:address:postalcode::string as postalcode,
    data_content:profile:department::string as department,
    data_content:profile:designation::string as designation
FROM
    raw_data