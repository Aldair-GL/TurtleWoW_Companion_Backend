package com.proyecto.wowcompanion.model;

import com.proyecto.wowcompanion.model.enums.ProfessionType;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "professions")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
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
}

