package com.proyecto.wowcompanion.dto;

import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserCharacterRequestDto {
    private String name;
    private Long raceId;
    private Long classId;
}

