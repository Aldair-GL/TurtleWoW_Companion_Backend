package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.UserBossKillDto;
import com.proyecto.wowcompanion.service.UserBossKillService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/users/{userId}/boss-kills")
@RequiredArgsConstructor
@Tag(name = "User Boss Kills", description = "Jefes derrotados por el usuario")
public class UserBossKillController {

    private final UserBossKillService service;

    @GetMapping
    @Operation(summary = "Lista de jefes derrotados")
    public ResponseEntity<List<UserBossKillDto>> list(@PathVariable Long userId) {
        return ResponseEntity.ok(service.list(userId));
    }

    @PostMapping
    @Operation(summary = "Marcar un jefe como derrotado")
    public ResponseEntity<UserBossKillDto> create(
            @PathVariable Long userId,
            @Valid @RequestBody UserBossKillDto request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.create(userId, request));
    }

    @DeleteMapping("/{bossId}")
    @Operation(summary = "Desmarcar un jefe")
    public ResponseEntity<Void> delete(
            @PathVariable Long userId,
            @PathVariable Long bossId) {
        service.delete(userId, bossId);
        return ResponseEntity.noContent().build();
    }
}

