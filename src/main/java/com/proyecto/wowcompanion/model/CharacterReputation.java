package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "character_reputations",
        uniqueConstraints = @UniqueConstraint(columnNames = {"character_id", "reputation_id"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CharacterReputation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_id", nullable = false)
    private UserCharacter userCharacter;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "reputation_id", nullable = false)
    private Reputation reputation;

    @Column(length = 30)
    @Builder.Default
    private String standing = "NEUTRAL";

    @Builder.Default
    private Integer points = 0;

    @Column(name = "created_at")
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();
}

