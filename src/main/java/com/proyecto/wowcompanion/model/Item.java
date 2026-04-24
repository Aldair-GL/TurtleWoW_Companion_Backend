package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.ItemQuality;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "items")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Item {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(length = 2000)
    private String description;

    @Enumerated(EnumType.STRING)
    private ItemQuality quality;

    /** WEAPON, ARMOR, CONSUMABLE, QUEST, TRADE, REAGENT, RECIPE, MISC */
    private String type;

    /** Sword, Mace, Cloth, Leather, Potion, etc. */
    private String subtype;

    private Integer levelRequired;

    private Integer itemLevel;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "profession_id")
    private Profession profession;
}
