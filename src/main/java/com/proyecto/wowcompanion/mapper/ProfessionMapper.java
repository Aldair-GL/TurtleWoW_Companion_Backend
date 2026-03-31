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
                .type(p.getType() != null ? p.getType().name() : null)
                .build();
    }
}

