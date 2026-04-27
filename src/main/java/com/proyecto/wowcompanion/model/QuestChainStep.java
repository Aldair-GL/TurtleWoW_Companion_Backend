package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "quest_chain_steps")
@IdClass(QuestChainStep.QuestChainStepId.class)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestChainStep {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quest_chain_id")
    private QuestChain questChain;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "quest_id")
    private Quest quest;

    @Column(name = "step_order", nullable = false)
    private Integer stepOrder;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class QuestChainStepId implements Serializable {
        private Long questChain;
        private Long quest;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof QuestChainStepId)) return false;
            QuestChainStepId that = (QuestChainStepId) o;
            return Objects.equals(questChain, that.questChain) && Objects.equals(quest, that.quest);
        }

        @Override
        public int hashCode() {
            return Objects.hash(questChain, quest);
        }
    }
}

