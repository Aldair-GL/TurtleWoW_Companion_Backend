package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserCharacterDto {
    private Long id;
    private String name;
    private String raceName;
    private String className;
    private Integer level;
    private String createdAt;
}
