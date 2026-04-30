package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FavoriteDto {
    private Long id;
    private String entityType;
    private Long entityId;
    private String createdAt;
}

