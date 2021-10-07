FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.72/* /opt/tomcat/.
RUN yum -y install java
RUN useradd -m -u 1000 -s /bin/bash jenkins
RUN java -version
RUN mkdir /var/maven

WORKDIR /opt/tomcat/webapps
COPY target/*.war .
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

