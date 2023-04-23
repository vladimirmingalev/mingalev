1. SELECT CONCAT(firstname, ' ', lastname) AS fullname,
   CASE WHEN gender = 'Female' THEN 'Женщина'
        WHEN gender = 'Male' THEN 'Мужчина'
        ELSE 'Неизвестно' END AS gender,
   DATEFORMAT(birthday, '%d %M %Y') AS formattedbirthday
   FROM users;
   
2. SELECT CONCAT(firstname, ' ', lastname) AS fullname,
   CASE WHEN email IS NOT NULL THEN email
        WHEN phonenumber IS NOT NULL THEN phonenumber
        ELSE 'Не задан' END AS contact
   FROM users;
   
3. SELECT DISTINCT SUBSTRINGINDEX(email, '@', -1) AS emailserver
   FROM users;
   
4. SELECT CONCAT(firstname, ' ', lastname) AS fullname,
   TIMESTAMPDIFF(YEAR, birthday, CURDATE()) AS age,
   CASE WHEN TIMESTAMPDIFF(YEAR, birthday, CURDATE()) >= 18 THEN 'совершеннолетний'
        ELSE 'не совершеннолетний' END AS agecategory
   FROM users;
   
5. SELECT SUBSTRINGINDEX(filename, '.', 1) AS filenamewithoutextension,
   ROUND(filesize/10000)10000 AS rounded_file_size
   FROM media_files;
   
6. UPDATE media_files SET created_at = NOW() WHERE creator = 'Frederik Upton';
   
7. SELECT MONTH(birthday) AS birth_month, COUNT() AS userscount
   FROM users
   GROUP BY birthmonth;