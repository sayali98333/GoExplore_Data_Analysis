
SELECT
    -- Retailer information
    r.`Retailer code` AS retailer_code,
    r.`Retailer name` AS retailer_name,
    r.Type AS retailer_type,
    r.Country AS country,

    -- Product information
    p.`Product number` AS product_number,
    p.Product AS product_name,
    p.`Product line` AS product_line,
    p.`Product type` AS product_type,
    p.`Product brand` AS product_brand,

    -- Sales
    SUM(ds.Quantity) AS units_sold,

    -- Revenue
    SUM(
        ds.Quantity * ds.`Unit sale price`
    ) AS revenue,

    -- Average selling price
    SAFE_DIVIDE(
        SUM(ds.Quantity * ds.`Unit sale price`),
        SUM(ds.Quantity)
    ) AS average_selling_price

FROM `goexplore.daily_sales` AS ds

LEFT JOIN `goexplore.retailers` AS r
    ON ds.`Retailer code` = r.`Retailer code`

LEFT JOIN `goexplore.products` AS p
    ON ds.`Product number` = p.`Product number`

GROUP BY
    r.`Retailer code`,
    r.`Retailer name`,
    r.Type,
    r.Country,
    p.`Product number`,
    p.Product,
    p.`Product line`,
    p.`Product type`,
    p.`Product brand`;