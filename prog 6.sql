CREATE TABLE N_RollCall(
    id INT,
    name VARCHAR(10),
    roll INT
);

CREATE TABLE O_RollCall(
    id INT,
    name VARCHAR(10),
    roll INT
);

DELIMITER $$

CREATE PROCEDURE sync_rollcall()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_name VARCHAR(100);
    DECLARE v_roll INT;
    DECLARE v_count INT;

    DECLARE cur_rollcall CURSOR FOR
        SELECT id, name, roll FROM N_RollCall;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur_rollcall;

    read_loop: LOOP
        FETCH cur_rollcall INTO v_id, v_name, v_roll;
        IF done THEN
            LEAVE read_loop;
        END IF;

        SELECT COUNT(*) INTO v_count
        FROM O_RollCall
        WHERE id = v_id;

        IF v_count = 0 THEN
            INSERT INTO O_RollCall (id, name, roll)
            VALUES (v_id, v_name, v_roll);
        END IF;

    END LOOP;

    CLOSE cur_rollcall;

    COMMIT;
END$$

DELIMITER ;