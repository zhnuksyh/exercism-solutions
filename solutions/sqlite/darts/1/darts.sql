-- Schema: CREATE TABLE "darts" ("x" REAL, "y" REAL, score INTEGER);
-- Task: update the darts table and set the score based on the x and y values.

UPDATE darts
SET score = CASE
    WHEN (x*x + y*y) > 100 THEN 0   -- Outside radius 10
    WHEN (x*x + y*y) > 25  THEN 1   -- Between radius 5 and 10
    WHEN (x*x + y*y) > 1   THEN 5   -- Between radius 1 and 5
    ELSE 10                         -- Inside radius 1
END;