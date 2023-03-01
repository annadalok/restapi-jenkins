FROM openjdk:17
LABEL maintainer="anand.alok"
EXPOSE 8081
ADD target/restapi-jenkins2.jar restapi-jenkins2.jar
ENTRYPOINT ["java","-jar","restapi-jenkins2.jar"]