package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.dto.BossResponseDto;
import com.proyecto.wowcompanion.dto.LootItemDto;
import com.proyecto.wowcompanion.exception.GlobalExceptionHandler;
import com.proyecto.wowcompanion.exception.ResourceNotFoundException;
import com.proyecto.wowcompanion.service.BossService;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.bean.override.mockito.MockitoBean;
import org.springframework.context.annotation.Import;
import org.springframework.test.web.servlet.MockMvc;

import java.util.List;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(BossController.class)
@Import(GlobalExceptionHandler.class)
class BossControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @MockitoBean
    private BossService bossService;

    @Test
    @DisplayName("GET /api/v1/zones/{zoneId}/bosses - devuelve 200 con lista de jefes")
    void getByZone_returns200() throws Exception {
        LootItemDto loot = LootItemDto.builder()
                .id(1L).name("Espada Cruel").quality("RARE").type("Espada a una mano").dropRate(15.5).build();
        BossResponseDto boss = BossResponseDto.builder()
                .id(1L).name("Edwin VanCleef").level(21).health(4200L)
                .zoneName("Las Minas de la Muerte").lootItems(List.of(loot)).build();

        when(bossService.findByZone(52L)).thenReturn(List.of(boss));

        mockMvc.perform(get("/api/v1/zones/52/bosses"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$[0].name").value("Edwin VanCleef"))
                .andExpect(jsonPath("$[0].lootItems[0].name").value("Espada Cruel"));
    }

    @Test
    @DisplayName("GET /api/v1/zones/{zoneId}/bosses - devuelve 200 vacio si no hay bosses")
    void getByZone_returnsEmpty() throws Exception {
        when(bossService.findByZone(1L)).thenReturn(List.of());

        mockMvc.perform(get("/api/v1/zones/1/bosses"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$").isArray())
                .andExpect(jsonPath("$").isEmpty());
    }

    @Test
    @DisplayName("GET /api/v1/bosses/{id} - devuelve 200 con detalle del jefe")
    void getById_returns200() throws Exception {
        BossResponseDto boss = BossResponseDto.builder()
                .id(1L).name("Archmage Arugal").level(26).zoneName("Castillo de Colmillo Oscuro")
                .lootItems(List.of()).build();

        when(bossService.findById(1L)).thenReturn(boss);

        mockMvc.perform(get("/api/v1/bosses/1"))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.name").value("Archmage Arugal"))
                .andExpect(jsonPath("$.zoneName").value("Castillo de Colmillo Oscuro"));
    }

    @Test
    @DisplayName("GET /api/v1/bosses/{id} - devuelve 404 si no existe")
    void getById_returns404() throws Exception {
        when(bossService.findById(999L)).thenThrow(new ResourceNotFoundException("Boss", 999L));

        mockMvc.perform(get("/api/v1/bosses/999"))
                .andExpect(status().isNotFound());
    }
}

