package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.FavoriteDto;
import com.proyecto.wowcompanion.dto.FavoriteRequestDto;
import com.proyecto.wowcompanion.service.FavoriteService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users/{userId}/favorites")
@RequiredArgsConstructor
@Tag(name = "Favorites", description = "Gestión de favoritos del usuario")
public class FavoriteController {

    private final FavoriteService favoriteService;

    @GetMapping
    @Operation(summary = "Obtener todos los favoritos de un usuario")
    public ResponseEntity<List<FavoriteDto>> getUserFavorites(@PathVariable Long userId) {
        return ResponseEntity.ok(favoriteService.getUserFavorites(userId));
    }

    @GetMapping(params = "entityType")
    @Operation(summary = "Obtener favoritos de un usuario filtrados por tipo de entidad")
    public ResponseEntity<List<FavoriteDto>> getUserFavoritesByType(
            @PathVariable Long userId,
            @RequestParam String entityType) {
        return ResponseEntity.ok(favoriteService.getUserFavoritesByType(userId, entityType));
    }

    @PostMapping
    @Operation(summary = "Añadir un favorito")
    public ResponseEntity<FavoriteDto> addFavorite(
            @PathVariable Long userId,
            @RequestBody FavoriteRequestDto request) {
        return ResponseEntity.ok(favoriteService.addFavorite(userId, request));
    }

    @DeleteMapping("/{entityType}/{entityId}")
    @Operation(summary = "Eliminar un favorito")
    public ResponseEntity<Void> removeFavorite(
            @PathVariable Long userId,
            @PathVariable String entityType,
            @PathVariable Long entityId) {
        favoriteService.removeFavorite(userId, entityType, entityId);
        return ResponseEntity.noContent().build();
    }
}

