/***********************************************************
* Create the database named hw5, its tables, and a database user
************************************************************/

DROP DATABASE IF EXISTS hw5;

CREATE DATABASE hw5;

USE hw5;

CREATE TABLE User (
  UserID INT NOT NULL AUTO_INCREMENT,
  Email VARCHAR(50),
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Password VARCHAR(50),
  
  PRIMARY KEY(UserID) 
);

INSERT INTO User 
  (Email, FirstName, LastName, Password)
VALUES 
  ('bat@gmail.com', 'Bat', 'Man', 'bat'),
  ('spider@gmail.com', 'Spider', 'Man', 'spider'), 
  ('super@gmail.com', 'Super', 'Man', 'super');

 
CREATE TABLE Book (
  BookID INT NOT NULL AUTO_INCREMENT,
  Cover VARCHAR(200),
  Title VARCHAR(50),
  Price VARCHAR(50),
  ProductCode VARCHAR(50),
  PRIMARY KEY(BookID) 
);

INSERT INTO Book 
  (Cover, Title, Price, ProductCode)
VALUES 
  ('https://clipartix.com/wp-content/uploads/2016/11/Cat-in-the-hat-the-cat-in-hat-clipart-2.jpg', 'The Cat in the Hat book cover', 8.79,'ttt'),
  ('https://images.fineartamerica.com/images/artworkimages/medium/3/dr-seuss-the-lorax-book-cover-ilyane-arlaja-transparent.png', 'The Lorax book cover', 12.45,'ttt0' ), 
  ('https://2f96be1b505f7f7a63c3-837c961929b51c21ec10b9658b068d6c.ssl.cf2.rackcdn.com/products/063063.jpg', 'If I Ran the Circus book cover', 6.75, 'ttt5' ),
   ('https://m.media-amazon.com/images/W/IMAGERENDERING_521856-T1/images/I/91Q9eneR7BL._AC_UF1000,1000_QL80_.jpg', 'How the Grinch Stole Christmas!', 9.60, 'ttt50' );

 -- Create student and grant privileges

DELIMITER //
CREATE PROCEDURE drop_user_if_exists()
BEGIN
    DECLARE userCount BIGINT DEFAULT 0 ;

    SELECT COUNT(*) INTO userCount FROM mysql.user
    WHERE User = 'student' and  Host = 'localhost';

    IF userCount > 0 THEN
        DROP USER student@localhost;
    END IF;
END ; //
DELIMITER ;

CALL drop_user_if_exists() ;

CREATE USER student@localhost IDENTIFIED BY 'sesame';

GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP
ON hw5.*
TO student@localhost;

  
USE hw5;