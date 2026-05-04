package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.UserLootProgressDto;
import com.proyecto.wowcompanion.exception.DuplicateResourceException;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.model.UserLootProgress;
import com.proyecto.wowcompanion.repository.UserLootProgressRepository;
import com.proyecto.wowcompanion.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserLootProgressService {

    private final UserLootProgressRepository repo;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<UserLootProgressDto> list(Long userId) {
        ensureUser(userId);
        return repo.findByUserId(userId).stream().map(this::toDto).collect(Collectors.toList());
    }

    @Transactional
    public UserLootProgressDto create(Long userId, UserLootProgressDto request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        String itemName = request.getItemName().trim();
        Long bossId = request.getBossId();

        if (repo.existsByUserIdAndItemNameAndBossId(userId, itemName, bossId)) {
            throw new DuplicateResourceException("Loot already marked as obtained");
        }

        UserLootProgress loot = UserLootProgress.builder()
                .user(user)
                .itemName(itemName)
                .itemQuality(request.getItemQuality())
                .bossId(bossId)
                .bossName(request.getBossName().trim())
                .obtainedAt(LocalDateTime.now())
                .build();

        return toDto(repo.save(loot));
    }

    @Transactional
    public void delete(Long userId, String itemName, Long bossId) {
        ensureUser(userId);
        UserLootProgress loot = repo.findByUserIdAndItemNameAndBossId(userId, itemName, bossId)
                .orElseThrow(() -> new ResourceNotFoundException("Loot entry not found"));
        repo.delete(loot);
    }

    private void ensureUser(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new ResourceNotFoundException("User not found");
        }
    }

    private UserLootProgressDto toDto(UserLootProgress l) {
        return UserLootProgressDto.builder()
                .id(l.getId())
                .itemName(l.getItemName())
                .itemQuality(l.getItemQuality())
                .bossId(l.getBossId())
                .bossName(l.getBossName())
                .obtainedAt(l.getObtainedAt() != null ? l.getObtainedAt().toString() : null)
                .build();
    }
}

