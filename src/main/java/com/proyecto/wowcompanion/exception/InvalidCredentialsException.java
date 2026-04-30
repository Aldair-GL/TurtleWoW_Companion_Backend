package com.proyecto.wowcompanion.exception;

/**
 * Indica credenciales invalidas en login (HTTP 401 Unauthorized).
 */
public class InvalidCredentialsException extends RuntimeException {
    public InvalidCredentialsException(String message) {
        super(message);
    }
}

