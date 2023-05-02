Простые запросы:
1. Вывести все записи из таблицы "users":

SELECT * FROM users;


2. Вывести только имена пользователей из таблицы "users":

SELECT name FROM users;


Запросы с агрегациями:
1. Подсчитать количество пользователей в таблице "users":

SELECT COUNT(*) AS total_users FROM users;


2. Подсчитать общее количество лайков, которые получили пользователи:

SELECT SUM(likes_count) AS total_likes_count FROM users;


Сложные запросы с объединением таблиц с помощью Join:
1. Вывести все сообщения и имена пользователей, которые их отправили:

SELECT messages.message_text, users.name 
FROM messages 
JOIN users ON messages.user_id = users.id;


2. Вывести все группы и имена пользователей, которые состоят в этих группах:

SELECT user_groups.group_name, users.name 
FROM user_groups 
JOIN group_members ON user_groups.id = group_members.group_id 
JOIN users ON group_members.user_id = users.id;


3. Вывести все сообщения и имена пользователей, которые их отправили, упорядоченные по времени отправки сообщения:

SELECT messages.message_text, users.name 
FROM messages 
JOIN users ON messages.user_id = users.id 
ORDER BY messages.timestamp;


Сложные запросы с объединением таблиц подзапросами:
1. Вывести все группы, в которых состоят пользователи младше 18 лет:

SELECT * FROM user_groups 
WHERE id IN (SELECT group_id FROM group_members WHERE user_id IN (SELECT id FROM users WHERE age < 18));


2. Вывести все сообщения, отправленные пользователями, младше 18 лет:

SELECT * FROM messages 
WHERE user_id IN (SELECT id FROM users WHERE age < 18);


3. Вывести все сообщения, отправленные пользователями, младше 18 лет, и имена этих пользователей:

SELECT messages.message_text, users.name 
FROM messages 
JOIN users ON messages.user_id = users.id 
WHERE user_id IN (SELECT id FROM users WHERE age < 18);