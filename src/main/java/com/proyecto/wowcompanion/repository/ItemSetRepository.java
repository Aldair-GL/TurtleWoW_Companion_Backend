package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.ItemSet;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;
import java.util.Optional;

@Repository
public interface ItemSetRepository extends JpaRepository<ItemSet, Long> {
    Optional<ItemSet> findBySlug(String slug);
    List<ItemSet> findByCharacterClassId(Long classId);
}

