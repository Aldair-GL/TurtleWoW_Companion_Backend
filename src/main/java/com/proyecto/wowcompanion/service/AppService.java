package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.NpcAppDto;
import com.proyecto.wowcompanion.dto.QuestAppDto;
import com.proyecto.wowcompanion.dto.ZoneAppDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.AppMapper;
import com.proyecto.wowcompanion.model.Npc;
import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.repository.NpcRepository;
import com.proyecto.wowcompanion.repository.QuestRepository;
import com.proyecto.wowcompanion.repository.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

/**
 * Servicio que expone listas planas de entidades para los endpoints simplificados.
 */
@Service
@RequiredArgsConstructor
public class AppService {

    private final ZoneRepository zoneRepository;
    private final QuestRepository questRepository;
    private final NpcRepository npcRepository;
    private final AppMapper appMapper;

    // ==================== ZONES ====================

    @Transactional(readOnly = true)
    public List<ZoneAppDto> findAllZones() {
        return zoneRepository.findAll().stream()
                .map(appMapper::toZoneAppDto)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public ZoneAppDto findZoneById(Long id) {
        Zone zone = zoneRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Zone", id));
        return appMapper.toZoneAppDto(zone);
    }

    // ==================== QUESTS ====================

    @Transactional(readOnly = true)
    public List<QuestAppDto> findAllQuests() {
        return questRepository.findAll().stream()
                .map(appMapper::toQuestAppDto)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public QuestAppDto findQuestById(Long id) {
        Quest quest = questRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Quest", id));
        return appMapper.toQuestAppDto(quest);
    }

    // ==================== NPCS ====================

    @Transactional(readOnly = true)
    public List<NpcAppDto> findAllNpcs() {
        return npcRepository.findAll().stream()
                .map(appMapper::toNpcAppDto)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public NpcAppDto findNpcById(Long id) {
        Npc npc = npcRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("NPC", id));
        return appMapper.toNpcAppDto(npc);
    }
}

