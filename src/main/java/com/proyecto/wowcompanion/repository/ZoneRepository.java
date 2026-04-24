package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.Continent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ZoneRepository extends JpaRepository<Zone, Long> {

    @EntityGraph(attributePaths = {"faction"})
    Page<Zone> findAll(Pageable pageable);

    @EntityGraph(attributePaths = {"faction"})
    Page<Zone> findByNameContainingIgnoreCase(String name, Pageable pageable);

    @EntityGraph(attributePaths = {"faction"})
    Page<Zone> findByContinent(Continent continent, Pageable pageable);

    @EntityGraph(attributePaths = {"faction"})
    Page<Zone> findByNameContainingIgnoreCaseAndContinent(String name, Continent continent, Pageable pageable);

    @EntityGraph(attributePaths = {"faction"})
    Optional<Zone> findById(Long id);
}
