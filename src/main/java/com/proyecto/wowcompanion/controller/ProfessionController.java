package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.ProfessionResponseDto;
import com.proyecto.wowcompanion.service.ProfessionService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/professions")
@RequiredArgsConstructor
@Tag(name = "Professions", description = "Profesiones de WoW Vanilla")
public class ProfessionController {

    private final ProfessionService professionService;

    @GetMapping
    @Operation(summary = "Listar profesiones")
    public ResponseEntity<List<ProfessionResponseDto>> getAll(
            @RequestParam(required = false) String name) {
        if (name != null) {
            return ResponseEntity.ok(professionService.searchByName(name));
        }
        return ResponseEntity.ok(professionService.findAll());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener profesion por ID")
    public ResponseEntity<ProfessionResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(professionService.findById(id));
    }
}

