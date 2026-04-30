package com.proyecto.wowcompanion.exception;

/**
 * Indica que se ha intentado crear un recurso que ya existe (HTTP 409 Conflict).
 */
public class DuplicateResourceException extends RuntimeException {
    public DuplicateResourceException(String message) {
        super(message);
    }
}

