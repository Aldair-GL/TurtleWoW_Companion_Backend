package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.NpcAppDto;
import com.proyecto.wowcompanion.service.AppService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Endpoints simplificados de NPCs para clientes moviles.
 */
@RestController
@RequestMapping("/api/npcs")
@RequiredArgsConstructor
@Tag(name = "NPCs", description = "Personajes no jugadores (formato simplificado)")
public class AppNpcController {

    private final AppService appService;

    @GetMapping
    @Operation(summary = "Listar todos los NPCs")
    public ResponseEntity<List<NpcAppDto>> getAll() {
        return ResponseEntity.ok(appService.findAllNpcs());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Detalle de un NPC por ID")
    public ResponseEntity<NpcAppDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(appService.findNpcById(id));
    }
}

