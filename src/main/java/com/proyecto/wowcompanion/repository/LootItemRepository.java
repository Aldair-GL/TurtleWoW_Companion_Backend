package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.LootItem;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface LootItemRepository extends JpaRepository<LootItem, Long> {
    List<LootItem> findByBossId(Long bossId);
}

