-- Pregunta de negocio: ¿cómo crecen los ingresos mes a mes? (month-over-month)
WITH ventas_mes AS (
  SELECT
    DATE_TRUNC(order_date, MONTH) AS mes,
    SUM(sales)                    AS ingresos
  FROM `skydrop-prep.skydropx.superstore_clean`
  GROUP BY mes
)
SELECT
  mes,
  ROUND(ingresos, 2)                                        AS ingresos,
  ROUND(LAG(ingresos) OVER (ORDER BY mes), 2)               AS ingresos_mes_anterior,
  ROUND(SAFE_DIVIDE(ingresos - LAG(ingresos) OVER (ORDER BY mes),
                    LAG(ingresos) OVER (ORDER BY mes)), 3)  AS crecimiento_pct
FROM ventas_mes
ORDER BY mes;
