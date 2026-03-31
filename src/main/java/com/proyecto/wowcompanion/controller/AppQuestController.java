package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.QuestAppDto;
import com.proyecto.wowcompanion.service.AppService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Endpoints simplificados de quests para clientes moviles.
 */
@RestController
@RequestMapping("/api/quests")
@RequiredArgsConstructor
@Tag(name = "Quests", description = "Misiones del mundo (formato simplificado)")
public class AppQuestController {

    private final AppService appService;

    @GetMapping
    @Operation(summary = "Listar todas las quests")
    public ResponseEntity<List<QuestAppDto>> getAll() {
        return ResponseEntity.ok(appService.findAllQuests());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Detalle de una quest por ID")
    public ResponseEntity<QuestAppDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(appService.findQuestById(id));
    }
}

