package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDungeonProgressDto {
    private Long id;
    private Long zoneId;

    @NotBlank
    @Size(max = 128)
    private String zoneName;

    @NotNull
    private Boolean completed;

    private String completedAt;
}

