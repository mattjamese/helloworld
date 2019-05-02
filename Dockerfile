FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD target/helloworld-0.1.jar helloworld.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/helloworld.jar"]
