# BASE IMAGE: We start with the official Tomcat 9 image ensuring Java is included.
FROM tomcat:9.0

# MAINTAINER: (Optional) Good professional practice to sign your work.
LABEL maintainer="your_email@example.com"

# CLEANUP: Remove default Tomcat apps to keep the image lightweight and secure.
RUN rm -rf /usr/local/tomcat/webapps/*

# DEPLOY: Copy our local 'sample.war' into the container's webapps directory.
# Tomcat watches this folder and will automatically unzip and run this.
COPY sample.war /usr/local/tomcat/webapps/sample.war

# EXPOSE: Document that this container listens on port 8080.
EXPOSE 8080

# RUN: Start the Tomcat server (catalina.sh is the script that launches it).
CMD ["catalina.sh", "run"]
