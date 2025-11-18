--                         ADMIN
-- MDP
DROP USER IF EXISTS 'admin'@'localhost';
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';

-- Droits
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'localhost' WITH GRANT OPTION;



--                          USER
-- chef ------------------------------------------------------------------------------------
DROP USER IF EXISTS 'chef'@'localhost';
CREATE USER 'chef'@'localhost' IDENTIFIED BY '1234';

-- Droits
GRANT SELECT ON la_bulle_du_giec.* TO 'chef'@'localhost';
GRANT INSERT, UPDATE, DELETE ON la_bulle_du_giec.techs TO 'chef'@'localhost';
GRANT INSERT, UPDATE, DELETE ON la_bulle_du_giec.admins TO 'chef'@'localhost';
GRANT INSERT, UPDATE, DELETE ON la_bulle_du_giec.capteurs TO 'chef'@'localhost';-- tech
GRANT INSERT ON la_bulle_du_giec.releves TO 'chef'@'localhost';-- tech
GRANT INSERT, UPDATE, DELETE ON la_bulle_du_giec.rapports TO 'chef'@'localhost';-- admin



-- technique ------------------------------------------------------------------------------------
DROP USER IF EXISTS 'technique'@'localhost';
CREATE USER 'technique'@'localhost' IDENTIFIED BY '1234';

-- Droits
GRANT SELECT ON la_bulle_du_giec.* TO 'technique'@'localhost';
GRANT SELECT ON la_bulle_du_giec.employes TO 'technique'@'localhost';
REVOKE SELECT ON la_bulle_du_giec.employes FROM 'technique'@'localhost';
GRANT INSERT, UPDATE, DELETE ON la_bulle_du_giec.capteurs TO 'technique'@'localhost';
GRANT INSERT ON la_bulle_du_giec.releves TO 'technique'@'localhost';



-- administratif ------------------------------------------------------------------------------------
DROP USER IF EXISTS 'administratif'@'localhost';
CREATE USER 'administratif'@'localhost' IDENTIFIED BY '1234';

-- Droits
GRANT SELECT ON la_bulle_du_giec.* TO 'administratif'@'localhost';
GRANT SELECT ON la_bulle_du_giec.employes TO 'administratif'@'localhost';
REVOKE SELECT ON la_bulle_du_giec.employes FROM 'administratif'@'localhost';
GRANT INSERT, UPDATE, DELETE ON la_bulle_du_giec.rapports TO 'administratif'@'localhost';


