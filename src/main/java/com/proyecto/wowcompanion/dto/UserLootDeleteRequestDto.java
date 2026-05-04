package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserLootDeleteRequestDto {
    @NotBlank
    private String itemName;

    @NotNull
    private Long bossId;
}

