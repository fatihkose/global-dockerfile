FROM centos:centos7
#Install wget, tar
RUN yum install -y wget && yum install -y tar	

# Download and install Java 8
WORKDIR /usr/local
RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
RUN tar xzf jdk-8u131-linux-x64.tar.gz

# Config Java 8 alternatives
RUN alternatives --install /usr/bin/java java /usr/local/jdk1.8.0_131/bin/java 2 
RUN alternatives --install /usr/bin/jar jar /usr/local/jdk1.8.0_131/bin/jar 2 
RUN alternatives --install /usr/bin/javac javac /usr/local/jdk1.8.0_131/bin/javac 2 
RUN alternatives --set jar /usr/local/jdk1.8.0_131/bin/jar  
RUN alternatives --set javac /usr/local/jdk1.8.0_131/bin/javac

# Config Java 8 Path
ENV JAVA_HOME /usr/local/jdk1.8.0_131
ENV JAVA_JRE /usr/local/jdk1.8.0_131/jre

RUN PATH=$PATH:/usr/local/jdk1.8.0_131/bin:/usr/local/jdk1.8.0_131/jre/bin

# JVM Memory config
ENV JAVA_OPTS "-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
