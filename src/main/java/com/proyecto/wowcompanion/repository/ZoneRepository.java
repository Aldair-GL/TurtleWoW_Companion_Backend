package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.Continent;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ZoneRepository extends JpaRepository<Zone, Long> {
    Page<Zone> findByNameContainingIgnoreCase(String name, Pageable pageable);
    Page<Zone> findByContinent(Continent continent, Pageable pageable);
    Page<Zone> findByNameContainingIgnoreCaseAndContinent(String name, Continent continent, Pageable pageable);
}

