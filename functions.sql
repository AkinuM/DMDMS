-- CREATE FUNCTION count_unpurchased_tickets() RETURNS table(session_id int, count int)
-- LANGUAGE SQL
-- AS $$
--   SELECT session_id, COUNT(*) FROM tickets WHERE availability=true GROUP BY session_id ORDER BY session_id;
-- $$;

-- CREATE FUNCTION staff_salary() RETURNS table(salary_sum int)
-- LANGUAGE SQL
-- AS $$
--   SELECT SUM(salary) FROM staff JOIN positions USING (position_id);
-- $$;

-- CREATE FUNCTION hall_capacity() RETURNS table(hall_name text, capacity int)
-- LANGUAGE SQL
-- AS $$
--   SELECT hall_name, capacity FROM hall;
-- $$;

-- CREATE FUNCTION anime_genre(genres varchar(50)) RETURNS table(anime_name text)
-- LANGUAGE SQL
-- AS $$
--   SELECT anime_name FROM anime_genre JOIN anime USING (anime_id) JOIN genre USING (genre_id) WHERE genre_name LIKE genres;
-- $$;

-- CREATE FUNCTION revenue(years int, months int) RETURNS table(price_sum int)
-- LANGUAGE SQL
-- AS $$
--   SELECT SUM(price) FROM tickets JOIN sessions USING (session_id) 
--   WHERE availability IS false AND date_part('year', sess_date) = years AND date_part('month', sess_date) = months;
-- $$;

-- CREATE FUNCTION popular_anime_count() RETURNS table(anime_name text, counts int)
-- LANGUAGE SQL
-- AS $$
--   SELECT anime_name, COUNT(*) FROM tickets JOIN sessions USING (session_id) JOIN anime USING (anime_id) 
--   WHERE availability IS false GROUP BY anime_name ORDER BY COUNT(*) DESC;
-- $$;

-- CREATE FUNCTION popular_genre_count() RETURNS table(genre_name text, counts int)
-- LANGUAGE SQL
-- AS $$
--   SELECT genre_name, COUNT(*) FROM tickets JOIN sessions USING (session_id) JOIN anime_genre USING (anime_id) JOIN genre USING (genre_id)
--   WHERE availability IS false GROUP BY genre_name ORDER BY COUNT(*) DESC;
-- $$;

-- CREATE FUNCTION popular_anime_revenue() RETURNS table(anime_name text, revenue int)
-- LANGUAGE SQL
-- AS $$
--   SELECT anime_name, SUM(price) FROM tickets JOIN sessions USING (session_id) JOIN anime USING (anime_id)
--   WHERE availability IS false GROUP BY anime_name ORDER BY SUM(price) DESC;
-- $$;

-- CREATE FUNCTION popular_genre_revenue() RETURNS table(genre_name text, revenue int)
-- LANGUAGE SQL
-- AS $$
--   SELECT genre_name, SUM(price) FROM tickets JOIN sessions USING (session_id) JOIN anime_genre USING (anime_id) JOIN genre USING (genre_id)
--   WHERE availability IS false GROUP BY genre_name ORDER BY SUM(price) DESC;
-- $$;

-- CREATE FUNCTION count_sessions_anime() RETURNS table(anime_name text, counts int)
-- LANGUAGE SQL
-- AS $$
--   SELECT anime_name, COUNT(*) FROM sessions JOIN anime USING (anime_id) 
--   GROUP BY anime_name ORDER BY COUNT(*) DESC;
-- $$;