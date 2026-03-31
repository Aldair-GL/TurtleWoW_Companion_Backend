# TurtleWoW Companion — Backend API REST

[![Java](https://img.shields.io/badge/Java-21-blue)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.4.4-brightgreen)](https://spring.io/projects/spring-boot)
[![H2](https://img.shields.io/badge/Dev%20DB-H2-lightgrey)](https://www.h2database.com/)
[![PostgreSQL](https://img.shields.io/badge/Prod%20DB-PostgreSQL-blue)](https://www.postgresql.org/)

---

## Descripcion

Backend API REST para **TurtleWoW Companion**, una enciclopedia de World of Warcraft Vanilla.
Expone endpoints REST consumidos por la aplicacion movil Android (Kotlin / Jetpack Compose).

---

## Tecnologias

| Tecnologia | Uso |
|---|---|
| Java 21 | Lenguaje principal |
| Spring Boot 3.4.4 | Framework |
| Spring Data JPA | ORM y persistencia |
| H2 Database | BD en memoria (desarrollo) |
| PostgreSQL | BD en produccion |
| Lombok | Reduccion de boilerplate |
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

## Endpoints

### API simplificada (cliente movil)

| Metodo | Ruta | Descripcion |
|--------|------|-------------|
| GET | `/api/zones` | Listar todas las zonas |
| GET | `/api/zones/{id}` | Detalle de una zona |
| GET | `/api/quests` | Listar todas las quests |
| GET | `/api/quests/{id}` | Detalle de una quest |
| GET | `/api/npcs` | Listar todos los NPCs |
| GET | `/api/npcs/{id}` | Detalle de un NPC |
| GET | `/api/search?q={term}` | Busqueda global |

### API completa (v1, paginada, con filtros)

| Metodo | Ruta | Descripcion | Filtros |
|--------|------|-------------|---------|
| GET | `/api/v1/zones` | Zonas (paginado) | `?name=`, `?continent=` |
| GET | `/api/v1/zones/{id}` | Detalle de zona | |
| GET | `/api/v1/quests` | Quests (paginado) | `?name=`, `?zoneId=`, `?faction=` |
| GET | `/api/v1/quests/{id}` | Detalle de quest | |
| POST | `/api/v1/quests` | Crear quest | Body JSON |
| PUT | `/api/v1/quests/{id}` | Actualizar quest | Body JSON |
| DELETE | `/api/v1/quests/{id}` | Eliminar quest | |
| GET | `/api/v1/npcs` | NPCs (paginado) | `?name=`, `?zoneId=` |
| GET | `/api/v1/npcs/{id}` | Detalle de NPC | |
| GET | `/api/v1/items` | Items (paginado) | `?name=`, `?quality=` |
| GET | `/api/v1/items/{id}` | Detalle de item | |
| GET | `/api/v1/factions` | Facciones | `?name=` |
| GET | `/api/v1/factions/{id}` | Detalle de faccion | |
| GET | `/api/v1/classes` | Clases | `?name=` |
| GET | `/api/v1/classes/{id}` | Detalle de clase | |
| GET | `/api/v1/races` | Razas | `?factionId=` |
| GET | `/api/v1/races/{id}` | Detalle de raza | |
| GET | `/api/v1/professions` | Profesiones | `?name=` |
| GET | `/api/v1/professions/{id}` | Detalle de profesion | |

Paginacion: `?page=0&size=20&sort=name,asc`

---

## Como ejecutar

```bash
# Desarrollo (H2 en memoria)
./mvnw spring-boot:run

# Swagger UI
http://localhost:8084/swagger-ui.html

# H2 Console
http://localhost:8084/h2-console
# JDBC URL: jdbc:h2:mem:wowdb | User: sa | Password: (vacio)

# Tests
./mvnw test
```

---

## Perfiles

| Perfil | BD | Activacion |
|--------|-----|-----------|
| `dev` (por defecto) | H2 en memoria | `spring.profiles.active=dev` |
| `prod` | PostgreSQL | `spring.profiles.active=prod` |

---

## Datos de prueba

El fichero `data.sql` carga automaticamente datos seed al arrancar en perfil `dev`:
- 6 facciones
- 9 clases de personaje
- 13 zonas
- 15 NPCs
- 10 quests
- 12 items
- 8 razas
- 12 profesiones
