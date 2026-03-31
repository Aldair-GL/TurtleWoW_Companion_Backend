package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RaceResponseDto {
    private Long id;
    private String name;
    private String description;
    private String factionName;
    private List<String> availableClasses;
}

