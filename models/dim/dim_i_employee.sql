{{
 config(
 materialized = 'incremental',
 on_schema_change='fail'
 )
}}
WITH employee AS (
 SELECT * FROM {{ ref('employee') }}
)
SELECT   * FROM employee
{% if is_incremental() %}
 WHERE timestamp_column > (select max(timestamp_column)
 from {{ this }})
{% endif %}