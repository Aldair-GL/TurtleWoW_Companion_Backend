package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.UserLootDeleteRequestDto;
import com.proyecto.wowcompanion.dto.UserLootProgressDto;
import com.proyecto.wowcompanion.service.UserLootProgressService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users/{userId}/loot")
@RequiredArgsConstructor
@Tag(name = "User Loot Progress", description = "Botín conseguido por el usuario")
public class UserLootProgressController {

    private final UserLootProgressService service;

    @GetMapping
    @Operation(summary = "Lista de loot conseguido")
    public ResponseEntity<List<UserLootProgressDto>> list(@PathVariable Long userId) {
        return ResponseEntity.ok(service.list(userId));
    }

    @PostMapping
    @Operation(summary = "Marcar un item como obtenido")
    public ResponseEntity<UserLootProgressDto> create(
            @PathVariable Long userId,
            @Valid @RequestBody UserLootProgressDto request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(userId, request));
    }

    @DeleteMapping
    @Operation(summary = "Desmarcar un item por (itemName, bossId)")
    public ResponseEntity<Void> delete(
            @PathVariable Long userId,
            @Valid @RequestBody UserLootDeleteRequestDto request) {
        service.delete(userId, request.getItemName(), request.getBossId());
        return ResponseEntity.noContent().build();
    }
}

