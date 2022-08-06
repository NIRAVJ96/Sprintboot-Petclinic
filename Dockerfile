#FROM public.ecr.aws/amazoncorretto/amazoncorretto:11
FROM --platform=linux/amd64 openjdk:11-jdk
COPY ./ /mavenwar
WORKDIR /mavenwar
RUN ./mvnw package
EXPOSE 8080
ENTRYPOINT ["java","-Dspring.profiles.active=mysql", "-jar","/mavenwar/target/spring-petclinic-2.7.0-SNAPSHOT.jar"]
