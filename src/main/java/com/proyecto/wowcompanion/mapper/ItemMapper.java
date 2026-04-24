package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.ItemResponseDto;
import com.proyecto.wowcompanion.model.Item;
import org.springframework.stereotype.Component;

@Component
public class ItemMapper {

    public ItemResponseDto toDto(Item item) {
        if (item == null) return null;
        return ItemResponseDto.builder()
                .id(item.getId())
                .name(item.getName())
                .description(item.getDescription())
                .quality(item.getQuality() != null ? item.getQuality().name() : null)
                .type(item.getType())
                .subtype(item.getSubtype())
                .levelRequired(item.getLevelRequired())
                .itemLevel(item.getItemLevel())
                .professionName(item.getProfession() != null ? item.getProfession().getName() : null)
                .build();
    }
}
