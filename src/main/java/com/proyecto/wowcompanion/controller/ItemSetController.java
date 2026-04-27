package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.repository.ItemSetRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/item-sets")
@RequiredArgsConstructor
@Tag(name = "Item Sets", description = "Catálogo de sets de items (tier sets)")
public class ItemSetController {

    private final ItemSetRepository repo;

    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> all(@RequestParam(required = false) Long classId) {
        var src = (classId == null) ? repo.findAll() : repo.findByCharacterClassId(classId);
        return ResponseEntity.ok(src.stream().map(s -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", s.getId());
            m.put("name", s.getName());
            m.put("slug", s.getSlug());
            m.put("description", s.getDescription() == null ? "" : s.getDescription());
            m.put("className", s.getCharacterClass() != null ? s.getCharacterClass().getName() : null);
            return m;
        }).collect(Collectors.toList()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> byId(@PathVariable Long id) {
        return repo.findById(id).<ResponseEntity<?>>map(s -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", s.getId());
            m.put("name", s.getName());
            m.put("slug", s.getSlug());
            m.put("description", s.getDescription() == null ? "" : s.getDescription());
            m.put("className", s.getCharacterClass() != null ? s.getCharacterClass().getName() : null);
            m.put("items", s.getItems().stream().map(it -> Map.of("id", it.getId(), "name", it.getName())).collect(Collectors.toList()));
            return ResponseEntity.ok(m);
        }).orElse(ResponseEntity.notFound().build());
    }
}


