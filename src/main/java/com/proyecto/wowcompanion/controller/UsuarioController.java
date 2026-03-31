package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.model.Usuario;
import com.proyecto.wowcompanion.service.UsuarioService;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/usuarios")
@RequiredArgsConstructor
@Tag(name = "Usuarios", description = "Gestion de usuarios (futuro auth)")
public class UsuarioController {

    private final UsuarioService usuarioService;

    @GetMapping
    public ResponseEntity<List<Usuario>> obtenerUsuarios() {
        return ResponseEntity.ok(usuarioService.getTodosUsuarios());
    }

    @PostMapping
    public ResponseEntity<Usuario> crearUsuario(@RequestBody Usuario u) {
        return ResponseEntity.ok(usuarioService.guardarUsuario(u));
    }
}
