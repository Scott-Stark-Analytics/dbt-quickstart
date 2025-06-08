with payments as (
    SELECT * from {{ ref('stg_payments') }}
)

SELECT
    order_id,
    sum(amount) as total_amount
FROM payments
GROUP BY order_id
HAVING total_amount < 0