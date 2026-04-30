package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.model.*;
import com.proyecto.wowcompanion.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class CharacterProgressService {

    private final UserCharacterRepository characterRepo;
    private final ProfessionRepository professionRepo;
    private final ReputationRepository reputationRepo;
    private final QuestRepository questRepo;
    private final BossRepository bossRepo;
    private final ZoneRepository zoneRepo;

    private final CharacterProfessionRepository charProfRepo;
    private final CharacterReputationRepository charRepRepo;
    private final CharacterQuestProgressRepository charQuestRepo;
    private final CharacterBossKillRepository charBossRepo;
    private final CharacterRaidProgressRepository charRaidRepo;

    private UserCharacter character(Long id) {
        return characterRepo.findById(id).orElseThrow(() -> new RuntimeException("Character not found"));
    }

    // =========== PROFESIONES ===========
    public List<CharacterProfession> getProfessions(Long characterId) {
        return charProfRepo.findByUserCharacterId(characterId);
    }

    @Transactional
    public CharacterProfession upsertProfession(Long characterId, Long professionId, Short skillLevel, Boolean isPrimary) {
        var existing = charProfRepo.findByUserCharacterIdAndProfessionId(characterId, professionId);
        CharacterProfession cp = existing.orElseGet(() -> CharacterProfession.builder()
                .userCharacter(character(characterId))
                .profession(professionRepo.findById(professionId).orElseThrow())
                .build());
        if (skillLevel != null) cp.setSkillLevel(skillLevel);
        if (isPrimary != null) cp.setIsPrimary(isPrimary);
        cp.setUpdatedAt(LocalDateTime.now());
        return charProfRepo.save(cp);
    }

    @Transactional
    public void deleteProfession(Long characterId, Long professionId) {
        charProfRepo.findByUserCharacterIdAndProfessionId(characterId, professionId)
                .ifPresent(charProfRepo::delete);
    }

    // =========== REPUTACIONES ===========
    public List<CharacterReputation> getReputations(Long characterId) {
        return charRepRepo.findByUserCharacterId(characterId);
    }

    @Transactional
    public CharacterReputation upsertReputation(Long characterId, Long reputationId, String standing, Integer points) {
        var existing = charRepRepo.findByUserCharacterIdAndReputationId(characterId, reputationId);
        CharacterReputation cr = existing.orElseGet(() -> CharacterReputation.builder()
                .userCharacter(character(characterId))
                .reputation(reputationRepo.findById(reputationId).orElseThrow())
                .build());
        if (standing != null) cr.setStanding(standing);
        if (points != null) cr.setPoints(points);
        cr.setUpdatedAt(LocalDateTime.now());
        return charRepRepo.save(cr);
    }

    // =========== QUESTS ===========
    public List<CharacterQuestProgress> getQuests(Long characterId, String status) {
        if (status != null && !status.isBlank()) {
            return charQuestRepo.findByUserCharacterIdAndStatus(characterId, status.toUpperCase());
        }
        return charQuestRepo.findByUserCharacterId(characterId);
    }

    @Transactional
    public CharacterQuestProgress updateQuestStatus(Long characterId, Long questId, String status, String notes) {
        var existing = charQuestRepo.findByUserCharacterIdAndQuestId(characterId, questId);
        CharacterQuestProgress cqp = existing.orElseGet(() -> CharacterQuestProgress.builder()
                .userCharacter(character(characterId))
                .quest(questRepo.findById(questId).orElseThrow())
                .build());
        if (status != null) {
            cqp.setStatus(status.toUpperCase());
            if ("COMPLETED".equalsIgnoreCase(status)) {
                cqp.setCompletedAt(LocalDateTime.now());
            }
        }
        if (notes != null) cqp.setNotes(notes);
        cqp.setUpdatedAt(LocalDateTime.now());
        return charQuestRepo.save(cqp);
    }

    // =========== BOSSES ===========
    public List<CharacterBossKill> getBossKills(Long characterId) {
        return charBossRepo.findByUserCharacterId(characterId);
    }

    @Transactional
    public CharacterBossKill toggleBossKill(Long characterId, Long bossId) {
        var existing = charBossRepo.findByUserCharacterIdAndBossId(characterId, bossId);
        CharacterBossKill kill = existing.orElseGet(() -> CharacterBossKill.builder()
                .userCharacter(character(characterId))
                .boss(bossRepo.findById(bossId).orElseThrow())
                .build());
        boolean newDefeated = !Boolean.TRUE.equals(kill.getDefeated());
        kill.setDefeated(newDefeated);
        if (newDefeated) {
            kill.setDefeatedAt(LocalDateTime.now());
            kill.setTimesDefeated(kill.getTimesDefeated() == null ? 1 : kill.getTimesDefeated() + 1);
        }
        kill.setUpdatedAt(LocalDateTime.now());
        return charBossRepo.save(kill);
    }

    // =========== RAIDS ===========
    public List<CharacterRaidProgress> getRaidProgress(Long characterId) {
        return charRaidRepo.findByUserCharacterId(characterId);
    }

    @Transactional
    public CharacterRaidProgress toggleRaid(Long characterId, Long zoneId) {
        var existing = charRaidRepo.findByUserCharacterIdAndZoneId(characterId, zoneId);
        CharacterRaidProgress rp = existing.orElseGet(() -> CharacterRaidProgress.builder()
                .userCharacter(character(characterId))
                .zone(zoneRepo.findById(zoneId).orElseThrow())
                .build());
        boolean newCompleted = !Boolean.TRUE.equals(rp.getCompleted());
        rp.setCompleted(newCompleted);
        if (newCompleted) {
            rp.setCompletedAt(LocalDateTime.now());
            rp.setTimesCompleted(rp.getTimesCompleted() == null ? 1 : rp.getTimesCompleted() + 1);
        }
        rp.setUpdatedAt(LocalDateTime.now());
        return charRaidRepo.save(rp);
    }
}

