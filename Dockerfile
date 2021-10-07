FROM centos

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN curl -O https://downloads.apache.org/tomcat/tomcat-8/v8.5.72/bin/apache-tomcat-8.5.72.tar.gz
RUN tar xvfz apache*.tar.gz
RUN mv apache-tomcat-8.5.72/* /opt/tomcat/.
RUN yum -y install java
RUN useradd -m -u 1000 -s /bin/bash jenkins
RUN java -version


WORKDIR /opt
RUN curl -SL  http://www-eu.apache.org/dist/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz | tar -xz
RUN mv apache-maven-3.5.4 maven
RUN echo 'M2_HOME=/opt/maven' > /etc/profile.d/mavenenv.sh
RUN echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/mavenenv.sh
RUN chmod +x /etc/profile.d/mavenenv.sh
RUN source /etc/profile.d/mavenenv.sh

WORKDIR /opt/tomcat/webapps
COPY target/*.war .
EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]

