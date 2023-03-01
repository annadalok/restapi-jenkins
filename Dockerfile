FROM openjdk:17
LABEL maintainer="anand.alok"
EXPOSE 8081
ADD target/restapi-jenkins.jar restapi-jenkins.jar
ENTRYPOINT ["java","-jar","restapi-jenkins.jar"]