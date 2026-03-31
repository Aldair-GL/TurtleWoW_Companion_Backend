package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Race;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RaceRepository extends JpaRepository<Race, Long> {
    List<Race> findByNameContainingIgnoreCase(String name);
    List<Race> findByFactionId(Long factionId);
}

