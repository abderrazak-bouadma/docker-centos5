############################################################################################
# Dockerfile to run AlfrescoParapheur/Parapheur ISO Producation environment
# Based on Centos5 Image
############################################################################################

from saltstack/centos-5-minimal
MAINTAINER abderrazak.bouadma@gmail.com

RUN yum update -y
RUN yum -y install wget
RUN yum -y install tar
RUN yum -y install curl

############################################################################################
# Install jdk 7u71
############################################################################################
RUN cd /opt &&  curl -L 'http://download.oracle.com/otn-pub/java/jdk/7u71-b14/jdk-7u71-linux-x64.tar.gz' -H 'Cookie: oraclelicense=accept-securebackup-cookie; gpw_e24=Dockerfile' | tar -xz
RUN cd /opt/jdk1.7.0_71/
RUN alternatives --install /usr/bin/java java /opt/jdk1.7.0_71/bin/java 2
RUN alternatives --set java /opt/jdk1.7.0_71/bin/java
RUN alternatives --install /usr/bin/jar jar /opt/jdk1.7.0_71/bin/jar 2
RUN alternatives --set jar /opt/jdk1.7.0_71/bin/jar
RUN alternatives --install /usr/bin/javac javac /opt/jdk1.7.0_71/bin/javac 2
RUN alternatives --set javac /opt/jdk1.7.0_71/bin/javac
RUN export JAVA_HOME=/opt/jdk1.7.0_71
RUN export JRE_HOME=/opt/jdk1.7.0_71/jre
RUN export PATH=$PATH:/opt/jdk1.7.0_67/bin:/opt/jdk1.7.0_71/jre/bin


############################################################################################
# Install tomcat7
############################################################################################
RUN cd /tmp
RUN wget http://www.us.apache.org/dist/tomcat/tomcat-7/v7.0.56/bin/apache-tomcat-7.0.56.tar.gz
RUN tar xzf apache-tomcat-7.0.56.tar.gz
RUN mv apache-tomcat-7.0.56 /usr/local/tomcat7

############################################################################################
# start tomcat7
############################################################################################
RUN ./usr/local/tomcat7/bin/startup.sh

############################################################################################
# Expose ports
############################################################################################
EXPOSE 8080
EXPOSE 80