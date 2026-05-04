package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(
        name = "user_dungeon_progress",
        uniqueConstraints = @UniqueConstraint(
                name = "uk_user_dungeon_progress_user_zone",
                columnNames = {"user_id", "zone_id"}
        )
)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class UserDungeonProgress {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "user_id", nullable = false)
    @ToString.Exclude
    @EqualsAndHashCode.Exclude
    private User user;

    @Column(name = "zone_id", nullable = false)
    private Long zoneId;

    @Column(name = "zone_name", nullable = false, length = 128)
    private String zoneName;

    @Column(nullable = false)
    @Builder.Default
    private Boolean completed = false;

    @Column(name = "completed_at")
    private LocalDateTime completedAt;
}

