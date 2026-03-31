package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.dto.QuestRequestDto;
import com.proyecto.wowcompanion.dto.QuestResponseDto;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.mapper.QuestMapper;
import com.proyecto.wowcompanion.model.Quest;
import com.proyecto.wowcompanion.model.Zone;
import com.proyecto.wowcompanion.repository.NpcRepository;
import com.proyecto.wowcompanion.repository.QuestRepository;
import com.proyecto.wowcompanion.repository.ZoneRepository;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import java.util.List;
import java.util.Optional;

import static org.assertj.core.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class QuestServiceTest {

    @Mock
    private QuestRepository questRepository;
    @Mock
    private ZoneRepository zoneRepository;
    @Mock
    private NpcRepository npcRepository;
    @Mock
    private QuestMapper questMapper;

    @InjectMocks
    private QuestService questService;

    @Test
    @DisplayName("findAll - devuelve pagina de quests")
    void findAll_returnsPage() {
        Quest quest = Quest.builder().id(1L).name("Test Quest").level(10).build();
        Page<Quest> page = new PageImpl<>(List.of(quest));
        Pageable pageable = PageRequest.of(0, 20);

        when(questRepository.findAll(pageable)).thenReturn(page);
        when(questMapper.toDto(any(Quest.class))).thenReturn(
                QuestResponseDto.builder().id(1L).name("Test Quest").level(10).build());

        Page<QuestResponseDto> result = questService.findAll(null, null, null, pageable);

        assertThat(result.getContent()).hasSize(1);
        assertThat(result.getContent().get(0).getName()).isEqualTo("Test Quest");
        verify(questRepository).findAll(pageable);
    }

    @Test
    @DisplayName("findById - devuelve quest existente")
    void findById_found() {
        Quest quest = Quest.builder().id(1L).name("Test Quest").level(5).build();
        when(questRepository.findById(1L)).thenReturn(Optional.of(quest));
        when(questMapper.toDto(quest)).thenReturn(
                QuestResponseDto.builder().id(1L).name("Test Quest").level(5).build());

        QuestResponseDto result = questService.findById(1L);

        assertThat(result.getName()).isEqualTo("Test Quest");
    }

    @Test
    @DisplayName("findById - lanza ResourceNotFoundException si no existe")
    void findById_notFound() {
        when(questRepository.findById(999L)).thenReturn(Optional.empty());

        assertThatThrownBy(() -> questService.findById(999L))
                .isInstanceOf(ResourceNotFoundException.class)
                .hasMessageContaining("Quest");
    }

    @Test
    @DisplayName("create - crea quest correctamente")
    void create_success() {
        QuestRequestDto dto = QuestRequestDto.builder()
                .name("New Quest").level(15).description("Desc").build();
        Quest entity = Quest.builder().name("New Quest").level(15).build();
        Quest saved = Quest.builder().id(1L).name("New Quest").level(15).build();

        when(questMapper.toEntity(dto)).thenReturn(entity);
        when(questRepository.save(entity)).thenReturn(saved);
        when(questMapper.toDto(saved)).thenReturn(
                QuestResponseDto.builder().id(1L).name("New Quest").level(15).build());

        QuestResponseDto result = questService.create(dto);

        assertThat(result.getId()).isEqualTo(1L);
        assertThat(result.getName()).isEqualTo("New Quest");
        verify(questRepository).save(entity);
    }

    @Test
    @DisplayName("create - con zona valida resuelve relacion")
    void create_withZone() {
        QuestRequestDto dto = QuestRequestDto.builder()
                .name("Zone Quest").level(20).zoneId(1L).build();
        Quest entity = Quest.builder().name("Zone Quest").level(20).build();
        Zone zone = Zone.builder().id(1L).name("Elwynn").build();
        Quest saved = Quest.builder().id(2L).name("Zone Quest").level(20).zone(zone).build();

        when(questMapper.toEntity(dto)).thenReturn(entity);
        when(zoneRepository.findById(1L)).thenReturn(Optional.of(zone));
        when(questRepository.save(entity)).thenReturn(saved);
        when(questMapper.toDto(saved)).thenReturn(
                QuestResponseDto.builder().id(2L).name("Zone Quest").zoneName("Elwynn").build());

        QuestResponseDto result = questService.create(dto);

        assertThat(result.getZoneName()).isEqualTo("Elwynn");
    }

    @Test
    @DisplayName("delete - lanza excepcion si no existe")
    void delete_notFound() {
        when(questRepository.existsById(999L)).thenReturn(false);

        assertThatThrownBy(() -> questService.delete(999L))
                .isInstanceOf(ResourceNotFoundException.class);
    }

    @Test
    @DisplayName("delete - elimina correctamente")
    void delete_success() {
        when(questRepository.existsById(1L)).thenReturn(true);

        questService.delete(1L);

        verify(questRepository).deleteById(1L);
    }
}

