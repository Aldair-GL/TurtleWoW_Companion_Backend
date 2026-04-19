package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.BossResponseDto;
import com.proyecto.wowcompanion.dto.LootItemDto;
import com.proyecto.wowcompanion.model.Boss;
import com.proyecto.wowcompanion.model.LootItem;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BossMapper {

    public BossResponseDto toDto(Boss boss) {
        if (boss == null) return null;

        List<LootItemDto> loot = boss.getLootItems() != null
                ? boss.getLootItems().stream()
                    .map(this::toLootDto)
                    .collect(Collectors.toList())
                : List.of();

        return BossResponseDto.builder()
                .id(boss.getId())
                .name(boss.getName())
                .description(boss.getDescription())
                .lore(boss.getLore())
                .level(boss.getLevel())
                .health(boss.getHealth())
                .zoneName(boss.getZone() != null ? boss.getZone().getName() : null)
                .lootItems(loot)
                .build();
    }

    private LootItemDto toLootDto(LootItem item) {
        return LootItemDto.builder()
                .id(item.getId())
                .name(item.getName())
                .description(item.getDescription())
                .quality(item.getQuality() != null ? item.getQuality().name() : null)
                .type(item.getType())
                .dropRate(item.getDropRate())
                .build();
    }
}

