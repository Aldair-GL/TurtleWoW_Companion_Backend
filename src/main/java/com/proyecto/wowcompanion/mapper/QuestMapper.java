package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.QuestRequestDto;
import com.proyecto.wowcompanion.dto.QuestResponseDto;
import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.enums.FactionType;
import org.springframework.stereotype.Component;

@Component
public class QuestMapper {

    public QuestResponseDto toDto(Quest quest) {
        if (quest == null) return null;
        return QuestResponseDto.builder()
                .id(quest.getId())
                .name(quest.getName())
                .description(quest.getDescription())
                .level(quest.getLevel())
                .factionRequired(quest.getFactionRequired() != null ? quest.getFactionRequired().name() : null)
                .rewards(quest.getRewards())
                .zoneName(quest.getZone() != null ? quest.getZone().getName() : null)
                .zoneId(quest.getZone() != null ? quest.getZone().getId() : null)
                .questGiverName(quest.getQuestGiver() != null ? quest.getQuestGiver().getName() : null)
                .questGiverId(quest.getQuestGiver() != null ? quest.getQuestGiver().getId() : null)
                .build();
    }

    public Quest toEntity(QuestRequestDto dto) {
        if (dto == null) return null;
        Quest quest = new Quest();
        quest.setName(dto.getName());
        quest.setDescription(dto.getDescription());
        quest.setLevel(dto.getLevel());
        quest.setRewards(dto.getRewards());
        if (dto.getFactionRequired() != null) {
            quest.setFactionRequired(FactionType.valueOf(dto.getFactionRequired()));
        }
        // zone y questGiver se setean en el service
        return quest;
    }

    public void updateEntity(QuestRequestDto dto, Quest quest) {
        quest.setName(dto.getName());
        quest.setDescription(dto.getDescription());
        quest.setLevel(dto.getLevel());
        quest.setRewards(dto.getRewards());
        if (dto.getFactionRequired() != null) {
            quest.setFactionRequired(FactionType.valueOf(dto.getFactionRequired()));
        } else {
            quest.setFactionRequired(null);
        }
    }
}

