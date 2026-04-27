package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.DungeonProgressDto;
import com.proyecto.wowcompanion.dto.UserCharacterDto;
import com.proyecto.wowcompanion.dto.UserCharacterRequestDto;
import com.proyecto.wowcompanion.model.CharacterClass;
import com.proyecto.wowcompanion.model.CharacterDungeonProgress;
import com.proyecto.wowcompanion.model.Race;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.model.UserCharacter;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.repository.*;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserCharacterService {

    private final UserCharacterRepository userCharacterRepository;
    private final CharacterDungeonProgressRepository progressRepository;
    private final UserRepository userRepository;
    private final RaceRepository raceRepository;
    private final CharacterClassRepository characterClassRepository;
    private final ZoneRepository zoneRepository;

    public List<UserCharacterDto> getUserCharacters(Long userId) {
        return userCharacterRepository.findByUserId(userId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public UserCharacterDto getCharacter(Long characterId) {
        UserCharacter uc = userCharacterRepository.findById(characterId)
                .orElseThrow(() -> new RuntimeException("Character not found"));
        return toDto(uc);
    }

    @Transactional
    public UserCharacterDto createCharacter(Long userId, UserCharacterRequestDto request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));
        Race race = raceRepository.findById(request.getRaceId())
                .orElseThrow(() -> new RuntimeException("Race not found"));
        CharacterClass clazz = characterClassRepository.findById(request.getClassId())
                .orElseThrow(() -> new RuntimeException("Class not found"));

        UserCharacter uc = UserCharacter.builder()
                .name(request.getName())
                .user(user)
                .race(race)
                .characterClass(clazz)
                .build();

        return toDto(userCharacterRepository.save(uc));
    }

    @Transactional
    public void deleteCharacter(Long characterId) {
        userCharacterRepository.deleteById(characterId);
    }

    @Transactional
    public DungeonProgressDto toggleDungeonProgress(Long characterId, Long zoneId) {
        var existing = progressRepository.findByUserCharacterIdAndZoneId(characterId, zoneId);

        if (existing.isPresent()) {
            CharacterDungeonProgress progress = existing.get();
            progress.setCompleted(!progress.getCompleted());
            progress.setCompletedAt(progress.getCompleted() ? LocalDateTime.now() : null);
            return toProgressDto(progressRepository.save(progress));
        } else {
            UserCharacter uc = userCharacterRepository.findById(characterId)
                    .orElseThrow(() -> new RuntimeException("Character not found"));
            Zone zone = zoneRepository.findById(zoneId)
                    .orElseThrow(() -> new RuntimeException("Zone not found"));

            CharacterDungeonProgress progress = CharacterDungeonProgress.builder()
                    .userCharacter(uc)
                    .zone(zone)
                    .completed(true)
                    .completedAt(LocalDateTime.now())
                    .build();
            return toProgressDto(progressRepository.save(progress));
        }
    }

    private UserCharacterDto toDto(UserCharacter uc) {
        List<DungeonProgressDto> progress = uc.getDungeonProgress() != null
                ? uc.getDungeonProgress().stream().map(this::toProgressDto).collect(Collectors.toList())
                : List.of();

        return UserCharacterDto.builder()
                .id(uc.getId())
                .name(uc.getName())
                .level(uc.getLevel())
                .raceName(uc.getRace().getName())
                .className(uc.getCharacterClass().getName())
                .factionName(uc.getRace().getFaction().getName())
                .createdAt(uc.getCreatedAt() != null ? uc.getCreatedAt().toString() : null)
                .dungeonProgress(progress)
                .build();
    }

    private DungeonProgressDto toProgressDto(CharacterDungeonProgress p) {
        return DungeonProgressDto.builder()
                .id(p.getId())
                .zoneId(p.getZone().getId())
                .zoneName(p.getZone().getName())
                .completed(p.getCompleted())
                .completedAt(p.getCompletedAt() != null ? p.getCompletedAt().toString() : null)
                .build();
    }
}

