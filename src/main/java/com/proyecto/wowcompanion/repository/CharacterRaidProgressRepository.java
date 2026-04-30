package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterRaidProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterRaidProgressRepository extends JpaRepository<CharacterRaidProgress, Long> {
    List<CharacterRaidProgress> findByUserCharacterId(Long characterId);
    Optional<CharacterRaidProgress> findByUserCharacterIdAndZoneId(Long characterId, Long zoneId);
}

