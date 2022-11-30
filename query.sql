SELECT anime_name, duration FROM anime WHERE duration > '4:36:00';

SELECT SUM(price) AS sum_price FROM tickets WHERE session_id = 4;

SELECT AVG(salary) AS avg_salary FROM positions WHERE salary BETWEEN 200 AND 900;

SELECT * FROM passport WHERE sex LIKE 'Мужчина' ORDER BY birth_date DESC;

SELECT * FROM passport WHERE residence_address LIKE '%Мазурова%';

SELECT * FROM tickets WHERE availability IS TRUE;

SELECT * FROM tickets LIMIT 10;