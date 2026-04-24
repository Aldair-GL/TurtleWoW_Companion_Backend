package com.proyecto.wowcompanion.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class ItemResponseDto {
    private Long id;
    private String name;
    private String description;
    private String quality;
    private String type;
    private String subtype;
    private Integer levelRequired;
    private Integer itemLevel;
    private String professionName;
}
