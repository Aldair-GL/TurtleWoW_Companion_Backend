package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.NpcResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.NpcMapper;
import com.proyecto.wowcompanion.model.Npc;
import com.proyecto.wowcompanion.repository.NpcRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class NpcService {

    private final NpcRepository npcRepository;
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
}

