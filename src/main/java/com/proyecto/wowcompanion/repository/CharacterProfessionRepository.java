package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.CharacterProfession;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface CharacterProfessionRepository extends JpaRepository<CharacterProfession, Long> {
    List<CharacterProfession> findByUserCharacterId(Long characterId);
    Optional<CharacterProfession> findByUserCharacterIdAndProfessionId(Long characterId, Long professionId);
}

