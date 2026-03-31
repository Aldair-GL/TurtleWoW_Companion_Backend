package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.RaceResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.RaceMapper;
import com.proyecto.wowcompanion.model.Race;
import com.proyecto.wowcompanion.repository.RaceRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class RaceService {

    private final RaceRepository raceRepository;
    private final RaceMapper raceMapper;

    @Cacheable("races")
    public List<RaceResponseDto> findAll() {
        return raceRepository.findAll().stream()
                .map(raceMapper::toDto)
                .collect(Collectors.toList());
    }

    public RaceResponseDto findById(Long id) {
        Race race = raceRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Race", id));
        return raceMapper.toDto(race);
    }

    public List<RaceResponseDto> findByFaction(Long factionId) {
        return raceRepository.findByFactionId(factionId).stream()
                .map(raceMapper::toDto)
                .collect(Collectors.toList());
    }
}

