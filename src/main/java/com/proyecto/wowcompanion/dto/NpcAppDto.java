package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO simplificado de NPC para el cliente movil.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NpcAppDto {
    private Long id;
    private String name;
    private String title;
    private String zone;
    private String type;
    private Integer level;
    private String faction;
    private String imageUrl;
}

