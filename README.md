# Meal Plans Web App in Angular

This is a web application for meal plans developed using Angular. It is a simple project that aims to help users get familiar with PostgreSQL.

## Contributors

- Anass El Kettani
- Dylane Chikhoune

## Project Setup

To set up the project, follow these steps:

1. Install PostgreSQL version 14 and Node version 16.
2. Navigate to the /client directory and run the command `npm install` in a terminal.
3. Navigate to the /server directory and run the command `npm install` in a terminal.
4. Modify the `connectionConfig` in `/server/app/services/database.service.ts` with the correct parameters for your database.
5. To launch the server, go to /server and run the command `ng serve --open` in a terminal. The server will run on `localhost:3000` by default.
6. To launch the client, go to /client and run the command `npm start` in a terminal. The client will run on `localhost:4200` by default.

## Database Configuration

Follow these steps to configure the database:

1. Create a new database with the user "postgres".
2. Create a password by navigating to Login/Group Roles -> Right-click on postgres -> Properties -> Definition. Name the password "root".
3. In the file `database.service.ts`, ensure that you have the following configuration:
user: "postgres",
database: <nomBD>,
password: "root",
port: 5432,
host: "127.0.0.1",
keepAlive: true

