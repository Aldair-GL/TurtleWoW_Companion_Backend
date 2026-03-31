package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.QuestRequestDto;
import com.proyecto.wowcompanion.dto.QuestResponseDto;
import com.proyecto.wowcompanion.service.QuestService;
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
@RequestMapping("/api/v1/quests")
@RequiredArgsConstructor
@Tag(name = "Quests", description = "Misiones de WoW Vanilla - CRUD completo")
public class QuestController {

    private final QuestService questService;

    @GetMapping
    @Operation(summary = "Listar quests", description = "Paginacion con filtros por nombre, zona y faccion")
    public ResponseEntity<Page<QuestResponseDto>> getAll(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) Long zoneId,
            @RequestParam(required = false) String faction,
            @PageableDefault(size = 20, sort = "name") Pageable pageable) {
        return ResponseEntity.ok(questService.findAll(name, zoneId, faction, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener quest por ID")
    public ResponseEntity<QuestResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(questService.findById(id));
    }

    @PostMapping
    @Operation(summary = "Crear nueva quest")
    public ResponseEntity<QuestResponseDto> create(@Valid @RequestBody QuestRequestDto dto) {
        QuestResponseDto created = questService.create(dto);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    @PutMapping("/{id}")
    @Operation(summary = "Actualizar quest existente")
    public ResponseEntity<QuestResponseDto> update(
            @PathVariable Long id,
            @Valid @RequestBody QuestRequestDto dto) {
        return ResponseEntity.ok(questService.update(id, dto));
    }

    @DeleteMapping("/{id}")
    @Operation(summary = "Eliminar quest")
    public ResponseEntity<Void> delete(@PathVariable Long id) {
        questService.delete(id);
        return ResponseEntity.noContent().build();
    }
}

