#Build application stage
FROM maven:3.5.3-jdk-10

WORKDIR /usr/src/java-code
RUN git clone https://github.com/spring-projects/spring-petclinic
WORKDIR /usr/src/java-code/spring-petclinic
RUN mvn -q -B package -DskipTests

RUN mkdir /usr/src/java-app
RUN cp -v /usr/src/java-code/spring-petclinic/target/*.jar /usr/src/java-app/app.jar

# Build the application running image
FROM openjdk:10

COPY ./bundle.sh /
RUN chmod 755 ./bundle.sh

WORKDIR /app
COPY --from=0 /usr/src/java-app/*.jar ./

EXPOSE 8080

# NewRelic Agent
WORKDIR /usr/local/newrelic/
RUN curl -O "http://download.newrelic.com/newrelic/java-agent/newrelic-agent/current/newrelic-java.zip"
RUN ["apt-get", "install", "unzip"]
RUN ["unzip", "newrelic-java.zip", "-d", "/usr/local/newrelic"]

ENTRYPOINT ["/bundle.sh"]

# ENTRYPOINT ["java", "-Dserver.port=8080",\
#           "-Dserver.context-path=/petclinic/",\
#           "-Dspring.messages.basename=messages/messages",\
#           "-Dlogging.level.org.springframework=INFO",\
#           "-Dsecurity.ignored=/**",\
#           "-Dbasic.authentication.enabled=false",\
#           "-Dserver.address=0.0.0.0",\
#           # NEWRELIC APM AGENT
#           "-javaagent:/usr/local/newrelic/newrelic/newrelic.jar",\
#           # "-Dnewrelic.config.license_key=${NEWRELIC_LICENSE_KEY}",\
#           # "-Dnewrelic.config.app_name=${NEWRELIC_APP_NAME}",\
#           # ADDITIONAL NEWRELIC CONFIGURATIONS
#           # "-Dnewrelic.config.distributed_tracing.enabled=true",\
#           "-jar",\
#           "/app/app.jar"]
