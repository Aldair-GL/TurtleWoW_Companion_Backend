package com.proyecto.wowcompanion.exception;

/**
 * Excepción lanzada cuando no se encuentra un recurso en la base de datos.
 * Será capturada por GlobalExceptionHandler para devolver HTTP 404.
 */
public class ResourceNotFoundException extends RuntimeException {

    public ResourceNotFoundException(String resourceName, Long id) {
        super(String.format("%s con id %d no encontrado", resourceName, id));
    }

    public ResourceNotFoundException(String message) {
        super(message);
    }
}

