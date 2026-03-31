package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO simplificado de zona para el cliente movil.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ZoneAppDto {
    private Long id;
    private String name;
    private String description;
    private String level;
    private String faction;
    private String imageUrl;
}

