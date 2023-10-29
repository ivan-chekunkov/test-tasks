WITH RECURSIVE schedule AS (
SELECT
	CURRENT_DATE + make_interval(days => 0) AS control_date,
	1 AS step
UNION ALL
SELECT
	control_date + make_interval(days => CAST(floor(random() * 6 + 2) AS INTEGER)),
	step + 1
FROM
	schedule
WHERE
	step < 100
)
SELECT
	control_date
FROM
	schedule
ORDER BY
	control_date