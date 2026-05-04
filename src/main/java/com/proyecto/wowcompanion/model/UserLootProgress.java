package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "user_loot_progress",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_user_loot_progress_user_item_boss",
                columnNames = {"user_id", "item_name", "boss_id"}
        )
)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserLootProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private User user;

    @Column(name = "item_name", nullable = false, length = 128)
    private String itemName;

    @Column(name = "item_quality", length = 32)
    private String itemQuality;

    @Column(name = "boss_id", nullable = false)
    private Long bossId;

    @Column(name = "boss_name", nullable = false, length = 128)
    private String bossName;

    @Column(name = "obtained_at", nullable = false)
    @Builder.Default
    private LocalDateTime obtainedAt = LocalDateTime.now();
}

