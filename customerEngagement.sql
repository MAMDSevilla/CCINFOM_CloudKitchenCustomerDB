DROP DATABASE IF EXISTS customerengagement;

-- Temporary DB
CREATE DATABASE IF NOT EXISTS customerengagement;

USE customerengagement;

DROP TABLE IF EXISTS customer_loyalty;

-- Customer loyalty record table creation
CREATE TABLE IF NOT EXISTS customer_loyalty (
    loyalty_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    loyalty_points INT DEFAULT 0,
    loyalty_tier ENUM('Bronze', 'Silver', 'Gold', 'Platinum') NOT NULL DEFAULT 'Bronze',
    rewards_claimed INT DEFAULT 0,
    update_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Trigger automatically updates loyalty_tier based on loyalty_points and the update_date
DELIMITER $$
CREATE TRIGGER update_loyalty_tier
BEFORE UPDATE ON customer_loyalty
FOR EACH ROW
BEGIN
    DECLARE new_tier ENUM('Bronze', 'Silver', 'Gold', 'Platinum');

    -- Determine tier based on updated points
    IF NEW.loyalty_points < 500 THEN
        SET new_tier = 'Bronze';
    ELSEIF NEW.loyalty_points < 1000 THEN
        SET new_tier = 'Silver';
    ELSEIF NEW.loyalty_points < 2000 THEN
        SET new_tier = 'Gold';
    ELSE
        SET new_tier = 'Platinum';
    END IF;

    -- Update tier if it changed
    IF NEW.loyalty_tier != new_tier THEN
        SET NEW.loyalty_tier = new_tier;
        SET NEW.update_date = CURRENT_TIMESTAMP;
    END IF;
END$$
DELIMITER ;

SELECT * FROM customer_loyalty;

/* Loyalty Record Table Documentation
1. loyalty_id 
= Assigns customer_id to a unique, non negative integer loyalty id, increments the more customers there are. 
2. loyalty_tier
= Restricts to one of the listed values (Bronze, Silver, Gold, Platinum). Default tier being Bronze. Tier automatically escalates the higher the loyalty points.
3. loyalty_points
= Customers start with 0 points and increases the more the customer creates an order.
4. update_date
= Every time changes/additions are made, date is recorded. 
*/

-- Add data
INSERT INTO customer_loyalty (loyalty_points, loyalty_tier, rewards_claimed)
VALUES
(120, 'Bronze', 0),
(350, 'Bronze', 1),
(620, 'Silver', 2),
(1450, 'Gold', 4),
(2300, 'Platinum', 6),
(890, 'Silver', 3),
(75, 'Bronze', 0),
(1700, 'Gold', 5),
(950, 'Silver', 3),
(410, 'Bronze', 1),
(3100, 'Platinum', 8),
(1280, 'Gold', 4),
(560, 'Silver', 2),
(180, 'Bronze', 0),
(700, 'Silver', 3),
(1900, 'Gold', 5),
(240, 'Bronze', 1),
(2500, 'Platinum', 7),
(820, 'Silver', 2),
(1600, 'Gold', 4);
