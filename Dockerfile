	#Get oraclelinux image
FROM oraclelinux:7-slim
	#install apache web server
RUN yum -y install httpd
	#install haproxy as a reverse proxy
RUN yum -y install haproxy
	#Overrdide httpd configuration file
COPY httpd.conf /etc/httpd/conf
	#Overrdide haproxy configuration file
COPY haproxy.cfg /etc/haproxy/haproxy.cfg
	#Run bash file
COPY run-httpd.sh /run-httpd.sh
	#create ssl configuration directory
RUN mkdir -p /etc/ssl/private
	#copy file to created directory
COPY task.pem /etc/ssl/private
	#change permissions for bash file (to be executable)
RUN chmod -v +x /run-httpd.sh
	#Launch 
#RUN haproxy -f /etc/haproxy/haproxy.cfg
	#Copy oracle game to directory ( /var/www/html ) 
COPY game /var/www/html
	#Run bash file
CMD ["/run-httpd.sh"]
	#Expose port
EXPOSE 443
