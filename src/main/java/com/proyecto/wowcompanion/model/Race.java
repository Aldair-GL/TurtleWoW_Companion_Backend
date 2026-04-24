package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "races")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"availableClasses"})
@EqualsAndHashCode(exclude = {"availableClasses"})
public class Race {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 5000)
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faction_id", nullable = false)
    private Faction faction;

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "race_class",
            joinColumns = @JoinColumn(name = "race_id"),
            inverseJoinColumns = @JoinColumn(name = "class_id")
    )
    @Builder.Default
    private Set<CharacterClass> availableClasses = new HashSet<>();
}

