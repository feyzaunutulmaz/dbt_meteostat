WITH source_data AS (
    SELECT *
    FROM {{ source('northwind_data', 'orders') }}
)
SELECT
    order_id
    ,customer_id
    ,employee_id
    ,order_date
    ,required_date
    ,shipped_date
    ,ship_via
--	,freight
--	,ship_name
--	,ship_address
    ,ship_city
--	,shipregion AS ship_region
--	,shippostalcode AS ship_postalcode
    ,ship_country
FROM source_data