package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestResponseDto {
    private Long id;
    private String name;
    private String description;
    private Integer level;
    private String factionRequired;
    private String rewards;
    private String zoneName;
    private Long zoneId;
    private String questGiverName;
    private Long questGiverId;
}

