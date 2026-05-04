package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.UserBossKill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserBossKillRepository extends JpaRepository<UserBossKill, Long> {
    List<UserBossKill> findByUserId(Long userId);
    Optional<UserBossKill> findByUserIdAndBossId(Long userId, Long bossId);
    boolean existsByUserIdAndBossId(Long userId, Long bossId);
    void deleteByUserIdAndBossId(Long userId, Long bossId);
}

