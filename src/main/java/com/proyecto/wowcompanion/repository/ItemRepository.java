package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Item;
import com.proyecto.wowcompanion.model.enums.ItemQuality;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ItemRepository extends JpaRepository<Item, Long> {
    Page<Item> findByNameContainingIgnoreCase(String name, Pageable pageable);
    Page<Item> findByQuality(ItemQuality quality, Pageable pageable);
}

