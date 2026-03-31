package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.NpcResponseDto;
import com.proyecto.wowcompanion.model.Npc;
import org.springframework.stereotype.Component;

@Component
public class NpcMapper {

    public NpcResponseDto toDto(Npc npc) {
        if (npc == null) return null;
        return NpcResponseDto.builder()
                .id(npc.getId())
                .name(npc.getName())
                .description(npc.getDescription())
                .npcType(npc.getNpcType() != null ? npc.getNpcType().name() : null)
                .isQuestGiver(npc.getIsQuestGiver())
                .level(npc.getLevel())
                .zoneName(npc.getZone() != null ? npc.getZone().getName() : null)
                .factionName(npc.getFaction() != null ? npc.getFaction().getName() : null)
                .build();
    }
}

