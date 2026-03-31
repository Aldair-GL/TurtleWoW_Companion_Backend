package com.proyecto.wowcompanion.config;

import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Configuration;

/**
 * Habilita el cache de Spring.
 * Se usa @Cacheable en los servicios para cachear consultas frecuentes (zonas, NPCs, etc.)
 */
@Configuration
@EnableCaching
public class CacheConfig {
}

