WITH source_data AS (
    SELECT *
    FROM {{ source('northwind_data', 'order_details') }}
)
SELECT
    order_id
    ,product_id
    ,unit_price::numeric
    ,quantity::integer
    ,discount::numeric 
FROM source_data