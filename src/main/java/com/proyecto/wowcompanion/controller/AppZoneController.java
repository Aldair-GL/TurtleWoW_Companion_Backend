package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.ZoneAppDto;
import com.proyecto.wowcompanion.service.AppService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Endpoints simplificados de zonas para clientes moviles.
 */
@RestController
@RequestMapping("/api/zones")
@RequiredArgsConstructor
@Tag(name = "Zones", description = "Zonas del mundo (formato simplificado)")
public class AppZoneController {

    private final AppService appService;

    @GetMapping
    @Operation(summary = "Listar todas las zonas")
    public ResponseEntity<List<ZoneAppDto>> getAll() {
        return ResponseEntity.ok(appService.findAllZones());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Detalle de una zona por ID")
    public ResponseEntity<ZoneAppDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(appService.findZoneById(id));
    }
}

