package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.UserCharacter;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserCharacterRepository extends JpaRepository<UserCharacter, Long> {

    List<UserCharacter> findByUserId(Long userId);

    long countByUserId(Long userId);

    Optional<UserCharacter> findByIdAndUserId(Long id, Long userId);
}
