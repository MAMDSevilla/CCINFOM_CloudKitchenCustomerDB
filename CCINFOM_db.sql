
-- Database + safety drops
CREATE DATABASE IF NOT EXISTS CCINFOM_db;
USE CCINFOM_db;

-- Drop existing tables
DROP TABLE IF EXISTS customerAddressRecords;
DROP TABLE IF EXISTS customerOrderRecords;

CREATE TABLE customerAddressRecords (
	customerNumber int,
    streetAddress varchar(50),
    barangay varChar(50),
    city varChar(50),
    province varChar(50),
    zipCode int,
    PRIMARY KEY (customerName),
    FOREIGN KEY(customerNumber) REFERENCES customerAddressRecords (customerNumber)
);
/*
Customer Address Records Table Explanation
1) customerNumber INT NOT NULL PRIMARY KEY
   = Stable identifier for a customer in the address book; we use it as the primary key.
2) streetAddress VARCHAR(100) NOT NULL
   = Required line for house/lot/building and street.
3) barangay VARCHAR(50)
   = Optional smaller administrative unit (can be NULL if not applicable).
4) city VARCHAR(50) NOT NULL / province VARCHAR(50) NOT NULL
   = Required higher-level location fields for filtering and reporting.
5) zipCode VARCHAR(10)
   = Stored as text to preserve leading zeros and support non-numeric codes.
*/

CREATE TABLE customerOrderRecords (
	customerNumber int,
    orderNumber int,
	orderDate date NOT NULL,
    orderedTime time NOT NULL,
    orderedTimeFulfilled time,
    status varchar(15) NOT NULL,
	PRIMARY KEY(customerIDNo),
    FOREIGN KEY(customerNumber) REFERENCES customerAddressRecords (customerNumber)
);
/*
Customer Order Records Table Explanation
1) orderNumber INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
   = Surrogate key that uniquely identifies each order.
2) customerNumber INT NOT NULL
   = Points to the customer placing the order (see foreign key).
3) orderDate DATE NOT NULL / orderedTime TIME NOT NULL
   = Required date and time of when the order was placed.
4) orderedTimeFulfilled TIME
   = Optional; time when the order was completed.
5) status ENUM('pending','fulfilled','cancelled') NOT NULL DEFAULT 'pending'
   = Restricts status to the defined lifecycle values with a sensible default.
*/


