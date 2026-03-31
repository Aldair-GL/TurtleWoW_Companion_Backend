package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.ZoneResponseDto;
import com.proyecto.wowcompanion.exception.GlobalExceptionHandler;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.service.ZoneService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.context.annotation.Import;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(ZoneController.class)
@Import(GlobalExceptionHandler.class)
class ZoneControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private ZoneService zoneService;

    @Test
    @DisplayName("GET /api/v1/zones - devuelve 200 con lista paginada")
    void getAll_returns200() throws Exception {
        ZoneResponseDto dto = ZoneResponseDto.builder()
                .id(1L).name("Elwynn Forest").continent("EASTERN_KINGDOMS").build();
        Page<ZoneResponseDto> page = new PageImpl<>(List.of(dto));

        when(zoneService.findAll(any(), any(), any())).thenReturn(page);

        mockMvc.perform(get("/api/v1/zones"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content[0].name").value("Elwynn Forest"));
    }

    @Test
    @DisplayName("GET /api/v1/zones/{id} - devuelve 200")
    void getById_returns200() throws Exception {
        ZoneResponseDto dto = ZoneResponseDto.builder()
                .id(1L).name("Elwynn Forest").build();

        when(zoneService.findById(1L)).thenReturn(dto);

        mockMvc.perform(get("/api/v1/zones/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Elwynn Forest"));
    }

    @Test
    @DisplayName("GET /api/v1/zones/{id} - devuelve 404 si no existe")
    void getById_returns404() throws Exception {
        when(zoneService.findById(999L)).thenThrow(new ResourceNotFoundException("Zone", 999L));

        mockMvc.perform(get("/api/v1/zones/999"))
                .andExpect(status().isNotFound());
    }

    @Test
    @DisplayName("GET /api/v1/zones?name=elwynn - filtro por nombre")
    void getAll_filterByName() throws Exception {
        ZoneResponseDto dto = ZoneResponseDto.builder()
                .id(1L).name("Elwynn Forest").build();
        Page<ZoneResponseDto> page = new PageImpl<>(List.of(dto));

        when(zoneService.findAll(eq("elwynn"), any(), any())).thenReturn(page);

        mockMvc.perform(get("/api/v1/zones").param("name", "elwynn"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.content[0].name").value("Elwynn Forest"));
    }
}



