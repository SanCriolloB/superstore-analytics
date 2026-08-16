CREATE OR REPLACE VIEW `skydrop-prep.skydropx.superstore_clean` AS
SELECT
  `Row ID`        AS row_id,
  `Order ID`      AS order_id,
  `Order Date`    AS order_date,
  `Ship Date`     AS ship_date,
  `Ship Mode`     AS ship_mode,
  `Customer ID`   AS customer_id,
  `Customer Name` AS customer_name,
  Segment         AS segment,
  Country         AS country,
  City            AS city,
  State           AS state,
  `Postal Code`   AS postal_code,
  Region          AS region,
  `Product ID`    AS product_id,
  Category        AS category,
  `Sub-Category`  AS sub_category,
  `Product Name`  AS product_name,
  Quantity        AS quantity,
  Discount        AS discount,
  SAFE_CAST(NULLIF(TRIM(Sales), '')  AS FLOAT64) AS sales,
  SAFE_CAST(NULLIF(TRIM(Profit), '') AS FLOAT64) AS profit
FROM `skydrop-prep.skydropx.Superstore`;
