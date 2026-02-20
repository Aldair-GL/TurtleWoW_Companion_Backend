package com.proyecto.wowcompanion.service;

import com.proyecto.wowcompanion.model.Usuario;
import com.proyecto.wowcompanion.repository.UsuarioRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UsuarioService {
    private final UsuarioRepository usuarioRepository;

    public UsuarioService(UsuarioRepository usuarioRepository) {
        this.usuarioRepository = usuarioRepository;
    }

    public List<Usuario> getTodosUsuarios() {
        return usuarioRepository.findAll();
    }

    public Usuario guardarUsuario(Usuario u) {
        return usuarioRepository.save(u);
    }
}
