package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para resultados de busqueda global.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class SearchResultDto {
    private Long id;
    private String name;
    private String type;        // "zone", "quest", "npc" (minúsculas)
    private String description;
}

