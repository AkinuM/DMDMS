CREATE FUNCTION process_anime_log() RETURNS TRIGGER AS $log$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		INSERT INTO logging(username, instructionname, tablename, log_message) VALUES
		((SELECT USER), TG_OP, TG_RELNAME, CONCAT_WS(' ', OLD.anime_id, OLD.anime_name, OLD.release_date, OLD.duration));
		RETURN OLD;
	ELSE INSERT INTO logging(username, instructionname, tablename, log_message) VALUES
		((SELECT USER), TG_OP, TG_RELNAME, CONCAT_WS(' ', NEW.anime_id, NEW.anime_name, NEW.release_date, NEW.duration));
		RETURN NEW;
	END IF;
END;
$log$ LANGUAGE plpgsql;


CREATE TRIGGER anime_log
BEFORE INSERT OR DELETE OR UPDATE ON anime
FOR EACH ROW
EXECUTE PROCEDURE process_anime_log();


CREATE FUNCTION process_genre_log() RETURNS TRIGGER AS $log$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		INSERT INTO logging(username, instructionname, tablename, log_message) VALUES
		((SELECT USER), TG_OP, TG_RELNAME, CONCAT_WS(' ', OLD.genre_id, OLD.genre_name, OLD.description));
		RETURN OLD;
	ELSE INSERT INTO logging(username, instructionname, tablename, log_message) VALUES
		((SELECT USER), TG_OP, TG_RELNAME, CONCAT_WS(' ', NEW.genre_id, NEW.genre_name, NEW.description));
		RETURN NEW;
	END IF;
END;
$log$ LANGUAGE plpgsql;


CREATE TRIGGER genre_log
BEFORE INSERT OR DELETE OR UPDATE ON genre
FOR EACH ROW
EXECUTE PROCEDURE process_genre_log();


CREATE FUNCTION process_hall_log() RETURNS TRIGGER AS $log$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		INSERT INTO logging(username, instructionname, tablename, log_message) VALUES
		((SELECT USER), TG_OP, TG_RELNAME, CONCAT_WS(' ', OLD.hall_id, OLD.hall_name, OLD.capacity));
		RETURN OLD;
	ELSE INSERT INTO logging(username, instructionname, tablename, log_message) VALUES
		((SELECT USER), TG_OP, TG_RELNAME, CONCAT_WS(' ', NEW.hall_id, NEW.hall_name, NEW.capacity));
		RETURN NEW;
	END IF;
END;
$log$ LANGUAGE plpgsql;


CREATE TRIGGER hall_log
BEFORE INSERT OR DELETE OR UPDATE ON hall
FOR EACH ROW
EXECUTE PROCEDURE process_hall_log();