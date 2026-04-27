package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterReputation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterReputationRepository extends JpaRepository<CharacterReputation, Long> {
    List<CharacterReputation> findByUserCharacterId(Long characterId);
    Optional<CharacterReputation> findByUserCharacterIdAndReputationId(Long characterId, Long reputationId);
}

