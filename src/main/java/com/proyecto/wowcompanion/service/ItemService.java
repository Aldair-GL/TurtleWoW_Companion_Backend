package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.ItemResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.ItemMapper;
import com.proyecto.wowcompanion.model.Item;
import com.proyecto.wowcompanion.model.enums.ItemQuality;
import com.proyecto.wowcompanion.repository.ItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class ItemService {

    private final ItemRepository itemRepository;
    private final ItemMapper itemMapper;

    @Cacheable(value = "items", key = "#pageable.pageNumber + '-' + #name + '-' + #quality")
    public Page<ItemResponseDto> findAll(String name, String quality, Pageable pageable) {
        Page<Item> page;

        if (name != null) {
            page = itemRepository.findByNameContainingIgnoreCase(name, pageable);
        } else if (quality != null) {
            ItemQuality q = ItemQuality.valueOf(quality.toUpperCase());
            page = itemRepository.findByQuality(q, pageable);
        } else {
            page = itemRepository.findAll(pageable);
        }

        return page.map(itemMapper::toDto);
    }

    public ItemResponseDto findById(Long id) {
        Item item = itemRepository.findById(id)
                .orElseThrow(() -> new ResourceNotFoundException("Item", id));
        return itemMapper.toDto(item);
    }
}
