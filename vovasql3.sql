use database vova
DECLARE @id INT = 1;
DECLARE @sql NVARCHAR(MAX);

SET @sql = 'SELECT name, email, city, file FROM users WHERE id = ' + CAST(@id AS NVARCHAR(MAX));

EXEC sp_executesql @sql;



CREATE TABLE #temp (
    category VARCHAR(50),
    count INT
);

INSERT INTO #temp (category, count)
SELECT 'music', COUNT(*) FROM files WHERE category = 'music';
INSERT INTO #temp (category, count)
SELECT 'video', COUNT(*) FROM files WHERE category = 'video';
INSERT INTO #temp (category, count)
SELECT 'photo', COUNT(*) FROM files WHERE category = 'photo';

SELECT * FROM #temp;



CREATE VIEW user_attributes AS
SELECT CONCAT(firstname, ' ', lastname) AS name, DATEDIFF(YEAR, birthdate, GETDATE()) AS age, city
FROM users
GROUP BY firstname, lastname, birthdate, city;

SELECT * FROM user_attributes;



CREATE VIEW user_groups AS
SELECT GROUP_CONCAT(CONCAT(firstname, ' ', lastname), ',') AS names, group_name
FROM users
GROUP BY group_name;

SELECT * FROM user_groups;

BEGIN TRANSACTION;

INSERT INTO users (firstname, lastname, birthdate, email, phone, city)
VALUES ('Jack', 'Nicholson', '1937-04-22', 'JackNIk@gmail.com', '+123456789', 'Neptune');

COMMIT TRANSACTION;



BEGIN TRANSACTION;

UPDATE users SET city = 'NewYork' WHERE firstname = 'Frederik' AND lastname = 'Upton';

COMMIT TRANSACTION