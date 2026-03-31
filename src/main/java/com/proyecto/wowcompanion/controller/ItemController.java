package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.ItemResponseDto;
import com.proyecto.wowcompanion.service.ItemService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/v1/items")
@RequiredArgsConstructor
@Tag(name = "Items", description = "Objetos del juego WoW Vanilla")
public class ItemController {

    private final ItemService itemService;

    @GetMapping
    @Operation(summary = "Listar items", description = "Paginacion con filtros por nombre y calidad")
    public ResponseEntity<Page<ItemResponseDto>> getAll(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String quality,
            @PageableDefault(size = 20, sort = "name") Pageable pageable) {
        return ResponseEntity.ok(itemService.findAll(name, quality, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Obtener item por ID")
    public ResponseEntity<ItemResponseDto> getById(@PathVariable Long id) {
        return ResponseEntity.ok(itemService.findById(id));
    }
}

