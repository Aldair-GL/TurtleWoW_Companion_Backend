package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "item_sets")
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString(exclude = {"items"})
@EqualsAndHashCode(exclude = {"items"})
public class ItemSet {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String name;

    @Column(nullable = false, unique = true)
    private String slug;

    @Column(columnDefinition = "TEXT")
    private String description;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "class_id")
    private CharacterClass characterClass;

    @Column(name = "source_url", columnDefinition = "TEXT")
    private String sourceUrl;

    @Column(name = "needs_verification")
    @Builder.Default
    private Boolean needsVerification = false;

    @Column(name = "created_at")
    @Builder.Default
    private LocalDateTime createdAt = LocalDateTime.now();

    @Column(name = "updated_at")
    @Builder.Default
    private LocalDateTime updatedAt = LocalDateTime.now();

    @ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
            name = "item_set_items",
            joinColumns = @JoinColumn(name = "item_set_id"),
            inverseJoinColumns = @JoinColumn(name = "item_id")
    )
    @Builder.Default
    private Set<Item> items = new HashSet<>();
}

