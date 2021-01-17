# Tekcare Backend

The entry point for the app is in app.js
*NOTE:* DO NOT write your code here (APP.JS).  create new files(in folders) then export and use them in app.js.

Take a look at the comment ``use Custom routes`` in app.js

Assets which would be uploaded should be added to `uploads` folder

## File and Folder Structure

- Create folders and put the files you create in them
- Folder names should describe what is inside them
- File names should describe what is inside them

## Database

For the database in this project, we would be using mySQL
(Assuming we're using localhost)I would put the neccessary SQl queries in `tekcare.sql` run them to create your database and tables locally

### using mysql in node js

check this on
[HOW TO USE mysql PACKAGE IN NODE JS](https://www.w3schools.com/nodejs/nodejs_mysql.asp)
For the the sake of saving time i have created the method for connecting the database (*I am assuming we would be developing locally until I further communicate with Dr.*) in a folder called `mysql_connection`/connections.js

