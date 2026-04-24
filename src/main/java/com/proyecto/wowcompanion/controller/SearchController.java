package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.SearchResultDto;
import com.proyecto.wowcompanion.service.SearchService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * Endpoint de busqueda global en zonas, quests y NPCs.
 */
@RestController
@RequestMapping("/api/v1/search")
@RequiredArgsConstructor
@Tag(name = "Search", description = "Busqueda global")
public class SearchController {

    private final SearchService searchService;

    @GetMapping
    @Operation(summary = "Búsqueda global en zonas, quests y NPCs")
    public ResponseEntity<List<SearchResultDto>> search(@RequestParam("q") String query) {
        return ResponseEntity.ok(searchService.search(query));
    }
}

