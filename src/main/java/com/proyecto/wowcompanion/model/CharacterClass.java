package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.ClassRole;
import com.proyecto.wowcompanion.model.enums.ResourceType;
import jakarta.persistence.*;
import lombok.*;

import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "character_classes")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"races"})
@EqualsAndHashCode(exclude = {"races"})
public class CharacterClass {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 1000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ClassRole role;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ResourceType resourceType;

    @ManyToMany(mappedBy = "availableClasses", fetch = FetchType.LAZY)
    @Builder.Default
    private Set<Race> races = new HashSet<>();
}
