package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.CharacterClassResponseDto;
import com.proyecto.wowcompanion.model.CharacterClass;
import org.springframework.stereotype.Component;

@Component
public class CharacterClassMapper {

    public CharacterClassResponseDto toDto(CharacterClass cc) {
        if (cc == null) return null;
        return CharacterClassResponseDto.builder()
                .id(cc.getId())
                .name(cc.getName())
                .description(cc.getDescription())
                .role(cc.getRole() != null ? cc.getRole().name() : null)
                .resourceType(cc.getResourceType() != null ? cc.getResourceType().name() : null)
                .build();
    }
}

