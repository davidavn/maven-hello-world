FROM openjdk:17-jdk-slim

RUN groupadd -r bot && useradd -r -g bot bot

COPY staging /usr/src/myapp

RUN chown -R bot:bot /usr/src/myapp

WORKDIR /usr/src/myapp

USER bot

CMD ["java", "-jar", "myapp-1.0.0.jar"]