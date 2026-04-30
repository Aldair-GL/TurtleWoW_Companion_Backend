package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterQuestProgress;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterQuestProgressRepository extends JpaRepository<CharacterQuestProgress, Long> {
    List<CharacterQuestProgress> findByUserCharacterId(Long characterId);
    List<CharacterQuestProgress> findByUserCharacterIdAndStatus(Long characterId, String status);
    Optional<CharacterQuestProgress> findByUserCharacterIdAndQuestId(Long characterId, Long questId);
}

