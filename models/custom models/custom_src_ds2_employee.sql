{{ config(
    materialized='table'
) }}

WITH src_ds2_employee AS (
    SELECT
        date,
        metric,
        AVG(metric) OVER (ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS rolling_avg
    FROM
        {{ ref('src_ds2_employee') }}
)

SELECT
    date,
    metric,
    rolling_avg
FROM
    src_ds2_employee