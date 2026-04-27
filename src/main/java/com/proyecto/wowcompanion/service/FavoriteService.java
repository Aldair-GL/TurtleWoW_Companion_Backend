package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.FavoriteDto;
import com.proyecto.wowcompanion.dto.FavoriteRequestDto;
import com.proyecto.wowcompanion.model.Favorite;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.repository.FavoriteRepository;
import com.proyecto.wowcompanion.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class FavoriteService {

    private final FavoriteRepository favoriteRepository;
    private final UserRepository userRepository;

    public List<FavoriteDto> getUserFavorites(Long userId) {
        return favoriteRepository.findByUserId(userId).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    public List<FavoriteDto> getUserFavoritesByType(Long userId, String entityType) {
        return favoriteRepository.findByUserIdAndEntityType(userId, entityType.toUpperCase()).stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    @Transactional
    public FavoriteDto addFavorite(Long userId, FavoriteRequestDto request) {
        // Check if already exists
        var existing = favoriteRepository.findByUserIdAndEntityTypeAndEntityId(
                userId, request.getEntityType().toUpperCase(), request.getEntityId());
        if (existing.isPresent()) {
            return toDto(existing.get());
        }

        User user = userRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        Favorite favorite = Favorite.builder()
                .user(user)
                .entityType(request.getEntityType().toUpperCase())
                .entityId(request.getEntityId())
                .build();

        return toDto(favoriteRepository.save(favorite));
    }

    @Transactional
    public void removeFavorite(Long userId, String entityType, Long entityId) {
        favoriteRepository.deleteByUserIdAndEntityTypeAndEntityId(userId, entityType.toUpperCase(), entityId);
    }

    private FavoriteDto toDto(Favorite f) {
        return FavoriteDto.builder()
                .id(f.getId())
                .entityType(f.getEntityType())
                .entityId(f.getEntityId())
                .createdAt(f.getCreatedAt() != null ? f.getCreatedAt().toString() : null)
                .build();
    }
}

