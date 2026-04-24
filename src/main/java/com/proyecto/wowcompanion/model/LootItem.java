package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.ItemQuality;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "loot_items")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class LootItem {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(length = 1000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ItemQuality quality;

    @Column(nullable = false)
    private String type;

    private Double dropRate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "boss_id")
    private Boss boss;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item item;
}
