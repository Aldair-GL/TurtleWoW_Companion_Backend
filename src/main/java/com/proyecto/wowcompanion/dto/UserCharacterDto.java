package com.proyecto.wowcompanion.dto;

import lombok.*;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserCharacterDto {
    private Long id;
    private String name;
    private Integer level;
    private String raceName;
    private String className;
    private String factionName;
    private String createdAt;
    private List<DungeonProgressDto> dungeonProgress;
}

