package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.Continent;
import com.proyecto.wowcompanion.model.enums.ZoneType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "zones")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Zone {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private String name;

    @Column(length = 2000)
    private String description;

    private Integer minLevel;

    private Integer maxLevel;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Continent continent;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ZoneType zoneType;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "faction_id")
    private Faction faction;

    @Column(name = "image_url", length = 500)
    private String imageUrl;
}

