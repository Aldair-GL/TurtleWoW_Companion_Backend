package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.UserDungeonProgressDto;
import com.proyecto.wowcompanion.service.UserDungeonProgressService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users/{userId}/dungeon-progress")
@RequiredArgsConstructor
@Tag(name = "User Dungeon Progress", description = "Mazmorras completadas por el usuario")
public class UserDungeonProgressController {

    private final UserDungeonProgressService service;

    @GetMapping
    @Operation(summary = "Lista de mazmorras completadas")
    public ResponseEntity<List<UserDungeonProgressDto>> list(@PathVariable Long userId) {
        return ResponseEntity.ok(service.list(userId));
    }

    @PutMapping("/{zoneId}")
    @Operation(summary = "Marcar/actualizar el estado de completado de una mazmorra (idempotente)")
    public ResponseEntity<UserDungeonProgressDto> upsert(
            @PathVariable Long userId,
            @PathVariable Long zoneId,
            @Valid @RequestBody UserDungeonProgressDto request) {
        return ResponseEntity.ok(service.upsert(userId, zoneId, request));
    }
}

