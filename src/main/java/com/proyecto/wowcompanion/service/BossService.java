package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.BossResponseDto;
import com.proyecto.wowcompanion.dto.LootItemDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.BossMapper;
import com.proyecto.wowcompanion.model.Boss;
import com.proyecto.wowcompanion.repository.BossRepository;
import com.proyecto.wowcompanion.repository.LootItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class BossService {

    private final BossRepository bossRepository;
    private final LootItemRepository lootItemRepository;
    private final BossMapper bossMapper;

    public List<BossResponseDto> findByZone(Long zoneId) {
        return bossRepository.findByZoneId(zoneId).stream()
                .map(bossMapper::toDto)
                .collect(Collectors.toList());
    }

    public BossResponseDto findById(Long id) {
        Boss boss = bossRepository.findByIdWithRelations(id)
                .orElseThrow(() -> new ResourceNotFoundException("Boss", id));
        return bossMapper.toDto(boss);
    }

    public List<LootItemDto> findItemsByBossId(Long bossId) {
        return lootItemRepository.findByBossId(bossId).stream()
                .map(li -> LootItemDto.builder()
                        .id(li.getId())
                        .name(li.getName())
                        .description(li.getDescription())
                        .quality(li.getQuality() != null ? li.getQuality().name() : null)
                        .type(li.getType())
                        .dropRate(li.getDropRate())
                        .build())
                .collect(Collectors.toList());
    }
}

