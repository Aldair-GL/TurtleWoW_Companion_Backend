package com.proyecto.wowcompanion.dto;

import lombok.*;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class BossResponseDto {
    private Long id;
    private String name;
    private String description;
    private String lore;
    private Integer level;
    private Long health;
    private String zoneName;
    private List<LootItemDto> lootItems;
}

