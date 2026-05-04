package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.UserDungeonProgressDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.model.UserDungeonProgress;
import com.proyecto.wowcompanion.repository.UserDungeonProgressRepository;
import com.proyecto.wowcompanion.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class UserDungeonProgressService {

    private final UserDungeonProgressRepository repo;
    private final UserRepository userRepository;

    @Transactional(readOnly = true)
    public List<UserDungeonProgressDto> list(Long userId) {
        ensureUser(userId);
        return repo.findByUserId(userId).stream().map(this::toDto).collect(Collectors.toList());
    }

    @Transactional
    public UserDungeonProgressDto upsert(Long userId, Long zoneId, UserDungeonProgressDto request) {
        User user = userRepository.findById(userId)
                .orElseThrow(() -> new ResourceNotFoundException("User not found"));

        UserDungeonProgress progress = repo.findByUserIdAndZoneId(userId, zoneId)
                .orElseGet(() -> UserDungeonProgress.builder()
                        .user(user)
                        .zoneId(zoneId)
                        .build());

        if (request.getZoneName() != null && !request.getZoneName().isBlank()) {
            progress.setZoneName(request.getZoneName().trim());
        } else if (progress.getZoneName() == null) {
            progress.setZoneName("Zone " + zoneId);
        }

        boolean completed = request.getCompleted() != null && request.getCompleted();
        progress.setCompleted(completed);
        progress.setCompletedAt(completed ? LocalDateTime.now() : null);

        return toDto(repo.save(progress));
    }

    private void ensureUser(Long userId) {
        if (!userRepository.existsById(userId)) {
            throw new ResourceNotFoundException("User not found");
        }
    }

    private UserDungeonProgressDto toDto(UserDungeonProgress p) {
        return UserDungeonProgressDto.builder()
                .id(p.getId())
                .zoneId(p.getZoneId())
                .zoneName(p.getZoneName())
                .completed(p.getCompleted())
                .completedAt(p.getCompletedAt() != null ? p.getCompletedAt().toString() : null)
                .build();
    }
}

