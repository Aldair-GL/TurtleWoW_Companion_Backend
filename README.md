# TurtleWoW Companion — Backend API REST

[![Java](https://img.shields.io/badge/Java-21-blue)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.4-brightgreen)](https://spring.io/projects/spring-boot)
[![PostgreSQL](https://img.shields.io/badge/DB-PostgreSQL%20(Neon)-blue)](https://neon.tech/)

---

## Descripcion

Backend API REST para **TurtleWoW Companion**, una enciclopedia de World of Warcraft Clasico (Vanilla).
Expone endpoints REST consumidos por la aplicacion movil Android (Kotlin / Jetpack Compose).
Todos los datos del juego estan en español.

---

## Tecnologias

| Tecnologia | Uso |
|---|---|
| Java 21 | Lenguaje principal |
| Spring Boot 3.4.4 | Framework |
| Spring Data JPA | ORM y persistencia |
| PostgreSQL (Neon) | Base de datos en la nube |
| Lombok | Reduccion de boilerplate |
| MapStruct | Mapeo Entity - DTO |
| SpringDoc OpenAPI | Documentacion Swagger UI |
| Bean Validation | Validacion de datos de entrada |
| Spring Cache | Cache en memoria |

---

## Arquitectura del proyecto

```
src/main/java/com/proyecto/wowcompanion/
  config/         -> Configuraciones (CORS, Cache, Async, OpenAPI)
  controller/     -> Endpoints REST
  dto/            -> Objetos de transferencia (Request / Response)
  exception/      -> Manejo centralizado de errores
  mapper/         -> Conversion Entity <-> DTO
  model/          -> Entidades JPA
  model/enums/    -> Enumerados del dominio
  repository/     -> Interfaces Spring Data JPA
  service/        -> Logica de negocio
```

---

## Modelo de datos

```
Faction (1) ----< (N) Zone
Faction (1) ----< (N) Npc
Faction (1) ----< (N) Race
Zone    (1) ----< (N) Npc
Zone    (1) ----< (N) Quest
Npc     (1) ----< (N) Quest (quest_giver)
Race    (N) >----< (N) CharacterClass (tabla intermedia race_class)
```

Entidades: **Faction, Zone, Npc, Quest, Item, CharacterClass, Race, Profession, Usuario**

---

## Endpoints principales

| Metodo | Ruta | Descripcion | Filtros |
|--------|------|-------------|---------|
| GET | `/api/v1/zones` | Zonas y mazmorras (paginado) | `?name=`, `?continent=` |
| GET | `/api/v1/zones/{id}` | Detalle de zona | |
| GET | `/api/v1/races` | Razas jugables | `?factionId=` |
| GET | `/api/v1/races/{id}` | Detalle de raza con clases | |
| GET | `/api/v1/classes` | Clases de personaje | `?name=` |
| GET | `/api/v1/classes/{id}` | Detalle de clase | |
| GET | `/api/v1/factions` | Facciones | `?name=` |
| GET | `/api/v1/factions/{id}` | Detalle de faccion | |
| GET | `/api/v1/professions` | Profesiones | `?name=` |
| GET | `/api/v1/professions/{id}` | Detalle de profesion | |

Paginacion (zonas): `?page=0&size=20&sort=name,asc`

---

## Como ejecutar

```bash
# Arrancar el servidor
./mvnw spring-boot:run

# Swagger UI
http://localhost:8084/swagger-ui.html

# Tests
./mvnw test
```

### Variables de entorno necesarias

El proyecto requiere las siguientes variables de entorno para conectar a la base de datos:

| Variable | Descripcion |
|----------|-------------|
| `DATABASE_URL` | URL JDBC de conexion a PostgreSQL |
| `DATABASE_USER` | Usuario de la base de datos |
| `DATABASE_PASSWORD` | Contraseña de la base de datos |

Se pueden configurar en la Run Configuration de IntelliJ o como variables del sistema.

---

## Perfiles

| Perfil | BD | Activacion |
|--------|-----|-----------|
| `dev` (por defecto) | PostgreSQL (Neon) | `spring.profiles.active=dev` |
| `prod` | PostgreSQL (Neon) | `spring.profiles.active=prod` |
| `test` | H2 en memoria | `spring.profiles.active=test` |

---

## Datos iniciales

El fichero `data.sql` carga automaticamente los datos semilla al arrancar:
- 6 facciones (Alianza, Horda, neutrales)
- 9 clases de personaje
- 27 zonas de mundo abierto (ciudades, zonas de inicio, zonas disputadas)
- 20 mazmorras vanilla (desde Simas Igneas hasta Scholomance)
- 8 razas jugables (4 Alianza, 4 Horda) con sus clases disponibles
- 12 profesiones (9 primarias, 3 secundarias)
