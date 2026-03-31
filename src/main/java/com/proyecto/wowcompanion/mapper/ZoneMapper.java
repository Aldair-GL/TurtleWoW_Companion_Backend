package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.ZoneResponseDto;
import com.proyecto.wowcompanion.model.Zone;
import org.springframework.stereotype.Component;

@Component
public class ZoneMapper {

    public ZoneResponseDto toDto(Zone zone) {
        if (zone == null) return null;
        return ZoneResponseDto.builder()
                .id(zone.getId())
                .name(zone.getName())
                .description(zone.getDescription())
                .minLevel(zone.getMinLevel())
                .maxLevel(zone.getMaxLevel())
                .continent(zone.getContinent() != null ? zone.getContinent().name() : null)
                .zoneType(zone.getZoneType() != null ? zone.getZoneType().name() : null)
                .factionName(zone.getFaction() != null ? zone.getFaction().getName() : null)
                .build();
    }
}

