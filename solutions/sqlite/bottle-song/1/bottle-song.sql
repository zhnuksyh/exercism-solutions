-- Schema:
-- CREATE TABLE "bottle-song" (
--         start_bottles INTEGER NOT NULL,
--         take_down     INTEGER NOT NULL,
--         result        TEXT
-- );
-- Task: update bottle-song table and set the result based on the
-- start_bottles and take_down.

UPDATE "bottle-song"
SET result = (
    WITH RECURSIVE verses(n) AS (
        -- Base case: start with the initial number of bottles
        SELECT start_bottles
        UNION ALL
        -- Recursive step: count down until we've processed 'take_down' amount of verses
        SELECT n - 1 FROM verses 
        WHERE n > (start_bottles - take_down + 1)
    )
    SELECT GROUP_CONCAT(
        (CASE n
            WHEN 10 THEN 'Ten' WHEN 9 THEN 'Nine' WHEN 8 THEN 'Eight' WHEN 7 THEN 'Seven'
            WHEN 6 THEN 'Six' WHEN 5 THEN 'Five' WHEN 4 THEN 'Four' WHEN 3 THEN 'Three'
            WHEN 2 THEN 'Two' WHEN 1 THEN 'One'
        END) || ' green bottle' || (CASE WHEN n = 1 THEN '' ELSE 's' END) || ' hanging on the wall,' || char(10) ||
        (CASE n
            WHEN 10 THEN 'Ten' WHEN 9 THEN 'Nine' WHEN 8 THEN 'Eight' WHEN 7 THEN 'Seven'
            WHEN 6 THEN 'Six' WHEN 5 THEN 'Five' WHEN 4 THEN 'Four' WHEN 3 THEN 'Three'
            WHEN 2 THEN 'Two' WHEN 1 THEN 'One'
        END) || ' green bottle' || (CASE WHEN n = 1 THEN '' ELSE 's' END) || ' hanging on the wall,' || char(10) ||
        'And if one green bottle should accidentally fall,' || char(10) ||
        'There''ll be ' || 
        (CASE (n - 1)
            WHEN 9 THEN 'nine' WHEN 8 THEN 'eight' WHEN 7 THEN 'seven' WHEN 6 THEN 'six'
            WHEN 5 THEN 'five' WHEN 4 THEN 'four' WHEN 3 THEN 'three' WHEN 2 THEN 'two'
            WHEN 1 THEN 'one' WHEN 0 THEN 'no'
        END) || ' green bottle' || (CASE WHEN (n - 1) = 1 THEN '' ELSE 's' END) || ' hanging on the wall.',
        char(10) || char(10) -- This is the separator between verses
    )
    FROM verses
);