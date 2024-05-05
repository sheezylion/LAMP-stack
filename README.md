# LAMP STACK DOCUMENTATION
![lamp](https://github.com/sheezylion/LAMP-stack/assets/142250556/5cc90a3c-a242-4eec-a534-ca41c513e960)

## WHAT IS LAMP STACK
LAMP is acronym for Linux, Apache, Mysql, Php or python or perl. It is a popular open source stack for building and deploying web applications.
- Linux - Operating system
- Apache - Web server
- Mysql - Open source relational data base for app data
- Php, perl, python - Programming language

## HOW LAMP STACK ELEMENT WORK TOGETHER
The process starts when apache web-server receives requests for web pages from a user's browser. If the request is for php file, Apache passes the request to php which loads 
the file and executes the code contained in the file. Php also communicate with Mysql to fetch any data referenced in the code. Php then uses the code in the file and the data from database to create the Html that browsers require to display web pages. LAMP is efficient to handle both static and dynmic web pages.

## ADVANTAGES OF LAMP STACK
- Flexible - Apache is modular in design and you will find existing and customizable modules.
- Secure architecture and well established encryption practices that have been proven in the enterprise.
- LAMP stack can help reduce development time because it is an open source stack that has been available for more than a decade. You can build on what other people have built on in the past

## LAMP STACK REQUIREMENTS
- Application framework: LAMP STACK
- Hardware setup: EC2 instance with ubuntu 24.04 LTS AMI
- Software installation and server requirements: <i>Apache, Mysql and PHP

## How to launch an EC2 instance server on AWS

Before going into the steps of launching a server on AWS we need to first create an AWS freetier account. Once done, on the AWS console search EC2 and click on launch instance

Step 1: Name your server and choose your preferred Amazon machine image AMI, we would select ubuntu 24.04 LTS free tier

<img width="769" alt="server-name and ami" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/76a6c55c-6001-41be-8ed2-d7fc9d19bb36">

Step 2: Choose instance type, select t2.micro

Step 3: Create a new key pair if you don't have one created before or select an existing one

<img width="781" alt="demo-key and t2 micro" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/ef8f3ed2-8714-4f8e-ab10-13da8f5e72de">

Step 4: Select create a security group and allow ssh traffic on port 22 this would allow us to ssh into our server from the terminal. Also allow traffic on http port 80

<img width="790" alt="sg and ssh" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/05a4ed19-90f7-4df8-ad92-b236eca7c2ef">

Step 5: Launch your server and ssh into your terminal

```
ssh -i key-pair path ubuntu@public-ip-address
```
<img width="676" alt="ssh preview" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/e334fbf5-e0c2-4527-b839-22628c264202">

### Install apache into AWS EC2 instance
Run the command below to update, install and check status of apache

```
sudo apt update
sudo apt install apache2 -y
sudo systemctl status apache2
```

### Install Mysql into AWS EC2 instance
Run the command below to install, create password and change password mysql

```
sudo install mysql
sudo mysql
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'passWord.1';
```
Type exit, to exit from mysql terminal then run the following command to create and change the password from passWord.1 to a new password 

```
sudo mysql_secure_installation
```
The above command enables you to change password to medium or strong, by pressing 2 you select a strong password, once done exit and confirm if you can login to mysql database with the new password created with the command below

```
sudo mysql -p
```

### Install PHP into AWS EC2 instance
Run the command below to install and check the version of php installed. Note that we are running 3 command together this is because php needs to be connected to both apache and mysql

```
sudo apt install php libapache2-mod-php php-mysql
php -v
```

NOTE: At this point our LAMP STACK is completely installed and fully operational, but to test our php script we would need to setup apache virtual host to host our website files and folders.

### Creating virtual host using apache
Step 1: We first create a directory named projectlamp inside the /var/www directory using mkdir as follows:

```
sudo mkdir /var/www/projectlamp
```
Step 2: Assign ownership of directory using chown command to the $USER environment variable as follow:

```
sudo chown -R $USER:$USER /var/www/projectlamp
```
Step 3: Create and open a new configuration file in apache site-available directory using the vim editor as follows: 

```
sudo vim /etc/apache2/sites-available/projectlamp.conf
```
##### Paste the following configuration inside the text editor:

```
<VirtualHost *:80> 
   ServerName projectlamp 
   ServerAlias www.projectlamp 
   ServerAdmin webmaster@localhost 
   DocumentRoot /var/www/projectlamp 
   ErrorLog ${APACHE_LOG_DIR}/error.log 
   CustomLog ${APACHE_LOG_DIR}/access.log combined 
</VirtualHost>
```
Step 4: Reload apache so the above changes can take effect with the command below:

```
sudo systemctl reload apache
```
Note: Our website is now active but the root /var/www/projectlamp is still empty so we need to create a new index.html file inside the projectlamp directory 

```
  vim /var/www/projectlamp/index.html
```

Once you are inside the vi editor enter I to be in INSERT mode and type echo 'Hello LAMP from hostname'.
Note: Click the esc key and type :wq to save and exit the vi editor
Now you can go to your browser and open your website URL using your public ip-address. You should have this display:

<img width="860" alt="echo lamp" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/24264142-8e98-4164-87eb-57493385b976">

### Enable php on website
Because of apache directory index settings, the index.html file will always take precedence over index.php file, hence to change this behaviour we need to do some settings.
Inside the /etc/apache2/mods-enabled/dir.conf file we would edit the order in which index.php is listed

Step 1:

```
  sudo vim /etc/apache2/mods-enabled/dir.conf
```
Step 2: Change the order of precedence using the following:

```
 <IfModule mod_dif.c>
 DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
 </IfModule>
```

Step 3: Once the file is saved, we would reload apache using the following command:

```
sudo systemctl reload apache2
```

Step 4: Create a new file index.php inside /var/www/projectlamp directory

```
 vim /var/www/projectlamp/index.php
```

Step 5: This create a blank file, copy the following inside the file

```
<?php
 phpinfo()
```
Step 6: Save and close the file, then refresh your page


<img width="795" alt="php preview" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/c67fb1c8-c23b-4825-9a02-f4089a6fe624">

This brings us to the end of LAMP STACK  documentation





