with raw_data as(
    select * from airbnb.raw.raw_data2
)
select
f.value:empid::string as empid,
city.value:place::string as place,
year.value:number as yearsLived,
CURRENT_TIMESTAMP AS timestamp_column
from raw_data as raw,
lateral flatten(input => raw.data_content:root) f,
LATERAL FLATTEN(f.value:citiesLived, outer => true) as city,
LATERAL FLATTEN(city.value:yearsLived, outer => true) as year
