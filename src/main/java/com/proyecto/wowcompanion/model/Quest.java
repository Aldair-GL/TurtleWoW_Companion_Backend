package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.FactionType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "quests")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Quest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(length = 3000)
    private String description;

    @Column(nullable = false)
    private Integer level;

    /** Nivel mínimo requerido para aceptar la quest */
    private Integer minLevel;

    /** Requisito de facción para aceptar la quest */
    @Enumerated(EnumType.STRING)
    private FactionType factionRequired;

    /** Texto con la recompensa (XP, oro, items) */
    @Column(length = 500)
    private String rewards;

    /** XP de recompensa numerico */
    private Integer rewardXp;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "zone_id")
    private Zone zone;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quest_giver_id")
    private Npc questGiver;
}

