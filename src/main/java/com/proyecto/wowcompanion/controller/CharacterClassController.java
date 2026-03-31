package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.CharacterClassResponseDto;
import com.proyecto.wowcompanion.service.CharacterClassService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/classes")
@RequiredArgsConstructor
@Tag(name = "Classes", description = "Clases de personaje de WoW Vanilla")
public class CharacterClassController {

    private final CharacterClassService classService;

    @GetMapping
    @Operation(summary = "Listar clases de personaje")
    public ResponseEntity<List<CharacterClassResponseDto>> getAll(
            @RequestParam(required = false) String name) {
        if (name != null) {
            return ResponseEntity.ok(classService.searchByName(name));
        }
        return ResponseEntity.ok(classService.findAll());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener clase por ID")
    public ResponseEntity<CharacterClassResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(classService.findById(id));
    }
}

