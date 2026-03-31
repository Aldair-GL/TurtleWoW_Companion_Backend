package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.SearchResultDto;
import com.proyecto.wowcompanion.mapper.AppMapper;
import com.proyecto.wowcompanion.model.Npc;
import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.repository.NpcRepository;
import com.proyecto.wowcompanion.repository.QuestRepository;
import com.proyecto.wowcompanion.repository.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * Servicio de búsqueda global: busca en zonas, quests y NPCs por nombre.
 */
@Service
@RequiredArgsConstructor
public class SearchService {

    private final ZoneRepository zoneRepository;
    private final QuestRepository questRepository;
    private final NpcRepository npcRepository;
    private final AppMapper appMapper;

    @Transactional(readOnly = true)
    public List<SearchResultDto> search(String query) {
        List<SearchResultDto> results = new ArrayList<>();

        if (query == null || query.isBlank()) {
            return results;
        }

        PageRequest limit = PageRequest.of(0, 20);

        // Buscar zonas
        List<Zone> zones = zoneRepository.findByNameContainingIgnoreCase(query, limit).getContent();
        for (Zone zone : zones) {
            results.add(appMapper.zoneToSearchResult(zone));
        }

        // Buscar quests
        List<Quest> quests = questRepository.findByNameContainingIgnoreCase(query, limit).getContent();
        for (Quest quest : quests) {
            results.add(appMapper.questToSearchResult(quest));
        }

        // Buscar NPCs
        List<Npc> npcs = npcRepository.findByNameContainingIgnoreCase(query, limit).getContent();
        for (Npc npc : npcs) {
            results.add(appMapper.npcToSearchResult(npc));
        }

        return results;
    }
}

