/* 
	Database Model for [CCINFOM-S20-02]
	Customer Engagement Database Application
    Members: Sevilla, Mariazeta, Siriban, & Tabanao
 */

/* Reset Database */
DROP DATABASE IF EXISTS customerFeedback_db;

/* Create the database */
CREATE DATABASE IF NOT EXISTS customerFeedback_db;

/* Switch to the customerFeedback_db database */
USE customerFeedback_db;

-- Make Feedback Table
CREATE TABLE Feedback (
    feedback_id INT AUTO_INCREMENT PRIMARY KEY,
    feedback_rating INT CHECK (feedback_rating BETWEEN 1 AND 5),
    feedback_description VARCHAR(255),
    feedback_category ENUM('pricing', 'food taste', 'packaging', 'delivery duration', 'customer support') NOT NULL,
    feedback_comments VARCHAR(255),
    date_submitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	INDEX idx_category (feedback_category),
    INDEX idx_rating (feedback_rating)
) ENGINE=InnoDB;

/* 
1. feedback_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY  
= Creates a unique numeric identifier for each feedback record. Automatically increases with every insert.
2. feedback_rating INT CHECK (feedback_rating BETWEEN 1 AND 5)  
= Stores customer rating values between 1 to 5.
3. feedback_description VARCHAR(255)  
= Stores a short description or summary of the feedback.
4. feedback_category ENUM('pricing', 'food taste', 'packaging', 'delivery duration', 'customer support') NOT NULL  
= Restricts feedback entries to one of the five predefined categories.
5. feedback_comments VARCHAR(255)  
= Allows additional customer remarks or elaboration. Optional (can be NULL).
6. date_submitted TIMESTAMP DEFAULT CURRENT_TIMESTAMP  
= Automatically records the timestamp when feedback is submitted. Defaults to current date and time on insert.
7. INDEX(idx_category) (feedback_category)  
= Optimizes searches and aggregations filtered by category (e.g., WHERE feedback_category = 'food taste').
8. INDEX(idx_rating) (feedback_rating)  
= Speeds up queries that group, sort, or filter by rating (e.g., ORDER BY feedback_rating DESC).
*/



