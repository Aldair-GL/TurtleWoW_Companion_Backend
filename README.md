# 🌟 Proyecto Final – Backend API REST

[![Java](https://img.shields.io/badge/Java-21-blue)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-brightgreen)](https://spring.io/projects/spring-boot)
[![H2](https://img.shields.io/badge/Database-H2-lightgrey)](https://www.h2database.com/)
[![License](https://img.shields.io/badge/License-MIT-orange)](LICENSE)

---

## 📌 Descripción

Este repositorio contiene el **backend API REST** del Proyecto Final de Desarrollo Multiplataforma.  
Su objetivo principal es exponer los **endpoints REST** que serán consumidos por la **app Android en Kotlin** y, eventualmente, por otras interfaces (por ejemplo, aplicaciones de escritorio o web).

El backend está construido con **Spring Boot 3.x** y utiliza **Spring Data JPA** para gestionar la persistencia de datos.  
Actualmente se puede ejecutar con una base de datos **H2 en memoria** para desarrollo rápido, y está preparado para PostgreSQL para producción.

---

## ⚙️ Tecnologías utilizadas

- **Java 21** – Lenguaje principal del backend
- **Spring Boot 3.x** – Framework principal
- **Spring Data JPA** – ORM para manejo de base de datos
- **H2 Database** – Base de datos en memoria para desarrollo
- **PostgreSQL** – Base de datos objetivo para producción
- **Lombok** – Para simplificar código (getters, setters, constructores)

---

## 🏗️ Estructura del proyecto

```text
src/main/java/com/tuempresa/proyectofinal
│
├─ controller/      → Endpoints REST (GET, POST, PUT, DELETE)
├─ service/         → Lógica de negocio y validaciones
├─ repository/      → Interfaces JPA para acceso a la base de datos
├─ model/           → Clases de entidades (tablas)
├─ dto/             → Objetos de transferencia de datos (opcional)
├─ config/          → Configuraciones de Spring (CORS, seguridad, etc.)
└─ ProyectoFinalApplication.java → Clase principal que arranca la aplicación
