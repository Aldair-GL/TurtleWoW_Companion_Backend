package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LootItemDto {
    private Long id;
    private String name;
    private String description;
    private String quality;
    private String type;
    private Double dropRate;
}

