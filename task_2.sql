SELECT
	e."id",
	e."name",
	COUNT(s.price) AS sales_c,
	RANK() OVER(
	ORDER BY COUNT(s.price) DESC) sales_rank_c,
	SUM(s.price) AS sales_s,
	RANK() OVER(
	ORDER BY SUM(s.price) DESC) sales_rank_s
FROM
	employee e
JOIN sales s ON
	e.id = s.employee_id
GROUP BY
	e."name",
	e."id" 