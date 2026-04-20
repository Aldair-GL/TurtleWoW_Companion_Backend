package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.RaceResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.RaceMapper;
import com.proyecto.wowcompanion.model.Faction;
import com.proyecto.wowcompanion.model.Race;
import com.proyecto.wowcompanion.model.enums.FactionType;
import com.proyecto.wowcompanion.repository.RaceRepository;
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
class RaceServiceTest {

    @Mock
    private RaceRepository raceRepository;
    @Mock
    private RaceMapper raceMapper;

    @InjectMocks
    private RaceService raceService;

    @Test
    @DisplayName("findAll - devuelve todas las razas")
    void findAll_returnsRaces() {
        Faction faction = Faction.builder().id(1L).name("Alianza").type(FactionType.ALLIANCE).build();
        Race race = Race.builder().id(1L).name("Humano").faction(faction).build();
        RaceResponseDto dto = RaceResponseDto.builder()
                .id(1L).name("Humano").factionName("Alianza").availableClasses(List.of("Guerrero", "Mago")).build();

        when(raceRepository.findAll()).thenReturn(List.of(race));
        when(raceMapper.toDto(race)).thenReturn(dto);

        List<RaceResponseDto> result = raceService.findAll();

        assertThat(result).hasSize(1);
        assertThat(result.get(0).getName()).isEqualTo("Humano");
        assertThat(result.get(0).getFactionName()).isEqualTo("Alianza");
        assertThat(result.get(0).getAvailableClasses()).contains("Guerrero", "Mago");
    }

    @Test
    @DisplayName("findById - devuelve raza existente")
    void findById_found() {
        Race race = Race.builder().id(1L).name("Orco").build();
        RaceResponseDto dto = RaceResponseDto.builder()
                .id(1L).name("Orco").factionName("Horda").build();

        when(raceRepository.findById(1L)).thenReturn(Optional.of(race));
        when(raceMapper.toDto(race)).thenReturn(dto);

        RaceResponseDto result = raceService.findById(1L);

        assertThat(result.getName()).isEqualTo("Orco");
        assertThat(result.getFactionName()).isEqualTo("Horda");
    }

    @Test
    @DisplayName("findById - lanza ResourceNotFoundException si no existe")
    void findById_notFound() {
        when(raceRepository.findById(999L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> raceService.findById(999L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("Race");
    }

    @Test
    @DisplayName("findByFaction - filtra razas por faccion")
    void findByFaction_returnsFiltered() {
        Race race = Race.builder().id(1L).name("Humano").build();
        RaceResponseDto dto = RaceResponseDto.builder()
                .id(1L).name("Humano").factionName("Alianza").build();

        when(raceRepository.findByFactionId(1L)).thenReturn(List.of(race));
        when(raceMapper.toDto(race)).thenReturn(dto);

        List<RaceResponseDto> result = raceService.findByFaction(1L);

        assertThat(result).hasSize(1);
        verify(raceRepository).findByFactionId(1L);
    }
}

