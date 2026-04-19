-- ============================================================
-- DATOS COMPLETOS: World of Warcraft Clasico (Vanilla)
-- Base de datos Turtle WoW Companion
-- ============================================================

-- Limpiar bosses y loot para recargar (las demas tablas usan ON CONFLICT)
DELETE FROM loot_items;
DELETE FROM bosses;

-- ==================== FACCIONES ====================
INSERT INTO factions (id, name, description, type) VALUES
(1, 'Alianza', 'La Gran Alianza, una faccion de razas nobles unidas contra amenazas comunes. Liderada desde Ciudad de Ventormenta.', 'ALLIANCE'),
(2, 'Horda', 'La Nueva Horda, una coalicion de razas marginadas que luchan por su supervivencia y honor bajo el mando del Jefe de Guerra.', 'HORDE'),
(3, 'Cartel Bonvapor', 'Un poderoso cartel goblin de comercio que mantiene la neutralidad entre Alianza y Horda.', 'NEUTRAL'),
(4, 'Alba Argenta', 'Una organizacion dedicada a combatir a la Plaga en las Tierras de la Peste.', 'NEUTRAL'),
(5, 'Circulo Cenarion', 'Una orden druidica dedicada a proteger la naturaleza y el Sueno Esmeralda.', 'NEUTRAL'),
(6, 'Hermandad del Torio', 'Un grupo de enanos Hierro Negro que se han separado de Ragnaros y ofrecen sus conocimientos de forja.', 'NEUTRAL')
ON CONFLICT (id) DO NOTHING;

-- ==================== CLASES DE PERSONAJE ====================
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES
(1, 'Guerrero', 'Maestros del armamento y la armadura. Destacan como tanques y causando dano cuerpo a cuerpo.', 'HYBRID', 'RAGE'),
(2, 'Paladin', 'Guerreros sagrados capaces de sanar, tanquear y causar dano. Exclusivos de la Alianza.', 'HYBRID', 'MANA'),
(3, 'Cazador', 'Especialistas en dano a distancia que luchan junto a companeros animales.', 'DPS', 'MANA'),
(4, 'Picaro', 'Asesinos sigilosos que destacan en dano explosivo cuerpo a cuerpo.', 'DPS', 'ENERGY'),
(5, 'Sacerdote', 'Sanadores versatiles que tambien pueden infligir dano de sombras.', 'HEALER', 'MANA'),
(6, 'Chaman', 'Guerreros elementales con totems. Exclusivos de la Horda.', 'HYBRID', 'MANA'),
(7, 'Mago', 'Maestros de la magia arcana, de fuego y de escarcha. Poderoso dano a distancia.', 'DPS', 'MANA'),
(8, 'Brujo', 'Lanzadores oscuros que comandan demonios y magia de las sombras.', 'DPS', 'MANA'),
(9, 'Druida', 'Cambiaformas que pueden cumplir cualquier rol: tanque, sanador, dano cuerpo a cuerpo o a distancia.', 'HYBRID', 'MANA')
ON CONFLICT (id) DO NOTHING;

-- ==================== ZONAS - MUNDO ABIERTO ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(1, 'Bosque de Elwynn', 'Un tranquilo bosque al sur de Ciudad de Ventormenta. Zona inicial para Humanos, con arroyos, colinas y la amenaza ocasional de kobolds y gnolls.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(2, 'Paramos de Poniente', 'Tierras de cultivo antano fertiles, ahora invadidas por la Hermandad Defias. La Milicia del Pueblo lucha por mantener el orden.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(3, 'Bosque del Ocaso', 'Un bosque oscuro y encantado perpetuamente envuelto en sombras. Huargen, no-muertos y otros horrores acechan entre los arboles.', 18, 30, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(4, 'Montanas Crestagrana', 'Una region montanosa bajo constante amenaza de orcos Roca Negra. El pueblo de Villalago es un bastion de la Alianza.', 15, 25, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(5, 'Ciudad de Ventormenta', 'Capital de la Alianza y del Reino de Ventormenta. Una majestuosa ciudad reconstruida tras la Primera Guerra.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(6, 'Dun Morogh', 'Tierras nevadas hogar de enanos y gnomos. Zona inicial para ambas razas, dominada por la gran montana de Forjaz.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(7, 'Loch Modan', 'Una region verdosa alrededor de un gran lago. Los enanos vigilan desde la Presa de Thandol.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(8, 'Teldrassil', 'El enorme arbol del mundo donde habitan los Elfos de la Noche. Zona inicial llena de espiritus corruptos.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 1, NULL),
(9, 'Costa Oscura', 'Costas boscosas al oeste de Kalimdor, punto de paso entre Teldrassil y el continente.', 10, 20, 'KALIMDOR', 'OPEN_WORLD', 1, NULL),
(10, 'Durotar', 'Una tierra aspera y rocosa en la costa oriental de Kalimdor. Zona inicial para Orcos y Trolls.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(11, 'Los Baldios', 'Una vasta sabana que se extiende por el centro de Kalimdor. Hogar de fauna diversa y la bulliciosa Encrucijada.', 10, 25, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(12, 'Mil Agujas', 'Un vasto canon lleno de imponentes pilares de piedra. Las Llanuras Relucientes albergan carreras goblin.', 25, 35, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(13, 'Sierra Espolon', 'Region montanosa en el centro de Kalimdor disputada por druidas y la Cia. Ventura.', 15, 27, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(14, 'Orgrimmar', 'Capital de la Horda, construida en los acantilados rojos de Durotar. Ciudad fortaleza de hierro y piedra.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(15, 'Mulgore', 'Vastas llanuras verdes hogar de los Tauren. Zona inicial con manadas de kodos y aguilas.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(16, 'Tirisfal', 'Bosques oscuros y tierras marchitas, hogar de los Renegados. Zona inicial para los No-Muertos.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 2, NULL),
(17, 'Silverpine', 'Bosques sombrios al sur de Tirisfal, plagados de huergen y no-muertos.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 2, NULL),
(18, 'Vallefresno', 'Antiguo bosque sagrado para los Elfos de la Noche pero ferozmente disputado por la Horda.', 18, 30, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(19, 'Vega de Tuercespina', 'Jungla densa llena de trolls, piratas y bestias. Los Gurubashi reconstruyen su imperio.', 30, 45, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(20, 'Tanaris', 'Vasto desierto hogar de Gadgetzan. Las Cavernas del Tiempo yacen ocultas bajo sus arenas.', 40, 50, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(21, 'Crater de Un''Goro', 'Crater primordial repleto de dinosaurios y flora exotica. Una tierra intacta por el tiempo.', 48, 55, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(22, 'Cuna del Invierno', 'Valle helado en las montanas del norte de Kalimdor. Hogar de dientes de sable y dragonantes.', 53, 60, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(23, 'Silithus', 'Desierto desolado plagado de Silithidos. Las puertas de Ahn''Qiraj se alzan al sur.', 55, 60, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(24, 'Tierras de la Peste del Este', 'Corazon del dominio de la Plaga. Tierra marchita centrada en la ciudadela de Stratholme.', 53, 60, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(25, 'Tierras de la Peste del Oeste', 'Tierras devastadas por la Plaga. El Alba Argenta lucha por recuperar este territorio.', 51, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(26, 'Las Estepas Ardientes', 'Tierras volcanicas al pie de la Montana Roca Negra. Orcos y dragones del vuelo negro.', 50, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(27, 'Feralas', 'Jungla tropical en el oeste de Kalimdor con antiguos templos Eldre''Thalas.', 40, 50, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(28, 'Las Tierras del Interior', 'Region salvaje hogar de los trolls Vilemortis y los enanos Pico Tormenta.', 40, 50, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(29, 'Desolace', 'Paramo arido en la costa oeste de Kalimdor. Territorio de centauros en guerra eterna.', 30, 40, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(30, 'Pantano de las Penas', 'Pantanos humedos y peligrosos al sureste de Reinos del Este, cerca del Portal Oscuro.', 35, 45, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(31, 'Las Tierras Devastadas', 'Region arida que rodea el Portal Oscuro. Demonios y orcos corruptos aun merodean.', 45, 55, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(32, 'Tierras de la Peste', 'Territorio devastado donde la Plaga sigue expandiendose sin control.', 50, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(33, 'Forjaz', 'Capital de los enanos, excavada en la Gran Forja bajo la Montana de Forjaz.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(34, 'Darnassus', 'Capital de los Elfos de la Noche, sobre las ramas de Teldrassil.', 1, 60, 'KALIMDOR', 'CITY', 1, NULL),
(35, 'Cima del Trueno', 'Capital Tauren construida sobre mesetas elevadas en Mulgore.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(36, 'Entranas', 'Capital de los Renegados, una ciudad subterranea bajo las ruinas de Lordaeron.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 2, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== MAZMORRAS ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(50, 'Simas Igneas', 'Mazmorra bajo Orgrimmar infestada de elementales de fuego y cultistas del clan Filo Ardiente.', 13, 18, 'KALIMDOR', 'DUNGEON', 2, NULL),
(51, 'Cuevas de los Lamentos', 'Red de cavernas en Los Baldios corrompida por druidas caidos del Sueno Esmeralda.', 15, 25, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(52, 'Las Minas de la Muerte', 'Fortaleza subterranea de la Hermandad Defias. Edwin VanCleef espera en su barco.', 17, 26, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(53, 'Castillo Colmillo Oscuro', 'Castillo maldito en Silverpine habitado por el archimago Arugal y sus huergen.', 22, 30, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(54, 'Las Mazmorras', 'La prision de Ciudad de Ventormenta tomada por prisioneros amotinados.', 22, 30, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(55, 'Cavernas de Brazanegra', 'Templo sumergido corrompido por el culto del Crepusculo y naga.', 24, 32, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(56, 'Gnomeregan', 'Capital gnoma caida, irradiada y tomada por troggs y leprosos gnomos.', 29, 38, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(57, 'Monasterio Escarlata', 'Fortaleza de la Cruzada Escarlata en Tirisfal. Cuatro alas llenas de fanaticos.', 26, 45, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(58, 'Horado Rajacieno', 'Guarida de los jabaespines Rajacieno en Los Baldios.', 30, 40, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(59, 'Zahurda Rajacieno', 'Catacumbas de jabaespines infestadas de no-muertos y el espiritu de Amnennar.', 37, 46, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(60, 'Uldaman', 'Excavacion enana que desvelo secretos de los Titanes. Troggs y golems la protegen.', 42, 52, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(61, 'Zul''Farrak', 'Ciudad troll en Tanaris, hogar de los trolls Furiarena que protegen antiguos tesoros.', 44, 54, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(62, 'Maraudon', 'Cueva sagrada en Desolace corrompida por la Princesa Theradras.', 46, 55, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(63, 'Templo Sumergido', 'Templo de Atal''Hakkar dedicado al dios de la sangre Hakkar.', 50, 56, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(64, 'Profundidades de Roca Negra', 'Enorme complejo del Emperador Thaurissan y los enanos Hierro Negro.', 52, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(65, 'Cumbre de Roca Negra Inferior', 'Estancias controladas por orcos Roca Negra y trolls Smolderthorn.', 55, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(66, 'Cumbre de Roca Negra Superior', 'Estancias superiores donde Rend Punonegro comanda sus fuerzas.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(67, 'La Masacre', 'Antiguos templos elficos en Feralas con tres alas: este, oeste y norte.', 56, 60, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(68, 'Stratholme', 'Ciudad caida de Lordaeron dividida entre la Plaga y la Cruzada Escarlata.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(69, 'Scholomance', 'Escuela de nigromancia donde se entrenan agentes de la Plaga.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== RAZAS ====================
INSERT INTO races (id, name, description, faction_id) VALUES
(1, 'Humano', 'Resilientes y adaptables, los humanos son una de las razas mas jovenes de Azeroth. Su determinacion los convierte en aliados formidables.', 1),
(2, 'Enano', 'Robustos y fuertes, los enanos son una raza ancestral de mineros y guerreros de las profundidades de Khaz Modan.', 1),
(3, 'Elfo de la Noche', 'Antiguos y sabios, los elfos de la noche son guardianes inmortales de la naturaleza.', 1),
(4, 'Gnomo', 'Inventivos y curiosos, los gnomos son brillantes ingenieros que buscan recuperar Gnomeregan.', 1),
(5, 'Orco', 'Guerreros orgullosos y feroces de Draenor, buscando honor bajo el liderazgo de Thrall.', 2),
(6, 'No-Muerto', 'Renegados que se liberaron del Rey Exanime. Luchan por encontrar su lugar en el mundo.', 2),
(7, 'Tauren', 'Nobles y pacificos, profundamente conectados con la naturaleza y la Madre Tierra.', 2),
(8, 'Troll', 'Astutos y espirituales, los trolls Lanza Negra son leales aliados de la Horda.', 2)
ON CONFLICT (id) DO NOTHING;

-- ==================== RELACIONES RAZA-CLASE ====================
INSERT INTO race_class (race_id, class_id) VALUES (1,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,2) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,8) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,2) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,9) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,8) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,8) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,8) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,9) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,7) ON CONFLICT DO NOTHING;

-- ==================== PROFESIONES ====================
INSERT INTO professions (id, name, description, type) VALUES
(1, 'Alquimia', 'Crea pociones, elixires y frascos a partir de hierbas.', 'PRIMARY'),
(2, 'Herreria', 'Forja armas y armaduras a partir de barras de metal.', 'PRIMARY'),
(3, 'Encantamiento', 'Encanta armas y armaduras con propiedades magicas.', 'PRIMARY'),
(4, 'Ingenieria', 'Crea artilugios, explosivos y dispositivos mecanicos.', 'PRIMARY'),
(5, 'Herboristeria', 'Recolecta hierbas del mundo para alquimia.', 'PRIMARY'),
(6, 'Peleteria', 'Confecciona armaduras de cuero y malla.', 'PRIMARY'),
(7, 'Mineria', 'Extrae mineral y gemas de vetas minerales.', 'PRIMARY'),
(8, 'Desuello', 'Desuella bestias para obtener cuero y pieles.', 'PRIMARY'),
(9, 'Sastreria', 'Crea armaduras de tela y bolsas.', 'PRIMARY'),
(10, 'Cocina', 'Prepara comida que otorga mejoras temporales.', 'SECONDARY'),
(11, 'Primeros Auxilios', 'Crea vendas para curar heridas fuera de combate.', 'SECONDARY'),
(12, 'Pesca', 'Pesca en masas de agua de todo Azeroth.', 'SECONDARY')
ON CONFLICT (id) DO NOTHING;

-- ====================================================================
-- JEFES DE MAZMORRA — 20 mazmorras, ~80 bosses
-- ====================================================================

-- SIMAS IGNEAS (50)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(1, 'Oggleflint', 'Lider trogg de las Simas Igneas.', 'Un trogg inusualmente inteligente que ha reunido a su especie en las profundidades bajo Orgrimmar.', 16, 1600, 50),
(2, 'Taragaman el Hambriento', 'Demonio satiro de las Simas.', 'Un satiro invocado por los cultistas del Filo Ardiente que se alimenta del fuego de las simas.', 16, 1800, 50),
(3, 'Jergosh el Invocador', 'Brujo orco del clan Filo Ardiente.', 'Un orco corrupto que canaliza energia demoniaca en las profundidades, amenazando la estabilidad de Orgrimmar.', 16, 1900, 50),
(4, 'Bazzalan', 'Satiro lider del Filo Ardiente en las Simas.', 'El satiro que lidera las fuerzas demoniaca bajo Orgrimmar. Su derrota es vital para la seguridad de la capital.', 17, 2100, 50);

-- CUEVAS DE LOS LAMENTOS (51)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(5, 'Lady Anacondra', 'Druida corrupta por el Sueno Esmeralda.', 'Una de los Lideres de los Colmillos, corrompida por la pesadilla que invade las cuevas.', 20, 2200, 51),
(6, 'Lord Cobrahn', 'Druida serpiente corrupto.', 'Fue un druida prometedor antes de caer bajo la influencia de la corrupcion del Sueno Esmeralda.', 20, 2300, 51),
(7, 'Kresh', 'Tortuga gigante de las cavernas.', 'Una tortuga ancestral de caparazon petreo que habita las aguas subterraneas desde tiempos inmemoriales.', 20, 2500, 51),
(8, 'Lord Serpentis', 'El mas peligroso de los druidas Colmillo.', 'Entregado por completo a la corrupcion, busca extender la pesadilla mas alla de las cuevas.', 21, 2800, 51),
(9, 'Verdan el Eterno', 'Elemental vegetal gigantesco.', 'Una manifestacion de la corrupcion natural que ha crecido hasta proporciones descomunales en las cavernas.', 21, 3000, 51),
(10, 'Mutanus el Devorador', 'Aberracion de la pesadilla del Sueno.', 'La manifestacion fisica de la corrupcion. Solo aparece cuando el ritual de purificacion despierta su furia.', 22, 3200, 51);

-- LAS MINAS DE LA MUERTE (52)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(11, 'Rhahk''Zor', 'Ogro guardian de las Minas.', 'Un ogro reclutado por la Hermandad Defias para vigilar la entrada. Su fuerza bruta es legendaria.', 17, 1800, 52),
(12, 'Sneed', 'Goblin ingeniero en su trituradora.', 'Supervisa las operaciones de talado. Se oculta dentro de su trituradora mecanica gigante.', 19, 2100, 52),
(13, 'Gilnid', 'Goblin fundidor de la forja Defias.', 'Dirige la fundicion donde se fabrican las armas de la Hermandad. El calor de su forja es infernal.', 20, 2400, 52),
(14, 'Mr. Smite', 'Primer oficial tauren del barco Defias.', 'Un tauren renegado que sirve como primer oficial del barco de VanCleef. Cambia de arma durante el combate.', 20, 3000, 52),
(15, 'Edwin VanCleef', 'Lider de la Hermandad Defias.', 'Maestro albanil que reconstruyo Ventormenta. Cuando la nobleza se nego a pagar, juro venganza y formo la Hermandad desde las profundidades de las minas.', 21, 4200, 52);

-- CASTILLO COLMILLO OSCURO (53)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(16, 'Razatormenta', 'Huargen enrabietado del castillo.', 'Una de las primeras criaturas transformadas por Arugal. Su furia es incontrolable.', 20, 2000, 53),
(17, 'Baron Silverlaine', 'Fantasma del antiguo senor del castillo.', 'El dueno original del Castillo Colmillo Oscuro. Su espiritu vaga por los pasillos buscando venganza.', 24, 2600, 53),
(18, 'Comandante Springvale', 'Caballero no-muerto al servicio de Arugal.', 'Antiguo paladin de Lordaeron, ahora sirviente no-muerto del archimago loco.', 24, 2700, 53),
(19, 'Odo el Ciego', 'Huargen murcielago monstruoso.', 'Transformado en criatura alada por los experimentos de Arugal. Patrulla las torres del castillo.', 24, 2800, 53),
(20, 'Fenrus el Devorador', 'Gran lobo espectral de Arugal.', 'El lobo mascota favorito de Arugal, imbuido con poderosa magia arcana oscura.', 25, 3000, 53),
(21, 'Archimago Arugal', 'Mago loco que invoco a los huargen.', 'Mago de Dalaran que invoco huargen de otra dimension contra la Plaga. Enloquecio y ahora los trata como hijos.', 26, 3800, 53);

-- LAS MAZMORRAS (54)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(22, 'Targorr el Terror', 'Prisionero orco liberado.', 'Un orco brutal que ha tomado el control de una seccion de la prision tras el motin.', 24, 2200, 54),
(23, 'Kam Pezhondo', 'Enano Hierro Negro encarcelado.', 'Un enano Hierro Negro capturado que ha aprovechado el caos para hacerse con poder.', 27, 2600, 54),
(24, 'Bazil Thredd', 'Lider del motin Defias en la prision.', 'Agente Defias infiltrado que orquesto el motin desde dentro de Las Mazmorras.', 29, 2800, 54),
(25, 'Dextren Ward', 'Asesino peligroso encarcelado.', 'Un asesino a sueldo tan peligroso que fue encerrado en la celda mas profunda de la prision.', 26, 2500, 54);

-- CAVERNAS DE BRAZANEGRA (55)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(26, 'Ghamoo-Ra', 'Tortuga marina gigante corrompida.', 'Una tortuga ancestral corrompida por la oscuridad que emana del templo sumergido.', 25, 2400, 55),
(27, 'Lady Sarevess', 'Naga hechicera del templo.', 'Una naga que busca los secretos arcanos ocultos en las profundidades de Brazanegra.', 25, 2600, 55),
(28, 'Gelihast', 'Murloc chamán de las cavernas.', 'Lider murloc que venera a las antiguas entidades que habitan bajo las aguas.', 26, 2500, 55),
(29, 'Señor del Crepusculo Kelris', 'Lider del culto del Crepusculo.', 'Un elfo de la noche que traiciono a su pueblo y ahora sirve a los Dioses Antiguos desde el templo.', 27, 3200, 55),
(30, 'Aku''mai', 'Hidra del Vacio.', 'Una hidra corrupta por los Dioses Antiguos que habita en lo mas profundo de las cavernas.', 28, 3800, 55);

-- GNOMEREGAN (56)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(31, 'Grubbis', 'Lider trogg de Gnomeregan.', 'Un trogg que ha establecido su dominio en las secciones superiores de la ciudad gnoma caida.', 30, 2800, 56),
(32, 'Desecho Viscoso', 'Ooze radiactivo gigante.', 'Una masa de residuos toxicos que ha cobrado vida propia debido a la radiacion de Gnomeregan.', 30, 3000, 56),
(33, 'Electrocutor 6000', 'Robot de defensa gnomo corrupto.', 'Un robot de seguridad que sigue sus protocolos de defensa contra cualquier intruso, aliado o enemigo.', 32, 3200, 56),
(34, 'Apisonador 9-60', 'Golem mecanico gnomo.', 'Una maquina de combate gnoma que ha sido reprogramada por Termochufe para eliminar intrusos.', 32, 3400, 56),
(35, 'Megaingeniero Termochufe', 'Traidor gnomo que irradio Gnomeregan.', 'El consejero que convencio al Alto Manitas Mekkatorque de irradiar la ciudad, supuestamente contra los troggs. En realidad, busca el poder para si mismo.', 34, 5200, 56);

-- MONASTERIO ESCARLATA (57)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(36, 'Interrogador Vishas', 'Torturador de la Cruzada Escarlata.', 'Un sadico interrogador que disfruta atormentando a los prisioneros en las camaras de tortura del Monasterio.', 32, 2800, 57),
(37, 'Hemomante Thalnos', 'Mago de sangre no-muerto Escarlata.', 'Un antiguo mago escarlata que fue asesinado y resucitado, pero la Cruzada lo mantiene encadenado.', 33, 3000, 57),
(38, 'Maestro de Canes Loksey', 'Entrenador de perros de la Cruzada.', 'Responsable de los feroces perros de guerra escarlata que patrullan la biblioteca del Monasterio.', 34, 3200, 57),
(39, 'Arcanista Doan', 'Mago protector de la biblioteca.', 'Guardian de los textos sagrados de la Cruzada. Usa poderosa magia arcana y su escudo de fuego es legendario.', 37, 3800, 57),
(40, 'Herodes', 'Campeon de la Cruzada Escarlata.', 'El campeon guerrero de la Cruzada. Su Torbellino es temido por todos los que se enfrentan a el en la armeria.', 40, 4800, 57),
(41, 'Comandante Escarlata Mograine', 'Lider militar del Monasterio.', 'Hijo del legendario Ashbringer, lidera la defensa militar del Monasterio con inquebrantable fanatismo.', 42, 5400, 57),
(42, 'Gran Inquisidora Melenablanca', 'Alta sacerdotisa de la Cruzada.', 'La lider espiritual del Monasterio. Posee el poder de resucitar a los caidos, incluido el Comandante Mograine.', 42, 4200, 57);

-- HORADO RAJACIENO (58)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(43, 'Malaciervo Aggem', 'Chaman jabaespin.', 'Un poderoso chaman que canaliza la magia de la tierra para proteger el horado de los intrusos.', 33, 3000, 58),
(44, 'Portavoz de la Muerte Jargba', 'Lider espiritual jabaespin.', 'Un brujo jabaespin que se comunica con los espiritus de los muertos para guiar a su tribu.', 34, 3200, 58),
(45, 'Señor Supremo Cuernocarero', 'Lider militar jabaespin.', 'El jefe guerrero de los Rajacieno, un jabaespin de enorme tamano que empuna un hacha descomunal.', 36, 4000, 58),
(46, 'Charlga Filonavaja', 'Matriarca de los Rajacieno.', 'La verdadera lider de la tribu. Una hechicera astuta que trama la expansion de los jabaespines.', 38, 4400, 58);

-- ZAHURDA RAJACIENO (59)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(47, 'Tuten''kash', 'Araña gigante no-muerta.', 'Una araña monstruosa resucitada por la nigromancia que infesta las catacumbas superiores.', 40, 3800, 59),
(48, 'Mordresh Ojo de Fuego', 'Esqueleto brujo de las catacumbas.', 'Un esqueleto que comanda legiones de no-muertos menores con magia de fuego desde su trono de huesos.', 39, 3600, 59),
(49, 'Gloton', 'Abominacion no-muerta.', 'Una masa grotesca de carne reanimada que devora todo a su paso en las profundidades de la zahurda.', 40, 4200, 59),
(50, 'Amnennar el Gelido', 'Liche senor de la Zahurda Rajacieno.', 'Un poderoso liche enviado por la Plaga para corromper a los jabaespines y convertirlos en no-muertos.', 42, 5000, 59);

-- ULDAMAN (60)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(51, 'Revelosh', 'Guardian trogg de Uldaman.', 'Un trogg que ha aprendido a usar los cristales de los Titanes como arma contra los intrusos.', 44, 4000, 60),
(52, 'Ironaya', 'Constructo titan de Uldaman.', 'Una guardiana titan que despierta cuando los intrusos se acercan demasiado a los secretos de la boveda.', 45, 4800, 60),
(53, 'Galgann Martillofuego', 'Enano Hierro Negro excavador.', 'Lider de la expedicion Hierro Negro que busca los artefactos titan en las profundidades de Uldaman.', 45, 4400, 60),
(54, 'Grimlok', 'Lider trogg chaman.', 'El trogg mas poderoso de Uldaman, capaz de invocar elementales de piedra para proteger las camaras interiores.', 45, 4200, 60),
(55, 'Archaedas', 'Guardian titan de la boveda final.', 'El guardian supremo de Uldaman, un coloso de piedra creado por los Titanes para proteger los discos de informacion.', 47, 7200, 60);

-- ZUL'FARRAK (61)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(56, 'Antu''sul', 'Sumo sacerdote troll de los basiliscos.', 'Controla a los basiliscos de Zul''Farrak mediante antiguos rituales de dominacion troll.', 48, 5000, 61),
(57, 'Theka el Martir', 'Troll sagrado de los Furiarena.', 'Un troll venerado que se transforma en escarabajo al borde de la muerte, un poder otorgado por los antiguos loas.', 46, 4200, 61),
(58, 'Brujo Zum''rah', 'Nigromante troll de Zul''Farrak.', 'Un brujo que ha aprendido nigromancia y resucita a los trolls caidos para aumentar su ejercito.', 46, 4600, 61),
(59, 'Hidromante Velratha', 'Hechicera troll del agua.', 'Guardiana de la Vara de Sul, un poderoso artefacto que controla las arenas de Tanaris.', 48, 5200, 61),
(60, 'Jefe Ukorz Cabezascalpe', 'Jefe supremo de los trolls Furiarena.', 'El lider guerrero de la tribu. Lucha junto a su guardian personal en la sala del trono de Zul''Farrak.', 48, 6000, 61);

-- MARAUDON (62)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(61, 'Noxxion', 'Elemental vegetal corrupto.', 'Una manifestacion de la corrupcion que se ha apoderado de la entrada de Maraudon.', 48, 4800, 62),
(62, 'Razorlash', 'Lasher gigante espinoso.', 'Una planta carnivora descomunal que ha crecido alimentandose de la energia corrupta del lugar.', 48, 5000, 62),
(63, 'Lord Lenguavil', 'Satiro senor de Maraudon.', 'Un satiro que se ha apoderado de las secciones superiores de la cueva sagrada.', 49, 5200, 62),
(64, 'Corrimiento', 'Elemental de tierra gigante.', 'Un elemental nacido de la ira de la tierra corrupta. Su poder sisimico sacude toda la caverna.', 50, 5800, 62),
(65, 'Princesa Theradras', 'Elemental hija de Therazane.', 'Hija de la Senora de la Tierra. Su union con el semidios Zaetar produjo a los centauros y corrompio Maraudon.', 51, 8000, 62);

-- TEMPLO SUMERGIDO (63)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(66, 'Atal''alarion', 'Guardian troll del templo.', 'Un golem de piedra animado por magia troll Atal''ai para proteger la entrada del templo.', 50, 5400, 63),
(67, 'Sonosueno', 'Dragon verde corrupto.', 'Un dragon del vuelo verde atrapado en el templo y corrupto por la influencia de Hakkar.', 53, 5800, 63),
(68, 'Jammal''an el Profeta', 'Sumo sacerdote de Hakkar.', 'Lider del culto Atal''ai que busca invocar al dios de la sangre Hakkar al mundo mortal.', 54, 6200, 63),
(69, 'Sombra de Eranikus', 'Esencia del dragon Eranikus.', 'La sombra del guardian dragon verde Eranikus, corrupta por la pesadilla del Sueno Esmeralda.', 55, 7800, 63);

-- PROFUNDIDADES DE ROCA NEGRA (64)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(70, 'Gran Interrogadora Gerstahn', 'Sacerdotisa Hierro Negro.', 'Encargada de extraer informacion a los prisioneros en las celdas de las Profundidades.', 52, 5600, 64),
(71, 'Lord Roccor', 'Elemental de fuego guardian.', 'Un elemental de roca fundida que custodia las entradas a las secciones mas profundas.', 51, 5200, 64),
(72, 'Finoso Oscurvira', 'Arquitecto jefe Hierro Negro.', 'El enano responsable de la construccion y mantenimiento de las enormes estructuras subterraneas.', 54, 5800, 64),
(73, 'General Forjafuria', 'General del ejercito Hierro Negro.', 'Comanda las fuerzas militares en las Profundidades. Su disciplina es ferrea y su crueldad legendaria.', 57, 7000, 64),
(74, 'Señor de los Golems Argelmach', 'Maestro golem Hierro Negro.', 'Creador de los golems que vigilan las Profundidades. Controla un ejercito de constructos de piedra y hierro.', 57, 7200, 64),
(75, 'Embajador Llamaraz', 'Emisario elemental de fuego.', 'Un elemental de fuego que sirve como enlace entre los Hierro Negro y el plano elemental de Ragnaros.', 57, 6800, 64),
(76, 'Emperador Dagran Thaurissan', 'Emperador de los enanos Hierro Negro.', 'El soberano de los enanos Hierro Negro, subyugado por Ragnaros. Mantiene cautiva a la princesa Moira Barbabronce.', 59, 12000, 64);

-- CUMBRE DE ROCA NEGRA INFERIOR (65)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(77, 'Alto Senor Omokk', 'Lider ogro de la Cumbre.', 'Un ogro brutalmente fuerte que gobierna sobre los ogros de las estancias inferiores con puno de hierro.', 59, 7400, 65),
(78, 'Maestro de Guerra Voone', 'Lider troll Smolderthorn.', 'Comanda a los trolls Smolderthorn que se han aliado con los orcos Roca Negra en la Cumbre.', 59, 7200, 65),
(79, 'Madre Brasalimosa', 'Araña gigante de la Cumbre.', 'Una araña colosal que ha tejido su tela en las secciones mas oscuras de las estancias inferiores.', 59, 6800, 65),
(80, 'Señor Supremo Vermithalak', 'Comandante dragonante negro.', 'El dragonante que lidera las fuerzas de Nefarian en las estancias inferiores de la Cumbre.', 60, 9600, 65);

-- CUMBRE DE ROCA NEGRA SUPERIOR (66)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(81, 'Piroguardia Brasalzar', 'Elemental de fuego enjaulado.', 'Un poderoso elemental de fuego mantenido cautivo por los orcos para ser usado como arma.', 60, 8200, 66),
(82, 'Jed Guardarunas', 'Orco hechicero de elite.', 'Un orco brujo que protege los pasillos superiores con poderosos hechizos de fuego y sombra.', 59, 7000, 66),
(83, 'Jefe de Guerra Rend Punonegro', 'Autoproclamado Jefe de Guerra.', 'Hijo de Punonegro, reclama el titulo de Jefe de Guerra de la Horda. Monta un dragon negro llamado Gyth.', 60, 11000, 66),
(84, 'La Bestia', 'Nucleo de magma gigante.', 'Una enorme criatura de fuego y roca que custodia la camara del general Drakkisath.', 60, 9800, 66),
(85, 'General Drakkisath', 'Dragonante lider al servicio de Nefarian.', 'El brazo derecho de Nefarian en la Cumbre. Custodia la entrada a la guarida del dragon negro.', 60, 12500, 66);

-- LA MASACRE (67)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(86, 'Zevrim Pesunaespino', 'Satiro senor del ala este.', 'Un satiro que se alimenta de las almas de los elfos atrapados en las ruinas de Eldre''Thalas.', 57, 6800, 67),
(87, 'Alzzin el Formacambiante', 'Satiro druida corrupto.', 'Un poderoso satiro que ha corrompido el jardin interior del ala este y lo ha convertido en una selva demoníaca.', 58, 8200, 67),
(88, 'Retorcedura Guardaleño', 'Ancestro arbol corrupto del ala oeste.', 'Un antiguo ancestro corrompido que bloquea el paso hacia las secciones interiores del ala oeste.', 57, 7000, 67),
(89, 'Immol''thar', 'Demonio del Vacio aprisionado.', 'Un poderoso demonio mantenido cautivo por los elfos para alimentar la barrera magica de Eldre''Thalas.', 59, 9400, 67),
(90, 'Principe Tortheldrin', 'Ultimo principe de Eldre''Thalas.', 'El elfo que sacrifico a sus propios subditos para mantener la barrera magica y alimentar a Immol''thar.', 60, 8800, 67),
(91, 'Rey Gordok', 'Lider ogro del ala norte.', 'El rey de los ogros Gordok que han ocupado el ala norte del templo. Puede ser desafiado al trono.', 60, 10000, 67);

-- STRATHOLME (68)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(92, 'El Imperdonable', 'Espectro vengativo de Stratholme.', 'El espiritu de un aldeano masacrado durante la Purga que ahora busca venganza contra todos los vivos.', 57, 6400, 68),
(93, 'Timmy el Cruel', 'Abominacion no-muerta.', 'Un ghoul especialmente sadico que merodea por las calles arruinadas de la ciudad.', 58, 7200, 68),
(94, 'Maestro de Canones Willey', 'Oficial Escarlata de artilleria.', 'Comanda las defensas de artilleria de la seccion Escarlata de Stratholme.', 58, 7400, 68),
(95, 'Archivista Galford', 'Guardian de los archivos Escarlata.', 'Custodia los registros secretos de la Cruzada Escarlata en su camara protegida.', 58, 7000, 68),
(96, 'Balnazzar', 'Señor del Terror disfrazado.', 'Un poderoso demonio Nathrezim que ha estado controlando la Cruzada Escarlata en secreto, disfrazado como el Gran Cruzado Saidan Dathrohan.', 60, 13000, 68),
(97, 'Baronesa Anastari', 'Banshee senora de la Plaga.', 'Una noble elfa convertida en banshee que controla la seccion no-muerta de Stratholme.', 59, 7800, 68),
(98, 'Nerub''enkan', 'Crypt lord nerubian.', 'Un nerubian al servicio de la Plaga que ha traido su ejercito de aranas no-muertas a Stratholme.', 59, 7600, 68),
(99, 'Ramstein el Empachador', 'Abominacion gigante.', 'La abominacion mas grande y repugnante de Stratholme. Guardia las puertas del Baron Rivendare.', 60, 9200, 68),
(100, 'Baron Rivendare', 'Señor no-muerto de Stratholme.', 'Un antiguo noble humano que sirvio voluntariamente a la Plaga. Gobierna Stratholme desde su trono de huesos y monta un corcel de la muerte.', 60, 14000, 68);

-- SCHOLOMANCE (69)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(101, 'Kirtonos el Heraldo', 'Vampiro guardian de Scholomance.', 'Un poderoso vampiro invocado mediante un ritual de sangre que sirve como guardian exterior de la escuela.', 60, 8000, 69),
(102, 'Jandice Barov', 'Maga ilusionista no-muerta.', 'Miembro de la familia Barov que crea copias ilusorias de si misma para confundir a los intrusos.', 59, 7400, 69),
(103, 'Trinquete', 'Constructo de huesos gigante.', 'Un golem ensamblado con los huesos de cientos de victimas. Su sola presencia hiela la sangre.', 60, 8800, 69),
(104, 'Ras Frostwhisper', 'Liche maestro de Scholomance.', 'Un poderoso liche que ensena las artes de la nigromancia a los aprendices de la Plaga.', 60, 10200, 69),
(105, 'Doctor Theolen Krastinov', 'El Carnicero de Scholomance.', 'Un sadico doctor que experimenta con los vivos y los muertos en sus laboratorios de terror.', 60, 9000, 69),
(106, 'Señor Alexei Barov', 'Noble Barov no-muerto.', 'Uno de los senores de la familia Barov que vendio su alma a la Plaga a cambio de poder eterno.', 60, 8600, 69),
(107, 'Señora Illucia Barov', 'Noble Barov no-muerta.', 'Hermana de Alexei, igualmente corrompida. Usa magia de sombras y control mental contra sus enemigos.', 60, 8400, 69),
(108, 'Maestro Oscuro Gandling', 'Director de Scholomance.', 'El rector de la escuela de nigromancia. Teletransporta a sus victimas a aulas llenas de no-muertos para examinarlos.', 60, 14500, 69);

-- ====================================================================
-- BOTIN (LOOT) — Items iconicos por boss
-- ====================================================================

-- SIMAS IGNEAS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(1, 'Bastón de Oggleflint', 'Un baston primitivo pero sorprendentemente resistente.', 'UNCOMMON', 'Baston', 35.0, 1),
(2, 'Hoja Subterranea', 'Una espada corta forjada en el calor de las simas.', 'UNCOMMON', 'Espada a una mano', 28.0, 2),
(3, 'Tunica del Invocador', 'Tunica raida pero imbuida de energia demoniaca.', 'UNCOMMON', 'Pechera de tela', 30.0, 3),
(4, 'Hoja de Bazzalan', 'Daga curva del lider satiro.', 'RARE', 'Daga', 25.0, 4);

-- CUEVAS DE LOS LAMENTOS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(5, 'Cinturon de Escamas de Anacondra', 'Cinturon tejido con escamas encantadas.', 'UNCOMMON', 'Cinturon de cuero', 28.0, 5),
(6, 'Colmillos de Serpiente', 'Dagas gemelas imbuidas con veneno de cobra.', 'RARE', 'Daga', 15.0, 6),
(7, 'Caparazon de Kresh', 'Escudo natural de caparazon petreo.', 'RARE', 'Escudo', 35.0, 7),
(8, 'Baston del Sueno Corrompido', 'Baston que pulsa con energia de pesadilla.', 'RARE', 'Baston', 14.0, 8),
(9, 'Espada Viviente', 'Espada que parece crecer como una planta.', 'RARE', 'Espada a dos manos', 18.0, 9),
(10, 'Garra del Devorador', 'Daga extraida de las fauces de Mutanus.', 'RARE', 'Daga', 22.0, 10);

-- LAS MINAS DE LA MUERTE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(11, 'Martillo de Rhahk''Zor', 'Pesado martillo de guerra del ogro guardian.', 'RARE', 'Maza a dos manos', 33.0, 11),
(12, 'Hacha de Sneed', 'Hacha ligera escondida en los engranajes de la trituradora.', 'RARE', 'Hacha a una mano', 18.0, 12),
(13, 'Guantes del Fundidor', 'Guantes resistentes al calor de la forja Defias.', 'UNCOMMON', 'Guantes de malla', 30.0, 13),
(14, 'Martillo de Smite', 'Enorme martillo del primer oficial tauren.', 'RARE', 'Maza a dos manos', 22.0, 14),
(15, 'Espada Cruel de VanCleef', 'Hoja oscura que emana malicia.', 'RARE', 'Espada a una mano', 15.5, 15),
(16, 'Pechera del Cabecilla Defias', 'Armadura de cuero del lider de la Hermandad.', 'RARE', 'Pechera de cuero', 12.0, 15),
(17, 'Capa de Seda Roja', 'Elegante capa escarlata, simbolo de autoridad.', 'UNCOMMON', 'Capa', 20.0, 15);

-- CASTILLO COLMILLO OSCURO
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(18, 'Cinturon de Razatormenta', 'Cinturon desgarrado por garras de huargen.', 'UNCOMMON', 'Cinturon de cuero', 30.0, 16),
(19, 'Espada Fantasmal de Silverlaine', 'Espada eterea con brillo espectral.', 'RARE', 'Espada a una mano', 16.0, 17),
(20, 'Escudo del Comandante Springvale', 'Escudo del antiguo paladin.', 'UNCOMMON', 'Escudo', 24.0, 18),
(21, 'Alas Oscuras de Odo', 'Hombreras de membranas alares.', 'RARE', 'Hombreras de cuero', 14.0, 19),
(22, 'Cinturon de Fenrus', 'Cinturon de piel de lobo espectral.', 'UNCOMMON', 'Cinturon de cuero', 26.0, 20),
(23, 'Tunica de Arugal', 'Vestiduras arcanas del archimago enloquecido.', 'RARE', 'Pechera de tela', 12.0, 21),
(24, 'Cinturon de Arugal', 'Cinturon bordado con runas de invocacion.', 'RARE', 'Cinturon de tela', 18.0, 21),
(25, 'Colmillo de Sombras', 'Espada legendaria imbuida con oscuridad.', 'RARE', 'Espada a una mano', 3.5, 21);

-- LAS MAZMORRAS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(26, 'Grilletes de Targorr', 'Grilletes rotos convertidos en arma improvisada.', 'UNCOMMON', 'Maza a una mano', 30.0, 22),
(27, 'Martillo de Kam', 'Martillo Hierro Negro de manufactura sólida.', 'UNCOMMON', 'Maza a una mano', 25.0, 23),
(28, 'Capa de Bazil Thredd', 'Capa del conspirador Defias.', 'UNCOMMON', 'Capa', 28.0, 24);

-- CAVERNAS DE BRAZANEGRA
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(29, 'Caparazon de Ghamoo-Ra', 'Escudo de caparazon de tortuga corrupta.', 'RARE', 'Escudo', 30.0, 26),
(30, 'Baston de las Profundidades', 'Baston encontrado en las aguas negras.', 'RARE', 'Baston', 20.0, 27),
(31, 'Ojos de Aku''mai', 'Gema preciosa arrancada de la hidra.', 'RARE', 'Accesorio', 18.0, 30),
(32, 'Capa de las Mareas Oscuras', 'Capa que parece fluir como agua.', 'RARE', 'Capa', 22.0, 29);

-- GNOMEREGAN
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(33, 'Sable Electrocutor', 'Espada que chisporrotea con electricidad.', 'RARE', 'Espada a una mano', 20.0, 33),
(34, 'Puños del Apisonador', 'Guanteletes mecanicos de increible potencia.', 'RARE', 'Guantes de malla', 22.0, 34),
(35, 'Casco de Termochufe', 'Casco ingenieril con visor irradiado.', 'RARE', 'Casco de malla', 15.0, 35),
(36, 'Bastón Irradiado', 'Baston que emite un tenue brillo verdoso.', 'RARE', 'Baston', 18.0, 35);

-- MONASTERIO ESCARLATA
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(37, 'Guantes del Interrogador', 'Guantes manchados de sangre del torturador.', 'UNCOMMON', 'Guantes de cuero', 30.0, 36),
(38, 'Daga de Thalnos', 'Daga de hemomante que drena vida.', 'RARE', 'Daga', 20.0, 37),
(39, 'Collar de Perros de Loksey', 'Collar reforzado con pinchos.', 'UNCOMMON', 'Accesorio', 28.0, 38),
(40, 'Manto del Arcanista Doan', 'Manto arcano de gran poder magico.', 'RARE', 'Hombreras de tela', 18.0, 39),
(41, 'Hacha del Campeon Herodes', 'El hacha del Campeon. Su Torbellino es legendario.', 'RARE', 'Hacha a una mano', 15.0, 40),
(42, 'Yelmo de Herodes', 'Yelmo imponente del campeon escarlata.', 'RARE', 'Casco de malla', 12.0, 40),
(43, 'Hoja de la Mano de Justicia de Mograine', 'Espada bendita del comandante escarlata.', 'RARE', 'Espada a una mano', 14.0, 41),
(44, 'Capucha de Melenablanca', 'Capucha de la inquisidora con poderes curativos.', 'RARE', 'Casco de tela', 16.0, 42);

-- HORADO RAJACIENO
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(45, 'Baston del Malaciervo', 'Baston de chaman jabaespin.', 'UNCOMMON', 'Baston', 28.0, 43),
(46, 'Hacha de Cuernocarero', 'Enorme hacha del senor supremo.', 'RARE', 'Hacha a dos manos', 20.0, 45),
(47, 'Corazon de Filonavaja', 'Amuleto de la matriarca jabaespin.', 'RARE', 'Accesorio', 15.0, 46);

-- ZAHURDA RAJACIENO
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(48, 'Colmillo de Tuten''kash', 'Colmillo venenoso de la araña no-muerta.', 'UNCOMMON', 'Daga', 28.0, 47),
(49, 'Sable Igneo de Mordresh', 'Espada envuelta en llamas espectrales.', 'RARE', 'Espada a una mano', 18.0, 48),
(50, 'Filoescarcha de Amnennar', 'Espada del liche imbuida con frio mortal.', 'RARE', 'Espada a una mano', 15.0, 50),
(51, 'Capa Helada del Liche', 'Capa que emana frio sobrenatural.', 'RARE', 'Capa', 20.0, 50);

-- ULDAMAN
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(52, 'Medallón de Ironaya', 'Medallon titan de increible manufactura.', 'RARE', 'Accesorio', 22.0, 52),
(53, 'Martillo de Galgann', 'Martillo de guerra Hierro Negro.', 'RARE', 'Maza a una mano', 18.0, 53),
(54, 'Piedra de Archaedas', 'Fragmento del guardian titan.', 'RARE', 'Accesorio', 12.0, 55),
(55, 'Espada del Arcano Titan', 'Espada forjada con tecnologia titan.', 'RARE', 'Espada a una mano', 10.0, 55);

-- ZUL'FARRAK
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(56, 'Aguijon de Antu''sul', 'Lanza hecha con aguijon de basilisco.', 'RARE', 'Lanza', 20.0, 56),
(57, 'Escarabeo de Theka', 'Amuleto que protege de la muerte.', 'RARE', 'Accesorio', 15.0, 57),
(58, 'Vara de Velratha', 'Vara magica que controla las aguas.', 'RARE', 'Baston', 18.0, 59),
(59, 'Gran Hacha de Ukorz', 'Hacha enorme del jefe troll.', 'RARE', 'Hacha a dos manos', 16.0, 60);

-- MARAUDON
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(60, 'Semilla de Noxxion', 'Semilla corrupta de poder vegetal.', 'UNCOMMON', 'Accesorio', 30.0, 61),
(61, 'Garras de Razorlash', 'Garras espinosas de la planta gigante.', 'RARE', 'Daga', 20.0, 62),
(62, 'Maza del Corrimiento', 'Maza de roca fundida por fuerza elemental.', 'RARE', 'Maza a una mano', 18.0, 64),
(63, 'Cuchilla de la Princesa', 'Daga cristalina de la hija de Therazane.', 'RARE', 'Daga', 14.0, 65),
(64, 'Gema de la Princesa Theradras', 'Gema de tierra de inmenso poder elemental.', 'EPIC', 'Accesorio', 8.0, 65);

-- TEMPLO SUMERGIDO
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(65, 'Hacha del Guardian de Piedra', 'Hacha arrancada del golem Atal''ai.', 'RARE', 'Hacha a una mano', 22.0, 66),
(66, 'Aliento del Dragon Verde', 'Baston imbuido con aliento de dragon.', 'RARE', 'Baston', 16.0, 67),
(67, 'Sable del Profeta', 'Espada ritual de Jammal''an.', 'RARE', 'Espada a una mano', 14.0, 68),
(68, 'Esencia de Eranikus', 'Fragmento del poder del dragon corrompido.', 'EPIC', 'Accesorio', 10.0, 69);

-- PROFUNDIDADES DE ROCA NEGRA
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(69, 'Latigo de la Interrogadora', 'Latigo usado en los interrogatorios.', 'RARE', 'Maza a una mano', 20.0, 70),
(70, 'Nucleo Fundido de Roccor', 'Nucleo incandescente del elemental.', 'RARE', 'Accesorio', 18.0, 71),
(71, 'Escudo de Forjafuria', 'Escudo del general Hierro Negro.', 'RARE', 'Escudo', 16.0, 73),
(72, 'Yunque-puño de Argelmach', 'Guanteletes del senor de los golems.', 'RARE', 'Guantes de placas', 14.0, 74),
(73, 'Sello Imperial de Thaurissan', 'Anillo del Emperador Hierro Negro.', 'EPIC', 'Accesorio', 8.0, 76),
(74, 'Mano de Justicia', 'Legendario abalorios del Emperador.', 'EPIC', 'Accesorio', 5.0, 76);

-- CUMBRE INFERIOR
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(75, 'Espadón de Omokk', 'Enorme espada del Alto Senor ogro.', 'RARE', 'Espada a dos manos', 20.0, 77),
(76, 'Lanza de Voone', 'Lanza tribal del maestro troll.', 'RARE', 'Lanza', 18.0, 78),
(77, 'Mandibula de Brasalimosa', 'Mandibula de la araña gigante.', 'RARE', 'Daga', 22.0, 79),
(78, 'Gema del Senor Vermithalak', 'Gema oscura arrancada al dragonante.', 'EPIC', 'Accesorio', 10.0, 80);

-- CUMBRE SUPERIOR
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(79, 'Pirosable de Brasalzar', 'Espada de fuego elemental.', 'RARE', 'Espada a una mano', 18.0, 81),
(80, 'Casco de Rend Punonegro', 'Casco del autoproclamado Jefe de Guerra.', 'EPIC', 'Casco de placas', 12.0, 83),
(81, 'Colmillo de la Bestia', 'Colmillo del monstruo de fuego.', 'EPIC', 'Daga', 10.0, 84),
(82, 'Hoja de Sangre de Drakkisath', 'Espada del general dragonante.', 'EPIC', 'Espada a una mano', 8.0, 85),
(83, 'Llave de la Guarida del Ala Negra', 'Llave que abre la guarida de Nefarian.', 'EPIC', 'Llave', 100.0, 85);

-- LA MASACRE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(84, 'Guadana de Espinaciervo', 'Guadana retorcida del satiro.', 'RARE', 'Arma de asta', 20.0, 86),
(85, 'Baston de Alzzin', 'Baston corrupto del formacambiante.', 'RARE', 'Baston', 16.0, 87),
(86, 'Ojo de Immol''thar', 'Ojo del demonio del Vacio.', 'EPIC', 'Accesorio', 10.0, 89),
(87, 'Hoja del Principe Tortheldrin', 'Espada del ultimo principe elfo.', 'RARE', 'Espada a una mano', 14.0, 90),
(88, 'Tributo del Rey Gordok', 'Cofre de tesoros del rey ogro.', 'EPIC', 'Accesorio', 100.0, 91);

-- STRATHOLME
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(89, 'Grito del Imperdonable', 'Espada fantasmal que aulla al golpear.', 'RARE', 'Espada a una mano', 18.0, 92),
(90, 'Canones de Willey', 'Baston de artilleria escarlata.', 'RARE', 'Baston', 16.0, 94),
(91, 'Enciclopedia Escarlata', 'Texto sagrado de la Cruzada.', 'RARE', 'Reliquia', 20.0, 95),
(92, 'Cuernos del Senor del Terror', 'Cuernos arrancados al Nathrezim.', 'EPIC', 'Casco de placas', 8.0, 96),
(93, 'Gran Cruzado Reforjado', 'Espada reforjada del Senor del Terror.', 'EPIC', 'Espada a dos manos', 6.0, 96),
(94, 'Capa de la Baronesa', 'Capa espectral de la banshee.', 'RARE', 'Capa', 18.0, 97),
(95, 'Corcel de la Muerte de Rivendare', 'Las riendas del corcel del Baron. Extremadamente raro.', 'EPIC', 'Montura', 0.8, 100),
(96, 'Espada Rúnica del Baron', 'Espada runica del senor no-muerto.', 'EPIC', 'Espada a una mano', 5.0, 100),
(97, 'Capa del Baron', 'Capa oscura del gobernante de Stratholme.', 'RARE', 'Capa', 14.0, 100);

-- SCHOLOMANCE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(98, 'Colmillos de Kirtonos', 'Colmillos del vampiro guardian.', 'RARE', 'Daga', 20.0, 101),
(99, 'Esencia Ilusoria de Jandice', 'Gema que distorsiona la realidad.', 'RARE', 'Accesorio', 16.0, 102),
(100, 'Femur de Trinquete', 'Hueso gigante usado como maza.', 'RARE', 'Maza a dos manos', 22.0, 103),
(101, 'Baston Glacial de Ras', 'Baston del liche que congela el alma.', 'EPIC', 'Baston', 10.0, 104),
(102, 'Bisturi del Carnicero', 'Bisturi ensangrentado de Krastinov.', 'RARE', 'Daga', 18.0, 105),
(103, 'Capa de los Barov', 'Capa noble de la familia maldita.', 'RARE', 'Capa', 20.0, 106),
(104, 'Toga del Maestro Oscuro', 'Vestiduras del rector de Scholomance.', 'EPIC', 'Pechera de tela', 8.0, 108),
(105, 'Baculo de Gandling', 'Baculo que teletransporta a las victimas.', 'EPIC', 'Baston', 6.0, 108);

-- ==================== SINCRONIZAR SECUENCIAS ====================
SELECT setval(pg_get_serial_sequence('factions','id'), (SELECT COALESCE(MAX(id),1) FROM factions));
SELECT setval(pg_get_serial_sequence('character_classes','id'), (SELECT COALESCE(MAX(id),1) FROM character_classes));
SELECT setval(pg_get_serial_sequence('zones','id'), (SELECT COALESCE(MAX(id),1) FROM zones));
SELECT setval(pg_get_serial_sequence('races','id'), (SELECT COALESCE(MAX(id),1) FROM races));
SELECT setval(pg_get_serial_sequence('professions','id'), (SELECT COALESCE(MAX(id),1) FROM professions));
SELECT setval(pg_get_serial_sequence('bosses','id'), (SELECT COALESCE(MAX(id),1) FROM bosses));
SELECT setval(pg_get_serial_sequence('loot_items','id'), (SELECT COALESCE(MAX(id),1) FROM loot_items));
