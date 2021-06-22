FROM ubuntu:18.04

ENV CATALINA_HOME /usr/share/apache-tomcat-9.0.46
ENV PATH $CATALINA_HOME/bin:$PATH

RUN mkdir -p "$CATALINA_HOME"

RUN apt update
RUN apt install apt-utils -y
RUN apt install default-jdk -y
RUN apt install maven -y
RUN apt install git -y
RUN git clone https://github.com/micro1985/jenkinslrn.git /home/user/boxfuse/
ADD https://mirror.datacenter.by/pub/apache.org/tomcat/tomcat-9/v9.0.46/bin/apache-tomcat-9.0.46.tar.gz /home/user/
RUN tar -xf /home/user/apache-tomcat-9.0.46.tar.gz -C /usr/share/
RUN cp /home/user/boxfuse/target/hello-1.0.war $CATALINA_HOME/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
