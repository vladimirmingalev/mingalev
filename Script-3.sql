CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(50),
    birthdate DATE,
    gender ENUM('male', 'female'),
    city VARCHAR(50),
    country VARCHAR(50)
);

 запрос на добавление нового пользователя:

INSERT INTO users (id, name, email, password, birthdate, gender, city, country)
VALUES (1, 'Ivan Ivanov', 'IvaIvanov@gmail.com', 'password123', '1990-01-01', 'male', 'Moscow', 'Russia');

 запрос на изменение данных пользователя:

UPDATE users
SET name = 'Ivan Ivanov', city = 'Moscow'
WHERE id = 1;

 запрос на удаление пользователя:

DELETE FROM users
WHERE id = 1;

 таблицы для хранения сообществ:

CREATE TABLE groups (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    description TEXT,
    creatorid INT,
    createdat DATETIME
);

запрос на добавление нового сообщества:

INSERT INTO groups (id, name, description, creatorid, createdat)
VALUES (1, 'Music Lovers', 'A group for music enthusiasts', 2, NOW());

запрос на изменение данных сообщества:

UPDATE groups
SET description = 'A group for music lovers of all genres'
WHERE id = 1;

 запрос на удаление сообщества:

DELETE FROM groups
WHERE id = 1;

таблицы для хранения друзей:

CREATE TABLE friends (
    userid INT,
    friendid INT,
    status ENUM('pending', 'accepted', 'rejected'),
    PRIMARY KEY (userid, friendid)
);

 запрос на добавление нового друга:

INSERT INTO friends (userid, friendid, status)
VALUES (3, 4, 'pending');

 запрос на изменение статуса друга:

UPDATE friends
SET status = 'accepted'
WHERE userid = 3 AND friendid = 4;

запрос на удаление друга:

DELETE FROM friends
WHERE userid = 3 AND friendid = 4;