package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data @NoArgsConstructor @AllArgsConstructor @Builder
public class ProgressUpdateDto {
    /** Para profesiones */
    private Short skillLevel;
    private Boolean isPrimary;
    /** Para reputaciones */
    private String standing;
    private Integer points;
    /** Para quests */
    private String status;
    private String notes;
}

