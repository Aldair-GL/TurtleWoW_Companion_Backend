package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.NpcResponseDto;
import com.proyecto.wowcompanion.service.NpcService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/npcs")
@RequiredArgsConstructor
@Tag(name = "NPCs", description = "Personajes no jugadores de WoW Vanilla")
public class NpcController {

    private final NpcService npcService;

    @GetMapping
    @Operation(summary = "Listar NPCs", description = "Paginacion con filtros por nombre y zona")
    public ResponseEntity<Page<NpcResponseDto>> getAll(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Long zoneId,
            @PageableDefault(size = 20, sort = "name") Pageable pageable) {
        return ResponseEntity.ok(npcService.findAll(name, zoneId, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener NPC por ID")
    public ResponseEntity<NpcResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(npcService.findById(id));
    }
}

