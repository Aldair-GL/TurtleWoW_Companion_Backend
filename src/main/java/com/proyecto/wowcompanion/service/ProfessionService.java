package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.ProfessionResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.ProfessionMapper;
import com.proyecto.wowcompanion.model.Profession;
import com.proyecto.wowcompanion.repository.ProfessionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ProfessionService {

    private final ProfessionRepository professionRepository;
    private final ProfessionMapper professionMapper;

    @Cacheable("professions")
    public List<ProfessionResponseDto> findAll() {
        return professionRepository.findAll().stream()
                .map(professionMapper::toDto)
                .collect(Collectors.toList());
    }

    public ProfessionResponseDto findById(Long id) {
        Profession profession = professionRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Profession", id));
        return professionMapper.toDto(profession);
    }

    public List<ProfessionResponseDto> searchByName(String name) {
        return professionRepository.findByNameContainingIgnoreCase(name).stream()
                .map(professionMapper::toDto)
                .collect(Collectors.toList());
    }
}

