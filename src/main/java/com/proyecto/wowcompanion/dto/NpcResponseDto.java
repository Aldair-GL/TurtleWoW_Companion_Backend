package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NpcResponseDto {
    private Long id;
    private String name;
    private String description;
    private String npcType;
    private Boolean isQuestGiver;
    private Integer level;
    private String zoneName;
    private String factionName;
}

