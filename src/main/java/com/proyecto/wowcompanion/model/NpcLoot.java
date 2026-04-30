package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Objects;

@Entity
@Table(name = "npc_loot")
@IdClass(NpcLoot.NpcLootId.class)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NpcLoot {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "npc_id")
    private Npc npc;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item item;

    @Column(name = "drop_chance", precision = 5, scale = 2)
    private BigDecimal dropChance;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class NpcLootId implements Serializable {
        private Long npc;
        private Long item;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof NpcLootId)) return false;
            NpcLootId that = (NpcLootId) o;
            return Objects.equals(npc, that.npc) && Objects.equals(item, that.item);
        }

        @Override
        public int hashCode() {
            return Objects.hash(npc, item);
        }
    }
}

