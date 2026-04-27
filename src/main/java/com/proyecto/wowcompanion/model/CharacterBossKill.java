package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "character_boss_kills",
        uniqueConstraints = @UniqueConstraint(columnNames = {"character_id", "boss_id"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CharacterBossKill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_id", nullable = false)
    private UserCharacter userCharacter;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "boss_id", nullable = false)
    private Boss boss;

    @Builder.Default
    private Boolean defeated = false;

    @Column(name = "defeated_at")
    private LocalDateTime defeatedAt;

    @Column(name = "times_defeated")
    @Builder.Default
    private Integer timesDefeated = 0;

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(name = "created_at")
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();
}

