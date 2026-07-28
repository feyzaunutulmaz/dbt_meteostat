WITH source_data AS (
    SELECT *
    FROM {{ source('northwind_data', 'order_details') }}
)
SELECT
    order_id
    ,product_id
    ,unit_price
    ,quantity
    ,discount
FROM source_data