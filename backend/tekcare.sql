-- Create the database

CREATE DATABASE tekcare

-- Creating users table
CREATE TABLE `users`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(250) NOT NULL,
    `email` VARCHAR(250) NOT NULL,
    `password` VARCHAR(250) NOT NULL,
    `profile_image` TEXT DEFAULT 'https://raw.githubusercontent.com/norbertkross/FlutterWeb/master/hosted%20Images/gitload/icons8-circled-user-male-skin-type-5-48.png',
    `email_verified` INT DEFAULT 0,
    `verification_code` VARCHAR(10)
   
)

    -- `time_added` Time DEFAULT CURRENT_TIME(),
    -- `date_added` Date DEFAULT CURRENT_DATE(),  


-- Creating medical_info table
CREATE TABLE `medical_info`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `gender` VARCHAR(60) ,
    `blood_type` VARCHAR(250) ,
    `height` VARCHAR(250),
    `bp` VARCHAR(250),

    FOREIGN KEY (patient_id) REFERENCES users(id)
)


-- Creating vitals table
CREATE TABLE `vitals`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `gender` VARCHAR(60) ,
    `blood_type` VARCHAR(250) ,
    `height` VARCHAR(250),
    `bp` VARCHAR(250) ,
    `time` Time DEFAULT CURRENT_TIME(),
    `date` Date DEFAULT CURRENT_DATE(),      

    FOREIGN KEY (patient_id) REFERENCES users(id)
)



-- Creating labs table
CREATE TABLE `labs`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `lab_report` MEDIUMTEXT,
    `conclusion` MEDIUMTEXT,    

    FOREIGN KEY (patient_id) REFERENCES users(id)
)



-- Creating prescriptions table
CREATE TABLE `prescriptions`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `conclusion` MEDIUMTEXT,    
    `time` Time DEFAULT CURRENT_TIME(),
    `date` Date DEFAULT CURRENT_DATE(),      

    FOREIGN KEY (patient_id) REFERENCES users(id)
)



-- Creating user_payments table
CREATE TABLE `user_payments`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `payment_method` VARCHAR(250) ,
    `network` VARCHAR(250),
    `number` VARCHAR(20) ,

    FOREIGN KEY (patient_id) REFERENCES users(id)
)



-- Creating feedback table
CREATE TABLE `feedback`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `lab_report` MEDIUMTEXT ,

    FOREIGN KEY (patient_id) REFERENCES users(id)
)



-- Creating all_pharmacies table
CREATE TABLE `all_pharmacies`(
    `pharm_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(250),
    `location_name` VARCHAR(250),
    `lat` Float(10,6) DEFAULT 0.0,
    `lon` Float(10,6) DEFAULT 0.0,
    `stars` INT
    )



-- Creating all_drugs table
CREATE TABLE `all_drugs`(
    `drug_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `drug_name` VARCHAR(250),
    `prescription` MEDIUMTEXT,
    `price` INT,
    `pharm_id` INT,

    FOREIGN KEY (pharm_id) REFERENCES all_pharmacies(pharm_id)    
    )





-- Creating all_drug_orders table
CREATE TABLE `all_drug_orders`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `this_order_id` VARCHAR(250),    
    `name` VARCHAR(250),    
    `price` INT,    
    `prescription` MEDIUMTEXT,    
    `time` Time DEFAULT CURRENT_TIME(),
    `date` Date DEFAULT CURRENT_DATE(),      

    FOREIGN KEY (patient_id) REFERENCES users(id)
)    



-- Creating chat messages table
CREATE TABLE `chat_msg`(
    `msgid` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `poster_id` INT NOT NULL,
    `recepient_id` VARCHAR(250),
    `username` VARCHAR(250),       
    `message` TEXT,    
    `time_sent` Time DEFAULT CURRENT_TIME(),
    `date_sent` Date DEFAULT CURRENT_DATE(),      
    `media_type` VARCHAR(60),      
    `media_url` VARCHAR(600),      
    `isReply` TEXT,      

    FOREIGN KEY (poster_id) REFERENCES users(id)
) 



-- Creating consultation table
CREATE TABLE `consultation`(
    `session_id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `patient_id` INT NOT NULL,
    `username`   VARCHAR(250),       
    `prescription` MEDIUMTEXT,    
    `time_sent` Time DEFAULT CURRENT_TIME(),
    `date_sent` Date DEFAULT CURRENT_DATE(),      

    FOREIGN KEY (patient_id) REFERENCES users(id)
)    








-- Creating all doctors table
CREATE TABLE `all_doctors`(
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `doc_id` INT NOT NULL,
    `profile_image` TEXT DEFAULT 'https://raw.githubusercontent.com/norbertkross/FlutterWeb/master/hosted%20Images/gitload/icons8-circled-user-male-skin-type-5-48.png',
    `doc_name` VARCHAR(250),    
    `hospital` VARCHAR(250) DEFAULT 'KNUST hospital',    
    `online` INT,    
    `rating` FLOAT(10,6) DEFAULT 2.5,    
    `last_seen` Time DEFAULT CURRENT_TIME()
)