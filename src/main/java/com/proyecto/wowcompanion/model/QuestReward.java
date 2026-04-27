package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Table(name = "quest_rewards",
        uniqueConstraints = @UniqueConstraint(columnNames = {"quest_id", "item_id"}))
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestReward {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quest_id", nullable = false)
    private Quest quest;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id", nullable = false)
    private Item item;

    @Builder.Default
    private Integer quantity = 1;

    /** CHOICE, FIXED */
    @Column(name = "reward_type", length = 30)
    @Builder.Default
    private String rewardType = "CHOICE";
}

