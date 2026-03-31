package com.proyecto.wowcompanion.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proyecto.wowcompanion.dto.QuestRequestDto;
import com.proyecto.wowcompanion.dto.QuestResponseDto;
import com.proyecto.wowcompanion.exception.GlobalExceptionHandler;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.service.QuestService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(QuestController.class)
@Import(GlobalExceptionHandler.class)
class QuestControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockitoBean
    private QuestService questService;

    @Test
    @DisplayName("GET /api/v1/quests - devuelve 200 con lista paginada")
    void getAll_returns200() throws Exception {
        QuestResponseDto dto = QuestResponseDto.builder()
                .id(1L).name("Test Quest").level(10).build();
        Page<QuestResponseDto> page = new PageImpl<>(List.of(dto));

        when(questService.findAll(any(), any(), any(), any())).thenReturn(page);

        mockMvc.perform(get("/api/v1/quests"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content[0].name").value("Test Quest"));
    }

    @Test
    @DisplayName("GET /api/v1/quests/{id} - devuelve 200")
    void getById_returns200() throws Exception {
        QuestResponseDto dto = QuestResponseDto.builder()
                .id(1L).name("Test Quest").level(10).build();

        when(questService.findById(1L)).thenReturn(dto);

        mockMvc.perform(get("/api/v1/quests/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Test Quest"));
    }

    @Test
    @DisplayName("GET /api/v1/quests/{id} - devuelve 404 si no existe")
    void getById_returns404() throws Exception {
        when(questService.findById(999L)).thenThrow(new ResourceNotFoundException("Quest", 999L));

        mockMvc.perform(get("/api/v1/quests/999"))
                .andExpect(status().isNotFound())
                .andExpect(jsonPath("$.message").exists());
    }

    @Test
    @DisplayName("POST /api/v1/quests - devuelve 201 con datos validos")
    void create_returns201() throws Exception {
        QuestRequestDto request = QuestRequestDto.builder()
                .name("New Quest").level(15).description("Description").build();
        QuestResponseDto response = QuestResponseDto.builder()
                .id(1L).name("New Quest").level(15).build();

        when(questService.create(any(QuestRequestDto.class))).thenReturn(response);

        mockMvc.perform(post("/api/v1/quests")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").value(1));
    }

    @Test
    @DisplayName("POST /api/v1/quests - devuelve 400 con datos invalidos")
    void create_returns400_whenInvalid() throws Exception {
        QuestRequestDto request = QuestRequestDto.builder()
                .name("").level(null).build(); // name vacio, level null

        mockMvc.perform(post("/api/v1/quests")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isBadRequest())
                .andExpect(jsonPath("$.fieldErrors").exists());
    }

    @Test
    @DisplayName("DELETE /api/v1/quests/{id} - devuelve 204")
    void delete_returns204() throws Exception {
        mockMvc.perform(delete("/api/v1/quests/1"))
                .andExpect(status().isNoContent());
    }
}



