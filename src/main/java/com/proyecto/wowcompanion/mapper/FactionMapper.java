package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.FactionResponseDto;
import com.proyecto.wowcompanion.model.Faction;
import org.springframework.stereotype.Component;

@Component
public class FactionMapper {

    public FactionResponseDto toDto(Faction faction) {
        if (faction == null) return null;
        return FactionResponseDto.builder()
                .id(faction.getId())
                .name(faction.getName())
                .description(faction.getDescription())
                .type(faction.getType() != null ? faction.getType().name() : null)
                .build();
    }
}

