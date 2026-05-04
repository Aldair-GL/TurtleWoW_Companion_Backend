package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.UserLootProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserLootProgressRepository extends JpaRepository<UserLootProgress, Long> {
    List<UserLootProgress> findByUserId(Long userId);
    Optional<UserLootProgress> findByUserIdAndItemNameAndBossId(Long userId, String itemName, Long bossId);
    boolean existsByUserIdAndItemNameAndBossId(Long userId, String itemName, Long bossId);
    void deleteByUserIdAndItemNameAndBossId(Long userId, String itemName, Long bossId);
}

