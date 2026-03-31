package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterClass;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CharacterClassRepository extends JpaRepository<CharacterClass, Long> {
    List<CharacterClass> findByNameContainingIgnoreCase(String name);
    Optional<CharacterClass> findByNameIgnoreCase(String name);
}

