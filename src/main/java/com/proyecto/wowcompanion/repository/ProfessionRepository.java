package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Profession;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProfessionRepository extends JpaRepository<Profession, Long> {
    List<Profession> findByNameContainingIgnoreCase(String name);
}

