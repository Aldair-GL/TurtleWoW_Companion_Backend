package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.ProgressUpdateDto;
import com.proyecto.wowcompanion.service.CharacterProgressService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("/api/v1/characters/{characterId}")
@RequiredArgsConstructor
@Tag(name = "Character Progress", description = "Progreso del personaje: profesiones, reputaciones, quests, bosses, raids")
public class CharacterProgressController {

    private final CharacterProgressService service;

    // ====== PROFESIONES ======
    @GetMapping("/professions")
    @Operation(summary = "Profesiones del personaje")
    public ResponseEntity<List<Map<String, Object>>> getProfessions(@PathVariable Long characterId) {
        var list = service.getProfessions(characterId).stream().map(cp -> Map.<String,Object>of(
                "id", cp.getId(),
                "professionId", cp.getProfession().getId(),
                "professionName", cp.getProfession().getName(),
                "skillLevel", cp.getSkillLevel(),
                "isPrimary", cp.getIsPrimary()
        )).collect(Collectors.toList());
        return ResponseEntity.ok(list);
    }

    @PutMapping("/professions/{professionId}")
    @Operation(summary = "Aprender o actualizar skill de profesión")
    public ResponseEntity<?> upsertProfession(@PathVariable Long characterId,
                                              @PathVariable Long professionId,
                                              @RequestBody ProgressUpdateDto body) {
        var cp = service.upsertProfession(characterId, professionId, body.getSkillLevel(), body.getIsPrimary());
        return ResponseEntity.ok(Map.of("id", cp.getId(), "skillLevel", cp.getSkillLevel(), "isPrimary", cp.getIsPrimary()));
    }

    @DeleteMapping("/professions/{professionId}")
    @Operation(summary = "Olvidar profesión")
    public ResponseEntity<Void> deleteProfession(@PathVariable Long characterId, @PathVariable Long professionId) {
        service.deleteProfession(characterId, professionId);
        return ResponseEntity.noContent().build();
    }

    // ====== REPUTACIONES ======
    @GetMapping("/reputations")
    @Operation(summary = "Reputaciones del personaje")
    public ResponseEntity<List<Map<String, Object>>> getReputations(@PathVariable Long characterId) {
        var list = service.getReputations(characterId).stream().map(cr -> Map.<String,Object>of(
                "id", cr.getId(),
                "reputationId", cr.getReputation().getId(),
                "reputationName", cr.getReputation().getName(),
                "standing", cr.getStanding(),
                "points", cr.getPoints()
        )).collect(Collectors.toList());
        return ResponseEntity.ok(list);
    }

    @PutMapping("/reputations/{reputationId}")
    @Operation(summary = "Actualizar standing/points de reputación")
    public ResponseEntity<?> upsertReputation(@PathVariable Long characterId,
                                              @PathVariable Long reputationId,
                                              @RequestBody ProgressUpdateDto body) {
        var cr = service.upsertReputation(characterId, reputationId, body.getStanding(), body.getPoints());
        return ResponseEntity.ok(Map.of("id", cr.getId(), "standing", cr.getStanding(), "points", cr.getPoints()));
    }

    // ====== QUESTS ======
    @GetMapping("/quests")
    @Operation(summary = "Progreso de quests del personaje (filtrable por status)")
    public ResponseEntity<List<Map<String, Object>>> getQuests(@PathVariable Long characterId,
                                                                @RequestParam(required = false) String status) {
        var list = service.getQuests(characterId, status).stream().map(q -> {
            java.util.Map<String, Object> m = new java.util.HashMap<>();
            m.put("id", q.getId());
            m.put("questId", q.getQuest().getId());
            m.put("questName", q.getQuest().getName());
            m.put("status", q.getStatus());
            m.put("completedAt", q.getCompletedAt() != null ? q.getCompletedAt().toString() : null);
            return m;
        }).collect(Collectors.toList());
        return ResponseEntity.ok(list);
    }

    @PutMapping("/quests/{questId}")
    @Operation(summary = "Actualizar status de una quest")
    public ResponseEntity<?> updateQuest(@PathVariable Long characterId,
                                          @PathVariable Long questId,
                                          @RequestBody ProgressUpdateDto body) {
        var cqp = service.updateQuestStatus(characterId, questId, body.getStatus(), body.getNotes());
        return ResponseEntity.ok(Map.of("id", cqp.getId(), "status", cqp.getStatus()));
    }

    // ====== BOSSES ======
    @GetMapping("/bosses")
    @Operation(summary = "Bosses derrotados por el personaje")
    public ResponseEntity<List<Map<String, Object>>> getBosses(@PathVariable Long characterId) {
        var list = service.getBossKills(characterId).stream().map(b -> Map.<String,Object>of(
                "id", b.getId(),
                "bossId", b.getBoss().getId(),
                "bossName", b.getBoss().getName(),
                "defeated", b.getDefeated(),
                "timesDefeated", b.getTimesDefeated()
        )).collect(Collectors.toList());
        return ResponseEntity.ok(list);
    }

    @PostMapping("/bosses/{bossId}/toggle")
    @Operation(summary = "Marcar/desmarcar boss derrotado")
    public ResponseEntity<?> toggleBoss(@PathVariable Long characterId, @PathVariable Long bossId) {
        var k = service.toggleBossKill(characterId, bossId);
        return ResponseEntity.ok(Map.of("defeated", k.getDefeated(), "timesDefeated", k.getTimesDefeated()));
    }

    // ====== RAIDS ======
    @GetMapping("/raids")
    @Operation(summary = "Progreso de raids del personaje")
    public ResponseEntity<List<Map<String, Object>>> getRaids(@PathVariable Long characterId) {
        var list = service.getRaidProgress(characterId).stream().map(r -> Map.<String,Object>of(
                "id", r.getId(),
                "zoneId", r.getZone().getId(),
                "zoneName", r.getZone().getName(),
                "completed", r.getCompleted(),
                "timesCompleted", r.getTimesCompleted()
        )).collect(Collectors.toList());
        return ResponseEntity.ok(list);
    }

    @PostMapping("/raids/{zoneId}/toggle")
    @Operation(summary = "Marcar/desmarcar raid completada")
    public ResponseEntity<?> toggleRaid(@PathVariable Long characterId, @PathVariable Long zoneId) {
        var r = service.toggleRaid(characterId, zoneId);
        return ResponseEntity.ok(Map.of("completed", r.getCompleted(), "timesCompleted", r.getTimesCompleted()));
    }
}


