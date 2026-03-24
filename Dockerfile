FROM tomcat:9.0

COPY target/appointment-booking-system.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080