WITH yearly_revenue AS (

    SELECT
        order_year,
        SUM(total_revenue) AS yearly_revenue

    FROM {{ ref('mart_sales_performance') }}

    GROUP BY order_year

),

growth AS (

    SELECT
        order_year,
        yearly_revenue,

        LAG(yearly_revenue) OVER (
            ORDER BY order_year
        ) AS previous_year_revenue

    FROM yearly_revenue

)

SELECT
    order_year,
    yearly_revenue,

    ROUND(
        (
            (yearly_revenue - previous_year_revenue)
            / previous_year_revenue
        ) * 100,
        2
    ) AS yearly_growth_percentage

FROM growth