<h1>LAMP STACK DOCUMENTATION</h1>

![lamp](https://github.com/sheezylion/LAMP-stack/assets/142250556/5cc90a3c-a242-4eec-a534-ca41c513e960)

<h2>LAMP STACK REQUIREMENTS</h2>
<ul>
  <li> Application framework: LAMP STACK </li>
 <li> Hardware setup: EC2 instance with ubuntu 24.04 LTS AMI </li>
  <li>Software installation and server requirements: <i>Apache, Mysql and PHP </i> </li>
</ul>

<h3>How to launch an EC2 instance server on AWS</h3>
<p>Step 1: Name your server and choose your preferred Amazon machine image AMI, we would select ubuntu 24.04 LTS free tier</p> <br>

<img width="769" alt="server-name and ami" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/087470fe-f1d7-4806-8a8c-38ec581dc91a"> <br>

<p>Step 2: Choose instance type, select t2.micro</p>

<p>Step 3: Create a new key pair if you don't have one created before or select an existing one. </p> <br>
<img width="781" alt="demo-key and t2 micro" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/8dc463b3-9094-4620-842b-ccfd4fb78b4d"> <br>

<p>Step 4: Select create a security group and allow ssh traffic on port 22, this would allow us to ssh into our server from the terminal</p> <br>
<img width="790" alt="sg and ssh" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/8fe19b88-e7ad-4a6e-8c8f-dc1e53f1402b"> <br>

<p>Step 5: Launch your server and ssh into your terminal</p> <br>
<img width="676" alt="ssh preview" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/5674b425-e1ea-4896-810b-5d3c8c83622a"> <br>

<h3>Install apache into AWS EC2 instance</h3>
<p><strong>Run the below command to update, install and check status of apache</strong> <br> 
<pre>sudo apt update <i>#to update the necessary dependables</i><br>
sudo apt install apache2 -y <i>#this will install apache2 into the server</i><br>
sudo systemctl status apache2 <i>#to check the status of the webserver is it is running</i></pre>
  
</p>

<h3>Install Mysql into AWS EC2 instance</h3>
<p><strong>Run the below command to install, create password and change password mysql</strong> <br> 
<pre>sudo install mysql <br>
sudo mysql <br> 
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'passWord.1'; #<i>give the server a password of passWord.1, then exit mysql </i><br>
sudo mysql_secure_installation #<i>this enables you to change password to medium or strong, by pressing 2 you select a strong password </i><br> 
sudo mysql -p #<i>to login back into mysql server with your new password </i> </pre>

<h3>Install PHP into AWS EC2 instance</h3>
<p><strong>Run the below command to install and check the version of php installed</strong> <br> 
 <pre>sudo apt install php libapache2-mod-php php-mysql #<i>installing the 3 packages at once</i><br>
php -v #<i>to confirm if php is installed and to check for it's version</i> </pre>
</p>
<p><strong>NOTE:</strong>At this point our LAMP STACK is completely installed and fully operational, but to test our php script we would need to setup apache virtual host to host our website files and folders</p>

<h3>Creating virtual host using apache</h3>
<p>Step 1: We first create a directory named <i>projectlamp</i> inside the /var/www directory using mkdir as follows:<br>
   <pre>sudo mkdir /var/www/projectlamp</pre>
</p>
<p>Step 2: Assign ownership of directory using <i>chown</i> command to the $USER environment variable as follow: <br>
   <pre>sudo chown -R $USER:$USER /var/www/projectlamp </pre>
</p>
<p>Step 3: Create and open a new configuration file in apache site-available directory using the vim editor as follows: <br>
sudo vim /etc/apache2/sites-available/projectlamp.conf <br>
  <h5>Paste the following configuration inside the text editor:</h5> <br>
  <pre><VirtualHost *:80> <br>
   ServerName projectlamp <br>
   ServerAlias www.projectlamp <br>
   ServerAdmin webmaster@localhost <br>
   DocumentRoot /var/www/projectlamp <br>
   ErrorLog ${APACHE_LOG_DIR}/error.log <br>
   CustomLog ${APACHE_LOG_DIR}/access.log combined <br>
</VirtualHost> </pre>
</p>
<p>Step 4: Reload apache so the above changes can take effect with the command below:
<pre>sudo systemctl reload apache</pre> <br>
<strong>Note:</strong> Our website is now active but the root /var/www/projectlamp is still empty so we need to create a new <i>index.html</i> file inside the projectlamp directory <br>
<pre>
  vim /var/www/projectlamp/index.html
</pre>
Once you are inside the vi editor enter I to be in INSERT mode and echo 'Hello LAMP from hostname'. <br>
Note: <i>Click the esc key and type :wq to save and exit the vi editor</i> <br>
Now you can go to your browser and open your website <strong>URL</strong> using your public ip-address. You should have this display: </p> <br>
<img width="860" alt="echo lamp" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/d9e477ff-6a90-41ef-8b52-50768083533b">

<h3>Enable php on website</h3>
<p>Because of apache <i>directory index</i> settings, the index.html file will always take precedence over index.php file, hence to change this behaviour we need to do some settings. <br>
  Inside the /etc/apache2/mods-enabled/dir.conf file we would edit the order in which index.php is listed </p>
  <pre>
    sudo vim /etc/apache2/mods-enabled/dir.conf 
  </pre> <br>
  <pre>
    <IfModule mod_dif.c>
DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>
  </pre> <br>
  Once the file is saved, we would reload apache <br>
  <pre>
    sudo systemctl reload apache2
  </pre>
</p>
<p>
Create a new file index.php inside /var/www/projectlamp directory <br>
  <pre>
    vim /var/www/projectlamp/index.php
  </pre> <br>
  This create a blank file, copy the following inside the file <br>
  <pre>
    <?php
    phpinfo()
  </pre> <br>
  Save and close the file, then refresh your page </p>
  <img width="795" alt="php preview" src="https://github.com/sheezylion/LAMP-stack/assets/142250556/0dc31205-d220-40be-a2ad-72756f15932f">
<br>


<p>This brings us to the end of LAMP STACK  documentation</p>

