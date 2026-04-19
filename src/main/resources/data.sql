-- ============================================================
-- DATOS INICIALES: World of Warcraft Clasico (Vanilla)
-- Todos los datos en español
-- Sincronizado con el frontend Android (Turtle WoW Companion)
-- Usa ON CONFLICT para evitar duplicados en cada reinicio
-- ============================================================

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
-- Zonas de la Alianza
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(1, 'Bosque de Elwynn', 'Un tranquilo bosque al sur de Ciudad de Ventormenta. Zona inicial para Humanos, con arroyos, colinas y la amenaza ocasional de kobolds y gnolls.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(2, 'Paramos de Poniente', 'Tierras de cultivo antano fertiles, ahora invadidas por la Hermandad Defias. La Milicia del Pueblo lucha por mantener el orden.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(3, 'Bosque del Ocaso', 'Un bosque oscuro y encantado al este de Paramos de Poniente, perpetuamente envuelto en sombras. Huergen, no-muertos y otros horrores acechan.', 18, 30, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(4, 'Montanas Crestagrana', 'Una region montanosa al este de Elwynn, bajo constante amenaza de orcos Roca Negra. El pueblo de Villalago es un bastion de la Alianza.', 15, 25, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(5, 'Ciudad de Ventormenta', 'Capital de la Alianza y del Reino de Ventormenta. Una majestuosa ciudad reconstruida tras la Primera Guerra.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(6, 'Dun Morogh', 'Tierras nevadas hogar de enanos y gnomos. Zona inicial para ambas razas, dominada por la gran montana de Ironforge.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(7, 'Loch Modan', 'Una region verdosa alrededor de un gran lago, hogar de troggs y kobolds. Los enanos vigilan desde la Presa de Thandol.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(8, 'Teldrassil', 'El enorme arbol del mundo donde habitan los Elfos de la Noche. Zona inicial para esta raza, llena de espiritus corruptos.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 1, NULL),
(9, 'Costa Oscura', 'Costas boscosas al oeste de Kalimdor, punto de paso entre Teldrassil y el continente. Amenazada por naga y satiros.', 10, 20, 'KALIMDOR', 'OPEN_WORLD', 1, NULL)
ON CONFLICT (id) DO NOTHING;

-- Zonas de la Horda
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(10, 'Durotar', 'Una tierra aspera y rocosa en la costa oriental de Kalimdor. Zona inicial para Orcos y Trolls, tierra de sol abrasador.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(11, 'Los Baldios', 'Una vasta sabana que se extiende por el centro de Kalimdor. Hogar de fauna diversa y la bulliciosa Encrucijada.', 10, 25, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(12, 'Mil Agujas', 'Un vasto canon lleno de imponentes pilares de piedra que se alzan desde el suelo desertico. Las Llanuras Relucientes albergan carreras goblin.', 25, 35, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(13, 'Sierra Espolon', 'Una region montanosa en el centro de Kalimdor disputada por druidas y la Cia. Ventura. La Horda mantiene fuerte presencia.', 15, 27, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(14, 'Orgrimmar', 'Capital de la Horda, construida en los acantilados rojos de Durotar. Ciudad fortaleza de hierro y piedra, sede del Jefe de Guerra.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(15, 'Mulgore', 'Vastas llanuras verdes, hogar de los Tauren. Zona inicial para esta raza, con manadas de kodos y aguilas planeando en el cielo.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(16, 'Tirisfal', 'Bosques oscuros y tierras marchitas, hogar de los Renegados. Zona inicial para los No-Muertos, con la capital Entranas bajo el suelo.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 2, NULL),
(17, 'Silverpine', 'Bosques sombrios al sur de Tirisfal, plagados de huergen y no-muertos. Los Renegados luchan por expandir su territorio.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 2, NULL)
ON CONFLICT (id) DO NOTHING;

-- Zonas Disputadas / Neutrales
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(18, 'Vallefresno', 'Un antiguo bosque en el norte de Kalimdor, sagrado para los Elfos de la Noche pero ferozmente disputado por la Horda.', 18, 30, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(19, 'Vega de Tuercespina', 'Una jungla densa llena de trolls, piratas y bestias salvajes. Los trolls Gurubashi reconstruyen su imperio en Zul''Gurub.', 30, 45, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(20, 'Tanaris', 'Un vasto desierto en el sur de Kalimdor, hogar de la ciudad portuaria de Gadgetzan. Las Cavernas del Tiempo yacen ocultas bajo sus arenas.', 40, 50, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(21, 'Crater de Un''Goro', 'Un crater exuberante y primordial repleto de dinosaurios y flora exotica. Una tierra intacta por el tiempo.', 48, 55, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(22, 'Cuna del Invierno', 'Un valle helado enclavado en las montanas del norte de Kalimdor. Hogar de gatos dientes de sable y dragonantes azules.', 53, 60, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(23, 'Silithus', 'Un desierto desolado en el suroeste de Kalimdor, plagado de los insectoides Silithidos. Las puertas de Ahn''Qiraj se alzan al sur.', 55, 60, 'KALIMDOR', 'CONTESTED', NULL, NULL),
(24, 'Tierras de la Peste del Este', 'El corazon del dominio de la Plaga en Lordaeron. La tierra esta marchita y repleta de no-muertos, centrada en Stratholme.', 53, 60, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(25, 'Tierras de la Peste del Oeste', 'Tierras devastadas por la Plaga en el norte de Reinos del Este. El Alba Argenta lucha por recuperar este territorio.', 51, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(26, 'Las Estepas Ardientes', 'Tierras volcanicas al pie de la Montana Roca Negra. Hogar de orcos Roca Negra y dragones del vuelo negro.', 50, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, NULL),
(27, 'Feralas', 'Jungla tropical en el oeste de Kalimdor. Hogar de ogros y los antiguos templos de los Eldre''Thalas.', 40, 50, 'KALIMDOR', 'CONTESTED', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== MAZMORRAS (Vanilla) ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(50, 'Simas Igneas', 'Mazmorra bajo Orgrimmar, infestada de elementales de fuego y troggs del clan Filo Ardiente.', 13, 18, 'KALIMDOR', 'DUNGEON', 2, NULL),
(51, 'Cuevas de los Lamentos', 'Red de cavernas en Los Baldios, corrompida por druidas caidos del Sueno Esmeralda.', 15, 25, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(52, 'Las Minas de la Muerte', 'Fortaleza subterranea de la Hermandad Defias bajo Paramos de Poniente. Edwin VanCleef espera en su barco.', 17, 26, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(53, 'Castillo de Shadowfang', 'Castillo maldito en Silverpine, habitado por el archimago Arugal y sus huergen.', 22, 30, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(54, 'Las Mazmorras', 'La prision de Ciudad de Ventormenta, tomada por prisioneros amotinados y miembros Defias.', 22, 30, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(55, 'Cavernas de Brazanegra', 'Templo sumergido en Costa Oscura, corrompido por el culto del Crepusculo y naga.', 24, 32, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(56, 'Gnomeregan', 'La capital gnoma caida, irradiada y tomada por troggs y lepers gnomos.', 29, 38, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(57, 'Monasterio Escarlata', 'Fortaleza de la Cruzada Escarlata en Tirisfal. Cuatro alas llenas de fanaticos.', 26, 45, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(58, 'Horado Rajacieno', 'Guarida de los jabaespines Rajacieno en Los Baldios.', 30, 40, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(59, 'Zahurda Rajacieno', 'Catacumbas de los jabaespines, infestadas de no-muertos y el espiritu de Amnennar el Gelido.', 37, 46, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(60, 'Uldaman', 'Excavacion de los enanos que desvelo secretos de los Titanes. Plagada de troggs y golems de piedra.', 42, 52, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(61, 'Zul''Farrak', 'Ciudad troll en el desierto de Tanaris, hogar de los trolls Sandfury que protegen antiguos tesoros.', 44, 54, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(62, 'Maraudon', 'Cueva sagrada en Desolace, corrompida por la influencia de la Princesa Theradras.', 46, 55, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(63, 'Templo Sumergido', 'Templo de Atal''Hakkar en el Pantano de las Penas, dedicado al dios de la sangre Hakkar.', 50, 56, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(64, 'Profundidades de Roca Negra', 'Enorme complejo subterraneo bajo la Montana Roca Negra, hogar de los enanos Hierro Negro y el Emperador Thaurissan.', 52, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(65, 'Cumbre de Roca Negra Inferior', 'Estancias inferiores de la Cumbre, controladas por orcos Roca Negra y trolls Smolderthorn.', 55, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(66, 'Cumbre de Roca Negra Superior', 'Estancias superiores donde el General Drakkisath comanda las fuerzas de Nefarian.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(67, 'La Masacre', 'Antiguos templos elficos en Feralas, habitados por ogros, satiros y espiritus arcanos. Tres alas distintas.', 56, 60, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(68, 'Stratholme', 'La ciudad caida de Lordaeron, dividida entre la Plaga y la Cruzada Escarlata.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(69, 'Scholomance', 'Escuela de nigromancia en las Tierras de la Peste del Oeste, donde se entrenan agentes de la Plaga.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== RAZAS ====================
INSERT INTO races (id, name, description, faction_id) VALUES
(1, 'Humano', 'Resilientes y adaptables, los humanos son una de las razas mas jovenes de Azeroth. Su determinacion los convierte en aliados formidables.', 1),
(2, 'Enano', 'Robustos y fuertes, los enanos son una raza ancestral de mineros y guerreros que habitan en las profundidades de Khaz Modan.', 1),
(3, 'Elfo de la Noche', 'Antiguos y sabios, los elfos de la noche son guardianes de la naturaleza que han vivido durante milenios.', 1),
(4, 'Gnomo', 'Inventivos y curiosos, los gnomos son brillantes ingenieros y manitas que buscan recuperar su ciudad natal Gnomeregan.', 1),
(5, 'Orco', 'Guerreros orgullosos y feroces de Draenor, buscando honor en un nuevo mundo bajo el liderazgo de Thrall.', 2),
(6, 'No-Muerto', 'Renegados que se liberaron del control del Rey Exanime. Luchan por encontrar su lugar en un mundo que los rechaza.', 2),
(7, 'Tauren', 'Nobles y pacificos, los tauren estan profundamente conectados con la naturaleza y la Madre Tierra.', 2),
(8, 'Troll', 'Astutos y espirituales, los trolls Lanza Negra son leales aliados de la Horda bajo el liderazgo de Vol''jin.', 2)
ON CONFLICT (id) DO NOTHING;

-- ==================== RELACIONES RAZA-CLASE ====================
-- Humano: Guerrero, Paladin, Picaro, Sacerdote, Mago, Brujo
INSERT INTO race_class (race_id, class_id) VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1, 2) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1, 5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1, 7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1, 8) ON CONFLICT DO NOTHING;
-- Enano: Guerrero, Paladin, Cazador, Picaro, Sacerdote
INSERT INTO race_class (race_id, class_id) VALUES (2, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2, 3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2, 5) ON CONFLICT DO NOTHING;
-- Elfo de la Noche: Guerrero, Cazador, Picaro, Sacerdote, Druida
INSERT INTO race_class (race_id, class_id) VALUES (3, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3, 3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3, 5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3, 9) ON CONFLICT DO NOTHING;
-- Gnomo: Guerrero, Picaro, Mago, Brujo
INSERT INTO race_class (race_id, class_id) VALUES (4, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4, 7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4, 8) ON CONFLICT DO NOTHING;
-- Orco: Guerrero, Cazador, Picaro, Chaman, Brujo
INSERT INTO race_class (race_id, class_id) VALUES (5, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5, 3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5, 6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5, 8) ON CONFLICT DO NOTHING;
-- No-Muerto: Guerrero, Picaro, Sacerdote, Mago, Brujo
INSERT INTO race_class (race_id, class_id) VALUES (6, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6, 5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6, 7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6, 8) ON CONFLICT DO NOTHING;
-- Tauren: Guerrero, Cazador, Chaman, Druida
INSERT INTO race_class (race_id, class_id) VALUES (7, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7, 3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7, 6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7, 9) ON CONFLICT DO NOTHING;
-- Troll: Guerrero, Cazador, Picaro, Sacerdote, Chaman, Mago
INSERT INTO race_class (race_id, class_id) VALUES (8, 1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8, 3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8, 4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8, 5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8, 6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8, 7) ON CONFLICT DO NOTHING;

-- ==================== PROFESIONES ====================
INSERT INTO professions (id, name, description, type) VALUES
(1, 'Alquimia', 'Crea pociones, elixires y frascos a partir de hierbas recolectadas.', 'PRIMARY'),
(2, 'Herreria', 'Forja armas y armaduras a partir de barras de metal fundido.', 'PRIMARY'),
(3, 'Encantamiento', 'Encanta armas y armaduras con propiedades magicas especiales.', 'PRIMARY'),
(4, 'Ingenieria', 'Crea artilugios, explosivos y dispositivos mecanicos ingeniosos.', 'PRIMARY'),
(5, 'Herboristeria', 'Recolecta hierbas del mundo para su uso en alquimia.', 'PRIMARY'),
(6, 'Peleteria', 'Confecciona armaduras de cuero y malla a partir de pieles curtidas.', 'PRIMARY'),
(7, 'Mineria', 'Extrae mineral y gemas de vetas minerales repartidas por el mundo.', 'PRIMARY'),
(8, 'Desuello', 'Desuella bestias para obtener cuero y pieles para peleteria.', 'PRIMARY'),
(9, 'Sastreria', 'Crea armaduras de tela y bolsas a partir de retales de tela.', 'PRIMARY'),
(10, 'Cocina', 'Prepara comida que otorga mejoras temporales a las estadisticas.', 'SECONDARY'),
(11, 'Primeros Auxilios', 'Crea vendas para curar heridas fuera de combate.', 'SECONDARY'),
(12, 'Pesca', 'Pesca en masas de agua de todo Azeroth para obtener peces y objetos.', 'SECONDARY')
ON CONFLICT (id) DO NOTHING;

-- ==================== SINCRONIZAR SECUENCIAS ====================
SELECT setval(pg_get_serial_sequence('factions','id'), (SELECT COALESCE(MAX(id),1) FROM factions));
SELECT setval(pg_get_serial_sequence('character_classes','id'), (SELECT COALESCE(MAX(id),1) FROM character_classes));
SELECT setval(pg_get_serial_sequence('zones','id'), (SELECT COALESCE(MAX(id),1) FROM zones));
SELECT setval(pg_get_serial_sequence('races','id'), (SELECT COALESCE(MAX(id),1) FROM races));
SELECT setval(pg_get_serial_sequence('professions','id'), (SELECT COALESCE(MAX(id),1) FROM professions));
