package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Reputation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface ReputationRepository extends JpaRepository<Reputation, Long> {
    Optional<Reputation> findBySlug(String slug);
}

