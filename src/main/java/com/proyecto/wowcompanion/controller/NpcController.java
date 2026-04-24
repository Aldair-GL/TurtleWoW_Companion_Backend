package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.NpcRequestDto;
import com.proyecto.wowcompanion.dto.NpcResponseDto;
import com.proyecto.wowcompanion.service.NpcService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/npcs")
@RequiredArgsConstructor
@Tag(name = "NPCs", description = "Personajes no jugadores de WoW Vanilla - CRUD completo")
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

    @PostMapping
    @Operation(summary = "Crear nuevo NPC")
    public ResponseEntity<NpcResponseDto> create(@Valid @RequestBody NpcRequestDto dto) {
        NpcResponseDto created = npcService.create(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Actualizar NPC existente")
    public ResponseEntity<NpcResponseDto> update(
            @PathVariable Long id,
            @Valid @RequestBody NpcRequestDto dto) {
        return ResponseEntity.ok(npcService.update(id, dto));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Eliminar NPC")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        npcService.delete(id);
        return ResponseEntity.noContent().build();
    }
}
