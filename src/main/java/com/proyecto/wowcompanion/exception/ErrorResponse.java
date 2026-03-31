package com.proyecto.wowcompanion.exception;

import com.fasterxml.jackson.annotation.JsonInclude;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.Map;

/**
 * DTO estandarizado para respuestas de error.
 * Todas las respuestas de error del backend usan este formato.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@JsonInclude(JsonInclude.Include.NON_NULL)
public class ErrorResponse {

    private LocalDateTime timestamp;
    private int status;
    private String error;
    private String message;

    /** Detalle de errores de validación por campo (solo en 400) */
    private Map<String, String> fieldErrors;
}

