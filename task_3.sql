CREATE TABLE transfers (
	"from" INTEGER,
	"to" INTEGER,
	amount INTEGER,
	tdate DATE
);
INSERT
	INTO
	transfers ("from",
	"to",
	amount,
	tdate)
VALUES ('1',
'2',
'500',
'23.02.2023'),
('2',
'3',
'300',
'01.03.2023'),
('3',
'1',
'200',
'05.03.2023'),
('1',
'3',
'400',
'05.04.2023');



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