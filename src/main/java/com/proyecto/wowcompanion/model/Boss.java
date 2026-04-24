package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "bosses")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"lootItems"})
@EqualsAndHashCode(exclude = {"lootItems"})
public class Boss {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(length = 1000)
    private String description;

    @Column(length = 3000)
    private String lore;

    private Integer level;

    private Long health;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id")
    private Zone zone;

    @OneToMany(mappedBy = "boss", fetch = FetchType.LAZY)
    @Builder.Default
    private List<LootItem> lootItems = new ArrayList<>();
}

