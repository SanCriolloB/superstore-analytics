-- Pregunta de negocio: ¿qué subcategorías venden pero pierden dinero? (margen negativo)
SELECT
  sub_category,
  ROUND(SUM(sales), 2)                 AS ingresos,
  ROUND(SUM(profit), 2)                AS margen,
  ROUND(SAFE_DIVIDE(SUM(profit), SUM(sales)), 3) AS margen_pct
FROM `skydrop-prep.skydropx.superstore_clean`
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY margen ASC;
