package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserBossKillDto {
    private Long id;

    @NotNull
    private Long bossId;

    @NotBlank
    @Size(max = 128)
    private String bossName;

    @NotBlank
    @Size(max = 128)
    private String zoneName;

    private String killedAt;
}

