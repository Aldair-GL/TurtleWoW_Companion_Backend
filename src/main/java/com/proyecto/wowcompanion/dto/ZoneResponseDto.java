package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ZoneResponseDto {
    private Long id;
    private String name;
    private String description;
    private Integer minLevel;
    private Integer maxLevel;
    private String continent;
    private String zoneType;
    private String factionName;
}

