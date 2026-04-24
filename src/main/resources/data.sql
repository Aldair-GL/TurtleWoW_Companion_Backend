-- ============================================================
-- DATOS COMPLETOS: World of Warcraft Clasico (Vanilla)
-- Base de datos Turtle WoW Companion
-- ============================================================

-- Limpiar tablas dependientes para recargar
DROP TABLE IF EXISTS usuarios;
ALTER TABLE items DROP COLUMN IF EXISTS item_type;
ALTER TABLE items DROP COLUMN IF EXISTS drop_source;
DELETE FROM loot_items;
DELETE FROM items;
DELETE FROM bosses;

-- ==================== FACCIONES ====================
INSERT INTO factions (id, name, description, type) VALUES
(1, 'Alliance', 'The Grand Alliance, a faction of noble races united against common threats. Led from Stormwind City.', 'ALLIANCE'),
(2, 'Horde', 'The New Horde, a coalition of outcast races fighting for survival and honor under the Warchief.', 'HORDE'),
(3, 'Neutral', 'Neutral factions that maintain balance between Alliance and Horde.', 'NEUTRAL')
ON CONFLICT (id) DO NOTHING;

-- ==================== CLASES DE PERSONAJE ====================
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES
(1, 'Warrior', 'Masters of weaponry and armor. Excel as tanks and melee damage dealers.', 'TANK', 'RAGE'),
(2, 'Paladin', 'Holy warriors capable of healing, tanking, and dealing damage. Alliance only.', 'HYBRID', 'MANA'),
(3, 'Hunter', 'Ranged damage specialists who fight alongside animal companions.', 'DPS', 'MANA'),
(4, 'Rogue', 'Stealthy assassins who excel at explosive melee damage.', 'DPS', 'ENERGY'),
(5, 'Priest', 'Versatile healers who can also deal shadow damage.', 'HEALER', 'MANA'),
(6, 'Shaman', 'Elemental warriors with totems. Horde only.', 'HYBRID', 'MANA'),
(7, 'Mage', 'Masters of arcane, fire and frost magic. Powerful ranged damage.', 'DPS', 'MANA'),
(8, 'Warlock', 'Dark casters who command demons and shadow magic.', 'DPS', 'MANA'),
(9, 'Druid', 'Shapeshifters who can fill any role: tank, healer, melee or ranged damage.', 'HYBRID', 'MANA')
ON CONFLICT (id) DO NOTHING;

-- ==================== ZONAS - MUNDO ABIERTO ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(1, 'Elwynn Forest', 'A peaceful forest south of Stormwind City. Starting zone for Humans.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(2, 'Westfall', 'Farmlands overrun by the Defias Brotherhood.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(3, 'Duskwood', 'A dark, haunted forest perpetually shrouded in shadows.', 18, 30, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(4, 'Redridge Mountains', 'A mountainous region under constant threat from Blackrock orcs.', 15, 25, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(5, 'Stormwind City', 'Capital of the Alliance and the Kingdom of Stormwind.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(6, 'Dun Morogh', 'Snowy lands home to dwarves and gnomes. Starting zone for both races.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(7, 'Loch Modan', 'A green region around a great lake. Dwarves watch from Thandol Span.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(8, 'Teldrassil', 'The enormous World Tree where Night Elves dwell. Starting zone.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 1, NULL),
(9, 'Darkshore', 'Forested coastline west of Kalimdor, passage between Teldrassil and the continent.', 10, 20, 'KALIMDOR', 'OPEN_WORLD', 1, NULL),
(10, 'Durotar', 'A harsh, rocky land on the eastern coast of Kalimdor. Starting zone for Orcs and Trolls.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(11, 'The Barrens', 'A vast savanna stretching across central Kalimdor.', 10, 25, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(12, 'Thousand Needles', 'A vast canyon filled with towering stone pillars.', 25, 35, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(13, 'Stonetalon Mountains', 'Mountainous region in central Kalimdor disputed by druids and the Venture Co.', 15, 27, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(14, 'Orgrimmar', 'Capital of the Horde, built into the red cliffs of Durotar.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(15, 'Mulgore', 'Vast green plains home to the Tauren. Starting zone.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, NULL),
(16, 'Tirisfal Glades', 'Dark forests and withered lands, home of the Forsaken. Starting zone for Undead.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 2, NULL),
(17, 'Silverpine Forest', 'Shadowy forests south of Tirisfal, plagued by worgen and undead.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 2, NULL),
(18, 'Ashenvale', 'Ancient sacred forest for Night Elves but fiercely contested by the Horde.', 18, 30, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(19, 'Stranglethorn Vale', 'Dense jungle full of trolls, pirates and beasts.', 30, 45, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(20, 'Tanaris', 'Vast desert home to Gadgetzan. The Caverns of Time lie hidden beneath.', 40, 50, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(21, 'Un''Goro Crater', 'Primordial crater full of dinosaurs and exotic flora.', 48, 55, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(22, 'Winterspring', 'Frozen valley in the northern mountains of Kalimdor.', 53, 60, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(23, 'Silithus', 'Desolate desert plagued by Silithids. The gates of Ahn''Qiraj rise to the south.', 55, 60, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(24, 'Eastern Plaguelands', 'Heart of the Scourge domain. Withered land centered on Stratholme.', 53, 60, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(25, 'Western Plaguelands', 'Lands devastated by the Plague. The Argent Dawn fights to reclaim.', 51, 58, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(26, 'Burning Steppes', 'Volcanic lands at the foot of Blackrock Mountain.', 50, 58, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(27, 'Feralas', 'Tropical jungle in western Kalimdor with ancient Eldre''Thalas temples.', 40, 50, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(28, 'The Hinterlands', 'Wild region home to the Vilebranch trolls and Wildhammer dwarves.', 40, 50, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(29, 'Desolace', 'Barren wasteland on the west coast of Kalimdor. Centaur territory.', 30, 40, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(30, 'Swamp of Sorrows', 'Wet and dangerous swamps near the Dark Portal.', 35, 45, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(31, 'Blasted Lands', 'Barren region surrounding the Dark Portal.', 45, 55, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(32, 'Searing Gorge', 'Scorched canyon south of Blackrock Mountain.', 43, 50, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(33, 'Ironforge', 'Capital of the dwarves, carved into the Great Forge under the mountain.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(34, 'Darnassus', 'Capital of the Night Elves atop Teldrassil.', 1, 60, 'KALIMDOR', 'CITY', 1, NULL),
(35, 'Thunder Bluff', 'Tauren capital built on elevated mesas in Mulgore.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(36, 'Undercity', 'Forsaken capital, an underground city beneath the ruins of Lordaeron.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 2, NULL),
(37, 'Wetlands', 'Marshy region connecting Loch Modan to the northern lands.', 20, 30, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, NULL),
(38, 'Arathi Highlands', 'Rolling highlands with the ruins of Stromgarde.', 30, 40, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(39, 'Badlands', 'A barren, rocky desert east of Loch Modan.', 35, 45, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(40, 'Felwood', 'A corrupted forest in northern Kalimdor tainted by the Burning Legion.', 48, 55, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(41, 'Azshara', 'Coastal cliffs northeast of Ashenvale, filled with ancient ruins.', 45, 55, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(42, 'Moonglade', 'Sacred druidic haven accessible through teleportation.', 55, 60, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL),
(43, 'Dustwallow Marsh', 'Swampy region on the coast of Kalimdor, home to Theramore.', 35, 45, 'KALIMDOR', 'OPEN_WORLD', 1, NULL),
(44, 'Hillsbrad Foothills', 'Fertile region contested between Tarren Mill and Southshore.', 20, 30, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL),
(45, 'Alterac Mountains', 'Snowy peaks and ruins of the fallen kingdom of Alterac.', 30, 40, 'EASTERN_KINGDOMS', 'OPEN_WORLD', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== MAZMORRAS ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(50, 'Ragefire Chasm', 'Dungeon beneath Orgrimmar infested by fire elementals and Burning Blade cultists.', 13, 18, 'KALIMDOR', 'DUNGEON', 2, NULL),
(51, 'Wailing Caverns', 'Cavern network in The Barrens corrupted by fallen druids.', 15, 25, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(52, 'The Deadmines', 'Underground fortress of the Defias Brotherhood. Edwin VanCleef awaits on his ship.', 17, 26, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(53, 'Shadowfang Keep', 'Cursed castle in Silverpine inhabited by Archmage Arugal and his worgen.', 22, 30, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(54, 'The Stockade', 'Stormwind City prison taken over by rioting inmates.', 22, 30, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(55, 'Blackfathom Deeps', 'Submerged temple corrupted by the Twilight cult and naga.', 24, 32, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(56, 'Gnomeregan', 'Fallen gnome capital, irradiated and overrun by troggs.', 29, 38, 'EASTERN_KINGDOMS', 'DUNGEON', 1, NULL),
(57, 'Scarlet Monastery', 'Scarlet Crusade fortress in Tirisfal. Four wings of fanatics.', 26, 45, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(58, 'Razorfen Kraul', 'Lair of the Razorfen quilboar in The Barrens.', 30, 40, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(59, 'Razorfen Downs', 'Quilboar catacombs infested with undead.', 37, 46, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(60, 'Uldaman', 'Dwarven excavation revealing Titan secrets.', 42, 52, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(61, 'Zul''Farrak', 'Troll city in Tanaris, home of the Sandfury trolls.', 44, 54, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(62, 'Maraudon', 'Sacred cave in Desolace corrupted by Princess Theradras.', 46, 55, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(63, 'Sunken Temple', 'Temple of Atal''Hakkar dedicated to the blood god Hakkar.', 50, 56, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(64, 'Blackrock Depths', 'Enormous complex of Emperor Thaurissan and the Dark Iron dwarves.', 52, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(65, 'Lower Blackrock Spire', 'Chambers controlled by Blackrock orcs and Smolderthorn trolls.', 55, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(66, 'Upper Blackrock Spire', 'Upper chambers where Rend Blackhand commands.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(67, 'Dire Maul', 'Ancient elven temples in Feralas with three wings.', 56, 60, 'KALIMDOR', 'DUNGEON', NULL, NULL),
(68, 'Stratholme', 'Fallen city of Lordaeron split between the Scourge and Scarlet Crusade.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL),
(69, 'Scholomance', 'School of necromancy training Scourge agents.', 58, 60, 'EASTERN_KINGDOMS', 'DUNGEON', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== RAIDS ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(70, 'Molten Core', 'The fiery lair of Ragnaros deep beneath Blackrock Mountain.', 60, 60, 'EASTERN_KINGDOMS', 'RAID', NULL, NULL),
(71, 'Onyxia''s Lair', 'The hidden lair of the black dragon Onyxia in Dustwallow Marsh.', 60, 60, 'KALIMDOR', 'RAID', NULL, NULL),
(72, 'Blackwing Lair', 'Nefarian''s fortress atop Blackrock Mountain.', 60, 60, 'EASTERN_KINGDOMS', 'RAID', NULL, NULL),
(73, 'Zul''Gurub', 'Ancient troll city in Stranglethorn where Hakkar is being summoned.', 60, 60, 'EASTERN_KINGDOMS', 'RAID', NULL, NULL),
(74, 'Ruins of Ahn''Qiraj', 'Outdoor ruins swarming with Silithid and Qiraji forces.', 60, 60, 'KALIMDOR', 'RAID', NULL, NULL),
(75, 'Temple of Ahn''Qiraj', 'The inner sanctum of the Qiraji empire.', 60, 60, 'KALIMDOR', 'RAID', NULL, NULL),
(76, 'Naxxramas', 'The flying necropolis of Kel''Thuzad above Eastern Plaguelands.', 60, 60, 'EASTERN_KINGDOMS', 'RAID', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== BATTLEGROUNDS ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(80, 'Warsong Gulch', 'Capture the flag battleground in Ashenvale.', 10, 60, 'KALIMDOR', 'BATTLEGROUND', NULL, NULL),
(81, 'Arathi Basin', 'Resource control battleground in the Arathi Highlands.', 20, 60, 'EASTERN_KINGDOMS', 'BATTLEGROUND', NULL, NULL),
(82, 'Alterac Valley', 'Epic 40v40 battleground in the Alterac Mountains.', 51, 60, 'EASTERN_KINGDOMS', 'BATTLEGROUND', NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== RAZAS ====================
INSERT INTO races (id, name, description, faction_id) VALUES
(1, 'Human', 'Resilient and adaptable, humans are one of the youngest races of Azeroth.', 1),
(2, 'Dwarf', 'Stout and strong, dwarves are an ancient race of miners and warriors.', 1),
(3, 'Night Elf', 'Ancient and wise, Night Elves are immortal guardians of nature.', 1),
(4, 'Gnome', 'Inventive and curious, gnomes are brilliant engineers seeking to reclaim Gnomeregan.', 1),
(5, 'Orc', 'Proud and fierce warriors from Draenor, seeking honor under Thrall.', 2),
(6, 'Undead', 'Forsaken who broke free from the Lich King. Fighting to find their place.', 2),
(7, 'Tauren', 'Noble and peaceful, deeply connected with nature and the Earth Mother.', 2),
(8, 'Troll', 'Cunning and spiritual, the Darkspear trolls are loyal Horde allies.', 2)
ON CONFLICT (id) DO NOTHING;

-- ==================== RELACIONES RAZA-CLASE ====================
-- Human: Warrior, Paladin, Rogue, Priest, Mage, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (1,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,2) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (1,8) ON CONFLICT DO NOTHING;
-- Dwarf: Warrior, Paladin, Hunter, Rogue, Priest
INSERT INTO race_class (race_id, class_id) VALUES (2,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,2) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (2,5) ON CONFLICT DO NOTHING;
-- Night Elf: Warrior, Hunter, Rogue, Priest, Druid
INSERT INTO race_class (race_id, class_id) VALUES (3,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (3,9) ON CONFLICT DO NOTHING;
-- Gnome: Warrior, Rogue, Mage, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (4,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (4,8) ON CONFLICT DO NOTHING;
-- Orc: Warrior, Hunter, Rogue, Shaman, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (5,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (5,8) ON CONFLICT DO NOTHING;
-- Undead: Warrior, Rogue, Priest, Mage, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (6,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,7) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (6,8) ON CONFLICT DO NOTHING;
-- Tauren: Warrior, Hunter, Shaman, Druid
INSERT INTO race_class (race_id, class_id) VALUES (7,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (7,9) ON CONFLICT DO NOTHING;
-- Troll: Warrior, Hunter, Rogue, Priest, Shaman, Mage
INSERT INTO race_class (race_id, class_id) VALUES (8,1) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,3) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,4) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,5) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,6) ON CONFLICT DO NOTHING;
INSERT INTO race_class (race_id, class_id) VALUES (8,7) ON CONFLICT DO NOTHING;

-- ==================== PROFESIONES ====================
INSERT INTO professions (id, name, description, type) VALUES
(1, 'Alchemy', 'Create potions, elixirs and flasks from herbs.', 'PRIMARY'),
(2, 'Blacksmithing', 'Forge weapons and armor from metal bars.', 'PRIMARY'),
(3, 'Enchanting', 'Enchant weapons and armor with magical properties.', 'PRIMARY'),
(4, 'Engineering', 'Create gadgets, explosives and mechanical devices.', 'PRIMARY'),
(5, 'Herbalism', 'Gather herbs from the world for alchemy.', 'PRIMARY'),
(6, 'Leatherworking', 'Craft leather and mail armor.', 'PRIMARY'),
(7, 'Mining', 'Extract ore and gems from mineral veins.', 'PRIMARY'),
(8, 'Skinning', 'Skin beasts for leather and hides.', 'PRIMARY'),
(9, 'Tailoring', 'Create cloth armor and bags.', 'PRIMARY'),
(10, 'Cooking', 'Prepare food that grants temporary buffs.', 'SECONDARY'),
(11, 'First Aid', 'Create bandages to heal wounds out of combat.', 'SECONDARY'),
(12, 'Fishing', 'Fish in water bodies throughout Azeroth.', 'SECONDARY')
ON CONFLICT (id) DO NOTHING;

-- ====================================================================
-- JEFES DE MAZMORRA
-- ====================================================================

-- RAGEFIRE CHASM (50)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(1, 'Oggleflint', 'Trogg leader of Ragefire Chasm.', 'An unusually intelligent trogg who has gathered his kind in the depths beneath Orgrimmar.', 16, 1600, 50),
(2, 'Taragaman the Hungerer', 'Satyr demon of the Chasm.', 'A satyr summoned by Burning Blade cultists who feeds on the fire of the chasm.', 16, 1800, 50),
(3, 'Jergosh the Invoker', 'Burning Blade orc warlock.', 'A corrupted orc channeling demonic energy in the depths, threatening Orgrimmar.', 16, 1900, 50),
(4, 'Bazzalan', 'Satyr leader of the Burning Blade in the Chasm.', 'The satyr leading demonic forces beneath Orgrimmar.', 17, 2100, 50);

-- WAILING CAVERNS (51)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(5, 'Lady Anacondra', 'Druid corrupted by the Emerald Dream.', 'One of the Fang leaders, corrupted by the nightmare invading the caverns.', 20, 2200, 51),
(6, 'Lord Cobrahn', 'Corrupted serpent druid.', 'A promising druid before falling under Emerald Dream corruption.', 20, 2300, 51),
(7, 'Kresh', 'Giant cave turtle.', 'An ancient turtle with petrified shell inhabiting the underground waters.', 20, 2500, 51),
(8, 'Lord Serpentis', 'The most dangerous of the Fang druids.', 'Fully given to corruption, seeking to spread the nightmare beyond the caves.', 21, 2800, 51),
(9, 'Verdan the Everliving', 'Gigantic plant elemental.', 'A manifestation of natural corruption grown to enormous proportions.', 21, 3000, 51),
(10, 'Mutanus the Devourer', 'Nightmare aberration.', 'The physical manifestation of corruption. Only appears when the purification ritual awakens its fury.', 22, 3200, 51);

-- THE DEADMINES (52)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(11, 'Rhahk''Zor', 'Ogre guardian of the Mines.', 'An ogre recruited by the Defias Brotherhood. His brute strength is legendary.', 17, 1800, 52),
(12, 'Sneed', 'Goblin engineer in his shredder.', 'Oversees logging operations. Hides inside his giant mechanical shredder.', 19, 2100, 52),
(13, 'Gilnid', 'Goblin smelter of the Defias forge.', 'Runs the foundry where Defias weapons are manufactured.', 20, 2400, 52),
(14, 'Mr. Smite', 'Tauren first mate of the Defias ship.', 'A renegade tauren serving as first mate. Changes weapons during combat.', 20, 3000, 52),
(15, 'Edwin VanCleef', 'Leader of the Defias Brotherhood.', 'Master mason who rebuilt Stormwind. When nobles refused to pay, he swore revenge and formed the Brotherhood.', 21, 4200, 52);

-- SHADOWFANG KEEP (53)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(16, 'Razorclaw the Butcher', 'Enraged worgen of the keep.', 'One of the first creatures transformed by Arugal. Its fury is uncontrollable.', 20, 2000, 53),
(17, 'Baron Silverlaine', 'Ghost of the former lord.', 'Original owner of Shadowfang Keep. His spirit wanders seeking revenge.', 24, 2600, 53),
(18, 'Commander Springvale', 'Undead knight serving Arugal.', 'Former Lordaeron paladin, now undead servant of the mad archmage.', 24, 2700, 53),
(19, 'Odo the Blindwatcher', 'Monstrous bat worgen.', 'Transformed into a winged creature by Arugal experiments.', 24, 2800, 53),
(20, 'Fenrus the Devourer', 'Great spectral wolf of Arugal.', 'Arugal favorite wolf pet, imbued with dark arcane magic.', 25, 3000, 53),
(21, 'Archmage Arugal', 'Mad mage who summoned the worgen.', 'Dalaran mage who summoned worgen from another dimension. Now treats them as children.', 26, 3800, 53);

-- THE STOCKADE (54)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(22, 'Targorr the Dread', 'Freed orc prisoner.', 'A brutal orc who seized control of a prison section after the riot.', 24, 2200, 54),
(23, 'Kam Deepfury', 'Imprisoned Dark Iron dwarf.', 'A captured Dark Iron dwarf who exploited the chaos to seize power.', 27, 2600, 54),
(24, 'Bazil Thredd', 'Leader of the Defias prison riot.', 'Defias agent who orchestrated the riot from inside.', 29, 2800, 54),
(25, 'Dextren Ward', 'Dangerous imprisoned assassin.', 'An assassin so dangerous he was locked in the deepest cell.', 26, 2500, 54);

-- BLACKFATHOM DEEPS (55)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(26, 'Ghamoo-Ra', 'Corrupted giant sea turtle.', 'An ancient turtle corrupted by the darkness emanating from the submerged temple.', 25, 2400, 55),
(27, 'Lady Sarevess', 'Naga sorceress of the temple.', 'A naga seeking arcane secrets hidden in the depths.', 25, 2600, 55),
(28, 'Gelihast', 'Murloc shaman of the caverns.', 'Murloc leader who worships ancient entities beneath the waters.', 26, 2500, 55),
(29, 'Twilight Lord Kelris', 'Leader of the Twilight cult.', 'A night elf who betrayed his people and now serves the Old Gods.', 27, 3200, 55),
(30, 'Aku''mai', 'Hydra of the Void.', 'A hydra corrupted by the Old Gods dwelling in the deepest caverns.', 28, 3800, 55);

-- GNOMEREGAN (56)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(31, 'Grubbis', 'Trogg leader of Gnomeregan.', 'A trogg dominating the upper sections of the fallen gnome city.', 30, 2800, 56),
(32, 'Viscous Fallout', 'Giant radioactive ooze.', 'A mass of toxic waste brought to life by Gnomeregan radiation.', 30, 3000, 56),
(33, 'Electrocutioner 6000', 'Corrupted gnome defense robot.', 'A security robot following defense protocols against all intruders.', 32, 3200, 56),
(34, 'Crowd Pummeler 9-60', 'Gnome mechanical golem.', 'A gnome combat machine reprogrammed by Thermaplugg.', 32, 3400, 56),
(35, 'Mekgineer Thermaplugg', 'Gnome traitor who irradiated Gnomeregan.', 'The advisor who convinced High Tinker Mekkatorque to irradiate the city.', 34, 5200, 56);

-- SCARLET MONASTERY (57)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(36, 'Interrogator Vishas', 'Scarlet Crusade torturer.', 'A sadistic interrogator who enjoys tormenting prisoners.', 32, 2800, 57),
(37, 'Bloodmage Thalnos', 'Undead Scarlet blood mage.', 'A former scarlet mage killed and resurrected.', 33, 3000, 57),
(38, 'Houndmaster Loksey', 'Crusade dog trainer.', 'Responsible for the fierce war hounds patrolling the library.', 34, 3200, 57),
(39, 'Arcanist Doan', 'Mage protector of the library.', 'Guardian of sacred Crusade texts. His fire shield is legendary.', 37, 3800, 57),
(40, 'Herod', 'Champion of the Scarlet Crusade.', 'The warrior champion. His Whirlwind is feared by all.', 40, 4800, 57),
(41, 'Scarlet Commander Mograine', 'Military leader of the Monastery.', 'Son of the legendary Ashbringer, leads with fanatical zeal.', 42, 5400, 57),
(42, 'High Inquisitor Whitemane', 'High priestess of the Crusade.', 'Spiritual leader with the power to resurrect the fallen.', 42, 4200, 57);

-- RAZORFEN KRAUL (58)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(43, 'Aggem Thorncurse', 'Quilboar shaman.', 'A powerful shaman channeling earth magic to protect the kraul.', 33, 3000, 58),
(44, 'Death Speaker Jargba', 'Quilboar spiritual leader.', 'A warlock who communicates with spirits of the dead.', 34, 3200, 58),
(45, 'Overlord Ramtusk', 'Quilboar military leader.', 'The war chief, an enormous quilboar wielding a massive axe.', 36, 4000, 58),
(46, 'Charlga Razorflank', 'Matriarch of the Razorfen.', 'The true leader. A cunning sorceress plotting quilboar expansion.', 38, 4400, 58);

-- RAZORFEN DOWNS (59)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(47, 'Tuten''kash', 'Giant undead spider.', 'A monstrous spider resurrected by necromancy.', 40, 3800, 59),
(48, 'Mordresh Fire Eye', 'Skeleton warlock.', 'A skeleton commanding undead legions with fire magic.', 39, 3600, 59),
(49, 'Glutton', 'Undead abomination.', 'A grotesque mass of reanimated flesh.', 40, 4200, 59),
(50, 'Amnennar the Coldbringer', 'Lich lord of Razorfen Downs.', 'A powerful lich sent by the Scourge to corrupt the quilboar.', 42, 5000, 59);

-- ULDAMAN (60)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(51, 'Revelosh', 'Trogg guardian of Uldaman.', 'A trogg who learned to use Titan crystals as weapons.', 44, 4000, 60),
(52, 'Ironaya', 'Titan construct of Uldaman.', 'A titan guardian who awakens when intruders approach vault secrets.', 45, 4800, 60),
(53, 'Galgann Fireforge', 'Dark Iron dwarf excavator.', 'Leader of the Dark Iron expedition seeking titan artifacts.', 45, 4400, 60),
(54, 'Grimlok', 'Trogg shaman leader.', 'The most powerful trogg, able to summon stone elementals.', 45, 4200, 60),
(55, 'Archaedas', 'Titan guardian of the final vault.', 'The supreme guardian, a stone colossus created by the Titans.', 47, 7200, 60);

-- ZUL'FARRAK (61)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(56, 'Antu''sul', 'Troll high priest of basilisks.', 'Controls Zul''Farrak basilisks through ancient domination rituals.', 48, 5000, 61),
(57, 'Theka the Martyr', 'Sacred Sandfury troll.', 'Transforms into a scarab near death, a power granted by ancient loas.', 46, 4200, 61),
(58, 'Witch Doctor Zum''rah', 'Troll necromancer.', 'A witch doctor who raises fallen trolls to grow his army.', 46, 4600, 61),
(59, 'Hydromancer Velratha', 'Troll water sorceress.', 'Guardian of the Rod of Sul, controlling the sands of Tanaris.', 48, 5200, 61),
(60, 'Chief Ukorz Sandscalp', 'Supreme chief of the Sandfury trolls.', 'The warrior leader fighting alongside his guardian.', 48, 6000, 61);

-- MARAUDON (62)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(61, 'Noxxion', 'Corrupted plant elemental.', 'A manifestation of corruption at Maraudon entrance.', 48, 4800, 62),
(62, 'Razorlash', 'Giant thorned lasher.', 'An enormous carnivorous plant fed by corrupt energy.', 48, 5000, 62),
(63, 'Lord Vyletongue', 'Satyr lord of Maraudon.', 'A satyr who seized the upper sections of the sacred cave.', 49, 5200, 62),
(64, 'Landslide', 'Giant earth elemental.', 'An elemental born from the anger of corrupted earth.', 50, 5800, 62),
(65, 'Princess Theradras', 'Elemental daughter of Therazane.', 'Daughter of the Earth Mother. Her union with Zaetar spawned the centaur.', 51, 8000, 62);

-- SUNKEN TEMPLE (63)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(66, 'Atal''alarion', 'Troll temple guardian.', 'A stone golem animated by Atal''ai magic to protect the temple entrance.', 50, 5400, 63),
(67, 'Dreamscythe', 'Corrupted green dragon.', 'A green flight dragon trapped and corrupted by Hakkar influence.', 53, 5800, 63),
(68, 'Jammal''an the Prophet', 'High priest of Hakkar.', 'Leader of the Atal''ai cult seeking to summon Hakkar.', 54, 6200, 63),
(69, 'Shade of Eranikus', 'Essence of dragon Eranikus.', 'Shadow of the green dragon guardian, corrupted by the Dream nightmare.', 55, 7800, 63);

-- BLACKROCK DEPTHS (64)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(70, 'High Interrogator Gerstahn', 'Dark Iron priestess.', 'Extracting information from prisoners in the Depths cells.', 52, 5600, 64),
(71, 'Lord Roccor', 'Fire elemental guardian.', 'A molten rock elemental guarding deeper sections.', 51, 5200, 64),
(72, 'Fineous Darkvire', 'Dark Iron chief architect.', 'Responsible for constructing the enormous underground structures.', 54, 5800, 64),
(73, 'General Angerforge', 'Dark Iron army general.', 'Commands military forces. His discipline is iron, his cruelty legendary.', 57, 7000, 64),
(74, 'Golem Lord Argelmach', 'Dark Iron golem master.', 'Creator of golems guarding the Depths.', 57, 7200, 64),
(75, 'Ambassador Flamelash', 'Fire elemental emissary.', 'A fire elemental liaison between Dark Irons and Ragnaros elemental plane.', 57, 6800, 64),
(76, 'Emperor Dagran Thaurissan', 'Emperor of the Dark Iron dwarves.', 'Sovereign of the Dark Irons, subjugated by Ragnaros. Holds Princess Moira captive.', 59, 12000, 64);

-- LOWER BLACKROCK SPIRE (65)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(77, 'Highlord Omokk', 'Ogre leader of the Spire.', 'A brutally strong ogre ruling the lower chambers.', 59, 7400, 65),
(78, 'War Master Voone', 'Smolderthorn troll leader.', 'Commands Smolderthorn trolls allied with Blackrock orcs.', 59, 7200, 65),
(79, 'Mother Smolderweb', 'Giant spider of the Spire.', 'A colossal spider in the darkest sections.', 59, 6800, 65),
(80, 'Overlord Wyrmthalak', 'Black dragonspawn commander.', 'Dragonspawn leading Nefarian forces in the lower chambers.', 60, 9600, 65);

-- UPPER BLACKROCK SPIRE (66)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(81, 'Pyroguard Emberseer', 'Caged fire elemental.', 'A powerful fire elemental kept captive by orcs as a weapon.', 60, 8200, 66),
(82, 'Jed Guardarunas', 'Elite orc spellcaster.', 'An orc warlock protecting upper halls with fire and shadow.', 59, 7000, 66),
(83, 'Warchief Rend Punonegro', 'Self-proclaimed Warchief.', 'Son of Punonegro, claims the title of Warchief of the Horde. Rides a black dragon named Gyth.', 60, 11000, 66),
(84, 'The Beast', 'Giant magma core.', 'An enormous fire and rock creature guarding the chamber of General Drakkisath.', 60, 9800, 66),
(85, 'General Drakkisath', 'Dragonspawn leader serving Nefarian.', 'The right hand of Nefarian in the Spire. Guards the entrance to the lair of the black dragon.', 60, 12500, 66);

-- DIRE MAUL (67)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(86, 'Zevrim Thornhoof', 'Satyr lord of the east wing.', 'A satyr feeding on souls of elves trapped in Eldre''Thalas ruins.', 57, 6800, 67),
(87, 'Alzzin the Wildshaper', 'Corrupted satyr druid.', 'A powerful satyr who corrupted the east wing inner garden.', 58, 8200, 67),
(88, 'Tendris Warpwood', 'Corrupted ancient treant of the west wing.', 'An ancient corrupted treant blocking passage to inner sections.', 57, 7000, 67),
(89, 'Immol''thar', 'Imprisoned Void demon.', 'A powerful demon kept captive by elves to power the magic barrier.', 59, 9400, 67),
(90, 'Prince Tortheldrin', 'Last prince of Eldre''Thalas.', 'The elf who sacrificed his own subjects to maintain the barrier.', 60, 8800, 67),
(91, 'King Gordok', 'Ogre leader of the north wing.', 'King of the Gordok ogres occupying the north wing.', 60, 10000, 67);

-- STRATHOLME (68)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(92, 'The Unforgiven', 'Vengeful specter of Stratholme.', 'Spirit of a villager massacred during the Purge.', 57, 6400, 68),
(93, 'Timmy the Cruel', 'Undead abomination.', 'A particularly sadistic ghoul roaming ruined streets.', 58, 7200, 68),
(94, 'Cannon Master Willey', 'Scarlet artillery officer.', 'Commands artillery defenses of the Scarlet section.', 58, 7400, 68),
(95, 'Archivist Galford', 'Guardian of Scarlet archives.', 'Guards secret Crusade records in his protected chamber.', 58, 7000, 68),
(96, 'Balnazzar', 'Disguised Dreadlord.', 'A Nathrezim demon secretly controlling the Scarlet Crusade.', 60, 13000, 68),
(97, 'Baroness Anastari', 'Scourge banshee lady.', 'A noble elf turned banshee controlling the undead section.', 59, 7800, 68),
(98, 'Nerub''enkan', 'Nerubian crypt lord.', 'A nerubian serving the Scourge with an army of undead spiders.', 59, 7600, 68),
(99, 'Ramstein the Gorger', 'Giant abomination.', 'The largest abomination in Stratholme, guarding Baron Rivendare.', 60, 9200, 68),
(100, 'Baron Rivendare', 'Undead lord of Stratholme.', 'A former human noble who willingly served the Scourge. Rides a deathcharger.', 60, 14000, 68);

-- SCHOLOMANCE (69)
INSERT INTO bosses (id, name, description, lore, level, health, zone_id) VALUES
(101, 'Kirtonos the Herald', 'Vampire guardian of Scholomance.', 'A powerful vampire summoned by blood ritual.', 60, 8000, 69),
(102, 'Jandice Barov', 'Undead illusionist mage.', 'Barov family member creating illusory copies of herself.', 59, 7400, 69),
(103, 'Rattlegore', 'Giant bone construct.', 'A golem assembled from hundreds of victims bones.', 60, 8800, 69),
(104, 'Ras Frostwhisper', 'Lich master of Scholomance.', 'A powerful liche teaching necromancy to Scourge apprentices.', 60, 10200, 69),
(105, 'Doctor Theolen Krastinov', 'The Butcher of Scholomance.', 'A sadistic doctor experimenting on living and dead.', 60, 9000, 69),
(106, 'Lord Alexei Barov', 'Undead Barov noble.', 'A Barov lord who sold his soul to the Scourge for eternal power.', 60, 8600, 69),
(107, 'Lady Illucia Barov', 'Undead Barov noble.', 'Sister of Alexei, equally corrupted. Uses shadow magic and mind control.', 60, 8400, 69),
(108, 'Darkmaster Gandling', 'Headmaster of Scholomance.', 'The rector who teleports victims to classrooms full of undead.', 60, 14500, 69)
ON CONFLICT (id) DO NOTHING;

-- ====================================================================
-- BOTIN (LOOT) — Items iconicos por boss
-- ====================================================================

-- RAGEFIRE CHASM
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(1, 'Oggleflint''s Inspirer', 'A primitive but surprisingly sturdy staff.', 'UNCOMMON', 'Staff', 35.0, 1),
(2, 'Subterranean Cape', 'A cape forged in the heat of the chasm.', 'UNCOMMON', 'Cloak', 28.0, 2),
(3, 'Robe of Evocation', 'Ragged robe imbued with demonic energy.', 'UNCOMMON', 'Chest Cloth', 30.0, 3),
(4, 'Bazzalan''s Blade', 'Curved dagger of the satyr leader.', 'RARE', 'Dagger', 25.0, 4);

-- WAILING CAVERNS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(5, 'Belt of the Fang', 'Belt woven with enchanted scales.', 'UNCOMMON', 'Belt Leather', 28.0, 5),
(6, 'Serpent''s Shoulders', 'Shoulder pads infused with serpent venom.', 'RARE', 'Shoulders Leather', 15.0, 6),
(7, 'Kresh''s Back', 'Natural petrified shell shield.', 'RARE', 'Shield', 35.0, 7),
(8, 'Savage Trodders', 'Boots pulsing with nightmare energy.', 'RARE', 'Boots Leather', 14.0, 8),
(9, 'Living Root', 'A sword that seems to grow like a plant.', 'RARE', 'Two-Hand Sword', 18.0, 9),
(10, 'Mutant Scale Breastplate', 'Breastplate from Mutanus hide.', 'RARE', 'Chest Mail', 22.0, 10);

-- THE DEADMINES
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(11, 'Rhahk''Zor''s Hammer', 'Heavy warhammer of the ogre guardian.', 'RARE', 'Two-Hand Mace', 33.0, 11),
(12, 'Taskmaster Axe', 'Light axe from Sneed''s shredder gears.', 'RARE', 'One-Hand Axe', 18.0, 12),
(13, 'Smelting Pants', 'Heat-resistant pants from the Defias forge.', 'UNCOMMON', 'Legs Mail', 30.0, 13),
(14, 'Smite''s Mighty Hammer', 'Enormous hammer of the tauren first mate.', 'RARE', 'Two-Hand Mace', 22.0, 14),
(15, 'Cruel Barb', 'Dark blade emanating malice.', 'RARE', 'One-Hand Sword', 15.5, 15),
(16, 'Blackened Defias Armor', 'Leather armor of the Brotherhood leader.', 'RARE', 'Chest Leather', 12.0, 15),
(17, 'Cape of the Brotherhood', 'Red silk cape, symbol of authority.', 'UNCOMMON', 'Cloak', 20.0, 15);

-- SHADOWFANG KEEP
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(18, 'Butcher''s Slicer', 'Belt torn by worgen claws.', 'UNCOMMON', 'One-Hand Sword', 30.0, 16),
(19, 'Silverlaine''s Family Seal', 'Ethereal ring with spectral glow.', 'RARE', 'Ring', 16.0, 17),
(20, 'Commander''s Crest', 'Shield of the former paladin.', 'UNCOMMON', 'Shield', 24.0, 18),
(21, 'Odo''s Ley Staff', 'Staff of the winged worgen.', 'RARE', 'Staff', 14.0, 19),
(22, 'Fenrus'' Hide', 'Belt of spectral wolf pelt.', 'UNCOMMON', 'Chest Leather', 26.0, 20),
(23, 'Robes of Arugal', 'Arcane vestments of the mad archmage.', 'RARE', 'Chest Cloth', 12.0, 21),
(24, 'Belt of Arugal', 'Belt embroidered with summoning runes.', 'RARE', 'Belt Cloth', 18.0, 21),
(25, 'Shadowfang', 'Legendary sword imbued with darkness.', 'RARE', 'One-Hand Sword', 3.5, 21);

-- THE STOCKADE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(26, 'Iron Knuckles', 'Broken shackles turned weapon.', 'UNCOMMON', 'Fist Weapon', 30.0, 22),
(27, 'Kam''s Walking Stick', 'Dark Iron hammer of solid make.', 'UNCOMMON', 'Staff', 25.0, 23),
(28, 'Defias Renegade Ring', 'Ring of the Defias conspirator.', 'UNCOMMON', 'Ring', 28.0, 24);

-- BLACKFATHOM DEEPS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(29, 'Ghamoo-Ra''s Bind', 'Corrupted turtle shell shield.', 'RARE', 'Shield', 30.0, 26),
(30, 'Naga Heartpiercer', 'Bow found in dark waters.', 'RARE', 'Bow', 20.0, 27),
(31, 'Aku''mai''s Sting', 'Precious gem torn from the hydra.', 'RARE', 'Dagger', 18.0, 30),
(32, 'Rod of the Sleepwalker', 'Cloak that seems to flow like water.', 'RARE', 'Staff', 22.0, 29);

-- GNOMEREGAN
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(33, 'Electrocutioner Leg', 'Sword sparking with electricity.', 'RARE', 'One-Hand Sword', 20.0, 33),
(34, 'Manual Crowd Pummeler', 'Mechanical gauntlets of incredible power.', 'RARE', 'Two-Hand Mace', 22.0, 34),
(35, 'Thermaplugg''s Central Core', 'Engineering helm with irradiated visor.', 'RARE', 'Helm Mail', 15.0, 35),
(36, 'Civinad Robes', 'Staff emitting a faint green glow.', 'RARE', 'Chest Cloth', 18.0, 35);

-- SCARLET MONASTERY
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(37, 'Bloody Brass Knuckles', 'Blood-stained gloves of the torturer.', 'UNCOMMON', 'Fist Weapon', 30.0, 36),
(38, 'Orb of the Forgotten Seer', 'Life-draining blood mage dagger.', 'RARE', 'Off-Hand', 20.0, 37),
(39, 'Dog Training Gloves', 'Spiked reinforced collar.', 'UNCOMMON', 'Gloves Leather', 28.0, 38),
(40, 'Mantle of Doan', 'Arcane mantle of great magical power.', 'RARE', 'Shoulders Cloth', 18.0, 39),
(41, 'Ravager', 'The Champion axe. Its Whirlwind is legendary.', 'RARE', 'Two-Hand Axe', 15.0, 40),
(42, 'Herod''s Shoulder', 'Imposing helm of the scarlet champion.', 'RARE', 'Shoulders Mail', 12.0, 40),
(43, 'Mograine''s Might', 'Blessed sword of the scarlet commander.', 'RARE', 'Two-Hand Mace', 14.0, 41),
(44, 'Whitemane''s Chapeau', 'Inquisitor hood with healing powers.', 'RARE', 'Helm Cloth', 16.0, 42);

-- RAZORFEN KRAUL
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(45, 'Thornspike', 'Quilboar shaman staff.', 'UNCOMMON', 'Dagger', 28.0, 43),
(46, 'Corpsemaker', 'Enormous axe of the overlord.', 'RARE', 'Two-Hand Axe', 20.0, 45),
(47, 'Heart of Agamaggan', 'Amulet of the quilboar matriarch.', 'RARE', 'Necklace', 15.0, 46);

-- RAZORFEN DOWNS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(48, 'Silky Spider Cape', 'Venomous fang of the undead spider.', 'UNCOMMON', 'Cloak', 28.0, 47),
(49, 'Mordresh''s Lifeless Skull', 'Sword wreathed in spectral flames.', 'RARE', 'Off-Hand', 18.0, 48),
(50, 'Icemetal Barbute', 'Sword of the lich imbued with deadly cold.', 'RARE', 'Helm Mail', 15.0, 50),
(51, 'Coldrage Dagger', 'Cloak emanating supernatural cold.', 'RARE', 'Dagger', 20.0, 50);

-- ULDAMAN
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(52, 'Ironaya''s Bracers', 'Titan medallion of incredible craft.', 'RARE', 'Bracers Plate', 22.0, 52),
(53, 'Galgann''s Fireblaster', 'Dark Iron warhammer.', 'RARE', 'Gun', 18.0, 53),
(54, 'Stoneslayer', 'Fragment of the titan guardian.', 'RARE', 'Two-Hand Sword', 12.0, 55),
(55, 'The Rockpounder', 'Sword forged with titan technology.', 'RARE', 'Two-Hand Mace', 10.0, 55);

-- ZUL'FARRAK
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(56, 'Sang''thraze the Deflector', 'Spear made from basilisk stinger.', 'RARE', 'One-Hand Sword', 20.0, 56),
(57, 'Theka''s Seal', 'Amulet that protects from death.', 'RARE', 'Ring', 15.0, 57),
(58, 'Sul''thraze the Lasher', 'Magic wand controlling waters.', 'EPIC', 'Two-Hand Sword', 18.0, 59),
(59, 'Ukorz''s First Mate Hat', 'Enormous axe of the troll chief.', 'RARE', 'Helm Leather', 16.0, 60);

-- MARAUDON
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(60, 'Noxxion''s Shackles', 'Corrupt seed of plant power.', 'UNCOMMON', 'Bracers Plate', 30.0, 61),
(61, 'Vinerot Sandals', 'Thorny claws of the giant plant.', 'RARE', 'Boots Cloth', 20.0, 62),
(62, 'Fist of Stone', 'Mace of rock melted by elemental force.', 'RARE', 'One-Hand Mace', 18.0, 64),
(63, 'Blade of Eternal Darkness', 'Crystalline dagger of Therazane''s daughter.', 'EPIC', 'Dagger', 14.0, 65),
(64, 'Princess Theradras'' Scepter', 'Earth gem of immense elemental power.', 'EPIC', 'One-Hand Mace', 8.0, 65);

-- SUNKEN TEMPLE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(65, 'Atal''alarion''s Tusk Ring', 'Axe torn from Atal''ai golem.', 'RARE', 'Ring', 22.0, 66),
(66, 'Dragon''s Call', 'Staff imbued with dragon breath.', 'RARE', 'One-Hand Sword', 16.0, 67),
(67, 'Jammal''an''s Smite', 'Ritual sword of Jammal''an.', 'RARE', 'Two-Hand Mace', 14.0, 68),
(68, 'Essence of Eranikus', 'Fragment of corrupted dragon power.', 'EPIC', 'Trinket', 10.0, 69);

-- BLACKROCK DEPTHS
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(69, 'Gerstahn''s Medallion', 'Whip used in interrogations.', 'RARE', 'Necklace', 20.0, 70),
(70, 'Stonegrip Gauntlets', 'Incandescent core of the elemental.', 'RARE', 'Gloves Plate', 18.0, 71),
(71, 'Angerforge''s Battle Axe', 'Shield of the Dark Iron general.', 'RARE', 'One-Hand Axe', 16.0, 73),
(72, 'Second Wind', 'Gauntlets of the golem lord.', 'RARE', 'Gun', 14.0, 74),
(73, 'Imperial Jewel', 'Ring of the Dark Iron Emperor.', 'EPIC', 'Trinket', 8.0, 76),
(74, 'Hand of Justice', 'Legendary trinket of the Emperor.', 'EPIC', 'Trinket', 5.0, 76);

-- LOWER BLACKROCK SPIRE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(75, 'Skullsmash Hammer', 'Enormous sword of the High Lord ogre.', 'RARE', 'One-Hand Mace', 20.0, 77),
(76, 'Keris of Zul''Serak', 'Tribal spear of the troll master.', 'RARE', 'Dagger', 18.0, 78),
(77, 'Smolderweb''s Eye', 'Mandible of the giant spider.', 'RARE', 'Trinket', 22.0, 79),
(78, 'Trindlehaven Staff', 'Dark gem torn from the dragonspawn.', 'EPIC', 'Staff', 10.0, 80);

-- UPPER BLACKROCK SPIRE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(79, 'Emberseer''s Burning Eye', 'Fire elemental sword.', 'RARE', 'Trinket', 18.0, 81),
(80, 'Warchief''s Crown', 'Helm of the self-proclaimed Warchief.', 'EPIC', 'Helm Plate', 12.0, 83),
(81, 'Fang of the Crystal Spider', 'Fang of the fire monster.', 'EPIC', 'Dagger', 10.0, 84),
(82, 'Draconic Maul', 'Sword of the dragonspawn general.', 'EPIC', 'Two-Hand Mace', 8.0, 85),
(83, 'Seal of Ascension', 'Key to Nefarian lair.', 'EPIC', 'Ring', 100.0, 85);

-- DIRE MAUL
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(84, 'Satyr''s Bow', 'Twisted scythe of the satyr.', 'RARE', 'Bow', 20.0, 86),
(85, 'Ring of the Wildshaper', 'Corrupted staff of the shapechanger.', 'RARE', 'Ring', 16.0, 87),
(86, 'Eye of Immol''thar', 'Eye of the Void demon.', 'EPIC', 'Trinket', 10.0, 89),
(87, 'Eldritch Reinforced Legplates', 'Sword of the last elven prince.', 'RARE', 'Legs Plate', 14.0, 90),
(88, 'Gordok''s Handguards', 'Treasure chest of the ogre king.', 'EPIC', 'Gloves Leather', 100.0, 91);

-- STRATHOLME
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(89, 'The Unforgiven''s Dreadsword', 'Ghostly sword that howls on strike.', 'RARE', 'One-Hand Sword', 18.0, 92),
(90, 'Willey''s Portable Howitzer', 'Scarlet artillery staff.', 'RARE', 'Gun', 16.0, 94),
(91, 'Tome of Knowledge', 'Sacred Crusade text.', 'RARE', 'Off-Hand', 20.0, 95),
(92, 'Grand Crusader''s Helm', 'Horns torn from the Nathrezim.', 'EPIC', 'Helm Plate', 8.0, 96),
(93, 'Hammer of the Grand Crusader', 'Reforged sword of the Dreadlord.', 'EPIC', 'Two-Hand Mace', 6.0, 96),
(94, 'Anastari Heirloom', 'Spectral cloak of the banshee.', 'RARE', 'Ring', 18.0, 97),
(95, 'Deathcharger''s Reins', 'Reins of the Baron deathcharger. Extremely rare.', 'EPIC', 'Mount', 0.8, 100),
(96, 'Runeblade of Baron Rivendare', 'Runic sword of the undead lord.', 'EPIC', 'One-Hand Sword', 5.0, 100),
(97, 'Helm of the Executioner', 'Dark cloak of Stratholme ruler.', 'RARE', 'Helm Mail', 14.0, 100);

-- SCHOLOMANCE
INSERT INTO loot_items (id, name, description, quality, type, drop_rate, boss_id) VALUES
(98, 'Heart of Kirtonos', 'Fangs of the vampire guardian.', 'RARE', 'Trinket', 20.0, 101),
(99, 'Barov Peasant Caller', 'Gem that distorts reality.', 'RARE', 'Trinket', 16.0, 102),
(100, 'Rattlegore''s Bone', 'Giant bone used as mace.', 'RARE', 'Two-Hand Mace', 22.0, 103),
(101, 'Frostwhisper''s Icy Grasp', 'Staff of the lich that freezes the soul.', 'EPIC', 'Staff', 10.0, 104),
(102, 'Krastinov''s Bag of Horrors', 'Bloodstained scalpel of Krastinov.', 'RARE', 'Bag', 18.0, 105),
(103, 'Barov Lord''s Signet', 'Noble cloak of the cursed family.', 'RARE', 'Ring', 20.0, 106),
(104, 'Gandling''s Dark Robes', 'Vestments of the Scholomance rector.', 'EPIC', 'Chest Cloth', 8.0, 108),
(105, 'Headmaster''s Charge', 'Staff that teleports victims.', 'EPIC', 'Staff', 6.0, 108);

-- ====================================================================
-- ITEMS GENERALES (tabla items — independiente de loot_items)
-- Incluye consumibles, materiales, recetas, equipamiento, etc.
-- ====================================================================
INSERT INTO items (id, name, description, quality, type, subtype, level_required, item_level, profession_id) VALUES
-- Legendary weapons
(1, 'Thunderfury, Blessed Blade of the Windseeker', 'Legendary sword forged with the essence of Thunderaan.', 'LEGENDARY', 'WEAPON', 'One-Hand Sword', 60, 80, NULL),
(2, 'Sulfuras, Hand of Ragnaros', 'Legendary two-hand mace forged with the Sulfuron Hammer.', 'LEGENDARY', 'WEAPON', 'Two-Hand Mace', 60, 80, NULL),
-- Common items
(3, 'Hearthstone', 'Returns you to your home inn when used.', 'COMMON', 'MISC', 'Utility', 1, 1, NULL),
(4, 'Linen Cloth', 'Basic cloth used in tailoring and first aid.', 'COMMON', 'TRADE', 'Cloth', 1, 5, 9),
(5, 'Wool Cloth', 'Medium-grade cloth dropped by mid-level humanoids.', 'COMMON', 'TRADE', 'Cloth', 1, 15, 9),
(6, 'Silk Cloth', 'Fine cloth used for tailoring and bandages.', 'COMMON', 'TRADE', 'Cloth', 1, 25, 9),
(7, 'Mageweave Cloth', 'High-quality cloth from powerful humanoids.', 'COMMON', 'TRADE', 'Cloth', 1, 40, 9),
(8, 'Runecloth', 'The finest cloth found in Azeroth, used in high-level recipes.', 'COMMON', 'TRADE', 'Cloth', 1, 50, 9),
-- Mining materials
(9, 'Copper Ore', 'Raw copper ore that can be smelted into bars.', 'COMMON', 'TRADE', 'Metal & Stone', 1, 5, 7),
(10, 'Tin Ore', 'Tin ore used in bronze smelting.', 'COMMON', 'TRADE', 'Metal & Stone', 1, 15, 7),
(11, 'Iron Ore', 'Iron ore for smelting into bars.', 'COMMON', 'TRADE', 'Metal & Stone', 1, 25, 7),
(12, 'Mithril Ore', 'Mithril ore, a valuable mining resource.', 'COMMON', 'TRADE', 'Metal & Stone', 1, 40, 7),
(13, 'Thorium Ore', 'High-level ore found in endgame zones.', 'COMMON', 'TRADE', 'Metal & Stone', 1, 50, 7),
(14, 'Arcane Crystal', 'Rare crystal found when mining Thorium veins.', 'RARE', 'TRADE', 'Metal & Stone', 1, 55, 7),
-- Herbs
(15, 'Peacebloom', 'A common herb found in starting zones.', 'COMMON', 'TRADE', 'Herb', 1, 5, 5),
(16, 'Silverleaf', 'A basic herb used in early alchemy recipes.', 'COMMON', 'TRADE', 'Herb', 1, 5, 5),
(17, 'Briarthorn', 'A thorny herb found in level 10-20 zones.', 'COMMON', 'TRADE', 'Herb', 1, 15, 5),
(18, 'Stranglekelp', 'An aquatic herb found in coastal areas.', 'COMMON', 'TRADE', 'Herb', 1, 20, 5),
(19, 'Goldthorn', 'A valuable herb found in mid-level zones.', 'COMMON', 'TRADE', 'Herb', 1, 35, 5),
(20, 'Black Lotus', 'The rarest herb in Azeroth, required for the most powerful flasks.', 'EPIC', 'REAGENT', 'Herb', 1, 60, 5),
-- Consumables - Alchemy
(21, 'Minor Healing Potion', 'Restores 70 to 90 health.', 'COMMON', 'CONSUMABLE', 'Potion', 1, 5, 1),
(22, 'Lesser Healing Potion', 'Restores 140 to 180 health.', 'COMMON', 'CONSUMABLE', 'Potion', 3, 10, 1),
(23, 'Healing Potion', 'Restores 280 to 360 health.', 'COMMON', 'CONSUMABLE', 'Potion', 12, 22, 1),
(24, 'Greater Healing Potion', 'Restores 455 to 585 health.', 'COMMON', 'CONSUMABLE', 'Potion', 21, 31, 1),
(25, 'Superior Healing Potion', 'Restores 700 to 900 health.', 'COMMON', 'CONSUMABLE', 'Potion', 35, 45, 1),
(26, 'Major Healing Potion', 'Restores 1050 to 1750 health.', 'COMMON', 'CONSUMABLE', 'Potion', 45, 55, 1),
(27, 'Minor Mana Potion', 'Restores 140 to 180 mana.', 'COMMON', 'CONSUMABLE', 'Potion', 5, 14, 1),
(28, 'Major Mana Potion', 'Restores 1350 to 2250 mana.', 'COMMON', 'CONSUMABLE', 'Potion', 49, 55, 1),
(29, 'Flask of the Titans', 'Increases max health by 1200 for 2 hours. Persists through death.', 'EPIC', 'CONSUMABLE', 'Flask', 50, 60, 1),
(30, 'Flask of Supreme Power', 'Increases spell damage by 150 for 2 hours. Persists through death.', 'EPIC', 'CONSUMABLE', 'Flask', 50, 60, 1),
(31, 'Elixir of the Mongoose', 'Increases Agility by 25 and Critical Strike by 2% for 1 hour.', 'UNCOMMON', 'CONSUMABLE', 'Elixir', 46, 56, 1),
(32, 'Free Action Potion', 'Immune to stun and movement impairing effects for 30 sec.', 'UNCOMMON', 'CONSUMABLE', 'Potion', 20, 30, 1),
-- Cooking
(33, 'Savory Deviate Delight', 'Transforms you into a pirate or ninja for 1 hour.', 'UNCOMMON', 'CONSUMABLE', 'Food', 1, 15, 10),
(34, 'Nightfin Soup', 'Restores 8 mana per 5 seconds for 10 minutes.', 'UNCOMMON', 'CONSUMABLE', 'Food', 35, 45, 10),
(35, 'Grilled Squid', 'Increases Agility by 10 for 10 minutes.', 'UNCOMMON', 'CONSUMABLE', 'Food', 35, 45, 10),
-- First Aid
(36, 'Linen Bandage', 'Heals 66 damage over 6 seconds.', 'COMMON', 'CONSUMABLE', 'Bandage', 1, 5, 11),
(37, 'Heavy Runecloth Bandage', 'Heals 2000 damage over 8 seconds.', 'COMMON', 'CONSUMABLE', 'Bandage', 1, 58, 11),
-- Fishing
(38, 'Raw Nightfin Snapper', 'Fish caught in inland waters at night.', 'COMMON', 'TRADE', 'Fish', 1, 45, 12),
(39, 'Stonescale Eel', 'Eel caught in coastal waters, used in alchemy.', 'COMMON', 'TRADE', 'Fish', 1, 45, 12),
-- Enchanting
(40, 'Strange Dust', 'Common enchanting dust from low-level items.', 'UNCOMMON', 'TRADE', 'Enchanting Material', 1, 10, 3),
(41, 'Large Brilliant Shard', 'High-level enchanting shard from epic items.', 'RARE', 'TRADE', 'Enchanting Material', 1, 55, 3),
(42, 'Nexus Crystal', 'The rarest enchanting material from Tier gear.', 'EPIC', 'TRADE', 'Enchanting Material', 1, 60, 3),
-- Skinning/Leatherworking
(43, 'Light Leather', 'Low-level leather from skinning beasts.', 'COMMON', 'TRADE', 'Leather', 1, 10, 8),
(44, 'Thick Leather', 'Mid-level leather from skinning.', 'COMMON', 'TRADE', 'Leather', 1, 40, 8),
(45, 'Rugged Leather', 'High-level leather from endgame beasts.', 'COMMON', 'TRADE', 'Leather', 1, 50, 8),
(46, 'Devilsaur Leather', 'Rare leather from devilsaurs in Un''Goro Crater.', 'RARE', 'TRADE', 'Leather', 1, 55, 8),
-- Engineering gadgets
(47, 'Goblin Rocket Boots', 'Increases run speed for 20 seconds. May malfunction.', 'UNCOMMON', 'ARMOR', 'Boots', 45, 50, 4),
(48, 'Gnomish Death Ray', 'Channels a death ray for massive damage. May hurt the user.', 'RARE', 'WEAPON', 'Trinket', 48, 55, 4),
-- Blacksmithing
(49, 'Arcanite Bar', 'Transmuted bar used in high-end blacksmithing recipes.', 'RARE', 'TRADE', 'Metal & Stone', 1, 55, 2),
(50, 'Arcanite Reaper', 'Powerful two-hand axe crafted by blacksmiths.', 'EPIC', 'WEAPON', 'Two-Hand Axe', 56, 61, 2),
-- Quest items
(51, 'Defias Bandana', 'A red bandana worn by members of the Defias Brotherhood.', 'COMMON', 'QUEST', 'Quest Item', 1, 15, NULL),
(52, 'Head of VanCleef', 'The severed head of Edwin VanCleef.', 'UNCOMMON', 'QUEST', 'Quest Item', 15, 22, NULL),
(53, 'Head of Onyxia', 'The severed head of Onyxia.', 'LEGENDARY', 'QUEST', 'Quest Item', 60, 60, NULL),
-- Dungeon drops (also in items table as canonical)
(54, 'Cruel Barb', 'A sharp blade dripping with malice, dropped by Edwin VanCleef.', 'RARE', 'WEAPON', 'One-Hand Sword', 17, 22, NULL),
(55, 'Shadowfang', 'A dark blade that seems to drink in light. Drops in Shadowfang Keep.', 'RARE', 'WEAPON', 'One-Hand Sword', 17, 24, NULL),
(56, 'Ravager', 'A massive axe that spins in a deadly whirlwind. Drops from Herod.', 'RARE', 'WEAPON', 'Two-Hand Axe', 33, 40, NULL),
(57, 'Hand of Justice', 'A powerful trinket from Emperor Thaurissan in BRD.', 'EPIC', 'ARMOR', 'Trinket', 52, 59, NULL),
(58, 'Deathcharger''s Reins', 'Summons the skeletal steed of Baron Rivendare. Extremely rare.', 'EPIC', 'MISC', 'Mount', 40, 60, NULL),
(59, 'Headmaster''s Charge', 'Staff of immense power from Darkmaster Gandling.', 'EPIC', 'WEAPON', 'Staff', 55, 60, NULL),
(60, 'Runeblade of Baron Rivendare', 'A two-hand sword infused with unholy power.', 'EPIC', 'WEAPON', 'Two-Hand Sword', 55, 60, NULL),
-- Generic gear
(61, 'Green Lens', 'Engineering headpiece that gives random stats.', 'RARE', 'ARMOR', 'Helm', 48, 53, 4),
(62, 'Lionheart Helm', 'The most sought-after plate helm for warriors.', 'EPIC', 'ARMOR', 'Helm Plate', 56, 61, 2),
-- PvP items
(63, 'Warsong Gulch Mark of Honor', 'Mark obtained in the battleground.', 'UNCOMMON', 'QUEST', 'PvP Token', 10, 10, NULL),
(64, 'Arathi Basin Mark of Honor', 'Mark obtained in Arathi Basin battleground.', 'UNCOMMON', 'QUEST', 'PvP Token', 20, 20, NULL),
-- More consumables and reagents
(65, 'Swiftness Potion', 'Increases movement speed by 50% for 15 seconds.', 'UNCOMMON', 'CONSUMABLE', 'Potion', 5, 15, 1),
(66, 'Greater Fire Protection Potion', 'Absorbs 1950 to 2550 fire damage for 1 hour.', 'UNCOMMON', 'CONSUMABLE', 'Potion', 48, 58, 1),
(67, 'Greater Nature Protection Potion', 'Absorbs 1950 to 2550 nature damage for 1 hour.', 'UNCOMMON', 'CONSUMABLE', 'Potion', 48, 58, 1),
(68, 'Thistle Tea', 'Instantly restores 100 energy. Rogue only.', 'UNCOMMON', 'CONSUMABLE', 'Potion', 1, 25, 10),
(69, 'Brilliant Mana Oil', 'Applies to weapon. Restores 12 mana per 5 sec and +25 healing.', 'UNCOMMON', 'CONSUMABLE', 'Oil', 45, 55, 3),
(70, 'Dense Sharpening Stone', 'Increases weapon damage by 8 for 30 minutes.', 'UNCOMMON', 'CONSUMABLE', 'Weapon Enhancement', 35, 50, 2),
-- Bags
(71, 'Runecloth Bag', '14-slot bag crafted by tailors.', 'UNCOMMON', 'MISC', 'Bag', 1, 50, 9),
(72, 'Mooncloth Bag', '16-slot bag, the largest craftable bag in Vanilla.', 'RARE', 'MISC', 'Bag', 1, 55, 9),
-- Recipes
(73, 'Recipe: Flask of the Titans', 'Teaches the alchemist to make Flask of the Titans.', 'RARE', 'RECIPE', 'Alchemy Recipe', 1, 60, 1),
(74, 'Plans: Arcanite Reaper', 'Teaches the blacksmith to make Arcanite Reaper.', 'RARE', 'RECIPE', 'Blacksmithing Plans', 1, 58, 2),
(75, 'Pattern: Devilsaur Gauntlets', 'Teaches the leatherworker to make Devilsaur Gauntlets.', 'RARE', 'RECIPE', 'Leatherworking Pattern', 1, 58, 6)
ON CONFLICT (id) DO NOTHING;

-- ==================== NPCs ====================
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES
(1, 'Marshal Dughan', 'Marshal of Goldshire', 'The marshal of Goldshire, defender of Elwynn Forest.', 'QUEST_GIVER', true, 15, 1, 1, NULL),
(2, 'Gryan Stoutmantle', 'Captain of the People''s Militia', 'Leader of the People''s Militia in Westfall.', 'QUEST_GIVER', true, 30, 2, 1, NULL),
(3, 'Hemet Nesingwary', 'The Great Hunter', 'Famous dwarf hunter who challenges adventurers in Stranglethorn.', 'QUEST_GIVER', true, 45, 19, 1, NULL),
(4, 'Innkeeper Farley', 'Innkeeper', 'Innkeeper of the Lion''s Pride Inn in Goldshire.', 'INNKEEPER', true, 10, 1, 1, NULL),
(5, 'Dungar Longdrink', 'Gryphon Master', 'Gryphon master in Stormwind City.', 'FLIGHT_MASTER', false, 55, 5, 1, NULL),
(6, 'Thrall', 'Warchief of the Horde', 'Warchief and leader of the Orcs. Powerful shaman who freed his people.', 'QUEST_GIVER', false, 63, 14, 2, NULL),
(7, 'Rexxar', 'Champion of the Horde', 'Legendary half-ogre beastmaster who wanders the wilds.', 'QUEST_GIVER', true, 60, 11, 2, NULL),
(8, 'Sergra Darkthorn', 'Quest Giver', 'Quest giver at the Crossroads in The Barrens.', 'QUEST_GIVER', true, 25, 11, 2, NULL),
(9, 'Doras', 'Wind Rider Master', 'Flight master in Orgrimmar.', 'FLIGHT_MASTER', false, 55, 14, 2, NULL),
(10, 'Gazlowe', 'Chief Engineer of Ratchet', 'Goblin chief engineer and leader of Ratchet.', 'QUEST_GIVER', true, 35, 11, 3, NULL),
(11, 'Chromie', 'Bronze Dragon', 'Bronze dragon disguised as a gnome, guardian of timelines.', 'QUEST_GIVER', true, 55, 25, NULL, NULL),
(12, 'Hogger', 'Gnoll Chieftain', 'The fearsome gnoll chieftain of Elwynn Forest.', 'BOSS', false, 11, 1, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== MISIONES (QUESTS) ====================
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES
(1, 'A Threat Within', 'Marshal Dughan is worried about the growing kobold threat in the Elwynn mines.', 4, 1, 'ALLIANCE', '250 XP, 1 silver', 250, 1, 1, NULL),
(2, 'The Defias Brotherhood', 'Gryan Stoutmantle needs help uncovering the Defias threat in Westfall.', 14, 10, 'ALLIANCE', '1150 XP, 8 silver', 1150, 2, 2, NULL),
(3, 'The People''s Militia', 'Help the People''s Militia defend Westfall from the Defias Brotherhood.', 12, 9, 'ALLIANCE', '900 XP, 6 silver', 900, 2, 2, NULL),
(4, 'Wanted: Hogger', 'Hogger has been terrorizing travelers in Elwynn. Bring his head to Marshal Dughan.', 11, 5, 'ALLIANCE', '850 XP, 5 silver', 850, 1, 1, NULL),
(5, 'Chen''s Empty Keg', 'Find ingredients for Chen Stormstout legendary brew in The Barrens.', 15, 11, 'HORDE', '1350 XP, 10 silver', 1350, 11, 10, NULL),
(6, 'Lost in Battle', 'Find a fallen warrior in The Barrens and return belongings to family.', 10, 7, 'HORDE', '630 XP, 3 silver 50 copper', 630, 11, NULL, NULL),
(7, 'Sergra''s Challenge', 'Sergra Darkthorn challenges you to hunt the fierce raptors of The Barrens.', 13, 10, 'HORDE', '1100 XP, 7 silver', 1100, 11, 8, NULL),
(8, 'Welcome to the Jungle', 'Hemet Nesingwary challenges you to hunt wild beasts of Stranglethorn.', 30, 28, NULL, '2400 XP, 25 silver', 2400, 19, 3, NULL),
(9, 'Raptor Mastery', 'Hemet wants you to prove your worth hunting the deadliest raptors.', 33, 29, NULL, '2800 XP, 30 silver', 2800, 19, 3, NULL),
(10, 'A Plague Upon Thee', 'Chromie needs help investigating the plague in Western Plaguelands.', 53, 50, NULL, '5500 XP, 55 silver', 5500, 25, 11, NULL),
(11, 'The Green Hills of Stranglethorn', 'Track and defeat King Bangalash for Hemet Nesingwary.', 38, 35, NULL, '3100 XP, 32 silver', 3100, 19, 3, NULL),
(12, 'The Call of Silithus', 'The Cenarion Circle needs champions to investigate the Silithid threat.', 58, 55, NULL, '6000 XP, 60 silver', 6000, 23, NULL, NULL)
ON CONFLICT (id) DO NOTHING;

-- ==================== SINCRONIZAR SECUENCIAS ====================
SELECT setval(pg_get_serial_sequence('factions','id'), (SELECT COALESCE(MAX(id),1) FROM factions));
SELECT setval(pg_get_serial_sequence('character_classes','id'), (SELECT COALESCE(MAX(id),1) FROM character_classes));
SELECT setval(pg_get_serial_sequence('zones','id'), (SELECT COALESCE(MAX(id),1) FROM zones));
SELECT setval(pg_get_serial_sequence('races','id'), (SELECT COALESCE(MAX(id),1) FROM races));
SELECT setval(pg_get_serial_sequence('professions','id'), (SELECT COALESCE(MAX(id),1) FROM professions));
SELECT setval(pg_get_serial_sequence('bosses','id'), (SELECT COALESCE(MAX(id),1) FROM bosses));
SELECT setval(pg_get_serial_sequence('loot_items','id'), (SELECT COALESCE(MAX(id),1) FROM loot_items));
SELECT setval(pg_get_serial_sequence('npcs','id'), (SELECT COALESCE(MAX(id),1) FROM npcs));
SELECT setval(pg_get_serial_sequence('quests','id'), (SELECT COALESCE(MAX(id),1) FROM quests));
SELECT setval(pg_get_serial_sequence('items','id'), (SELECT COALESCE(MAX(id),1) FROM items));
