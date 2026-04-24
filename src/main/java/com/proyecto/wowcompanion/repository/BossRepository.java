package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Boss;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface BossRepository extends JpaRepository<Boss, Long> {

    @Query("SELECT DISTINCT b FROM Boss b LEFT JOIN FETCH b.lootItems LEFT JOIN FETCH b.zone WHERE b.zone.id = :zoneId")
    List<Boss> findByZoneId(@Param("zoneId") Long zoneId);

    @Query("SELECT b FROM Boss b LEFT JOIN FETCH b.lootItems LEFT JOIN FETCH b.zone WHERE b.id = :id")
    Optional<Boss> findByIdWithRelations(@Param("id") Long id);
}

