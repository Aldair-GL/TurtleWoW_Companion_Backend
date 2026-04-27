package com.proyecto.wowcompanion.model;

import jakarta.persistence.*;
import lombok.*;
import java.io.Serializable;
import java.util.Objects;

@Entity
@Table(name = "recipe_materials")
@IdClass(RecipeMaterial.RecipeMaterialId.class)
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class RecipeMaterial {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "recipe_id")
    private Recipe recipe;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "item_id")
    private Item item;

    @Column(nullable = false)
    @Builder.Default
    private Integer quantity = 1;

    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class RecipeMaterialId implements Serializable {
        private Long recipe;
        private Long item;

        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (!(o instanceof RecipeMaterialId)) return false;
            RecipeMaterialId that = (RecipeMaterialId) o;
            return Objects.equals(recipe, that.recipe) && Objects.equals(item, that.item);
        }

        @Override
        public int hashCode() {
            return Objects.hash(recipe, item);
        }
    }
}

