# Project Setup

This project was developed by Anass El Kettani and Dylane Chikhoune. The following instructions will guide you through the process of setting up the project on your local machine.

## Prerequisites

Make sure you have the following installed on your system:

- PostgreSQL version 14
- Node version 16

## Installation

1. Clone the repository to your local machine.
2. Go to the `/client` directory and run the command `npm install` in a terminal.
3. Go to the `/server` directory and run the command `npm install` in a terminal.
4. In `/server/app/services/database.service.ts`, modify `connectionConfig` with the correct parameters for your database.

## Running the project

1. Go to the `/server` directory and run the command `ng serve --open` in a terminal. The server will be launched at `localhost:3000` by default.
2. Go to the `/client` directory and run the command `npm start` in a terminal. The client will be launched at `localhost:4200` by default.

## Database Configuration

1. Create a new database with the user `postgres`.
2. Follow these steps to create a password: `Login/Group Roles -> Right-click on postgres -> Properties -> Definition`. Name the password `root`.
3. In `/server/app/services/database.service.ts`, make sure you have the following configuration:

