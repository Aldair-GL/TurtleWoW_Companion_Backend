package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Boss;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BossRepository extends JpaRepository<Boss, Long> {
    List<Boss> findByZoneId(Long zoneId);
}

