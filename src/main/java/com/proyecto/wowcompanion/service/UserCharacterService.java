package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.UserCharacterDto;
import com.proyecto.wowcompanion.dto.UserCharacterRequestDto;
import com.proyecto.wowcompanion.exception.DuplicateResourceException;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.model.UserCharacter;
import com.proyecto.wowcompanion.repository.UserCharacterRepository;
import com.proyecto.wowcompanion.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserCharacterService {

    public static final int MAX_CHARACTERS_PER_USER = 6;

    private final UserCharacterRepository userCharacterRepository;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<UserCharacterDto> getUserCharacters(Long userId) {
        ensureUserExists(userId);
        return userCharacterRepository.findByUserId(userId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public UserCharacterDto getCharacter(Long userId, Long characterId) {
        UserCharacter uc = userCharacterRepository.findByIdAndUserId(characterId, userId)
                .orElseThrow(() -> new ResourceNotFoundException("Character not found"));
        return toDto(uc);
    }

    @Transactional
    public UserCharacterDto createCharacter(Long userId, UserCharacterRequestDto request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (userCharacterRepository.countByUserId(userId) >= MAX_CHARACTERS_PER_USER) {
            throw new DuplicateResourceException(
                    "User already has " + MAX_CHARACTERS_PER_USER + " characters");
        }

        UserCharacter uc = UserCharacter.builder()
                .name(request.getName().trim())
                .raceName(request.getRaceName().trim())
                .className(request.getClassName().trim())
                .level(request.getLevel())
                .user(user)
                .race(null)
                .characterClass(null)
                .mainCharacter(false)
                .createdAt(java.time.LocalDateTime.now())
                .updatedAt(java.time.LocalDateTime.now())
                .build();

        return toDto(userCharacterRepository.save(uc));
    }

    @Transactional
    public void deleteCharacter(Long userId, Long characterId) {
        UserCharacter uc = userCharacterRepository.findByIdAndUserId(characterId, userId)
                .orElseThrow(() -> new ResourceNotFoundException("Character not found"));
        userCharacterRepository.delete(uc);
    }

    private void ensureUserExists(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new ResourceNotFoundException("User not found");
        }
    }

    private UserCharacterDto toDto(UserCharacter uc) {
        String raceName = uc.getRaceName();
        if (raceName == null && uc.getRace() != null) {
            raceName = uc.getRace().getName();
        }
        String className = uc.getClassName();
        if (className == null && uc.getCharacterClass() != null) {
            className = uc.getCharacterClass().getName();
        }

        return UserCharacterDto.builder()
                .id(uc.getId())
                .name(uc.getName())
                .raceName(raceName)
                .className(className)
                .level(uc.getLevel())
                .createdAt(uc.getCreatedAt() != null ? uc.getCreatedAt().toString() : null)
                .build();
    }
}

