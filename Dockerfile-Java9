FROM centos:centos7
#Install wget, tar
RUN yum install -y wget && yum install -y tar	

# Download and install Java 9
WORKDIR /usr/local
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_linux-x64_bin.tar.gz -O jdk-9_linux-x64_bin.tar.gz
RUN tar xzf jdk-9_linux-x64_bin.tar.gz

# Config Java 9 alternatives
RUN alternatives --install /usr/bin/java java /usr/local/jdk-9.0.1/bin/java 2 
RUN alternatives --install /usr/bin/jar jar /usr/local/jdk-9.0.1/bin/jar 2 
RUN alternatives --install /usr/bin/javac javac /usr/local/jdk-9.0.1/bin/javac 2 
RUN alternatives --set jar /usr/local/jdk-9.0.1/bin/jar  
RUN alternatives --set javac /usr/local/jdk-9.0.1/bin/javac

# Config Java 9 Path
ENV JAVA_HOME /usr/local/jdk-9.0.1
ENV JAVA_JRE /usr/local/jdk-9.0.1/jre

RUN PATH=$PATH:/usr/local/jdk-9.0.1/bin:/usr/local/jdk-9.0.1/jre/bin

# JVM Memory config
ENV JAVA_OPTS "-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
