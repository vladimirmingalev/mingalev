1. Вывести все файлы видео с расширениями .avi и .mp4:

SELECT * FROM files WHERE file_extension = 'avi' OR file_extension = 'mp4';


2. Пусть задан некоторый пользователь. Из всех друзей этого пользователя найдите человека, который больше всех общался с выбранным пользователем (написал ему сообщений):

SELECT friend_id, COUNT(*) AS messages_count 
FROM messages 
WHERE user_id = {user_id} 
GROUP BY friend_id 
ORDER BY messages_count DESC 
LIMIT 1;


3. Подсчитать общее количество лайков, которые получили пользователи младше 11 лет:

SELECT SUM(likes_count) AS total_likes_count 
FROM users 
WHERE age < 11;

4. Определить кто больше поставил лайков (всего): мужчины или женщины:

SELECT gender, SUM(likes_count) AS total_likes_count 
FROM users 
GROUP BY gender 
ORDER BY total_likes_count DESC 
LIMIT 1;


5. Вывести количество групп каждого пользователя:

SELECT user_id, COUNT(*) AS groups_count 
FROM user_groups 
GROUP BY user_id;


6. Найти количество пользователей в сообществах:

SELECT group_id, COUNT(*) AS members_count 
FROM group_members 
GROUP BY group_id;


7. Найти 3 пользователей с наибольшим количеством лайков:

SELECT user_id, SUM(likes_count) AS total_likes_count 
FROM users 
GROUP BY user_id 
ORDER BY total_likes_count DESC 
LIMIT 3;