-- Create the database

CREATE DATABASE tekcare

-- Creating users table
CREATE TABLE all_user(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(250) NOT NULL,
    `email` VARCHAR(250) NOT NULL,
    `contact` VARCHAR(25) DEFAULT '+233 000 000 000',
    `password` VARCHAR(250) NOT NULL,
    `profile_image` TEXT DEFAULT 'https://raw.githubusercontent.com/norbertkross/FlutterWeb/master/hosted%20Images/gitload/icons8-circled-user-male-skin-type-5-48.png',
    `email_verified` INT DEFAULT 0,
    `verification_code` VARCHAR(10),
    `is_loggedin` VARCHAR(60),   
    `time_added` Time DEFAULT CURRENT_TIME(),
    `date_added` Date DEFAULT CURRENT_DATE(),     
)