package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.BossResponseDto;
import com.proyecto.wowcompanion.service.BossService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@Tag(name = "Bosses", description = "Jefes de mazmorra de WoW Vanilla")
public class BossController {

    private final BossService bossService;

    @GetMapping("/api/v1/zones/{zoneId}/bosses")
    @Operation(summary = "Listar jefes de una mazmorra")
    public ResponseEntity<List<BossResponseDto>> getByZone(@PathVariable Long zoneId) {
        return ResponseEntity.ok(bossService.findByZone(zoneId));
    }

    @GetMapping("/api/v1/bosses/{id}")
    @Operation(summary = "Obtener jefe por ID")
    public ResponseEntity<BossResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(bossService.findById(id));
    }
}

