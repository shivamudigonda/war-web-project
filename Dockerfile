FROM ubuntu

MAINTAINER shivamudigonda123@gmail.com

RUN mkdir /opt/tomcat/

WORKDIR /opt/tomcat
RUN apt update &&  apt upgrade -y
RUN apt-get install curl -y
RUN curl -O https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz
RUN tar xvfz apache*.tar.gz 
RUN mv apache-tomcat-9.0.62/* /opt/tomcat/.
RUN apt-get install -y openjdk-8-jdk
RUN java -version

WORKDIR /opt/tomcat/webapps
RUN cp /var/lib/jenkins/workspace/java-tomcat-dockerfile/target/wwp-1.0.0.war .

EXPOSE 8080

CMD ["/opt/tomcat/bin/catalina.sh", "run"]
