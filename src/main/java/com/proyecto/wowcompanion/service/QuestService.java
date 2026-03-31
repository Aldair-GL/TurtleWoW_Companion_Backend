package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.QuestRequestDto;
import com.proyecto.wowcompanion.dto.QuestResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.QuestMapper;
import com.proyecto.wowcompanion.model.Npc;
import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.FactionType;
import com.proyecto.wowcompanion.repository.NpcRepository;
import com.proyecto.wowcompanion.repository.QuestRepository;
import com.proyecto.wowcompanion.repository.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Servicio con CRUD completo para Quests.
 */
@Service
@RequiredArgsConstructor
public class QuestService {

    private final QuestRepository questRepository;
    private final ZoneRepository zoneRepository;
    private final NpcRepository npcRepository;
    private final QuestMapper questMapper;

    @Cacheable(value = "quests", key = "#pageable.pageNumber + '-' + #name + '-' + #zoneId + '-' + #faction")
    public Page<QuestResponseDto> findAll(String name, Long zoneId, String faction, Pageable pageable) {
        Page<Quest> page;

        if (name != null && zoneId != null) {
            page = questRepository.findByNameContainingIgnoreCaseAndZoneId(name, zoneId, pageable);
        } else if (name != null) {
            page = questRepository.findByNameContainingIgnoreCase(name, pageable);
        } else if (zoneId != null) {
            page = questRepository.findByZoneId(zoneId, pageable);
        } else if (faction != null) {
            FactionType ft = FactionType.valueOf(faction.toUpperCase());
            page = questRepository.findByFactionRequired(ft, pageable);
        } else {
            page = questRepository.findAll(pageable);
        }

        return page.map(questMapper::toDto);
    }

    public QuestResponseDto findById(Long id) {
        Quest quest = questRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Quest", id));
        return questMapper.toDto(quest);
    }

    @Transactional
    @CacheEvict(value = "quests", allEntries = true)
    public QuestResponseDto create(QuestRequestDto dto) {
        Quest quest = questMapper.toEntity(dto);
        resolveRelations(dto, quest);
        Quest saved = questRepository.save(quest);
        return questMapper.toDto(saved);
    }

    @Transactional
    @CacheEvict(value = "quests", allEntries = true)
    public QuestResponseDto update(Long id, QuestRequestDto dto) {
        Quest quest = questRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Quest", id));
        questMapper.updateEntity(dto, quest);
        resolveRelations(dto, quest);
        Quest saved = questRepository.save(quest);
        return questMapper.toDto(saved);
    }

    @Transactional
    @CacheEvict(value = "quests", allEntries = true)
    public void delete(Long id) {
        if (!questRepository.existsById(id)) {
            throw new ResourceNotFoundException("Quest", id);
        }
        questRepository.deleteById(id);
    }

    /**
     * Resuelve las relaciones ManyToOne (Zone, Npc) a partir de los IDs del DTO.
     */
    private void resolveRelations(QuestRequestDto dto, Quest quest) {
        if (dto.getZoneId() != null) {
            Zone zone = zoneRepository.findById(dto.getZoneId())
                    .orElseThrow(() -> new ResourceNotFoundException("Zone", dto.getZoneId()));
            quest.setZone(zone);
        } else {
            quest.setZone(null);
        }

        if (dto.getQuestGiverId() != null) {
            Npc npc = npcRepository.findById(dto.getQuestGiverId())
                    .orElseThrow(() -> new ResourceNotFoundException("NPC", dto.getQuestGiverId()));
            quest.setQuestGiver(npc);
        } else {
            quest.setQuestGiver(null);
        }
    }
}

