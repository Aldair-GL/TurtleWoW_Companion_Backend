package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.ZoneResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.ZoneMapper;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.Continent;
import com.proyecto.wowcompanion.repository.ZoneRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ZoneService {

    private final ZoneRepository zoneRepository;
    private final ZoneMapper zoneMapper;

    @Cacheable(value = "zones", key = "#pageable.pageNumber + '-' + #pageable.pageSize + '-' + #name + '-' + #continent")
    public Page<ZoneResponseDto> findAll(String name, String continent, Pageable pageable) {
        Page<Zone> page;

        if (name != null && continent != null) {
            Continent cont = Continent.valueOf(continent.toUpperCase());
            page = zoneRepository.findByNameContainingIgnoreCaseAndContinent(name, cont, pageable);
        } else if (name != null) {
            page = zoneRepository.findByNameContainingIgnoreCase(name, pageable);
        } else if (continent != null) {
            Continent cont = Continent.valueOf(continent.toUpperCase());
            page = zoneRepository.findByContinent(cont, pageable);
        } else {
            page = zoneRepository.findAll(pageable);
        }

        return page.map(zoneMapper::toDto);
    }

    public ZoneResponseDto findById(Long id) {
        Zone zone = zoneRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Zone", id));
        return zoneMapper.toDto(zone);
    }
}

