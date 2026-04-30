package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.AuthRequestDto;
import com.proyecto.wowcompanion.dto.UserDto;
import com.proyecto.wowcompanion.exception.DuplicateResourceException;
import com.proyecto.wowcompanion.exception.InvalidCredentialsException;
import com.proyecto.wowcompanion.model.User;
import com.proyecto.wowcompanion.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepository;

    @Transactional
    public UserDto register(AuthRequestDto request) {
        if (request.getUsername() == null || request.getUsername().isBlank()) {
            throw new IllegalArgumentException("Username is required");
        }
        if (request.getPassword() == null || request.getPassword().isBlank()) {
            throw new IllegalArgumentException("Password is required");
        }
        String username = request.getUsername().trim();
        if (userRepository.existsByUsername(username)) {
            throw new DuplicateResourceException("Username already exists");
        }

        User user = User.builder()
                .username(username)
                .passwordHash(hashPassword(request.getPassword()))
                .build();

        user = userRepository.save(user);
        return toDto(user);
    }

    @Transactional(readOnly = true)
    public UserDto login(AuthRequestDto request) {
        if (request.getUsername() == null || request.getPassword() == null
                || request.getUsername().isBlank() || request.getPassword().isBlank()) {
            throw new IllegalArgumentException("Username and password are required");
        }

        User user = userRepository.findByUsername(request.getUsername().trim())
                .orElseThrow(() -> new InvalidCredentialsException("Invalid username or password"));

        if (!user.getPasswordHash().equals(hashPassword(request.getPassword()))) {
            throw new InvalidCredentialsException("Invalid username or password");
        }

        return toDto(user);
    }

    private UserDto toDto(User user) {
        return UserDto.builder()
                .id(user.getId())
                .username(user.getUsername())
                .build();
    }

    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            return HexFormat.of().formatHex(hash);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("SHA-256 not available", e);
        }
    }
}

