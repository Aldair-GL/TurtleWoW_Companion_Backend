package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.repository.ReputationRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/reputations")
@RequiredArgsConstructor
@Tag(name = "Reputations", description = "Catálogo de reputaciones")
public class ReputationController {

    private final ReputationRepository repo;

    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> all() {
        return ResponseEntity.ok(repo.findAll().stream().map(r -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", r.getId());
            m.put("name", r.getName());
            m.put("slug", r.getSlug());
            m.put("description", r.getDescription() == null ? "" : r.getDescription());
            m.put("factionName", r.getFaction() != null ? r.getFaction().getName() : null);
            return m;
        }).collect(Collectors.toList()));
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> byId(@PathVariable Long id) {
        return repo.findById(id).<ResponseEntity<?>>map(r -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", r.getId());
            m.put("name", r.getName());
            m.put("slug", r.getSlug());
            m.put("description", r.getDescription() == null ? "" : r.getDescription());
            m.put("factionName", r.getFaction() != null ? r.getFaction().getName() : null);
            m.put("sourceUrl", r.getSourceUrl() == null ? "" : r.getSourceUrl());
            return ResponseEntity.ok(m);
        }).orElse(ResponseEntity.notFound().build());
    }
}


