package com.proyecto.wowcompanion.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Contact;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * Configuracion de OpenAPI / Swagger UI.
 * Accesible en: http://localhost:8084/swagger-ui.html
 */
@Configuration
public class OpenApiConfig {

    @Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
                .info(new Info()
                        .title("TurtleWoW Companion API")
                        .version("1.0.0")
                        .description("API REST para la app de enciclopedia de World of Warcraft Vanilla. "
                                + "Proporciona endpoints para consultar zonas, quests, NPCs, items, razas, "
                                + "clases, facciones y profesiones.")
                        .contact(new Contact()
                                .name("TurtleWoW Companion")
                                .email("contacto@turtlewow-companion.dev")));
    }
}

