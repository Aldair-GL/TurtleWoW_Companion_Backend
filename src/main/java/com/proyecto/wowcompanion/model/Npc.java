package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.NpcType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "npcs")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Npc {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    /** Subtítulo del NPC, ej: "Jefe Gnoll" */
    private String title;

    @Column(length = 2000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private NpcType npcType;

    @Column(nullable = false)
    @Builder.Default
    private Boolean isQuestGiver = false;

    private Integer level;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id")
    private Zone zone;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faction_id")
    private Faction faction;
}

