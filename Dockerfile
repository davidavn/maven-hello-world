FROM openjdk:17-jdk-slim

RUN groupadd -r bot && useradd -r -g bot bot

COPY staging /usr/src/myapp

WORKDIR /usr/src/myapp

RUN chown -R bot:bot /app

USER bot

CMD ["java", "-jar", "*.jar"]