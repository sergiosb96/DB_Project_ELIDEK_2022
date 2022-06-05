# DB_Project_ELIDEK_2022

This is a project for the Databases class in NTUA Electrical and Computer Engineering Department (Still work in progress)

## Contributors
(Listed Alphabetically)

1. Gina Kalogeropoulou, 03114174, @GinaKalog
2. Nikos Papanikolas, 03120624, @NikosP6
3. Sergios Batsas, 03114762 ,@Azzy90

## Dependencies

1. [NodeJS](https://nodejs.org/en/)
2. [MySQL for Windows](https://dev.mysql.com/downloads/installer/)

## Required NodeJS Dependencies

1. [express](https://www.npmjs.com/package/express) - Fast, unopinionated, minimalist web framework for node.
2. [mysql2](https://www.npmjs.com/package/mysql2) - Fast mysql driver. Implements core protocol, prepared statements, ssl and compression in native JS
3. [ejs](https://www.npmjs.com/package/ejs) - a templating engine

## Optional NodeJS Dependencies

1. [nodemon](https://www.npmjs.com/package/nodemon) - nodemon is a tool that helps develop Node.js based applications by automatically restarting the node application when file changes in the directory are detected.
2. [custom-env](https://www.npmjs.com/package/custom-env) - custom env is a library built to make development more feasible by allowing multiple .env configurations for different environments.

## Useful Applications

Database Managment Applications (DBMS) such as [HeidiSQL](https://www.heidisql.com/), [Navicat](https://www.navicat.com/en/), [MySQL Workbench](https://dev.mysql.com/downloads/workbench/)

## Installation


1. run ```git clone https://github.com/Azzy90/DB_Project_ELIDEK_2022``` (inside the directory you want your application)
2. import [CREATE_Database_Full.sql](SQL_Codes/CREATE_Database_Full.sql) to your Database
3. edit the env-example.txt and rename it to .env.localhost (located under Project)
4. create the needed views to your database using the [3.2.sql](SQL_Codes/3.2.sql)
5. run ```npm install``` (inside your DB_ELIDEK_Project_2022/Project directory ) to install dependencies
6. run ```npm start``` to start your server with nodemon
7. visit http://localhost:PORT


## ER Diagram

![](https://github.com/Azzy90/DB_Project_ELIDEK_2022/blob/main/Diagrams/ER.png)

## Relational Model

![](https://github.com/Azzy90/DB_Project_ELIDEK_2022/blob/main/Diagrams/Relational_Schema_V2.png)
