SELECT cases.number, cases.client, lawyers.name
FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id

SELECT cases.number, lawyers.name FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id 
WHERE lawyers.name = 'Мария Ким';


SELECT cases.number, lawyers.name FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id 
WHERE cases.status = 'в работе' ORDER BY lawyers.name;

INSERT INTO cases (number, client, subject, lawyer_id) VALUES ('2-116/2026', 'ТОО Сигма', 'иск', 99);

SELECT COUNT(*) FROM cases

SELECT COUNT(*) FROM cases WHERE status = 'в работе'

SELECT SUM(amount) FROM cases WHERE client = 'ТОО Альфа'

SELECT AVG(amount) from cases;

SELECT MAX(amount), MIN(amount) FROM cases;

SELECT cases.number, cases.client FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id WHERE lawyers.name = 'Данияр Ермеков'

SELECT COUNT(*) FROM cases WHERE status = 'выиграно'

SELECT SUM(amount) FROM cases WHERE court = 'Астана'

SELECT MIN(amount) FROM cases WHERE client = 'ТОО Альфа'

SELECT * FROM cases WHERE client = 'ТОО Альфа' ORDER BY amount ASC LIMIT 1

SELECT court, SUM(amount) FROM cases GROUP BY court ORDER BY SUM(amount) DESC;

SELECT lawyers.name, COUNT(*) FROM cases
JOIN lawyers ON cases.lawyer_id = lawyers.id GROUP BY lawyers.name

SELECT client, COUNT(*) FROM cases GROUP BY client

SELECT court, MAX(amount) FROM cases GROUP BY court

SELECT lawyers.name, COUNT(*) FROM cases JOIN lawyers ON cases.lawyer_id = lawyers.id
WHERE cases.status = 'в работе' GROUP BY lawyers.name