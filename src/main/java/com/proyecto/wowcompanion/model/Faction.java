package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.FactionType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "factions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Faction {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 1000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private FactionType type;
}

