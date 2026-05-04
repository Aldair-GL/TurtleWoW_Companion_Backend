package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.*;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserCharacterRequestDto {

    @NotBlank
    @Size(max = 64)
    private String name;

    @NotBlank
    @Size(max = 64)
    private String raceName;

    @NotBlank
    @Size(max = 64)
    private String className;

    @NotNull
    @Min(1)
    @Max(60)
    private Integer level;
}
