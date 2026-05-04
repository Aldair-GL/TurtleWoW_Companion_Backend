package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.UserCharacterDto;
import com.proyecto.wowcompanion.dto.UserCharacterRequestDto;
import com.proyecto.wowcompanion.service.UserCharacterService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users/{userId}/characters")
@RequiredArgsConstructor
@Tag(name = "User Characters", description = "Personajes del usuario (max 6)")
public class UserCharacterController {

    private final UserCharacterService userCharacterService;

    @GetMapping
    @Operation(summary = "Lista de personajes del usuario")
    public ResponseEntity<List<UserCharacterDto>> getUserCharacters(@PathVariable Long userId) {
        return ResponseEntity.ok(userCharacterService.getUserCharacters(userId));
    }

    @GetMapping("/{characterId}")
    @Operation(summary = "Detalle de un personaje")
    public ResponseEntity<UserCharacterDto> getCharacter(
            @PathVariable Long userId,
            @PathVariable Long characterId) {
        return ResponseEntity.ok(userCharacterService.getCharacter(userId, characterId));
    }

    @PostMapping
    @Operation(summary = "Crear un personaje (max 6 por usuario)")
    public ResponseEntity<UserCharacterDto> createCharacter(
            @PathVariable Long userId,
            @Valid @RequestBody UserCharacterRequestDto request) {
        UserCharacterDto created = userCharacterService.createCharacter(userId, request);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    @DeleteMapping("/{characterId}")
    @Operation(summary = "Eliminar un personaje")
    public ResponseEntity<Void> deleteCharacter(
            @PathVariable Long userId,
            @PathVariable Long characterId) {
        userCharacterService.deleteCharacter(userId, characterId);
        return ResponseEntity.noContent().build();
    }
}
