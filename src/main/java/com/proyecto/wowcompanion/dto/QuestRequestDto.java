package com.proyecto.wowcompanion.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * DTO para crear o actualizar una Quest.
 * Incluye validaciones con Bean Validation.
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestRequestDto {

    @NotBlank(message = "El nombre de la quest es obligatorio")
    @Size(min = 2, max = 200, message = "El nombre debe tener entre 2 y 200 caracteres")
    private String name;

    @Size(max = 3000, message = "La descripción no puede superar los 3000 caracteres")
    private String description;

    @NotNull(message = "El nivel es obligatorio")
    @Min(value = 1, message = "El nivel mínimo es 1")
    private Integer level;

    /** ALLIANCE, HORDE o NEUTRAL */
    private String factionRequired;

    @Size(max = 500, message = "Las recompensas no pueden superar los 500 caracteres")
    private String rewards;

    /** ID de la zona donde se realiza la quest */
    private Long zoneId;

    /** ID del NPC que da la quest */
    private Long questGiverId;
}

