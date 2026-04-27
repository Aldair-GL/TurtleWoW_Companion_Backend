package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.QuestReward;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface QuestRewardRepository extends JpaRepository<QuestReward, Long> {
    List<QuestReward> findByQuestId(Long questId);
}

