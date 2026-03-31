package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.RaceResponseDto;
import com.proyecto.wowcompanion.model.CharacterClass;
import com.proyecto.wowcompanion.model.Race;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class RaceMapper {

    public RaceResponseDto toDto(Race race) {
        if (race == null) return null;

        List<String> classNames = race.getAvailableClasses() != null
                ? race.getAvailableClasses().stream()
                    .map(CharacterClass::getName)
                    .sorted()
                    .collect(Collectors.toList())
                : List.of();

        return RaceResponseDto.builder()
                .id(race.getId())
                .name(race.getName())
                .description(race.getDescription())
                .factionName(race.getFaction() != null ? race.getFaction().getName() : null)
                .availableClasses(classNames)
                .build();
    }
}

