FROM openjdk:17-jdk-slim

RUN groupadd -r bot && bot -r -g bot bot

COPY ./myapp/target/*.jar /usr/src/myapp

WORKDIR /usr/src/myapp

RUN chown -R bot:bot /app

USER bot

CMD ["java", "-jar", "*.jar"]