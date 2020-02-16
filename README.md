FROM centos

MAINTAINER kartikay.rajput40@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O http://mirrors.estointernet.in/apache/tomcat/tomcat-8/v8.5.50/bin/apache-tomcat-8.5.50.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.*/* /opt/tomcat/.
RUN yum -y install java
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN curl -O -L <GIVE WAR FILE LOCATION FROM GIT>

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
