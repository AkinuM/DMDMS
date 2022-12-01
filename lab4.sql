SELECT first_name, last_name, pos_name, salary FROM staff 
JOIN positions USING(position_id);


SELECT place, COUNT(*) as count_place FROM tickets WHERE session_id > 1 GROUP BY place HAVING COUNT(*) > 1
UNION
SELECT place, COUNT(*) as count_place FROM tickets GROUP BY place HAVING COUNT(*) < 2 ORDER BY count_place DESC;


SELECT first_name, last_name FROM staff 
WHERE EXISTS (SELECT pos_name, salary FROM positions WHERE staff.position_id = positions.position_id);


SELECT hall_name, capacity,
CASE WHEN capacity > 150 THEN 'Big' 
ELSE 'Small'
END as capacity_tier
FROM hall;