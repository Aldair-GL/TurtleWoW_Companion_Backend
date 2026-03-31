package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.ZoneResponseDto;
import com.proyecto.wowcompanion.service.ZoneService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/zones")
@RequiredArgsConstructor
@Tag(name = "Zones", description = "Zonas del mundo de WoW Vanilla")
public class ZoneController {

    private final ZoneService zoneService;

    @GetMapping
    @Operation(summary = "Listar zonas", description = "Devuelve zonas paginadas con filtros opcionales por nombre y continente")
    public ResponseEntity<Page<ZoneResponseDto>> getAll(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String continent,
            @PageableDefault(size = 20, sort = "name") Pageable pageable) {
        return ResponseEntity.ok(zoneService.findAll(name, continent, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener zona por ID")
    public ResponseEntity<ZoneResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(zoneService.findById(id));
    }
}

