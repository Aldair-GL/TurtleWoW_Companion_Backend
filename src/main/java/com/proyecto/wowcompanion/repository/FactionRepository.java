package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Faction;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FactionRepository extends JpaRepository<Faction, Long> {
    List<Faction> findByNameContainingIgnoreCase(String name);
}

