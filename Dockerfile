FROM openjdk:17
ADD target/pipeline-jenkins-test.jar pipeline-jenkins-test.jar
ENTRYPOINT ["java","-jar","/pipeline-jenkins-test.jar"]
EXPOSE 6060
