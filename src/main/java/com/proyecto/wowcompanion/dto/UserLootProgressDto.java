package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserLootProgressDto {
    private Long id;

    @NotBlank
    @Size(max = 128)
    private String itemName;

    @Size(max = 32)
    private String itemQuality;

    @NotNull
    private Long bossId;

    @NotBlank
    @Size(max = 128)
    private String bossName;

    private String obtainedAt;
}

