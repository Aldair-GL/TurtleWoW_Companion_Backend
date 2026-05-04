package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.UserDungeonProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserDungeonProgressRepository extends JpaRepository<UserDungeonProgress, Long> {
    List<UserDungeonProgress> findByUserId(Long userId);
    Optional<UserDungeonProgress> findByUserIdAndZoneId(Long userId, Long zoneId);
}

