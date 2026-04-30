package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.QuestChain;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.Optional;

@Repository
public interface QuestChainRepository extends JpaRepository<QuestChain, Long> {
    Optional<QuestChain> findBySlug(String slug);
}

