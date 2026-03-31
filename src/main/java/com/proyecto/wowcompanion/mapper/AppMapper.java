package com.proyecto.wowcompanion.mapper;

import com.proyecto.wowcompanion.dto.NpcAppDto;
import com.proyecto.wowcompanion.dto.QuestAppDto;
import com.proyecto.wowcompanion.dto.SearchResultDto;
import com.proyecto.wowcompanion.dto.ZoneAppDto;
import com.proyecto.wowcompanion.model.Npc;
import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.NpcType;
import org.springframework.stereotype.Component;

/**
 * Mapper que convierte entidades JPA a los DTOs simplificados
 * utilizados por los endpoints de /api/.
 */
@Component
public class AppMapper {

    // ==================== ZONE ====================

    public ZoneAppDto toZoneAppDto(Zone zone) {
        if (zone == null) return null;

        String level = "";
        if (zone.getMinLevel() != null && zone.getMaxLevel() != null) {
            level = zone.getMinLevel() + "-" + zone.getMaxLevel();
        } else if (zone.getMinLevel() != null) {
            level = String.valueOf(zone.getMinLevel());
        }

        String faction = "Neutral";
        if (zone.getFaction() != null) {
            faction = zone.getFaction().getName();
        }

        return ZoneAppDto.builder()
                .id(zone.getId())
                .name(zone.getName())
                .description(zone.getDescription() != null ? zone.getDescription() : "")
                .level(level)
                .faction(faction)
                .imageUrl(null)
                .build();
    }

    // ==================== QUEST ====================

    public QuestAppDto toQuestAppDto(Quest quest) {
        if (quest == null) return null;

        String faction = "Both";
        if (quest.getFactionRequired() != null) {
            switch (quest.getFactionRequired()) {
                case ALLIANCE -> faction = "Alliance";
                case HORDE -> faction = "Horde";
                case NEUTRAL -> faction = "Both";
            }
        }

        String zoneName = "";
        if (quest.getZone() != null) {
            zoneName = quest.getZone().getName();
        }

        Integer rewardXp = quest.getRewardXp();
        if (rewardXp == null) {
            // Intenta parsear del campo rewards si existe
            rewardXp = parseXpFromRewards(quest.getRewards());
        }

        Integer minLevel = quest.getMinLevel();
        if (minLevel == null) {
            // Default: nivel de quest - 3 (mínimo 1)
            minLevel = Math.max(1, quest.getLevel() != null ? quest.getLevel() - 3 : 1);
        }

        return QuestAppDto.builder()
                .id(quest.getId())
                .title(quest.getName())
                .description(quest.getDescription() != null ? quest.getDescription() : "")
                .level(quest.getLevel() != null ? quest.getLevel() : 1)
                .minLevel(minLevel)
                .zone(zoneName)
                .faction(faction)
                .rewardXp(rewardXp != null ? rewardXp : 0)
                .imageUrl(null)
                .build();
    }

    // ==================== NPC ====================

    public NpcAppDto toNpcAppDto(Npc npc) {
        if (npc == null) return null;

        String type = mapNpcType(npc.getNpcType(), npc.getIsQuestGiver());

        String faction = "Neutral";
        if (npc.getFaction() != null) {
            faction = npc.getFaction().getName();
        } else {
            faction = "Hostile";
        }

        String zoneName = "";
        if (npc.getZone() != null) {
            zoneName = npc.getZone().getName();
        }

        String title = npc.getTitle();
        if (title == null || title.isBlank()) {
            title = npc.getDescription() != null ? npc.getDescription() : "";
        }

        return NpcAppDto.builder()
                .id(npc.getId())
                .name(npc.getName())
                .title(title)
                .zone(zoneName)
                .type(type)
                .level(npc.getLevel() != null ? npc.getLevel() : 1)
                .faction(faction)
                .imageUrl(null)
                .build();
    }

    // ==================== SEARCH ====================

    public SearchResultDto zoneToSearchResult(Zone zone) {
        return SearchResultDto.builder()
                .id(zone.getId())
                .name(zone.getName())
                .type("zone")
                .description(zone.getDescription() != null ? zone.getDescription() : "")
                .build();
    }

    public SearchResultDto questToSearchResult(Quest quest) {
        return SearchResultDto.builder()
                .id(quest.getId())
                .name(quest.getName())
                .type("quest")
                .description(quest.getDescription() != null ? quest.getDescription() : "")
                .build();
    }

    public SearchResultDto npcToSearchResult(Npc npc) {
        return SearchResultDto.builder()
                .id(npc.getId())
                .name(npc.getName())
                .type("npc")
                .description(npc.getDescription() != null ? npc.getDescription() : "")
                .build();
    }

    // ==================== HELPERS ====================

    private String mapNpcType(NpcType npcType, Boolean isQuestGiver) {
        if (Boolean.TRUE.equals(isQuestGiver)) {
            return "Quest Giver";
        }
        if (npcType == null) return "NPC";
        return switch (npcType) {
            case BOSS -> "Boss";
            case VENDOR -> "Vendor";
            case TRAINER -> "Trainer";
            case QUEST_GIVER -> "Quest Giver";
            case DRAGON -> "Boss";
            case ELEMENTAL -> "Boss";
            default -> "NPC";
        };
    }

    /**
     * Extrae el valor de XP del campo rewards (ej: "250 XP, 1 silver" -> 250).
     */
    private Integer parseXpFromRewards(String rewards) {
        if (rewards == null || rewards.isBlank()) return 0;
        try {
            String[] parts = rewards.split(",");
            for (String part : parts) {
                String trimmed = part.trim().toUpperCase();
                if (trimmed.contains("XP")) {
                    String num = trimmed.replaceAll("[^0-9]", "");
                    if (!num.isEmpty()) {
                        return Integer.parseInt(num);
                    }
                }
            }
        } catch (NumberFormatException e) {
            // ignore
        }
        return 0;
    }
}

