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

<img width="1165" alt="launch instance" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/7eddb994-e326-483c-9549-d035de93926e">

Step 1: Once you click on launch instance, the next thing is to name your server and choose your preferred Amazon machine image AMI, we would select ubuntu 24.04 LTS free tier

<img width="1208" alt="servername and ami" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/317e6d8a-aae5-4359-a006-28a0dac31040">


Step 2: Choose instance type, select t2.micro

<img width="873" alt="t2 micro" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/029d34fa-15b7-452d-9905-b99f6346a9c0">


Step 3: Create a new key pair if you don't have one created before or select an existing one. I have created one before, so i would select it

<img width="817" alt="kry-pair" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/8f8aceed-8e5b-4db2-9f64-135f9a20a1ee">

Step 4: Select create a security group, ssh traffic on port 22 has been allowed by default, you can choose to disallow but in our case we want to ssh into our server from the terminal, so we would allow.

<img width="798" alt="security group" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/b0fc8a2a-a4ad-4a41-b68e-316305a5e897">

step 5: Check the summary to double check, once satisfied. Click on launch instance
 
 <img width="412" alt="summary" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/0eba9c49-f405-4c5d-8f47-5f7d26197790">

The information below shows different information, one of it is the public ip-address which would be used later on.

<img width="1451" alt="lauch instance display" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/caa388f3-76a3-43af-9c6f-f8682c4ce9b1">

step 6: Click on security then click on the link under security group. This will allow us to edit inbound rules to allow traffic on port 80 (HTTP) and port 443 (HTTPS) with source from anywhere on the internet. Click on save rules and proceed

<img width="1597" alt="port rules" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/1b5941db-20fc-470a-a595-04618da63c44">


Step 7: ssh into your terminal using the key pair that was downloaded earlier

```
ssh -i ~/Download/demo-key ubuntu@54.226.96.90
```
The ~/Download is the path where my key pair named demo-key is located. Ubuntu is the username which is followed by @ and the public ip-address 54.226.96.90

<img width="821" alt="ssh-terminal" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/79ed2a5d-c4df-4eb7-9ed6-a517c1511880">

### Install apache into AWS EC2 instance and update firewall
Steps to install apache

step 1: Update annd upgrade list of packages in package manager

```
sudo apt update 
sudo apt upgrade -y
```

<img width="1024" alt="upgrade and update" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/5be8bd11-2069-4586-9ca9-90131fc47007">

Step 2: Install apache2 using the command below

```
sudo apt install apache2 -y
```

Step 3: Enable apache2 and check apache2 status to check if its running

```
sudo systemctl enable apache2
sudo systemctl status apache2
```
<img width="811" alt="apache2 enable" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/99d7ca28-677e-4e62-a3bc-f9c9f1032656">

Step 4: The server is running and can be accessed locally in the ubuntu shell by running the command below:

```
curl http://localhost:80
or
curl http://127.0.0.1:80
```
<img width="947" alt="curl" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/f3e89c0b-2e15-424a-aed7-5a7976318729">

You can also check through your browser using the public ip-address of our server

```
http://54.226.96.90:80
```
<img width="1013" alt="apache" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/a4689c96-b2ab-43ad-854e-8a955d928270">


### Install Mysql into server
Steps to install mysql server. This steps would let us install, create and change password 

Step 1: Install mysql server

```
sudo apt install mysql-server
```
<img width="1069" alt="install mysql" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/5315a67f-5ff5-475e-98f8-30966db45dad">

Step 2: Enable and verify if mysql server is running using the command below

```
sudo systemctl enable mysql
sudo systemctl status mysql
```
<img width="811" alt="sql running" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/81352b4c-50dd-4e53-9a4a-183cba8b5fe5">

Step 3: Log into mysql-server with the comman  below

```
sudo mysql
```

<img width="597" alt="mysql login" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/af165b6b-4249-4827-ae2e-f077e7ec7d39">

Step 4: Set a password for root user. The root user password is set to New.1.pass

```
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'New.1.pass';
```
<img width="720" alt="root" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/ef60e908-9940-4b75-aece-e3d5881abdb0">


Step 5 Type exit, to exit from mysql server

```
exit
```

<img width="391" alt="exit" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/dc25f7b0-b60a-494e-832b-e635cb03b79b">

Step 6: Run an interactive script using the command below, this script removes some insecure settings and lock down access to the database system.
```
sudo mysql_secure_installation
```
Note: Always use strong and unique password for database credentials

<img width="854" alt="secure" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/f712b42e-0f29-40d1-9b9a-87a5c2e4c9b3">

Step 7: Test if you are able to log into mysql console with the comman below 

```
sudo mysql -p
```
<img width="683" alt="mysql enter" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/18b9c3a1-ffd2-4eff-81b9-f85900b9addf">

Exit from the server. Mysql server is now installed and secured. 

### Install PHP into AWS EC2 instance
PHP is the component of the LAMP stack set up that processes code to display both static and dynamic content to the end user.

Run the command below to install the 3 packages at once:

- install php - This command installs php 
- php-mysql, a PHP module that allows PHP to communicate with MySQL-server databases.
- libapache2-mod-php, to enable Apache to handle PHP files.

```
sudo apt install php libapache2-mod-php php-mysql
```
<img width="1055" alt="php" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/ecbf6ba3-a46d-4de6-95d9-e837529dee0c">

Confirm the php version using the command below

```
php --version
```
<img width="736" alt="php version" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/45396353-e84b-4a3b-9dde-decd37dd68c4">


NOTE: At this point our LAMP STACK is completely installed and fully operational, but to test our php script we would need to setup apache virtual host to host our website files and folders.

### Creating virtual host using apache

The default directory serving the apache default page is /var/www/html. Create your document directory next to the default one.

Step 1: We first create a directory named projectlamp using the comman mkdir inside the /var/www directory 

```
sudo mkdir /var/www/projectlamp
```

Step 2: Assign ownership of directory using chown command to the $USER environment variable as follow:

```
sudo chown -R $USER:$USER /var/www/projectlamp
```
<img width="712" alt="mkdir" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/843057e4-7b0f-4766-b8f2-290d727a5401">

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

<img width="577" alt="virtual vim" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/0a6e5fa7-a979-431e-bff7-82a8b005edcb">

Step 4: Show the new file in sites-available

```
sudo ls /etc/apache2/sites-available
```
<img width="561" alt="output" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/0b8cb1e0-29e8-4f39-ae17-176ecef90633">

Step 5: With the VirtualHost configuration, Apache will serve projectlamp using /var/www/projectlamp as its web root directory. Enable the new virtual host

```
sudo a2ensite projectlamp
```
<img width="625" alt="enable" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/a6484fab-03f5-4927-9090-56ba09d14187">

Step 6: Disable apache’s default website. This is because Apache’s default configuration will overwrite the virtual host if not disabled. This is required if a custom domain is not being used.

```
sudo a2dissite 000-default
```

<img width="518" alt="disable" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/4b525105-942d-44d8-a91e-dcbfd05d43e9">

Step 7: Ensure the configuration does not contain syntax error, use the command below to confirm

```
sudo apache2ctl configtest
```
<img width="572" alt="syntax" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/d7649900-c321-4aa2-8dbd-5a9e047c1d42">


Step 8: Reload apache so the above changes can take effect with the command below:

```
sudo systemctl reload apache2
```
Note: Our website is now active but the root /var/www/projectlamp is still empty so we need to create a new index.html file inside the projectlamp directory 

```
 sudo echo 'Hello LAMP from hostname' $(curl -s http://169.254.169.254/latest/meta-data/public-hostname) 'with public IP' $(curl -s http://169.254.169.254/latest/meta-data/public-ipv4) > /var/www/projectlamp/index.html 
```
<img width="1677" alt="echo terminal" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/c0a85777-0f54-4031-b7f6-58b653426595">

Step 9: Open the website on a browser using the public IP address.

```
http://54.226.96.90:80
```

Another alternative is to open the website with public dns name (port is optional)

```
ec2-54-226-96-90.compute-1.amazonaws.com
```
Note: The index.html file can be left in place as a temporary landing page for the application until an index.php file is set up to replace it. Once this is done, the index.html file should be renamed or removed from the document root as it will take precedence over index.php file by default.

### Enable php on website
Because of apache directory index settings, the index.html file will always take precedence over index.php file, hence to change this behaviour we need to do some settings.
Inside the /etc/apache2/mods-enabled/dir.conf file we would edit the order in which index.php is listed

Step 1: Open the dir.conf file with vim to change the behaviour

```
 sudo vim /etc/apache2/mods-enabled/dir.conf
```
Step 2: Change the order of precedence using the following:

```
<IfModule mod_dir.c>
  # Change this:
  # DirectoryIndex index.html index.cgi index.pl index.php index.xhtml index.htm
  # To this:
  DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
```
<img width="679" alt="order" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/24808111-0696-4044-8ade-4ccf42b1312e">


Step 3: Once the file is saved, we would reload apache using the following command:

```
sudo systemctl reload apache2
```

Step 4:
Create a php test script to confirm that Apache is able to handle and process requests for PHP files.

A new index.php file was created inside the custom web root folder.

```
 vim /var/www/projectlamp/index.php
```

Step 5: This create a blank file, copy the following inside the file

```
<?php
 phpinfo()
```
<img width="543" alt="?php" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/9a1368e9-6cf1-4cd6-a2e7-e34ef57797b1">


Step 6: Save and close the file, then refresh your page

<img width="1518" alt="Screenshot 2024-05-07 at 00 28 41" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/f8604d5c-d574-4bfd-b610-3d8b7985bf8e">

This page is useful for debugging and also ensures settings are being applied correctly.

After checking the relevant information about the server through this page, It’s best to remove the file created as it contains sensitive information about the PHP environment and the ubuntu server. It can always be recreated if the information is needed later, use the commad below 

```
sudo rm /var/www/projectlamp/index.php
```

This brings us to the end of LAMP STACK  documentation





