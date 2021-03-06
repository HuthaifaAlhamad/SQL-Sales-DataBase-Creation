CREATE DATABASE Sales;

USE Sales;

CREATE TABLE customer (
	first_name VARCHAR(30) NOT NULL
	,last_name VARCHAR(30) NOT NULL
	,email VARCHAR(60) NOT NULL
	,company VARCHAR(60) NULL
	,street VARCHAR(50) NOT NULL
	,city VARCHAR(40) NOT NULL
	,STATE CHAR(2) NOT NULL DEFAULT "PA"
	,zip MEDIUMINT UNSIGNED NOT NULL
	,phone VARCHAR(20) NOT NULL
	,birth_date DATE NULL
	,sex ENUM('M', 'F') NOT NULL
	,date_entered TIMESTAMP NOT NULL
	,id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
	);

CREATE TABLE customer (
	first_name VARCHAR(30) NOT NULL
	,last_name VARCHAR(30) NOT NULL
	,email VARCHAR(60) NOT NULL
	,company VARCHAR(60) NULL
	,street VARCHAR(50) NOT NULL
	,city VARCHAR(40) NOT NULL
	,STATE CHAR(2) NOT NULL DEFAULT "PA"
	,zip MEDIUMINT UNSIGNED NOT NULL
	,phone VARCHAR(20) NOT NULL
	,birth_date DATE NULL
	,sex ENUM('M', 'F') NOT NULL
	,date_entered TIMESTAMP NOT NULL
	,id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
	);

CREATE TABLE sales_person (
	first_name VARCHAR(30) NOT NULL
	,last_name VARCHAR(30) NOT NULL
	,email VARCHAR(60) NOT NULL
	,street VARCHAR(50) NOT NULL
	,city VARCHAR(40) NOT NULL
	,STATE CHAR(2) NOT NULL DEFAULT "PA"
	,zip MEDIUMINT UNSIGNED NOT NULL
	,phone VARCHAR(20) NOT NULL
	,birth_date DATE NULL
	,sex ENUM('M', 'F') NOT NULL
	,date_hired TIMESTAMP NOT NULL
	,id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
	);

CREATE TABLE product (
	type_id INT UNSIGNED NOT NULL
	,FOREIGN KEY (type_id) REFERENCES product_type(id)
	,name VARCHAR(30) NOT NULL
	,supplier VARCHAR(30) NOT NULL
	,description BLOB NOT NULL
	,id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
	);

CREATE TABLE item (
	product_id INT UNSIGNED NOT NULL
	,FOREIGN KEY (product_id) REFERENCES product(id)
	,size INT NOT NULL
	,color VARCHAR(30) NOT NULL
	,picture VARCHAR(256) NOT NULL
	,price DECIMAL(6, 2) NOT NULL
	,id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
	);

CREATE TABLE sales_item (
	item_id INT UNSIGNED NOT NULL
	,sales_order_id INT UNSIGNED NOT NULL
	,FOREIGN KEY (item_id) REFERENCES item(id)
	,FOREIGN KEY (sales_order_id) REFERENCES sales_order(id)
	,quantity INT NOT NULL
	,discount DECIMAL(3, 2) NULL DEFAULT 0
	,taxable BOOL NOT NULL DEFAULT 0
	,sales_tax_rate DECIMAL(5, 2) NOT NULL DEFAULT 0
	,id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
	);