-- Pregunta de negocio: ¿qué región/categoría es más rentable y cómo evoluciona el margen?
SELECT
  region,
  category,
  DATE_TRUNC(order_date, MONTH)        AS mes,
  ROUND(SUM(sales), 2)                 AS ingresos,
  ROUND(SUM(profit), 2)                AS margen,
  ROUND(SAFE_DIVIDE(SUM(profit), SUM(sales)), 3) AS margen_pct
FROM `skydrop-prep.skydropx.superstore_clean`
GROUP BY region, category, mes
ORDER BY region, category, mes;
