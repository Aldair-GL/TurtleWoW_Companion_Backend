-- ============================================================
-- BORRABLE — NO SUBIR A GITHUB
-- Script para añadir ciudades Alliance/Horde + Ashenvale
-- Ejecutar en: console.neon.tech → SQL Editor
-- ============================================================

-- ==================== CIUDADES ALLIANCE ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(5, 'Stormwind City', 'Stormwind City is the crown jewel of the Alliance and the capital of the Kingdom of Stormwind. Rebuilt after its complete destruction during the First War by the stonemasons guild (whose betrayal by the nobles led to the formation of the Defias Brotherhood), Stormwind is a magnificent city of white stone towers, tree-lined canals, and grand districts. The city is divided into several distinct areas: the Trade District (auction house and bank), the Cathedral of Light (priest and paladin trainers), the Dwarven District (mining and blacksmithing), the Mage Quarter (mage and warlock trainers), Old Town (rogue trainers and SI:7 headquarters), and Stormwind Keep where the throne room awaits. The city also houses the Stockade dungeon and the Deeprun Tram connecting to Ironforge.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(33, 'Ironforge', 'Ironforge is the ancient, magnificent capital of the Dwarven nation, carved into the very heart of the mountain bearing its name. The city is centered around the Great Forge, an immense pit of molten metal that has burned since the city''s founding and serves as both a cultural symbol and practical crafting station. The city''s circular layout radiates outward from the Forge into distinct districts: the Commons (auction house and bank), the Military Ward (warrior and hunter trainers), the Mystic Ward (mage and priest trainers), Tinker Town (gnome quarter with engineering trainers), the Hall of Explorers (museum and Explorer''s League headquarters), and the Throne Room where King Magni Bronzebeard rules. The Deeprun Tram connects Ironforge to Stormwind City, making it a central hub for Alliance logistics.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, NULL),
(34, 'Darnassus', 'Darnassus is the ethereal, moonlit capital of the Night Elves, situated atop the World Tree Teldrassil. The city is a marvel of ancient elven architecture, with graceful buildings woven into the living wood of the great tree, moonlit waterways, and serene gardens. Key areas include the Temple of the Moon (where High Priestess Tyrande Whisperwind resides), the Cenarion Enclave (druid trainers and Cenarion Circle representatives), the Tradesmen''s Terrace (auction house and bank), and the Craftsmen''s Terrace. Darnassus is notably quieter and less visited than other Alliance capitals due to its remote location, accessible primarily by boat from Darkshore. Despite this, it remains one of the most beautiful cities in the game, embodying the Night Elves'' deep connection to nature and the moon.', 1, 60, 'KALIMDOR', 'CITY', 1, NULL)
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    min_level = EXCLUDED.min_level,
    max_level = EXCLUDED.max_level,
    continent = EXCLUDED.continent,
    zone_type = EXCLUDED.zone_type,
    faction_id = EXCLUDED.faction_id;

-- ==================== CIUDADES HORDE ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(14, 'Orgrimmar', 'Orgrimmar is the mighty fortress capital of the Horde, carved into the red rock canyons of northern Durotar by Warchief Thrall and named in honor of the legendary Orgrim Doomhammer. The city is a testament to orcish engineering and strength, with massive iron gates, spike-topped walls, and buildings constructed from timber and iron. Key districts include the Valley of Strength (main hub with auction house and bank), the Valley of Wisdom (where Thrall holds court), the Valley of Honor (warrior trainers and the Ring of Valor), the Drag (a narrow canyon with various trainers), the Cleft of Shadow (rogue and warlock trainers), and the Valley of Spirits (troll district). Orgrimmar also houses the entrance to the Ragefire Chasm dungeon and serves as the flight hub connecting to all Horde territories.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(35, 'Thunder Bluff', 'Thunder Bluff is the majestic capital of the Tauren people, constructed atop a series of towering mesas that rise dramatically from the plains of Mulgore. The city is connected by rope bridges spanning the gaps between the mesa plateaus, each serving a different purpose: the High Rise (where Cairne Bloodhoof holds court), the Spirit Rise (shaman and priest trainers, with the Pools of Vision for scrying), the Hunter Rise (hunter and warrior trainers), and the lower mesa with the auction house and bank. Accessible only by elevators from the ground level, Thunder Bluff is one of the most defensible cities in the game and features some of the most stunning views in World of Warcraft. The city reflects Tauren culture perfectly — open to the sky, connected to nature, and built with reverence for the Earth Mother.', 1, 60, 'KALIMDOR', 'CITY', 2, NULL),
(36, 'Undercity', 'Undercity is the dark, labyrinthine capital of the Forsaken, built in the catacombs and sewers beneath the ruins of Lordaeron''s once-great palace. The city is a gothic masterpiece of undead architecture, with green slime rivers, flickering lanterns, and the constant sound of dripping water echoing through its circular corridors. The layout consists of four quarters arranged around a central hub: the War Quarter (warrior and rogue trainers), the Magic Quarter (mage and warlock trainers), the Apothecarium (where the Royal Apothecary Society conducts sinister experiments developing a New Plague), and the Rogues'' Quarter. At the center, Sylvanas Windrunner, the Banshee Queen, holds court in the Royal Quarter. Above the Undercity, the ruined Lordaeron throne room contains an eerie echo of the moment Prince Arthas murdered his father, King Terenas.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 2, NULL)
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    min_level = EXCLUDED.min_level,
    max_level = EXCLUDED.max_level,
    continent = EXCLUDED.continent,
    zone_type = EXCLUDED.zone_type,
    faction_id = EXCLUDED.faction_id;

-- ==================== ASHENVALE (Kalimdor Open World) ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES
(18, 'Ashenvale', 'Ashenvale is an ancient, sacred forest in northern Kalimdor that represents one of the fiercest battlegrounds between the Alliance and Horde. The Night Elves have guarded this woodland for thousands of years, but the Horde''s need for lumber has led to an aggressive deforestation campaign by the Warsong clan, based out of the Warsong Lumber Camp. Both factions maintain strongholds: Astranaar for the Alliance and Splintertree Post for the Horde. The zone features ancient Night Elf ruins, the corrupted Demonfall Canyon (scarred by the Burning Legion''s invasion), and the entrance to the Warsong Gulch battleground. Notable quest chains involve battling the satyr forces in Night Run, investigating the corruption of the Forest Song, and the escalating military conflict between the two factions.', 18, 30, 'KALIMDOR', 'OPEN_WORLD', NULL, NULL)
ON CONFLICT (id) DO UPDATE SET
    name = EXCLUDED.name,
    description = EXCLUDED.description,
    min_level = EXCLUDED.min_level,
    max_level = EXCLUDED.max_level,
    continent = EXCLUDED.continent,
    zone_type = EXCLUDED.zone_type,
    faction_id = EXCLUDED.faction_id;

-- ==================== VERIFICACION ====================
-- Ejecuta esto después para confirmar que se insertaron:
SELECT id, name, zone_type, continent,
       (SELECT f.name FROM factions f WHERE f.id = z.faction_id) AS faction_name
FROM zones z
WHERE z.zone_type = 'CITY' OR z.id = 18
ORDER BY z.zone_type, z.id;

