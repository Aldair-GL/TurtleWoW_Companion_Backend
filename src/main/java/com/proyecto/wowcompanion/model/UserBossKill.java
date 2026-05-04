package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "user_boss_kills",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_user_boss_kills_user_boss",
                columnNames = {"user_id", "boss_id"}
        )
)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserBossKill {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private User user;

    @Column(name = "boss_id", nullable = false)
    private Long bossId;

    @Column(name = "boss_name", nullable = false, length = 128)
    private String bossName;

    @Column(name = "zone_name", nullable = false, length = 128)
    private String zoneName;

    @Column(name = "killed_at", nullable = false)
    @Builder.Default
    private LocalDateTime killedAt = LocalDateTime.now();
}

