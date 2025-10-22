# ============================================================
# 🧱 Etapa 1: Construcción con Maven
# ============================================================
FROM maven:3.9.9-eclipse-temurin-17 AS builder

# Establece el directorio de trabajo
WORKDIR /app

# Copia pom.xml y descarga dependencias primero (cache eficiente)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copia el código fuente y construye el JAR
COPY src ./src
RUN mvn clean package -DskipTests

# ============================================================
# 🚀 Etapa 2: Imagen final optimizada con JDK 17
# ============================================================
FROM eclipse-temurin:17-jre-jammy

# Crea un usuario no root para seguridad
RUN useradd -ms /bin/bash springuser

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

# Variables de entorno (dinámicas y sobreescribibles)
ENV SPRING_PROFILES_ACTIVE=default
ENV SERVER_PORT=8080

# Variables de entorno de base de datos (pueden venir desde AWS)
ENV DB_URL="r2dbc:postgresql://pg-teamokaren-jhosepromero14-dc28.l.aivencloud.com:16012/payments_aje?sslMode=require"
ENV DB_USERNAME="avnadmin"
ENV DB_PASSWORD="AVNS_saIKDKJWdkjnltsiL_d"

# Exponemos el puerto del contenedor
EXPOSE 8080

# 🔹 Log limpio (sin buffering)
ENV JAVA_OPTS="-Djava.security.egd=file:/dev/./urandom"

# 🔹 Comando de inicio
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar \
  --spring.r2dbc.url=${DB_URL} \
  --spring.r2dbc.username=${DB_USERNAME} \
  --spring.r2dbc.password=${DB_PASSWORD} \
  --server.port=${SERVER_PORT}"]
