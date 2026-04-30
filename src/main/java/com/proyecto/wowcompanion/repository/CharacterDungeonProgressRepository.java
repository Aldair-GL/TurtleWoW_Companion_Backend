package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterDungeonProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterDungeonProgressRepository extends JpaRepository<CharacterDungeonProgress, Long> {

    List<CharacterDungeonProgress> findByUserCharacterId(Long characterId);

    Optional<CharacterDungeonProgress> findByUserCharacterIdAndZoneId(Long characterId, Long zoneId);
}

