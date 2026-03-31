package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.enums.FactionType;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface QuestRepository extends JpaRepository<Quest, Long> {
    Page<Quest> findByNameContainingIgnoreCase(String name, Pageable pageable);
    Page<Quest> findByZoneId(Long zoneId, Pageable pageable);
    Page<Quest> findByFactionRequired(FactionType faction, Pageable pageable);
    Page<Quest> findByNameContainingIgnoreCaseAndZoneId(String name, Long zoneId, Pageable pageable);
}

