package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.Continent;
import com.proyecto.wowcompanion.model.enums.ZoneType;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "zones")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"bosses", "npcs", "quests"})
@EqualsAndHashCode(exclude = {"bosses", "npcs", "quests"})
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

    @OneToMany(mappedBy = "zone", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Boss> bosses = new ArrayList<>();

    @OneToMany(mappedBy = "zone", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Npc> npcs = new ArrayList<>();

    @OneToMany(mappedBy = "zone", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Quest> quests = new ArrayList<>();
}
