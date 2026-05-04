package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "user_characters")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"dungeonProgress"})
@EqualsAndHashCode(exclude = {"dungeonProgress"})
public class UserCharacter {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 100)
    private String name;

    @Column(name = "race_name", length = 64)
    private String raceName;

    @Column(name = "class_name", length = 64)
    private String className;

    @Column(nullable = false)
    @Builder.Default
    private Integer level = 1;

    @Column(length = 100)
    private String realm;

    @Column(length = 20)
    private String gender;

    @Column(columnDefinition = "TEXT")
    private String notes;

    @Column(name = "main_character")
    @Builder.Default
    private Boolean mainCharacter = false;

    @Column(name = "updated_at")
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "race_id", nullable = true)
    private Race race;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "class_id", nullable = true)
    private CharacterClass characterClass;

    @Column(name = "created_at")
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @OneToMany(mappedBy = "userCharacter", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    @Builder.Default
    private List<CharacterDungeonProgress> dungeonProgress = new ArrayList<>();
}


