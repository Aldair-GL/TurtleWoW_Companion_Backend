package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.BossResponseDto;
import com.proyecto.wowcompanion.dto.LootItemDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.BossMapper;
import com.proyecto.wowcompanion.model.Boss;
import com.proyecto.wowcompanion.model.LootItem;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.model.enums.ItemQuality;
import com.proyecto.wowcompanion.repository.BossRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class BossServiceTest {

    @Mock
    private BossRepository bossRepository;
    @Mock
    private BossMapper bossMapper;

    @InjectMocks
    private BossService bossService;

    @Test
    @DisplayName("findByZone - devuelve lista de bosses de una mazmorra")
    void findByZone_returnsBosses() {
        Zone zone = Zone.builder().id(52L).name("Las Minas de la Muerte").build();
        Boss boss = Boss.builder().id(1L).name("Edwin VanCleef").level(21).zone(zone).lootItems(List.of()).build();

        when(bossRepository.findByZoneId(52L)).thenReturn(List.of(boss));
        when(bossMapper.toDto(boss)).thenReturn(
                BossResponseDto.builder().id(1L).name("Edwin VanCleef").zoneName("Las Minas de la Muerte").lootItems(List.of()).build());

        List<BossResponseDto> result = bossService.findByZone(52L);

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getName()).isEqualTo("Edwin VanCleef");
        verify(bossRepository).findByZoneId(52L);
    }

    @Test
    @DisplayName("findByZone - mazmorra sin bosses devuelve lista vacia")
    void findByZone_empty() {
        when(bossRepository.findByZoneId(999L)).thenReturn(List.of());

        List<BossResponseDto> result = bossService.findByZone(999L);

        assertThat(result).isEmpty();
    }

    @Test
    @DisplayName("findById - devuelve boss con loot")
    void findById_found() {
        Zone zone = Zone.builder().id(52L).name("Las Minas de la Muerte").build();
        LootItem loot = LootItem.builder().id(1L).name("Espada Cruel").quality(ItemQuality.RARE).build();
        Boss boss = Boss.builder().id(1L).name("VanCleef").level(21).zone(zone).lootItems(List.of(loot)).build();

        LootItemDto lootDto = LootItemDto.builder().id(1L).name("Espada Cruel").quality("RARE").build();
        BossResponseDto dto = BossResponseDto.builder().id(1L).name("VanCleef").lootItems(List.of(lootDto)).build();

        when(bossRepository.findById(1L)).thenReturn(Optional.of(boss));
        when(bossMapper.toDto(boss)).thenReturn(dto);

        BossResponseDto result = bossService.findById(1L);

        assertThat(result.getName()).isEqualTo("VanCleef");
        assertThat(result.getLootItems()).hasSize(1);
        assertThat(result.getLootItems().get(0).getQuality()).isEqualTo("RARE");
    }

    @Test
    @DisplayName("findById - lanza ResourceNotFoundException si no existe")
    void findById_notFound() {
        when(bossRepository.findById(999L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> bossService.findById(999L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("Boss");
    }
}

