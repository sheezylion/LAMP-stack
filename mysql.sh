#steps to install mysql database on ubuntu 24.04
sudo apt install mysql-server #this will install mysql server
sudo mysql #to log into mysql server
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'passWord.1'; #give the server a password of passWord.1, then exit mysql
sudo mysql_secure_installation #this enables you to change password to medium or strong, by pressing 2 you select a strong password
sudo mysql -p #to login back into mysql server with your new password