package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.DungeonProgressDto;
import com.proyecto.wowcompanion.dto.UserCharacterDto;
import com.proyecto.wowcompanion.dto.UserCharacterRequestDto;
import com.proyecto.wowcompanion.service.UserCharacterService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users/{userId}/characters")
@RequiredArgsConstructor
@Tag(name = "User Characters", description = "Gestión de personajes del usuario y progreso de mazmorras")
public class UserCharacterController {

    private final UserCharacterService userCharacterService;

    @GetMapping
    @Operation(summary = "Obtener todos los personajes de un usuario")
    public ResponseEntity<List<UserCharacterDto>> getUserCharacters(@PathVariable Long userId) {
        return ResponseEntity.ok(userCharacterService.getUserCharacters(userId));
    }

    @GetMapping("/{characterId}")
    @Operation(summary = "Obtener un personaje por ID")
    public ResponseEntity<UserCharacterDto> getCharacter(
            @PathVariable Long userId,
            @PathVariable Long characterId) {
        return ResponseEntity.ok(userCharacterService.getCharacter(characterId));
    }

    @PostMapping
    @Operation(summary = "Crear un nuevo personaje")
    public ResponseEntity<UserCharacterDto> createCharacter(
            @PathVariable Long userId,
            @RequestBody UserCharacterRequestDto request) {
        return ResponseEntity.ok(userCharacterService.createCharacter(userId, request));
    }

    @DeleteMapping("/{characterId}")
    @Operation(summary = "Eliminar un personaje")
    public ResponseEntity<Void> deleteCharacter(
            @PathVariable Long userId,
            @PathVariable Long characterId) {
        userCharacterService.deleteCharacter(characterId);
        return ResponseEntity.noContent().build();
    }

    @PostMapping("/{characterId}/dungeons/{zoneId}/toggle")
    @Operation(summary = "Marcar/desmarcar una mazmorra como completada")
    public ResponseEntity<DungeonProgressDto> toggleDungeonProgress(
            @PathVariable Long userId,
            @PathVariable Long characterId,
            @PathVariable Long zoneId) {
        return ResponseEntity.ok(userCharacterService.toggleDungeonProgress(characterId, zoneId));
    }
}

