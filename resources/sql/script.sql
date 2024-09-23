CREATE TABLE `USERS` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `email` VARCHAR(255) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(40),
  `last_name` VARCHAR(40),
  `address` VARCHAR(255),
  `birth_date` DATE,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `RENTALS` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `vehicle_id` INT,
  `start_city` VARCHAR(255),
  `end_city` VARCHAR(255),
  `start_date_time` DATETIME,
  `end_date_time` DATETIME,
  `price` DECIMAL(12, 2),
  `rental_agency_id` INT,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `RENTAL_AGENCIES` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(255),
  `address` VARCHAR(255),
  `phone_number` VARCHAR(40),
  `director_name` VARCHAR(40),
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `VEHICLES` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `model` VARCHAR(255),
  `passenger_amount` INT,
  `luggage_amount` INT,
  `door_amount` INT,
  `fuel_type` VARCHAR(255),
  `gearbox_type` VARCHAR(255),
  `air_conditioning` BOOLEAN,
  `created_at` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `BOOKING` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `user_id` INT, 
  `rental_id` INT,
  `status` VARCHAR(255) NOT NULL
);

ALTER TABLE `RENTALS` ADD FOREIGN KEY (`vehicle_id`) REFERENCES `VEHICLES` (`id`);
ALTER TABLE `RENTALS` ADD FOREIGN KEY (`rental_agency_id`) REFERENCES `RENTAL_AGENCIES` (`id`);
ALTER TABLE `BOOKING` ADD FOREIGN KEY (`user_id`) REFERENCES `USERS` (`id`);
ALTER TABLE `BOOKING` ADD FOREIGN KEY (`rental_id`) REFERENCES `RENTALS` (`id`);

INSERT INTO USERS (email, password, first_name, last_name, address, birth_date)
VALUES ('test@gmail.com', '$2a$10$TtvgboXV.LyOWWKd/icCxuh8XfTF2foRkB8DH3MPvJKBJz9kqiWhq', 'Test', 'Test', '40 Rue de la faim 75000 Paris', '2024-08-31');

INSERT INTO RENTAL_AGENCIES (name, address, phone_number, director_name)
VALUES ('Test Agence de location', '36 Rue de la soif 75000 Paris', '0396738935', 'Ludovic Marchand');

INSERT INTO VEHICLES (model, passenger_amount, luggage_amount, door_amount, fuel_type, gearbox_type, air_conditioning)
VALUES ('Renault', 4, 3, 4, 'électrique', 'automatique', 1);

INSERT INTO RENTALS (vehicle_id, start_city, end_city, start_date_time, end_date_time, price, rental_agency_id)
VALUES (1, 'Paris', 'Marseille', '2024-10-31 23:59:59', '2024-11-02 23:59:59', 199.99, 1);

INSERT INTO BOOKING (user_id, rental_id, status)
VALUES (1, 1, 'réservé');