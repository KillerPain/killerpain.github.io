SELECT * FROM cases WHERE client = 'ТОО Альфа';

SELECT * FROM cases WHERE amount > 1000000;

SELECT * FROM cases WHERE client = 'ТОО Альфа' AND amount > 1000000;

SELECT * FROM cases WHERE court = 'Алматы' OR court = 'Астана';

SELECT * from cases WHERE subject LIKE '%долг%'

SELECT * FROM cases WHERE filed >= '2026-06-11'

SELECT number, client, amount FROM cases ORDER BY amount DESC LIMIT 3;

SELECT number, client, filed FROM cases WHERE status = 'в работе' ORDER BY filed;

SELECT * FROM cases WHERE court = 'Караганда'

SELECT * FROM cases WHERE status = 'проиграно' ORDER BY amount DESC

SELECT * FROM cases WHERE client = 'ИП Сапаров' OR client = 'ИП Ахметова'

SELECT * FROM cases ORDER BY filed LIMIT 1

INSERT INTO cases (number, client, subject, amount, filed, court, status)
VALUES ('2-116/2026', 'ТОО Сигма', 'взыскание долга', 700000, '2026-10-27', 'Алматы', 'в работе');

UPDATE cases SET status = 'выиграно' WHERE number = '2-102/2026'

DELETE FROM cases WHERE number = '2-116/2026'