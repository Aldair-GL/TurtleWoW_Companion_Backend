package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.ProfessionType;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "professions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"items"})
@EqualsAndHashCode(exclude = {"items"})
public class Profession {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(length = 1000)
    private String description;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ProfessionType type;

    @OneToMany(mappedBy = "profession", fetch = FetchType.LAZY)
    @Builder.Default
    private List<Item> items = new ArrayList<>();
}
