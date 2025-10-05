/* 
	Database Model for [CCINFOM-S20-02]
	Customer Engagement Database Application
    Members: Sevilla, Mariazeta, Siriban, & Tabanao
 */

/* Reset Database */
DROP DATABASE IF EXISTS cloudKitchenCustomers_db;

/* Create the database */
CREATE DATABASE IF NOT EXISTS cloudKitchenCustomers_db;

/* Switch to the vintage_db database */
USE cloudKitchenCustomers_db;

-- Drop Tables If Exist
DROP TABLE IF EXISTS customers; 

-- Make Customer Profiles Table
CREATE TABLE customers (
  customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  contact_number VARCHAR(30),
  created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status_of ENUM('active','deactivated','deleted','banned') NOT NULL DEFAULT 'active',
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  INDEX idx_status (status_of),
  INDEX idx_created_at (created_at),
  INDEX idx_lastname_firstname (last_name, first_name)
) ENGINE=InnoDB;

/*
Customer Profiles Table Explanation
1. customer_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY
= Creates a numeric primary key column that automatically gets the next integer value on insert.
2. & 3. first_name VARCHAR(100) NOT NULL / last_name VARCHAR(100) NOT NULL
= Variable-length string up to 100 characters; NOT NULL requires a value.
4. email VARCHAR(255) NOT NULL UNIQUE
= Stores email up to 255 chars, requires a value, and enforces uniqueness at the DB level.
5. contact_number VARCHAR(30)
= Stores phone numbers as text; optional field (nullable).
6. created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
= Stores insertion time; default value is the current timestamp on row creation.
7. status_of ENUM('active','deactivated','deleted','banned') NOT NULL DEFAULT 'active'
= status is already a keyword, use status_of instead. Restricts to one of the listed values, defaulting to 'active'.
8. updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
= Automatically sets to current timestamp on insert and updates to current timestamp on any row update.
9. Indexes
9.1. INDEX(idx_status) (status_of)
INDEX(idx_status) (status_of) = Fast filtering when you query by status (ex: WHERE status_of = 'active'), 
								used in reports and list queries.
INDEX(idx_created_at) (created_at) = Good for queries that order or filter by creation time (ex: recent signups).
INDEX(idx_lastname_firstname) (last_name, first_name) = Supports queries that search or sort by last name then 
														first name (useful for alphabetical listing or lookups).
10. ENGINE=InnoDB
InnoDB provides transactions, row-level locking, foreign key support, crash recovery. I
t’s the recommended engine for most OLTP (Online Transaction Processing) applications.
*/

-- Batch 1 
INSERT INTO customers (first_name, last_name, email, contact_number, created_at, status_of, updated_at) VALUES
('Juan', 'Dela Cruz', 'juan.dela.cruz@sample.ph', '+63 917-123-4567', '2021-01-12 09:15:23', 'active', '2023-03-10 11:22:10'),
('Maria', 'Santos', 'maria.santos@sample.ph', '+63 912-345-6789', '2022-02-05 14:05:12', 'active', '2024-05-21 08:44:55'),
('Jose', 'Reyes', 'jose.reyes@sample.ph', '+63 921-555-0199', '2021-03-18 10:11:45', 'active', '2022-07-30 09:12:01'),
('Anne', 'Garcia', 'anne.garcia@sample.ph', '+63 2-8723-4567', '2023-06-01 12:34:56', 'active', '2023-12-05 16:10:20'),
('Mark', 'Lopez', 'mark.lopez@sample.ph', '+63 922-333-4455', '2021-07-22 08:22:11', 'active', '2024-01-18 10:00:00'),
('Kristine', 'Bautista', 'kristine.bautista@sample.ph', '+63 917-555-3344', '2022-09-10 13:13:13', 'active', '2023-09-10 13:14:00'),
('Miguel', 'Mendoza', 'miguel.mendoza@sample.ph', '+63 923-111-2233', '2021-11-02 17:45:00', 'active', '2024-07-07 09:09:09'),
('Angelo', 'Ramos', 'angelo.ramos@sample.ph', '+63 2-8675-1122', '2024-01-05 08:00:00', 'active', '2024-09-01 08:00:01'),
('Camille', 'Navarro', 'camille.navarro@sample.ph', '+63 915-777-8888', '2023-03-08 19:20:30', 'active', '2024-03-08 19:20:31'),
('Reynaldo', 'Castillo', 'reynaldo.castillo@sample.ph', '+63 2-8456-9900', '2022-04-14 07:05:05', 'active', '2022-12-12 12:12:12'),
('Leah', 'Valdez', 'leah.valdez@sample.ph', '+63 916-222-3333', '2021-05-20 15:15:15', 'active', '2023-05-20 15:15:15'),
('Rafael', 'Mercado', 'rafael.mercado@sample.ph', '+63 917-888-9999', '2022-08-01 11:11:11', 'active', '2024-02-02 11:11:11'),
('Gina', 'Dizon', 'gina.dizon@sample.ph', '+63 936-444-5555', '2021-09-09 09:09:09', 'active', '2023-09-09 09:09:09'),
('Luis', 'Aquino', 'luis.aquino@sample.ph', '+63 922-444-5566', '2024-03-12 10:10:10', 'active', '2024-06-12 10:10:10'),
('Isabel', 'Soriano', 'isabel.soriano@sample.ph', '+63 917-321-4321', '2023-11-21 14:14:14', 'active', '2024-11-21 14:14:14'),
('Pedro', 'Fernandez', 'pedro.fernandez@sample.ph', '+63 2-8833-7766', '2021-12-31 23:59:59', 'active', '2022-06-30 12:00:00'),
('May', 'Alcantara', 'may.alcantara@sample.ph', '+63 918-654-3210', '2022-10-17 09:35:21', 'active', '2024-08-17 09:35:21'),
('Rico', 'Torres', 'rico.torres@sample.ph', '+63 929-101-2020', '2021-04-04 04:04:04', 'active', '2023-04-04 04:04:04'),
('Liza', 'Montenegro', 'liza.montenegro@sample.ph', '+63 2-8422-3000', '2023-02-20 18:18:18', 'active', '2024-02-20 18:18:18'),
('Nico', 'Oliva', 'nico.oliva@sample.ph', '+63 930-222-3344', '2021-06-06 06:06:06', 'active', '2022-06-06 06:06:06'),
('Theresa', 'Delos Santos', 'theresa.delos.santos@sample.ph', '+63 917-456-7890', '2024-05-01 09:00:00', 'active', '2024-07-01 09:00:00'),
('Erwin', 'Gutierrez', 'erwin.gutierrez@sample.ph', '+63 914-321-9876', '2022-01-30 16:30:00', 'active', '2024-01-30 16:30:00'),
('Carmela', 'Lozada', 'carmela.lozada@sample.ph', '+63 2-8777-1234', '2021-08-15 07:45:12', 'active', '2023-08-15 07:45:12'),
('Vince', 'Panganiban', 'vince.panganiban@sample.ph', '+63 921-777-0001', '2023-05-05 05:05:05', 'active', '2024-05-05 05:05:05'),
('Rosa', 'Manalo', 'rosa.manalo@sample.ph', '+63 916-333-4444', '2022-11-11 11:11:11', 'active', '2023-11-11 11:11:11'),
('Alfred', 'Navarro', 'alfred.navarro@sample.ph', '+63 2-8100-2000', '2021-10-10 10:10:10', 'active', '2023-10-10 10:10:10'),
('Joy', 'Sarmiento', 'joy.sarmiento@sample.ph', '+63 927-555-6666', '2024-04-04 04:04:04', 'active', '2024-09-04 04:04:04'),
('Henry', 'Padilla', 'henry.padilla@sample.ph', '+63 935-888-2222', '2021-02-02 02:02:02', 'active', '2022-02-02 02:02:02'),
('Elaine', 'Marquez', 'elaine.marquez@sample.ph', '+63 917-202-3030', '2022-06-06 06:06:06', 'active', '2023-06-06 06:06:06'),
('Daniel', 'Velasco', 'daniel.velasco@sample.ph', '+63 924-999-1111', '2023-07-07 07:07:07', 'active', '2024-07-07 07:07:07'),
('Rhea', 'Torralba', 'rhea.torralba@sample.ph', '+63 2-8811-4455', '2021-05-05 05:05:05', 'active', '2023-05-05 05:05:05'),
('Joel', 'Malig', 'joel.malig@sample.ph', '+63 916-777-8888', '2022-12-12 12:12:12', 'active', '2023-12-12 12:12:12'),
('Bianca', 'Rebolledo', 'bianca.rebolledo@sample.ph', '+63 918-111-2222', '2023-01-01 09:00:00', 'active', '2024-01-01 09:00:00'),
('Freddy', 'Carlos', 'freddy.carlos@sample.ph', '+63 929-333-4444', '2021-09-20 14:21:00', 'active', '2023-09-20 14:21:00'),
('Sonia', 'Herrera', 'sonia.herrera@sample.ph', '+63 927-303-4040', '2022-03-03 03:03:03', 'active', '2024-03-03 03:03:03'),
('Arnel', 'Cruz', 'arnel.cruz@sample.ph', '+63 915-000-1111', '2024-06-06 06:06:06', 'active', '2024-08-06 06:06:06'),
('Patricia', 'Lopez', 'patricia.lopez@sample.ph', '+63 2-8888-9999', '2021-11-11 11:11:11', 'active', '2022-11-11 11:11:11'),
('Marvin', 'Casimiro', 'marvin.casimiro@sample.ph', '+63 936-101-2020', '2022-07-07 07:07:07', 'active', '2023-07-07 07:07:07'),
('Carla', 'Villanueva', 'carla.villanueva@sample.ph', '+63 917-222-3333', '2023-08-08 08:08:08', 'active', '2024-08-08 08:08:08'),
('Roberto', 'Sison', 'roberto.sison@sample.ph', '+63 928-444-5555', '2021-03-03 03:03:03', 'active', '2022-03-03 03:03:03'),
('Ela', 'Acosta', 'ela.acosta@sample.ph', '+63 2-8123-4567', '2024-02-14 14:14:14', 'active', '2024-06-14 14:14:14'),
('Vernon', 'Del Rosario', 'vernon.del.rosario@sample.ph', '+63 917-909-8080', '2022-05-05 05:05:05', 'active', '2023-05-05 05:05:05'),
('Judith', 'Magno', 'judith.magno@sample.ph', '+63 916-909-9090', '2021-08-08 08:08:08', 'active', '2023-08-08 08:08:08'),
('Paz', 'Galang', 'paz.galang@sample.ph', '+63 927-111-3333', '2023-10-10 10:10:10', 'active', '2024-10-10 10:10:10'),
('Julian', 'Lacson', 'julian.lacson@sample.ph', '+63 936-505-6060', '2021-04-01 09:20:30', 'active', '2022-04-01 09:20:30'),
('Mylene', 'Serrano', 'mylene.serrano@sample.ph', '+63 2-8999-0000', '2022-09-09 09:09:09', 'active', '2024-09-09 09:09:09'),
('Victor', 'Angeles', 'victor.angeles@sample.ph', '+63 917-505-5050', '2023-12-12 12:12:12', 'active', '2024-12-12 12:12:12'),
('Gloria', 'Salvador', 'gloria.salvador@sample.ph', '+63 915-111-4444', '2021-06-15 06:15:00', 'active', '2023-06-15 06:15:00'),
('Ethan', 'Bernardo', 'ethan.bernardo@sample.ph', '+63 930-777-0000', '2022-11-02 11:22:33', 'active', '2023-11-02 11:22:33'),
('Kristo', 'Pineda', 'kristo.pineda@sample.ph', '+63 922-888-1212', '2024-07-07 07:07:07', 'active', '2024-09-07 07:07:07');

-- Batch 2 
INSERT INTO customers (first_name, last_name, email, contact_number, created_at, status_of, updated_at) VALUES
('Aileen', 'Santos', 'aileen.santos@sample.ph', '+63 917-400-5000', '2021-02-18 08:08:08', 'active', '2023-02-18 08:08:08'),
('Ben', 'Tupas', 'ben.tupas@sample.ph', '+63 919-222-3333', '2022-03-21 13:13:13', 'active', '2024-03-21 13:13:13'),
('Celine', 'Abad', 'celine.abad@sample.ph', '+63 932-444-8888', '2021-05-30 15:15:15', 'active', '2022-05-30 15:15:15'),
('Dante', 'Ramos', 'dante.ramos@sample.ph', '+63 927-898-9898', '2023-01-25 10:10:10', 'active', '2024-01-25 10:10:10'),
('Erika', 'Del Mundo', 'erika.del.mundo@sample.ph', '+63 2-8333-1212', '2021-09-17 09:17:00', 'active', '2022-09-17 09:17:00'),
('Felix', 'Bañez', 'felix.banez@sample.ph', '+63 917-333-2222', '2022-12-01 12:12:12', 'active', '2024-12-01 12:12:12'),
('Greta', 'Camacho', 'greta.camacho@sample.ph', '+63 921-404-4040', '2023-04-04 04:04:04', 'active', '2024-04-04 04:04:04'),
('Hector', 'Pimentel', 'hector.pimentel@sample.ph', '+63 933-111-7777', '2021-06-22 06:22:22', 'active', '2023-06-22 06:22:22'),
('Ida', 'Suarez', 'ida.suarez@sample.ph', '+63 2-8122-3333', '2024-03-03 03:03:03', 'active', '2024-06-03 03:03:03'),
('Jomar', 'Tañedo', 'jomar.tanedo@sample.ph', '+63 918-404-5050', '2022-01-10 11:11:11', 'active', '2023-01-10 11:11:11'),
('Karla', 'Espinosa', 'karla.espinosa@sample.ph', '+63 917-606-7070', '2021-08-28 14:14:14', 'active', '2022-08-28 14:14:14'),
('Leo', 'Polo', 'leo.polo@sample.ph', '+63 924-222-1212', '2023-09-09 09:09:09', 'active', '2024-09-09 09:09:09'),
('Maya', 'Fabre', 'maya.fabre@sample.ph', '+63 935-202-2020', '2021-11-19 19:19:19', 'active', '2023-11-19 19:19:19'),
('Noel', 'Gabriel', 'noel.gabriel@sample.ph', '+63 929-800-8000', '2022-02-02 02:02:02', 'active', '2023-02-02 02:02:02'),
('Ophelia', 'Ruiz', 'ophelia.ruiz@sample.ph', '+63 2-8544-1111', '2024-05-15 05:15:15', 'active', '2024-07-15 05:15:15'),
('Paul', 'Tan', 'paul.tan@sample.ph', '+63 917-999-0000', '2021-12-12 12:12:12', 'active', '2023-12-12 12:12:12'),
('Queenie', 'Alegre', 'queenie.alegre@sample.ph', '+63 916-444-6666', '2022-06-06 06:06:06', 'active', '2023-06-06 06:06:06'),
('Ramon', 'Tolentino', 'ramon.tolentino@sample.ph', '+63 930-505-6060', '2023-07-21 07:21:00', 'active', '2024-07-21 07:21:00'),
('Sheila', 'Bustos', 'sheila.bustos@sample.ph', '+63 922-707-8080', '2021-04-14 14:14:14', 'active', '2022-04-14 14:14:14'),
('Tim', 'Concepcion', 'tim.concepcion@sample.ph', '+63 931-111-2222', '2024-01-01 01:01:01', 'active', '2024-06-01 01:01:01'),
('Ursula', 'Delgado', 'ursula.delgado@sample.ph', '+63 2-8990-1111', '2022-08-08 08:08:08', 'active', '2023-08-08 08:08:08'),
('Vance', 'Padua', 'vance.padua@sample.ph', '+63 917-212-2121', '2021-03-12 12:12:12', 'active', '2023-03-12 12:12:12'),
('Winnie', 'Sanchez', 'winnie.sanchez@sample.ph', '+63 926-333-2222', '2023-10-23 10:23:00', 'active', '2024-10-23 10:23:00'),
('Xavier', 'Manalang', 'xavier.manalang@sample.ph', '+63 917-777-1212', '2021-07-07 07:07:07', 'active', '2022-07-07 07:07:07'),
('Yam', 'Rebong', 'yam.rebong@sample.ph', '+63 919-000-1111', '2022-10-10 10:10:10', 'active', '2023-10-10 10:10:10'),
('Zara', 'Villamor', 'zara.villamor@sample.ph', '+63 915-333-1111', '2023-05-30 08:08:08', 'active', '2024-05-30 08:08:08'),
('Aldrin', 'Serrano', 'aldrin.serrano@sample.ph', '+63 936-654-3210', '2021-09-01 09:01:01', 'active', '2023-09-01 09:01:01'),
('Bree', 'Labrador', 'bree.labrador@sample.ph', '+63 922-121-3434', '2022-11-05 11:05:05', 'active', '2023-11-05 11:05:05'),
('Cris', 'Eusebio', 'cris.eusebio@sample.ph', '+63 932-777-8888', '2024-02-02 02:02:02', 'active', '2024-07-02 02:02:02'),
('Dina', 'Padilla', 'dina.padilla@sample.ph', '+63 926-505-5050', '2021-10-20 10:20:20', 'active', '2022-10-20 10:20:20'),
('Eddie', 'Delos Reyes', 'eddie.delos.reyes@sample.ph', '+63 915-202-3030', '2023-03-03 03:03:03', 'active', '2024-03-03 03:03:03'),
('Faye', 'Gonzales', 'faye.gonzales@sample.ph', '+63 917-101-0101', '2022-04-04 04:04:04', 'active', '2023-04-04 04:04:04'),
('Gelo', 'Tañada', 'gelo.tanada@sample.ph', '+63 929-404-5050', '2021-06-06 06:06:06', 'active', '2023-06-06 06:06:06'),
('Hazel', 'Ocampo', 'hazel.ocampo@sample.ph', '+63 918-222-1111', '2024-05-05 05:05:05', 'active', '2024-08-05 05:05:05'),
('Ian', 'Del Castillo', 'ian.del.castillo@sample.ph', '+63 932-303-3030', '2021-01-01 01:01:01', 'active', '2022-01-01 01:01:01'),
('Joyce', 'Herrera', 'joyce.herrera@sample.ph', '+63 917-121-2121', '2022-02-22 02:22:22', 'active', '2023-02-22 02:22:22'),
('Ken', 'Munting', 'ken.munting@sample.ph', '+63 922-212-2121', '2023-04-11 04:11:11', 'active', '2024-04-11 04:11:11'),
('Lorie', 'Sarmiento', 'lorie.sarmiento@sample.ph', '+63 2-8338-1212', '2021-08-18 08:18:18', 'active', '2023-08-18 08:18:18'),
('Mike', 'Alvarado', 'mike.alvarado@sample.ph', '+63 935-131-1313', '2022-12-24 12:24:24', 'active', '2023-12-24 12:24:24'),
('Nadine', 'Cordero', 'nadine.cordero@sample.ph', '+63 927-212-3131', '2024-06-15 06:15:15', 'active', '2024-09-15 06:15:15'),
('Oscar', 'Polo', 'oscar.polo@sample.ph', '+63 936-909-9090', '2021-03-27 03:27:03', 'active', '2023-03-27 03:27:03'),
('Paolo', 'Santiago', 'paolo.santiago@sample.ph', '+63 915-707-7070', '2022-07-07 07:07:07', 'active', '2023-07-07 07:07:07'),
('Que', 'Reyes', 'que.reyes@sample.ph', '+63 929-321-4321', '2023-09-15 09:15:15', 'active', '2024-09-15 09:15:15');

-- Batch 3 
INSERT INTO customers (first_name, last_name, email, contact_number, created_at, status_of, updated_at) VALUES
('Rina', 'Buenaventura', 'rina.buenaventura@sample.ph', '+63 918-808-8080', '2021-05-02 05:02:02', 'active', '2023-05-02 05:02:02'),
('Simon', 'Abadiano', 'simon.abadiano@sample.ph', '+63 917-909-1010', '2022-09-29 09:29:09', 'active', '2024-09-29 09:29:09'),
('Tricia', 'Garcia', 'tricia.garcia@sample.ph', '+63 922-909-9090', '2023-11-11 11:11:11', 'active', '2024-11-11 11:11:11'),
('Ulric', 'Puno', 'ulric.puno@sample.ph', '+63 930-101-0101', '2021-02-14 14:14:14', 'active', '2023-02-14 14:14:14'),
('Val', 'Cruz', 'val.cruz@sample.ph', '+63 2-8722-1111', '2024-03-20 03:20:20', 'active', '2024-07-20 03:20:20'),
('Wesley', 'Tiamzon', 'wesley.tiamzon@sample.ph', '+63 936-010-0100', '2021-12-05 12:05:05', 'active', '2023-12-05 12:05:05'),
('Xena', 'Sison', 'xena.sison@sample.ph', '+63 915-303-3030', '2022-06-16 16:16:16', 'active', '2023-06-16 16:16:16'),
('Yves', 'Alcantara', 'yves.alcantara@sample.ph', '+63 918-606-6060', '2023-01-20 20:20:20', 'active', '2024-01-20 20:20:20'),
('Zed', 'Cervantes', 'zed.cervantes@sample.ph', '+63 927-909-0000', '2021-10-30 10:30:30', 'active', '2023-10-30 10:30:30'),
('Ava', 'Cruz', 'ava.cruz@sample.ph', '+63 917-141-4141', '2022-02-28 02:28:28', 'active', '2023-02-28 02:28:28'),
('Bobby', 'De Leon', 'bobby.de.leon@sample.ph', '+63 932-141-4141', '2023-06-06 06:06:06', 'active', '2024-06-06 06:06:06'),
('Chloe', 'Valerio', 'chloe.valerio@sample.ph', '+63 2-8800-4400', '2021-07-14 07:14:14', 'active', '2022-07-14 07:14:14'),
('Dexter', 'Ortega', 'dexter.ortega@sample.ph', '+63 929-171-7171', '2022-11-30 11:30:30', 'active', '2024-11-30 11:30:30'),
('Eloisa', 'Tadeo', 'eloisa.tadeo@sample.ph', '+63 935-414-1414', '2021-09-09 09:09:09', 'active', '2023-09-09 09:09:09'),
('Ferdinand', 'Del Moral', 'ferdinand.del.moral@sample.ph', '+63 917-616-1616', '2024-04-04 04:04:04', 'active', '2024-08-04 04:04:04'),
('Gretchen', 'Ledesma', 'gretchen.ledesma@sample.ph', '+63 916-232-3232', '2022-01-05 05:05:05', 'active', '2023-01-05 05:05:05'),
('Hugo', 'Calaquian', 'hugo.calaquian@sample.ph', '+63 922-717-1717', '2021-03-03 03:03:03', 'active', '2022-03-03 03:03:03'),
('Isla', 'Talavera', 'isla.talavera@sample.ph', '+63 2-8111-2222', '2023-08-08 08:08:08', 'active', '2024-08-08 08:08:08'),
('Jade', 'Masangkay', 'jade.masangkay@sample.ph', '+63 930-505-5050', '2021-05-05 05:05:05', 'active', '2023-05-05 05:05:05'),
('Kirk', 'Luna', 'kirk.luna@sample.ph', '+63 917-989-8989', '2022-07-07 07:07:07', 'active', '2023-07-07 07:07:07'),
('Lani', 'Santiago', 'lani.santiago@sample.ph', '+63 918-909-9090', '2024-01-07 01:07:07', 'active', '2024-09-07 01:07:07'),
('Marco', 'Bien', 'marco.bien@sample.ph', '+63 921-909-9090', '2021-11-11 11:11:11', 'active', '2023-11-11 11:11:11'),
('Nora', 'Buen', 'nora.buen@sample.ph', '+63 936-232-3232', '2022-04-21 04:21:04', 'active', '2023-04-21 04:21:04'),
('Omar', 'Flores', 'omar.flores@sample.ph', '+63 929-555-1111', '2023-09-29 09:29:09', 'active', '2024-09-29 09:29:09'),
('Pia', 'Cruzado', 'pia.cruzado@sample.ph', '+63 2-8555-6666', '2021-12-01 12:01:12', 'active', '2023-12-01 12:01:12'),
('Quincy', 'Salazar', 'quincy.salazar@sample.ph', '+63 915-707-1010', '2024-02-20 02:20:20', 'active', '2024-06-20 02:20:20'),
('Ramon', 'Esguerra', 'ramon.esguerra@sample.ph', '+63 917-303-3030', '2022-06-12 06:12:12', 'active', '2023-06-12 06:12:12'),
('Sofia', 'Galang', 'sofia.galang@sample.ph', '+63 921-808-8080', '2021-08-25 08:25:08', 'active', '2023-08-25 08:25:08'),
('Tony', 'Espino', 'tony.espino@sample.ph', '+63 918-232-3232', '2023-03-15 03:15:15', 'active', '2024-03-15 03:15:15'),
('Ulysses', 'Bantug', 'ulysses.bantug@sample.ph', '+63 936-666-7777', '2021-10-08 10:08:10', 'active', '2022-10-08 10:08:10'),
('Vicky', 'Cabaluna', 'vicky.cabaluna@sample.ph', '+63 2-8666-7777', '2022-01-25 01:25:25', 'active', '2023-01-25 01:25:25'),
('Waldo', 'Gatdula', 'waldo.gatdula@sample.ph', '+63 917-404-4044', '2024-06-06 06:06:06', 'active', '2024-09-06 06:06:06'),
('Ximena', 'Capuno', 'ximena.capuno@sample.ph', '+63 922-505-5050', '2021-02-02 02:02:02', 'active', '2023-02-02 02:02:02'),
('Yvette', 'Javier', 'yvette.javier@sample.ph', '+63 918-808-1212', '2022-09-09 09:09:09', 'active', '2023-09-09 09:09:09'),
('Zion', 'Torbenson', 'zion.torbenson@sample.ph', '+63 930-909-9090', '2023-07-01 07:01:07', 'active', '2024-07-01 07:01:07');

-- Batch 4
INSERT INTO customers (first_name, last_name, email, contact_number, created_at, status_of, updated_at) VALUES
('Ari', 'Lacap', 'ari.lacap@sample.ph', '+63 917-141-1414', '2021-03-01 03:01:03', 'active', '2023-03-01 03:01:03'),
('Bella', 'Razon', 'bella.razon@sample.ph', '+63 915-212-2121', '2022-05-07 05:07:05', 'active', '2023-05-07 05:07:05'),
('Carmel', 'Roa', 'carmel.roa@sample.ph', '+63 932-999-0000', '2021-06-06 06:06:06', 'active', '2023-06-06 06:06:06'),
('Dax', 'Lapeña', 'dax.lapena@sample.ph', '+63 929-090-0900', '2024-04-14 04:14:14', 'active', '2024-08-14 04:14:14'),
('Eden', 'Yabut', 'eden.yabut@sample.ph', '+63 2-8770-7777', '2022-08-08 08:08:08', 'active', '2023-08-08 08:08:08'),
('Fiona', 'Librada', 'fiona.librada@sample.ph', '+63 917-232-4242', '2021-10-12 10:12:10', 'active', '2023-10-12 10:12:10'),
('Gian', 'Cruz', 'gian.cruz@sample.ph', '+63 918-707-7070', '2023-02-02 02:02:02', 'active', '2024-02-02 02:02:02'),
('Hannah', 'Lim', 'hannah.lim@sample.ph', '+63 922-404-0202', '2021-11-11 11:11:11', 'active', '2023-11-11 11:11:11'),
('Ivy', 'Santos', 'ivy.santos@sample.ph', '+63 936-222-1212', '2022-12-12 12:12:12', 'active', '2023-12-12 12:12:12'),
('Jules', 'De Guzman', 'jules.de.guzman@sample.ph', '+63 930-333-2222', '2024-01-30 01:30:30', 'active', '2024-07-30 01:30:30'),
('Kaye', 'Tiongson', 'kaye.tiongson@sample.ph', '+63 917-303-2020', '2021-09-19 09:19:19', 'active', '2023-09-19 09:19:19'),
('Louie', 'Yap', 'louie.yap@sample.ph', '+63 915-888-2222', '2022-03-03 03:03:03', 'active', '2023-03-03 03:03:03'),
('Mitch', 'Cardenas', 'mitch.cardenas@sample.ph', '+63 921-606-6060', '2021-07-07 07:07:07', 'active', '2023-07-07 07:07:07'),
('Nikki', 'Ong', 'nikki.ong@sample.ph', '+63 918-555-1212', '2023-05-12 05:12:05', 'active', '2024-05-12 05:12:05'),
('Olive', 'Paz', 'olive.paz@sample.ph', '+63 2-8112-3434', '2021-02-22 02:22:22', 'active', '2023-02-22 02:22:22'),
('Perry', 'Cruz', 'perry.cruz@sample.ph', '+63 935-444-1212', '2022-06-30 06:30:30', 'active', '2023-06-30 06:30:30'),
('Queena', 'Mendoza', 'queena.mendoza@sample.ph', '+63 922-131-3131', '2023-08-20 08:20:08', 'active', '2024-08-20 08:20:08'),
('Ricky', 'Pangan', 'ricky.pangan@sample.ph', '+63 915-414-1414', '2021-04-10 04:10:10', 'active', '2022-04-10 04:10:10'),
('Samantha', 'Guerrero', 'samantha.guerrero@sample.ph', '+63 929-232-2323', '2024-03-03 03:03:03', 'active', '2024-07-03 03:03:03'),
('Tomas', 'Bautista', 'tomas.bautista@sample.ph', '+63 917-171-1717', '2021-05-25 05:25:05', 'active', '2023-05-25 05:25:05'),
('Ula', 'Cervantes', 'ula.cervantes@sample.ph', '+63 936-909-1010', '2022-09-14 09:14:09', 'active', '2023-09-14 09:14:09'),
('Violeta', 'Cruz', 'violeta.cruz@sample.ph', '+63 2-8444-0000', '2021-01-20 01:20:20', 'active', '2023-01-20 01:20:20'),
('Warren', 'Cornejo', 'warren.cornejo@sample.ph', '+63 917-909-2020', '2022-11-02 11:02:11', 'active', '2023-11-02 11:02:11'),
('Xandra', 'Azcuna', 'xandra.azcuna@sample.ph', '+63 918-404-0404', '2023-06-06 06:06:06', 'active', '2024-06-06 06:06:06'),
('Yolanda', 'Lomboy', 'yolanda.lomboy@sample.ph', '+63 921-777-1212', '2021-10-01 10:01:10', 'active', '2023-10-01 10:01:10'),
('Zoe', 'Valenzuela', 'zoe.valenzuela@sample.ph', '+63 915-131-2121', '2024-07-07 07:07:07', 'active', '2024-09-07 07:07:07'),
('Arwin', 'Delos Angeles', 'arwin.delos.angeles@sample.ph', '+63 936-414-4141', '2021-08-08 08:08:08', 'active', '2023-08-08 08:08:08'),
('Belinda', 'Magsino', 'belinda.magsino@sample.ph', '+63 917-606-9090', '2022-02-14 02:14:14', 'active', '2023-02-14 02:14:14'),
('Carson', 'Eraso', 'carson.eraso@sample.ph', '+63 922-101-1010', '2023-03-03 03:03:03', 'active', '2024-03-03 03:03:03'),
('Dulce', 'Serrano', 'dulce.serrano@sample.ph', '+63 918-808-8088', '2021-09-09 09:09:09', 'active', '2023-09-09 09:09:09'),
('Evan', 'Bautista', 'evan.bautista@sample.ph', '+63 929-505-5050', '2022-12-12 12:12:12', 'active', '2023-12-12 12:12:12'),
('Felicity', 'Tolosa', 'felicity.tolosa@sample.ph', '+63 2-8331-3333', '2021-06-18 06:18:06', 'active', '2023-06-18 06:18:06'),
('Glen', 'Padua', 'glen.padua@sample.ph', '+63 915-212-4141', '2024-05-02 05:02:05', 'active', '2024-08-02 05:02:05'),
('Hana', 'Guevarra', 'hana.guevarra@sample.ph', '+63 932-414-1414', '2021-11-29 11:29:11', 'active', '2023-11-29 11:29:11'),
('Ian', 'Roldan', 'ian.roldan@sample.ph', '+63 917-888-1212', '2022-04-04 04:04:04', 'active', '2023-04-04 04:04:04'),
('Jessa', 'Abella', 'jessa.abella@sample.ph', '+63 922-414-4141', '2023-10-10 10:10:10', 'active', '2024-10-10 10:10:10'),
('Kimo', 'Tupaz', 'kimo.tupaz@sample.ph', '+63 936-123-4567', '2021-02-02 02:02:02', 'active', '2023-02-02 02:02:02'),
('Lara', 'Paderes', 'lara.paderes@sample.ph', '+63 915-909-9090', '2022-07-07 07:07:07', 'active', '2023-07-07 07:07:07'),
('Miko', 'Yambao', 'miko.yambao@sample.ph', '+63 929-121-2121', '2021-05-05 05:05:05', 'active', '2023-05-05 05:05:05'),
('Nestor', 'Villar', 'nestor.villar@sample.ph', '+63 918-333-7777', '2023-01-17 01:17:01', 'active', '2024-01-17 01:17:01'),
('Odie', 'Panganiban', 'odie.panganiban@sample.ph', '+63 2-8444-1212', '2022-08-08 08:08:08', 'active', '2023-08-08 08:08:08');

-- Batch 5 - includes the non-active statuses (deactivated, banned, deleted)
INSERT INTO customers (first_name, last_name, email, contact_number, created_at, status_of, updated_at) VALUES
('Pauline', 'Salonga', 'pauline.salonga@sample.ph', '+63 917-101-1212', '2021-01-15 01:15:15', 'active', '2023-01-15 01:15:15'),
('Quinn', 'Ocampo', 'quinn.ocampo@sample.ph', '+63 915-909-1010', '2022-03-03 03:03:03', 'active', '2024-03-03 03:03:03'),
('Rogelio', 'Garcia', 'rogelio.garcia@sample.ph', '+63 932-232-3232', '2023-06-06 06:06:06', 'active', '2024-06-06 06:06:06'),
('Selma', 'Hernandez', 'selma.hernandez@sample.ph', '+63 2-8111-3333', '2021-04-04 04:04:04', 'active', '2023-04-04 04:04:04'),
('Terry', 'Reyes', 'terry.reyes@sample.ph', '+63 918-808-9090', '2022-05-12 05:12:12', 'active', '2023-05-12 05:12:12'),
('Una', 'Luna', 'una.luna@sample.ph', '+63 929-909-8080', '2021-09-09 09:09:09', 'active', '2023-09-09 09:09:09'),
('Vito', 'Torres', 'vito.torres@sample.ph', '+63 936-909-3030', '2024-02-02 02:02:02', 'active', '2024-07-02 02:02:02'),
('Willa', 'Mendoza', 'willa.mendoza@sample.ph', '+63 917-111-2121', '2021-06-06 06:06:06', 'active', '2023-06-06 06:06:06'),
('Xerxes', 'Garcia', 'xerxes.garcia@sample.ph', '+63 922-707-4040', '2022-11-11 11:11:11', 'active', '2023-11-11 11:11:11'),
('Yani', 'Olivares', 'yani.olivares@sample.ph', '+63 915-212-3232', '2023-08-08 08:08:08', 'active', '2024-08-08 08:08:08'),
('Zedrick', 'Manalo', 'zedrick.manalo@sample.ph', '+63 936-808-8080', '2021-03-23 03:23:03', 'active', '2023-03-23 03:23:03'),
('Aimee', 'Pineda', 'aimee.pineda@sample.ph', '+63 917-404-1212', '2022-12-12 12:12:12', 'active', '2024-12-12 12:12:12'),
('Basil', 'Taneo', 'basil.taneo@sample.ph', '+63 929-111-2222', '2021-07-07 07:07:07', 'active', '2023-07-07 07:07:07'),
('Cathy', 'Subido', 'cathy.subido@sample.ph', '+63 918-909-2020', '2023-05-05 05:05:05', 'deactivated', '2024-05-05 05:05:05'),
('Daryl', 'Vega', 'daryl.vega@sample.ph', '+63 936-121-1212', '2022-01-01 01:01:01', 'deactivated', '2023-01-01 01:01:01'),
('Eileen', 'Aguilar', 'eileen.aguilar@sample.ph', '+63 915-909-9091', '2021-02-02 02:02:02', 'deactivated', '2022-02-02 02:02:02'),
('Fritz', 'Molano', 'fritz.molano@sample.ph', '+63 922-888-3333', '2023-03-03 03:03:03', 'deactivated', '2024-03-03 03:03:03'),
('Gem', 'Buencamino', 'gem.buencamino@sample.ph', '+63 917-100-2000', '2022-06-06 06:06:06', 'deactivated', '2024-06-06 06:06:06'),
('Hilda', 'Lazaro', 'hilda.lazaro@sample.ph', '+63 929-202-2020', '2021-09-09 09:09:09', 'deactivated', '2023-09-09 09:09:09'),
('Ivan', 'Yap', 'ivan.yap@sample.ph', '+63 936-606-6066', '2024-04-04 04:04:04', 'deactivated', '2024-08-04 04:04:04'),
('Jocelyn', 'Sarmiento', 'jocelyn.sarmiento@sample.ph', '+63 915-303-4040', '2021-11-11 11:11:11', 'deactivated', '2023-11-11 11:11:11'),
('Karlo', 'Fernandez', 'karlo.fernandez@sample.ph', '+63 917-212-3232', '2022-12-12 12:12:12', 'banned', '2023-12-12 12:12:12'),
('Liza', 'Torralba', 'liza.torralba@sample.ph', '+63 929-000-1111', '2021-08-08 08:08:08', 'banned', '2022-08-08 08:08:08'),
('Mario', 'Solis', 'mario.solis@sample.ph', '+63 936-202-2020', '2023-06-16 06:16:16', 'banned', '2024-06-16 06:16:16'),
('Nina', 'Del Rosario', 'nina.del.rosario@sample.ph', '+63 917-808-8081', '2022-02-02 02:02:02', 'banned', '2023-02-02 02:02:02'),
('Oswald', 'Pangilinan', 'oswald.pangilinan@sample.ph', '+63 915-909-3030', '2021-04-04 04:04:04', 'banned', '2023-04-04 04:04:04'),
('Priscilla', 'Apostol', 'priscilla.apostol@sample.ph', '+63 922-404-4041', '2024-01-20 01:20:20', 'banned', '2024-07-20 01:20:20'),
('Quintin', 'Valdez', 'quintin.valdez@sample.ph', '+63 936-505-6060', '2021-06-06 06:06:06', 'deleted', '2022-06-06 06:06:06'),
('Rita', 'Del Pilar', 'rita.del.pilar@sample.ph', '+63 917-909-4040', '2022-03-03 03:03:03', 'deleted', '2023-03-03 03:03:03'),
('Samuel', 'Martinez', 'samuel.martinez@sample.ph', '+63 929-909-9091', '2023-09-09 09:09:09', 'deleted', '2024-09-09 09:09:09'),
('Tanya', 'Lizada', 'tanya.lizada@sample.ph', '+63 915-111-2223', '2021-12-12 12:12:12', 'deleted', '2022-12-12 12:12:12'),
('Uriel', 'Cordero', 'uriel.cordero@sample.ph', '+63 916-141-1414', '2022-07-07 07:07:07', 'deleted', '2023-07-07 07:07:07'),
('Vera', 'Pangan', 'vera.pangan@sample.ph', '+63 932-121-2122', '2024-02-02 02:02:02', 'deleted', '2024-07-02 02:02:02');
