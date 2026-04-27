package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterBossKill;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterBossKillRepository extends JpaRepository<CharacterBossKill, Long> {
    List<CharacterBossKill> findByUserCharacterId(Long characterId);
    Optional<CharacterBossKill> findByUserCharacterIdAndBossId(Long characterId, Long bossId);
}

