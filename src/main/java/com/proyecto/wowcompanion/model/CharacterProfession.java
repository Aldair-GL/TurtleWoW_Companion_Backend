package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "character_professions",
        uniqueConstraints = @UniqueConstraint(columnNames = {"character_id", "profession_id"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CharacterProfession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "character_id", nullable = false)
    private UserCharacter userCharacter;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profession_id", nullable = false)
    private Profession profession;

    @Column(name = "skill_level")
    @Builder.Default
    private Short skillLevel = 1;

    @Column(name = "is_primary")
    @Builder.Default
    private Boolean isPrimary = true;

    @Column(name = "created_at")
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();
}

