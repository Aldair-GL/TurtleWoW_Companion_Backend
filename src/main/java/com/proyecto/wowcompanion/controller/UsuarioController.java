package com.proyecto.wowcompanion.controller;

import com.proyecto.wowcompanion.model.Usuario;
import com.proyecto.wowcompanion.service.UsuarioService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/usuarios")
public class UsuarioController {
    private final UsuarioService usuarioService;

    public UsuarioController(UsuarioService usuarioService) {
        this.usuarioService = usuarioService;
    }

    @GetMapping
    public List<Usuario> obtenerUsuarios() {
        return usuarioService.getTodosUsuarios();
    }

    @PostMapping
    public Usuario crearUsuario(@RequestBody Usuario u) {
        return usuarioService.guardarUsuario(u);
    }
}
