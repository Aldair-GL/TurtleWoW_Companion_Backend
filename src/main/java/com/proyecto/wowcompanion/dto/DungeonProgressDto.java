package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DungeonProgressDto {
    private Long id;
    private Long zoneId;
    private String zoneName;
    private Boolean completed;
    private String completedAt;
}

