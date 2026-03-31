package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO simplificado de quest para el cliente movil.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestAppDto {
    private Long id;
    private String title;
    private String description;
    private Integer level;
    private Integer minLevel;
    private String zone;
    private String faction;
    private Integer rewardXp;
    private String imageUrl;
}

