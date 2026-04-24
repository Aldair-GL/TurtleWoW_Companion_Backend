package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Race;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface RaceRepository extends JpaRepository<Race, Long> {

    @EntityGraph(attributePaths = {"faction", "availableClasses"})
    List<Race> findAll();

    @EntityGraph(attributePaths = {"faction", "availableClasses"})
    Optional<Race> findById(Long id);

    @EntityGraph(attributePaths = {"faction", "availableClasses"})
    List<Race> findByNameContainingIgnoreCase(String name);

    @EntityGraph(attributePaths = {"faction", "availableClasses"})
    List<Race> findByFactionId(Long factionId);
}
