package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.FactionResponseDto;
import com.proyecto.wowcompanion.service.FactionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/factions")
@RequiredArgsConstructor
@Tag(name = "Factions", description = "Facciones de WoW Vanilla")
public class FactionController {

    private final FactionService factionService;

    @GetMapping
    @Operation(summary = "Listar facciones")
    public ResponseEntity<List<FactionResponseDto>> getAll(
            @RequestParam(required = false) String name) {
        if (name != null) {
            return ResponseEntity.ok(factionService.searchByName(name));
        }
        return ResponseEntity.ok(factionService.findAll());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener faccion por ID")
    public ResponseEntity<FactionResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(factionService.findById(id));
    }
}

