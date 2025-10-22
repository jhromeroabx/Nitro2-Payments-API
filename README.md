# ⚡ **Nitro2 Payments API**

> Microservicio **reactivo** con **Spring Boot 3 + WebFlux + R2DBC + PostgreSQL (Aiven)**, documentado con **Swagger** y desplegable en **Docker / AWS**.  
> Desarrollado por **Jhosep Romero** como demostración técnica para **AJE Group** (puesto: Desarrollador Backend).

---

## 🚀 **Stack principal**

| Categoría | Tecnología |
|------------|-------------|
| **Backend** | Java 17, Spring Boot 3.3.4, WebFlux |
| **Base de datos** | PostgreSQL (Aiven Cloud), R2DBC |
| **Documentación** | Swagger / Springdoc OpenAPI 3 |
| **Infraestructura** | Docker, AWS Elastic Beanstalk |
| **Extras** | Lombok, Actuator, DevTools |

---

## 🧩 **Arquitectura del Proyecto**

```
src/
 ├── controller/   → Controladores REST (WebFlux)
 ├── service/      → Lógica reactiva de negocio
 ├── repository/   → Repositorios R2DBC
 ├── model/        → Entidades: User, Payment
 ├── config/       → Configuración Swagger dinámica
 └── resources/
      ├── application.yml
      └── schema.sql
```

---

## 💰 **Endpoints principales**

| Método | Ruta | Descripción |
|--------|------|-------------|
| `GET` | `/api/users` | Lista todos los usuarios |
| `GET` | `/api/payments` | Lista todos los pagos |
| `GET` | `/api/payments/user/{userId}` | Pagos por usuario |
| `POST` | `/api/payments` | Crea un nuevo pago |
| `PUT` | `/api/payments/{id}/status?status=CONFIRMED` | Actualiza estado |

---

## 🌐 **Swagger / OpenAPI**

- Swagger UI → [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)
- JSON Docs → `/v3/api-docs`
- YAML Docs → `/v3/api-docs.yaml`

🔹 *El host se detecta dinámicamente según el entorno (local, AWS, etc.)*

---

## 🐳 **Docker Ready**

```bash
# Construcción
docker build -t nitro2-payments-api .

# Ejecución
docker run -d -p 8080:8080 \
  -e DB_URL="r2dbc:postgresql://.../payments_aje?sslMode=require" \
  -e DB_USERNAME="avnadmin" \
  -e DB_PASSWORD="********" \
  --name nitro2 nitro2-payments-api
```

👉 Swagger UI disponible en: [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html)

---

## ☁️ **Despliegue en AWS**

Compatible con **Elastic Beanstalk**, **ECS**, o **EC2** usando el mismo `Dockerfile`.

Variables de entorno necesarias:
- `DB_URL`
- `DB_USERNAME`
- `DB_PASSWORD`

---

## ☁️ **Flujo de Despliegue**

- GitHub → build + push Docker → ECR.
- ECS → ejecuta contenedor → puerto 8080.
- ALB → escucha puerto 80 → redirige a Target Group (8080).
- Security Group → abre puertos 80/8080 al público.
- Load Balancer DNS → acceso externo → Vista Swagger.

---

## 🧠 **Conceptos demostrados**

- Arquitectura **reactiva no bloqueante** (WebFlux + R2DBC)
- **Clean architecture**: controller → service → repository
- Configuración **cloud-ready** (sin hardcode)
- **Swagger dinámico** (auto-detección del host)
- Despliegue portable con Docker y AWS

---

## 👨‍💻 **Autor**

**Jhosep Romero Loa**  
📧 jhosepromero14@gmail.com  
🔗 [GitHub](https://github.com/jhromeroabx) | [LinkedIn](https://www.linkedin.com/in/jhosep-romero-loa-274b06239/)
