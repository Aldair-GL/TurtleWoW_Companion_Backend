package com.proyecto.wowcompanion.repository;

import com.proyecto.wowcompanion.model.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<Usuario, Long> {
}
