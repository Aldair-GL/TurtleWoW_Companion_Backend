package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.repository.RecipeRepository;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.*;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/recipes")
@RequiredArgsConstructor
@Tag(name = "Recipes", description = "Catálogo de recetas de profesión")
public class RecipeController {

    private final RecipeRepository repo;

    @GetMapping
    public ResponseEntity<List<Map<String, Object>>> all(@RequestParam(required = false) Long professionId) {
        var src = (professionId == null) ? repo.findAll() : repo.findByProfessionId(professionId);
        return ResponseEntity.ok(src.stream().map(r -> {
            Map<String, Object> m = new HashMap<>();
            m.put("id", r.getId());
            m.put("name", r.getName());
            m.put("slug", r.getSlug());
            m.put("professionId", r.getProfession().getId());
            m.put("professionName", r.getProfession().getName());
            m.put("craftedItemId", r.getCraftedItem() != null ? r.getCraftedItem().getId() : null);
            m.put("requiredSkill", r.getRequiredSkill());
            m.put("sourceType", r.getSourceType() == null ? "" : r.getSourceType());
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
            m.put("professionName", r.getProfession().getName());
            m.put("craftedItemId", r.getCraftedItem() != null ? r.getCraftedItem().getId() : null);
            m.put("requiredSkill", r.getRequiredSkill());
            m.put("sourceType", r.getSourceType() == null ? "" : r.getSourceType());
            m.put("sourceUrl", r.getSourceUrl() == null ? "" : r.getSourceUrl());
            return ResponseEntity.ok(m);
        }).orElse(ResponseEntity.notFound().build());
    }
}


