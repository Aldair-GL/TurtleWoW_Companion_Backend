package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.RaceResponseDto;
import com.proyecto.wowcompanion.service.RaceService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/races")
@RequiredArgsConstructor
@Tag(name = "Races", description = "Razas jugables de WoW Vanilla")
public class RaceController {

    private final RaceService raceService;

    @GetMapping
    @Operation(summary = "Listar razas", description = "Filtro opcional por factionId")
    public ResponseEntity<List<RaceResponseDto>> getAll(
            @RequestParam(required = false) Long factionId) {
        if (factionId != null) {
            return ResponseEntity.ok(raceService.findByFaction(factionId));
        }
        return ResponseEntity.ok(raceService.findAll());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener raza por ID")
    public ResponseEntity<RaceResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(raceService.findById(id));
    }
}

