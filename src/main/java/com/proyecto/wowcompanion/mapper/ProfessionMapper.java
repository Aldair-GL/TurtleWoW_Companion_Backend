package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.ProfessionResponseDto;
import com.proyecto.wowcompanion.model.Profession;
import org.springframework.stereotype.Component;

@Component
public class ProfessionMapper {

    public ProfessionResponseDto toDto(Profession p) {
        if (p == null) return null;
        return ProfessionResponseDto.builder()
                .id(p.getId())
                .name(p.getName())
                .description(p.getDescription())
                .type(formatearTipo(p.getType()))
                .build();
    }

    private String formatearTipo(com.proyecto.wowcompanion.model.enums.ProfessionType tipo) {
        if (tipo == null) return null;
        String nombre = tipo.name();
        return nombre.charAt(0) + nombre.substring(1).toLowerCase();
    }
}

