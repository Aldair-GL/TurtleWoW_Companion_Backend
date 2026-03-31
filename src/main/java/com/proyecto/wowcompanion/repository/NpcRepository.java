package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Npc;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface NpcRepository extends JpaRepository<Npc, Long> {
    Page<Npc> findByNameContainingIgnoreCase(String name, Pageable pageable);
    Page<Npc> findByZoneId(Long zoneId, Pageable pageable);
    Page<Npc> findByIsQuestGiverTrue(Pageable pageable);
}

