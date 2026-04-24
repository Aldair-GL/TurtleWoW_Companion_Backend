package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NpcRequestDto {

    @NotBlank(message = "El nombre del NPC es obligatorio")
    @Size(min = 2, max = 200)
    private String name;

    private String title;

    @Size(max = 2000)
    private String description;

    @NotNull(message = "El tipo de NPC es obligatorio")
    private String npcType;

    private Boolean isQuestGiver;

    private Integer level;

    private Long zoneId;

    private Long factionId;
}

