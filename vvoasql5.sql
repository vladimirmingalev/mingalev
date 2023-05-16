CREATE PROCEDURE VovaCity
AS
BEGIN
    CREATE TABLE temp (
        city VARCHAR(50),
        count INT
    )

    INSERT INTO temp (city, count)
    SELECT city, COUNT(*) AS count
    FROM users
    GROUP BY city

    SELECT * FROM temp

    DROP TABLE temp
END


CREATE TRIGGER DeleteUserFiles
ON users
AFTER DELETE
AS
BEGIN
    DECLARE @userId INT
    SELECT @userId = deleted.id FROM deleted

    DELETE FROM files WHERE user_id = @userId
END


CREATE TRIGGER CheckUserBirthdate
ON users
AFTER INSERT
AS
BEGIN
    DECLARE @currentDate DATE = GETDATE()

    UPDATE users SET birthdate = @currentDate WHERE birthdate > @currentDate
END


CREATE TRIGGER UpdateMediaUpdatedAt
ON media
AFTER UPDATE
AS
BEGIN
    UPDATE media SET updated_at = GETDATE() WHERE id IN (SELECT id FROM inserted)
END


CREATE TRIGGER CheckUserDataOnInsert
ON users
AFTER INSERT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM inserted WHERE firstname = '' OR lastname = '' OR email = '' OR phone NOT LIKE '7%')
    BEGIN
        RAISERROR('Invalid user data', 16, 1)
        ROLLBACK TRANSACTION
    END
END


CREATE FUNCTION DeleteUserById (@userId INT)
RETURNS INT
AS
BEGIN
    DECLARE @rowsAffected INT

    BEGIN TRANSACTION

    DELETE FROM profiles WHERE user_id = @userId
    DELETE FROM users WHERE id = @userId

    SET @rowsAffected = @@ROWCOUNT

    IF @@ERROR <> 0
    BEGIN
        ROLLBACK TRANSACTION
        RETURN -1
    END

    COMMIT TRANSACTION

    RETURN @rowsAffected
END


CREATE FUNCTION hello()
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @currentTime TIME = CONVERT(TIME, GETDATE())
    DECLARE @greeting VARCHAR(50)

    IF @currentTime >= '06:00:00' AND @currentTime < '12:00:00'
        SET @greeting = 'Доброе утро'
    ELSE IF @currentTime >= '12:00:00' AND @currentTime < '18:00:00'
        SET @greeting = 'Добрый день'
    ELSE IF @currentTime >= '18:00:00' AND @currentTime < '00:00:00'
        SET @greeting = 'Добрый вечер'
    ELSE
        SET @greeting = 'Доброй ночи'

    RETURN @greeting
END