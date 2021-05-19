FROM adoptopenjdk/openjdk11:jre-11.0.4_11
COPY ./build/libs/demo-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8000
ENTRYPOINT ["java","-jar","/app.jar"]