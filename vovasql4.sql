BACKUP DATABASE vova TO DISK = 'C:\backup\vova';

CREATE LOGIN superuser WITH PASSWORD = 'vova2005123';
CREATE LOGIN admin WITH PASSWORD = 'bobabiba';
CREATE LOGIN username WITH PASSWORD = 'avadakedabra';

USE vova;
CREATE USER superuser FOR LOGIN superuser;
ALTER ROLE db_owner ADD MEMBER superuser;

CREATE USER admin FOR LOGIN admin;
GRANT SELECT, UPDATE, DELETE, INSERT TO admin;

CREATE USER admin FOR LOGIN username;
GRANT SELECT, INSERT ON table TO admin;

DROP LOGIN admin;

GO