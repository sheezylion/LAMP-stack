#installing apache2 on ubuntu server 24.04
sudo apt update #to update the necessary dependables
sudo apt install apache2 -y #this will install apache2 into the server
sudo systemctl start apache2 #to start apache 
sudo systemctl enable apache2 #to enable the web server as daemon
sudo systemctl status apache2 #to check the status of the webserver is it is running