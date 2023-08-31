FROM openjdk:17-jdk-slim

RUN groupadd -r bot && useradd -r -g bot bot

COPY staging /usr/src/myapp

RUN chown -R bot:bot /usr/src/myapp

WORKDIR /usr/src/myapp

USER bot

RUN mv myapp-*.jar myapp.jar
CMD ["java", "-jar", "myapp.jar"]