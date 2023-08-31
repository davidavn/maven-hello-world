FROM openjdk:17-jre-slim

RUN groupadd -r bot && bot -r -g bot bot

COPY staging /usr/src/myapp

WORKDIR /usr/src/myapp

RUN chown -R bot:bot /app

USER bot

CMD ["java", "-jar", "*.jar"]