CREATE DATABASE database_assignment;
USE database_assignment;
CREATE TABLE customers( 
id INT AUTO_INCREMENT PRIMARY KEY  ,
first_name VARCHAR(25)  NOT NULL,
last_name VARCHAR(25)  NOT NULL,
birth_date DATE NOT NULL,
phone  VARCHAR(15),
address VARCHAR(15)  NOT NULL ,
city VARCHAR(15)  NOT NULL ,
state VARCHAR(15)  NOT NULL ,
points INT (7) 
);

SELECT * FROM customers ;

INSERT INTO customers(first_name, last_name ,birth_date ,phone , address ,city ,state,points) VALUES 
('Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','MA','2273'),
( 'Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA','947'),
( 'Freddi','Boagey', '1985-02-07','19-724-7869','251 Springs Junction','Colorado Springs','CO','2967'),
( 'Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL','457'),
('Clemmie','Betchley','1973-11-07','','5 Spohn Circle','Arlington','TX','3675')
;
 
 DROP TABLE customers;
 TRUNCATE TABLE customers;
 
  -- 4 Show only 2 members whose points are more than 1000
  
  SELECT * FROM customers  WHERE points>1000 LIMIT 2 ;
  
  -- 5. Find the customers whose age is in 1980 to 1990 or points less than 1000
  SELECT * FROM customers WHERE points <1000 AND birth_date BETWEEN '1980-01-01' AND '1990-12-30' ;
  
  -- 6. Order the customers by points in ascending and descending order.
  
  SELECT * FROM customers ORDER BY Points ASC;
  AND 
  SELECT * FROM customers ORDER BY Points DESC;
  
  --7. Find the customer whose NAME CONTAINS 'burgh' USING LIKE AND regexp.
  SELECT * FROM customers WHERE LOWER (CONCAT (First_Name, ' ', Last_name)) LIKE '%burgh';
  -- and 
  SELECT * FROM customers WHERE LOWER (CONCAT (First_Name, ' ', Last_name)) REGEXP 'burgh';
  
  
  -- 8. Find the customer who does NOT have phone number.
   SELECT * FROM customers WHERE phone = 0 ;
   
   -- 9.Change the 'Date of Birth' COLUMN NAME INTO 'dob'
   ALTER TABLE customers CHANGE COLUMN birth_date dob DATE;
   
   
   
-- 10. Find the MAX POINT holder customer
SELECT * FROM customers WHERE points =(SELECT MAX(points) FROM customers);


-- 11. EXECUTE a QUERY FOR the following scenario.
IF customers have points LESS THAN 1000, they are bronze member.
IF customers have points more THAN 1000 AND LESS THAN 2000, they are silver member.
IF customers have points more THAN 2000 AND LESS THAN 3000, they are gold member.
IF customers have points more THAN 3000, they are platinum member.



SELECT points,
 CASE
        WHEN points<1000 THEN 'They are bronze member.'
	WHEN points >1000 AND points <2000 THEN 'They are silver member.'
	WHEN points >2000 AND points<3000 THEN 'They are gold member.'
	WHEN points >3000 THEN 'They are platinum member.'
	ELSE 'They are not valid members.'

END AS Points_measurement FROM customers;
  


  
   
   
 
  
 
 
 
