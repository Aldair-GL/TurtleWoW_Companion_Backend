package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.UserBossKillDto;
import com.proyecto.wowcompanion.exception.DuplicateResourceException;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.model.UserBossKill;
import com.proyecto.wowcompanion.repository.UserBossKillRepository;
import com.proyecto.wowcompanion.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserBossKillService {

    private final UserBossKillRepository repo;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<UserBossKillDto> list(Long userId) {
        ensureUser(userId);
        return repo.findByUserId(userId).stream().map(this::toDto).collect(Collectors.toList());
    }

    @Transactional
    public UserBossKillDto create(Long userId, UserBossKillDto request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        if (repo.existsByUserIdAndBossId(userId, request.getBossId())) {
            throw new DuplicateResourceException("Boss already marked as killed");
        }

        UserBossKill kill = UserBossKill.builder()
                .user(user)
                .bossId(request.getBossId())
                .bossName(request.getBossName().trim())
                .zoneName(request.getZoneName().trim())
                .killedAt(LocalDateTime.now())
                .build();

        return toDto(repo.save(kill));
    }

    @Transactional
    public void delete(Long userId, Long bossId) {
        ensureUser(userId);
        UserBossKill kill = repo.findByUserIdAndBossId(userId, bossId)
                .orElseThrow(() -> new ResourceNotFoundException("Boss kill not found"));
        repo.delete(kill);
    }

    private void ensureUser(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new ResourceNotFoundException("User not found");
        }
    }

    private UserBossKillDto toDto(UserBossKill k) {
        return UserBossKillDto.builder()
                .id(k.getId())
                .bossId(k.getBossId())
                .bossName(k.getBossName())
                .zoneName(k.getZoneName())
                .killedAt(k.getKilledAt() != null ? k.getKilledAt().toString() : null)
                .build();
    }
}

