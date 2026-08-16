-- Pregunta de negocio: ¿qué regiones tienen mayor ticket promedio? (ranking)
SELECT
  region,
  ROUND(AVG(sales), 2) AS ticket_promedio,
  RANK() OVER (ORDER BY AVG(sales) DESC) AS ranking
FROM `skydrop-prep.skydropx.superstore_clean`
GROUP BY region
ORDER BY ranking;
