package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.CharacterClassResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.CharacterClassMapper;
import com.proyecto.wowcompanion.model.CharacterClass;
import com.proyecto.wowcompanion.repository.CharacterClassRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class CharacterClassService {

    private final CharacterClassRepository classRepository;
    private final CharacterClassMapper classMapper;

    @Cacheable("classes")
    public List<CharacterClassResponseDto> findAll() {
        return classRepository.findAll().stream()
                .map(classMapper::toDto)
                .collect(Collectors.toList());
    }

    public CharacterClassResponseDto findById(Long id) {
        CharacterClass cc = classRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("CharacterClass", id));
        return classMapper.toDto(cc);
    }

    public List<CharacterClassResponseDto> searchByName(String name) {
        return classRepository.findByNameContainingIgnoreCase(name).stream()
                .map(classMapper::toDto)
                .collect(Collectors.toList());
    }
}

