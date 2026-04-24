package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Item;
import com.proyecto.wowcompanion.model.enums.ItemQuality;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ItemRepository extends JpaRepository<Item, Long> {

    @EntityGraph(attributePaths = {"profession"})
    Page<Item> findAll(Pageable pageable);

    @EntityGraph(attributePaths = {"profession"})
    Optional<Item> findById(Long id);

    @EntityGraph(attributePaths = {"profession"})
    Page<Item> findByNameContainingIgnoreCase(String name, Pageable pageable);

    @EntityGraph(attributePaths = {"profession"})
    Page<Item> findByQuality(ItemQuality quality, Pageable pageable);
}
