WITH monthly_revenue AS (

    SELECT
        order_year,
        order_month,
        SUM(total_revenue) AS monthly_revenue

    FROM {{ ref('mart_sales') }}

    GROUP BY
        order_year,
        order_month
),

growth AS (

    SELECT
        order_year,
        order_month,
        monthly_revenue,

        LAG(monthly_revenue) OVER (
            ORDER BY order_year, order_month
        ) AS previous_month_revenue

    FROM monthly_revenue

)

SELECT
    order_year,
    order_month,
    monthly_revenue,

    ROUND(
        (
            (monthly_revenue - previous_month_revenue)
            / previous_month_revenue
        ) * 100,
        2
    ) AS monthly_growth_percentage

FROM growth
