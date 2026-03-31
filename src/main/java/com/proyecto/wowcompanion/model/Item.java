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
    @Column(nullable = false)
    private ItemQuality quality;

    /** Tipo de item: Weapon, Armor, Consumable, Quest, Trade Good, etc. */
    @Column(nullable = false)
    private String itemType;

    private Integer levelRequired;

    /** Fuente de obtención: nombre del NPC, mazmorra, vendor, etc. */
    private String dropSource;
}

