package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteRequestDto {
    private String entityType;
    private Long entityId;
}

