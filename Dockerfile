# Use an official Tomcat image as the base image
FROM tomcat:9-jdk11-openjdk

# Remove the default web apps that come with Tomcat (optional, to avoid clutter)
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to Tomcat's webapps directory
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Change the port Tomcat listens on (from default 8080 to 8000)
RUN sed -i 's/8080/8000/g' /usr/local/tomcat/conf/server.xml

# Expose the Tomcat HTTP port on 8000
EXPOSE 8100


