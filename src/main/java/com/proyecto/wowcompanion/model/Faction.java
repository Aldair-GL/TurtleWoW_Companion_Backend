package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.FactionType;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "factions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"races", "zones", "npcs"})
@EqualsAndHashCode(exclude = {"races", "zones", "npcs"})
public class Faction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 5000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private FactionType type;

    @OneToMany(mappedBy = "faction", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Race> races = new ArrayList<>();

    @OneToMany(mappedBy = "faction", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Zone> zones = new ArrayList<>();

    @OneToMany(mappedBy = "faction", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Npc> npcs = new ArrayList<>();
}
