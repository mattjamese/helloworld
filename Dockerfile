FROM java:8
VOLUME /tmp
ARG JAR_FILE
ADD target/${JAR_FILE} helloworld.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

