package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.FactionResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.FactionMapper;
import com.proyecto.wowcompanion.model.Faction;
import com.proyecto.wowcompanion.repository.FactionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FactionService {

    private final FactionRepository factionRepository;
    private final FactionMapper factionMapper;

    @Cacheable("factions")
    public List<FactionResponseDto> findAll() {
        return factionRepository.findAll().stream()
                .map(factionMapper::toDto)
                .collect(Collectors.toList());
    }

    public FactionResponseDto findById(Long id) {
        Faction faction = factionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Faction", id));
        return factionMapper.toDto(faction);
    }

    public List<FactionResponseDto> searchByName(String name) {
        return factionRepository.findByNameContainingIgnoreCase(name).stream()
                .map(factionMapper::toDto)
                .collect(Collectors.toList());
    }
}

