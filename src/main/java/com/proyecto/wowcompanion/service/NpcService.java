package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.NpcRequestDto;
import com.proyecto.wowcompanion.dto.NpcResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.NpcMapper;
import com.proyecto.wowcompanion.model.Faction;
import com.proyecto.wowcompanion.model.Npc;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.NpcType;
import com.proyecto.wowcompanion.repository.FactionRepository;
import com.proyecto.wowcompanion.repository.NpcRepository;
import com.proyecto.wowcompanion.repository.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class NpcService {

    private final NpcRepository npcRepository;
    private final ZoneRepository zoneRepository;
    private final FactionRepository factionRepository;
    private final NpcMapper npcMapper;

    @Cacheable(value = "npcs", key = "#pageable.pageNumber + '-' + #name + '-' + #zoneId")
    public Page<NpcResponseDto> findAll(String name, Long zoneId, Pageable pageable) {
        Page<Npc> page;

        if (name != null) {
            page = npcRepository.findByNameContainingIgnoreCase(name, pageable);
        } else if (zoneId != null) {
            page = npcRepository.findByZoneId(zoneId, pageable);
        } else {
            page = npcRepository.findAll(pageable);
        }

        return page.map(npcMapper::toDto);
    }

    public NpcResponseDto findById(Long id) {
        Npc npc = npcRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("NPC", id));
        return npcMapper.toDto(npc);
    }

    @Transactional
    @CacheEvict(value = "npcs", allEntries = true)
    public NpcResponseDto create(NpcRequestDto dto) {
        Npc npc = new Npc();
        mapFromDto(dto, npc);
        Npc saved = npcRepository.save(npc);
        return npcMapper.toDto(saved);
    }

    @Transactional
    @CacheEvict(value = "npcs", allEntries = true)
    public NpcResponseDto update(Long id, NpcRequestDto dto) {
        Npc npc = npcRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("NPC", id));
        mapFromDto(dto, npc);
        Npc saved = npcRepository.save(npc);
        return npcMapper.toDto(saved);
    }

    @Transactional
    @CacheEvict(value = "npcs", allEntries = true)
    public void delete(Long id) {
        if (!npcRepository.existsById(id)) {
            throw new ResourceNotFoundException("NPC", id);
        }
        npcRepository.deleteById(id);
    }

    private void mapFromDto(NpcRequestDto dto, Npc npc) {
        npc.setName(dto.getName());
        npc.setTitle(dto.getTitle());
        npc.setDescription(dto.getDescription());
        npc.setNpcType(NpcType.valueOf(dto.getNpcType().toUpperCase()));
        npc.setIsQuestGiver(dto.getIsQuestGiver() != null ? dto.getIsQuestGiver() : false);
        npc.setLevel(dto.getLevel());

        if (dto.getZoneId() != null) {
            Zone zone = zoneRepository.findById(dto.getZoneId())
                    .orElseThrow(() -> new ResourceNotFoundException("Zone", dto.getZoneId()));
            npc.setZone(zone);
        } else {
            npc.setZone(null);
        }

        if (dto.getFactionId() != null) {
            Faction faction = factionRepository.findById(dto.getFactionId())
                    .orElseThrow(() -> new ResourceNotFoundException("Faction", dto.getFactionId()));
            npc.setFaction(faction);
        } else {
            npc.setFaction(null);
        }
    }
}
