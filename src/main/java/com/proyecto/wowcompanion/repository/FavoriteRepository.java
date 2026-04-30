package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Favorite;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface FavoriteRepository extends JpaRepository<Favorite, Long> {

    List<Favorite> findByUserId(Long userId);

    List<Favorite> findByUserIdAndEntityType(Long userId, String entityType);

    Optional<Favorite> findByUserIdAndEntityTypeAndEntityId(Long userId, String entityType, Long entityId);

    void deleteByUserIdAndEntityTypeAndEntityId(Long userId, String entityType, Long entityId);
}

