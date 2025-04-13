-- Users and Grant Permissions --
/* Creating Users and Grant Permissions */
CREATE USER '<enter_user_name>'@'localhost' IDENTIFIED BY "<enter_password>";

GRANT SELECT, INSERT, UPDATE, DELETE ON BookStoreDB.* TO '<enter_user_name>'@'localhost';
FLUSH PRIVILEGES;

CREATE ROLE 'read_only';
GRANT SELECT ON BookStoreDB.* TO 'read_only';
GRANT 'read_only' TO '<enter_user_name>'@'localhost';

