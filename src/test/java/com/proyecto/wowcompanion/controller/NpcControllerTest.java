package com.proyecto.wowcompanion.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.proyecto.wowcompanion.dto.NpcRequestDto;
import com.proyecto.wowcompanion.dto.NpcResponseDto;
import com.proyecto.wowcompanion.exception.GlobalExceptionHandler;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.service.NpcService;
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

@WebMvcTest(NpcController.class)
@Import(GlobalExceptionHandler.class)
class NpcControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ObjectMapper objectMapper;

    @MockitoBean
    private NpcService npcService;

    @Test
    @DisplayName("GET /api/v1/npcs - devuelve 200 con lista paginada")
    void getAll_returns200() throws Exception {
        NpcResponseDto dto = NpcResponseDto.builder()
                .id(1L).name("Thrall").npcType("QUEST_GIVER").level(63).build();
        Page<NpcResponseDto> page = new PageImpl<>(List.of(dto));

        when(npcService.findAll(any(), any(), any())).thenReturn(page);

        mockMvc.perform(get("/api/v1/npcs"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content[0].name").value("Thrall"));
    }

    @Test
    @DisplayName("GET /api/v1/npcs/{id} - devuelve 200")
    void getById_returns200() throws Exception {
        NpcResponseDto dto = NpcResponseDto.builder()
                .id(1L).name("Thrall").npcType("QUEST_GIVER").factionName("Horda").build();

        when(npcService.findById(1L)).thenReturn(dto);

        mockMvc.perform(get("/api/v1/npcs/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Thrall"))
                .andExpect(jsonPath("$.factionName").value("Horda"));
    }

    @Test
    @DisplayName("GET /api/v1/npcs/{id} - devuelve 404 si no existe")
    void getById_returns404() throws Exception {
        when(npcService.findById(999L)).thenThrow(new ResourceNotFoundException("NPC", 999L));

        mockMvc.perform(get("/api/v1/npcs/999"))
                .andExpect(status().isNotFound());
    }

    @Test
    @DisplayName("POST /api/v1/npcs - devuelve 201 con datos validos")
    void create_returns201() throws Exception {
        NpcRequestDto request = NpcRequestDto.builder()
                .name("Nuevo NPC").npcType("VENDOR").level(30).zoneId(1L).build();
        NpcResponseDto response = NpcResponseDto.builder()
                .id(100L).name("Nuevo NPC").npcType("VENDOR").level(30).build();

        when(npcService.create(any(NpcRequestDto.class))).thenReturn(response);

        mockMvc.perform(post("/api/v1/npcs")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isCreated())
                .andExpect(jsonPath("$.id").value(100));
    }

    @Test
    @DisplayName("POST /api/v1/npcs - devuelve 400 con datos invalidos")
    void create_returns400() throws Exception {
        NpcRequestDto request = NpcRequestDto.builder()
                .name("").npcType(null).build();

        mockMvc.perform(post("/api/v1/npcs")
                        .contentType(MediaType.APPLICATION_JSON)
                        .content(objectMapper.writeValueAsString(request)))
                .andExpect(status().isBadRequest());
    }

    @Test
    @DisplayName("DELETE /api/v1/npcs/{id} - devuelve 204")
    void delete_returns204() throws Exception {
        mockMvc.perform(delete("/api/v1/npcs/1"))
                .andExpect(status().isNoContent());
    }
}

