SELECT
	t.tdate,
	t.acc,
	SUM(t.amount) OVER (PARTITION BY t.acc
ORDER BY
	t.tdate) AS account_balance
FROM
	(
	SELECT
		t.acc AS acc,
		t.amount AS amount,
		t.tdate AS tdate
	FROM
		(
		SELECT
			t."from" AS acc,
			-t.amount AS amount,
			t.tdate AS tdate
		FROM
			transfers t
	UNION ALL
		SELECT
			t."to" AS acc,
			t.amount AS amount,
			t.tdate AS tdate
		FROM
			transfers t
) AS t
	ORDER BY
		t.acc,
		t.tdate) AS t
ORDER BY
	t.acc,
	t.tdate;