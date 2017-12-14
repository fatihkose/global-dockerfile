FROM centos:centos7
#Install wget, tar
RUN yum install -y wget && yum install -y tar

# Set working directory
WORKDIR /usr/local

# Download and install Java 8

# If you want to use JDK, please uncomment the following section
#<!-- start
#RUN wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
#RUN tar xzf jdk-8u131-linux-x64.tar.gz && rm jdk-8u131-linux-x64.tar.gz

# Config Java 8 alternatives
#RUN alternatives --install /usr/bin/java java /usr/local/jdk1.8.0_131/bin/java 2
#RUN alternatives --install /usr/bin/jar jar /usr/local/jdk1.8.0_131/bin/jar 2
#RUN alternatives --install /usr/bin/javac javac /usr/local/jdk1.8.0_131/bin/javac 2
#RUN alternatives --set jar /usr/local/jdk1.8.0_131/bin/jar
# end -->

# If you want to use JRE, please uncomment the following section
#<!-- start
RUN  wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jre-8u151-linux-x64.tar.gz
RUN tar xzf jre-8u151-linux-x64.tar.gz && rm jre-8u151-linux-x64.tar.gz

# Config Java 8 alternatives
RUN alternatives --install /usr/bin/java java /usr/local/jre-8u151-linux-x64/bin/java 2

# Config Java 8 Path
ENV JAVA_HOME /usr/local/jre-8u151-linux-x64
ENV JAVA_JRE  /usr/local/jre-8u151-linux-x64

RUN PATH=$PATH:/usr/local/jre-8u151-linux-x64/bin
# end --> 

# JVM Memory config
ENV JAVA_OPTS "-Djava.security.egd=file:/dev/./urandom -Djava.awt.headless=true -Xmx512m -XX:MaxPermSize=256m -XX:+UseConcMarkSweepGC"
