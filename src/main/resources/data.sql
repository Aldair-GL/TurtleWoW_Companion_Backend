-- ============================================================
-- DATA SEED: World of Warcraft Vanilla
-- Datos iniciales para desarrollo y demostracion
-- ============================================================

-- ==================== FACTIONS ====================
INSERT INTO factions (id, name, description, type) VALUES (1, 'Alliance', 'The Grand Alliance, a faction of noble races united against common threats.', 'ALLIANCE');
INSERT INTO factions (id, name, description, type) VALUES (2, 'Horde', 'The New Horde, a coalition of outcast races fighting for survival and honor.', 'HORDE');
INSERT INTO factions (id, name, description, type) VALUES (3, 'Steamwheedle Cartel', 'A powerful goblin trade coalition that maintains neutrality between Alliance and Horde.', 'NEUTRAL');
INSERT INTO factions (id, name, description, type) VALUES (4, 'Argent Dawn', 'An organization focused on combating the Scourge in the Plaguelands.', 'NEUTRAL');
INSERT INTO factions (id, name, description, type) VALUES (5, 'Cenarion Circle', 'A druidic order dedicated to protecting nature and the Emerald Dream.', 'NEUTRAL');
INSERT INTO factions (id, name, description, type) VALUES (6, 'Thorium Brotherhood', 'A group of Dark Iron dwarves that have broken away from Ragnaros.', 'NEUTRAL');

-- ==================== CHARACTER CLASSES ====================
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (1, 'Warrior', 'Masters of weaponry and armor. Excel at tanking and melee damage.', 'HYBRID', 'RAGE');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (2, 'Paladin', 'Holy warriors that can heal, tank, and deal damage. Alliance only.', 'HYBRID', 'MANA');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (3, 'Hunter', 'Ranged damage dealers who fight alongside animal companions.', 'DPS', 'MANA');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (4, 'Rogue', 'Stealthy assassins that excel at melee burst damage.', 'DPS', 'ENERGY');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (5, 'Priest', 'Versatile healers who can also deal shadow damage.', 'HEALER', 'MANA');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (6, 'Shaman', 'Elemental warriors with totems. Horde only.', 'HYBRID', 'MANA');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (7, 'Mage', 'Masters of arcane, fire, and frost magic. Powerful ranged DPS.', 'DPS', 'MANA');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (8, 'Warlock', 'Dark casters who command demons and shadow magic.', 'DPS', 'MANA');
INSERT INTO character_classes (id, name, description, role, resource_type) VALUES (9, 'Druid', 'Shapeshifters who can fill any role: tank, healer, melee or ranged DPS.', 'HYBRID', 'MANA');

-- ==================== ZONES ====================
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (1, 'Elwynn Forest', 'A tranquil woodland south of Stormwind City. Starting zone for Humans.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (2, 'Durotar', 'A harsh, rocky land on the eastern coast of Kalimdor. Starting zone for Orcs and Trolls.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (3, 'Westfall', 'Once-fertile farmlands now overrun by the Defias Brotherhood.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (4, 'The Barrens', 'A vast savanna stretching across central Kalimdor.', 10, 25, 'KALIMDOR', 'OPEN_WORLD', 2);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (5, 'Stranglethorn Vale', 'A dense jungle filled with trolls, pirates, and wild beasts.', 30, 45, 'EASTERN_KINGDOMS', 'CONTESTED', NULL);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (6, 'Stormwind City', 'Capital of the Alliance and the Kingdom of Stormwind.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (7, 'Orgrimmar', 'Capital of the Horde, built into the cliffs of Durotar.', 1, 60, 'KALIMDOR', 'CITY', 2);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (8, 'Deadmines', 'A dungeon hidden beneath the farmlands of Westfall, stronghold of the Defias Brotherhood.', 17, 26, 'EASTERN_KINGDOMS', 'DUNGEON', 1);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (9, 'Wailing Caverns', 'A dungeon within the Barrens, corrupted by the Emerald Nightmare.', 17, 24, 'KALIMDOR', 'DUNGEON', 2);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (10, 'Ashenvale', 'An ancient forest in northern Kalimdor, contested by Alliance and Horde.', 18, 30, 'KALIMDOR', 'CONTESTED', NULL);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (11, 'Tanaris', 'A vast desert in southern Kalimdor, home to the port city of Gadgetzan.', 40, 50, 'KALIMDOR', 'CONTESTED', NULL);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (12, 'Western Plaguelands', 'Lands devastated by the Scourge in northern Eastern Kingdoms.', 51, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL);
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id) VALUES (13, 'Molten Core', 'The fiery lair of Ragnaros the Firelord, deep beneath Blackrock Mountain.', 60, 60, 'EASTERN_KINGDOMS', 'RAID', NULL);

-- ==================== NPCS ====================
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (1, 'Marshal Dughan', 'Marshal of Goldshire', 'The marshal of Goldshire, defender of Elwynn Forest.', 'HUMANOID', true, 15, 1, 1);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (2, 'Gryan Stoutmantle', 'Captain of the People''s Militia', 'Leader of the People''s Militia in Westfall.', 'HUMANOID', true, 30, 3, 1);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (3, 'Gazlowe', 'Chief Engineer of Ratchet', 'Chief engineer and leader of Ratchet in the Barrens.', 'HUMANOID', true, 35, 4, 3);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (4, 'Thrall', 'Warchief of the Horde', 'Warchief of the Horde and leader of the Orcs.', 'HUMANOID', false, 63, 7, 2);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (5, 'Edwin VanCleef', 'Defias Kingpin', 'Leader of the Defias Brotherhood. Final boss of the Deadmines.', 'HUMANOID', false, 21, 8, NULL);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (6, 'Lady Anacondra', 'Corrupted Druid', 'A corrupted druid boss in Wailing Caverns.', 'HUMANOID', false, 20, 9, NULL);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (7, 'Hemet Nesingwary', 'Big Game Hunter', 'A famous dwarven hunter in Stranglethorn Vale.', 'HUMANOID', true, 45, 5, 1);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (8, 'Ragnaros', 'The Firelord', 'The Firelord, elemental lord of fire. Final boss of Molten Core.', 'ELEMENTAL', false, 63, 13, NULL);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (9, 'Rexxar', 'Champion of the Horde', 'A half-ogre beastmaster wandering Desolace and Feralas.', 'HUMANOID', true, 60, 4, 2);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (10, 'Onyxia', 'Broodmother of the Black Dragonflight', 'Daughter of Deathwing disguised as Lady Prestor in Stormwind.', 'DRAGON', false, 63, 6, NULL);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (11, 'Innkeeper Farley', 'Innkeeper', 'The innkeeper at the Lion''s Pride Inn in Goldshire.', 'HUMANOID', true, 10, 1, 1);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (12, 'Orgrimmar Grunt', 'City Guard', 'Guards of Orgrimmar, loyal to the Warchief.', 'HUMANOID', false, 55, 7, 2);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (13, 'Auctioneer Beardo', 'Auctioneer', 'Goblin auctioneer at Gadgetzan.', 'HUMANOID', false, 40, 11, 3);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (14, 'Chromie', 'Bronze Dragon', 'A bronze dragon disguised as a gnome, found in Andorhal.', 'DRAGON', true, 55, 12, 4);
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id) VALUES (15, 'Vendor Turen', 'General Goods Vendor', 'A general goods vendor in Orgrimmar.', 'VENDOR', false, 30, 7, 2);

-- ==================== QUESTS ====================
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (1, 'A Threat Within', 'Marshal Dughan is concerned about the growing threat of kobolds in the mines of Elwynn Forest.', 4, 1, 'ALLIANCE', '250 XP, 1 silver', 250, 1, 1);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (2, 'The Defias Brotherhood', 'Gryan Stoutmantle needs help uncovering the Defias threat in Westfall.', 14, 10, 'ALLIANCE', '1150 XP, 8 silver, Chain quest reward', 1150, 3, 2);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (3, 'The People''s Militia', 'Help the People''s Militia defend Westfall from the Defias Brotherhood.', 12, 9, 'ALLIANCE', '900 XP, 6 silver', 900, 3, 2);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (4, 'Chen''s Empty Keg', 'Find the ingredients for Chen Stormstout''s legendary brew somewhere in the Barrens.', 15, 11, 'HORDE', '1350 XP, 10 silver', 1350, 4, 3);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (5, 'Welcome to the Jungle', 'Hemet Nesingwary challenges you to hunt the wild beasts of Stranglethorn Vale.', 30, 28, NULL, '2400 XP, 25 silver', 2400, 5, 7);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (6, 'Raptor Mastery', 'Hemet Nesingwary wants you to prove yourself by hunting raptors.', 33, 29, NULL, '2800 XP, 30 silver', 2800, 5, 7);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (7, 'Lost in Battle', 'Find a fallen warrior in the Barrens and return his belongings.', 10, 7, 'HORDE', '630 XP, 3 silver 50 copper', 630, 4, NULL);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (8, 'A Plague Upon Thee', 'Chromie needs help investigating the plague in the Western Plaguelands.', 53, 50, NULL, '5500 XP, 55 silver', 5500, 12, 14);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (9, 'Elwynn Forest Wolves', 'Clear the wolves threatening the farmers of Elwynn Forest.', 2, 1, 'ALLIANCE', '170 XP, 75 copper', 170, 1, 11);
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id) VALUES (10, 'Ashenvale Outrunners', 'Eliminate the Horde scouts in Ashenvale forest.', 20, 18, 'ALLIANCE', '1750 XP, 15 silver', 1750, 10, NULL);

-- ==================== ITEMS ====================
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (1, 'Thunderfury, Blessed Blade of the Windseeker', 'A legendary sword forged from the essence of Thunderaan.', 'LEGENDARY', 'Weapon', 60, 'Molten Core - Bindings of the Windseeker');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (2, 'Hearthstone', 'Returns you to your home inn when used.', 'COMMON', 'Consumable', 1, 'Given at character creation');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (3, 'Linen Cloth', 'A basic cloth used for tailoring and first aid.', 'COMMON', 'Trade Good', 1, 'Humanoid mobs level 1-15');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (4, 'Defias Bandana', 'A red bandana worn by members of the Defias Brotherhood.', 'COMMON', 'Quest', 1, 'Defias mobs in Westfall');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (5, 'Smite''s Mighty Hammer', 'A powerful hammer dropped by Mr. Smite in the Deadmines.', 'RARE', 'Weapon', 17, 'Deadmines - Mr. Smite');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (6, 'Staff of Dominance', 'A powerful staff for casters from Blackrock Spire.', 'EPIC', 'Weapon', 57, 'Upper Blackrock Spire');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (7, 'Copper Ore', 'Raw copper ore that can be smelted into copper bars.', 'COMMON', 'Trade Good', 1, 'Mining nodes level 1-50');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (8, 'Shadowfang', 'A rare twink sword from Shadowfang Keep.', 'RARE', 'Weapon', 17, 'Shadowfang Keep - various bosses');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (9, 'Minor Healing Potion', 'Restores 70 to 90 health.', 'COMMON', 'Consumable', 1, 'Alchemy crafting, vendor');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (10, 'Warsong Gulch Mark of Honor', 'A mark earned from Warsong Gulch battleground.', 'UNCOMMON', 'Quest', 10, 'Warsong Gulch PvP');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (11, 'Devout Mantle', 'Priest tier 0 shoulders from Baron Rivendare.', 'RARE', 'Armor', 55, 'Stratholme - Baron Rivendare');
INSERT INTO items (id, name, description, quality, item_type, level_required, drop_source) VALUES (12, 'Sulfuras, Hand of Ragnaros', 'Legendary two-handed mace forged with the Sulfuron Hammer and Eye of Ragnaros.', 'LEGENDARY', 'Weapon', 60, 'Molten Core - Ragnaros');

-- ==================== RACES ====================
INSERT INTO races (id, name, description, faction_id) VALUES (1, 'Human', 'Resilient and adaptable, humans are one of the youngest races of Azeroth.', 1);
INSERT INTO races (id, name, description, faction_id) VALUES (2, 'Dwarf', 'Stout and strong, dwarves are an ancient race of miners and warriors.', 1);
INSERT INTO races (id, name, description, faction_id) VALUES (3, 'Night Elf', 'Ancient and wise, night elves are guardians of nature.', 1);
INSERT INTO races (id, name, description, faction_id) VALUES (4, 'Gnome', 'Inventive and curious, gnomes are brilliant engineers and tinkerers.', 1);
INSERT INTO races (id, name, description, faction_id) VALUES (5, 'Orc', 'Proud and fierce warriors from Draenor, seeking honor in a new world.', 2);
INSERT INTO races (id, name, description, faction_id) VALUES (6, 'Undead', 'Forsaken undead who broke free from the Lich King''s control.', 2);
INSERT INTO races (id, name, description, faction_id) VALUES (7, 'Tauren', 'Noble and peaceful, tauren are deeply connected to nature and the Earth Mother.', 2);
INSERT INTO races (id, name, description, faction_id) VALUES (8, 'Troll', 'Cunning and spiritual, the Darkspear trolls are loyal allies of the Horde.', 2);

-- ==================== RACE-CLASS RELATIONS ====================
-- Human: Warrior, Paladin, Rogue, Priest, Mage, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (1, 1);
INSERT INTO race_class (race_id, class_id) VALUES (1, 2);
INSERT INTO race_class (race_id, class_id) VALUES (1, 4);
INSERT INTO race_class (race_id, class_id) VALUES (1, 5);
INSERT INTO race_class (race_id, class_id) VALUES (1, 7);
INSERT INTO race_class (race_id, class_id) VALUES (1, 8);
-- Dwarf: Warrior, Paladin, Hunter, Rogue, Priest
INSERT INTO race_class (race_id, class_id) VALUES (2, 1);
INSERT INTO race_class (race_id, class_id) VALUES (2, 2);
INSERT INTO race_class (race_id, class_id) VALUES (2, 3);
INSERT INTO race_class (race_id, class_id) VALUES (2, 4);
INSERT INTO race_class (race_id, class_id) VALUES (2, 5);
-- Night Elf: Warrior, Hunter, Rogue, Priest, Druid
INSERT INTO race_class (race_id, class_id) VALUES (3, 1);
INSERT INTO race_class (race_id, class_id) VALUES (3, 3);
INSERT INTO race_class (race_id, class_id) VALUES (3, 4);
INSERT INTO race_class (race_id, class_id) VALUES (3, 5);
INSERT INTO race_class (race_id, class_id) VALUES (3, 9);
-- Gnome: Warrior, Rogue, Mage, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (4, 1);
INSERT INTO race_class (race_id, class_id) VALUES (4, 4);
INSERT INTO race_class (race_id, class_id) VALUES (4, 7);
INSERT INTO race_class (race_id, class_id) VALUES (4, 8);
-- Orc: Warrior, Hunter, Rogue, Shaman, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (5, 1);
INSERT INTO race_class (race_id, class_id) VALUES (5, 3);
INSERT INTO race_class (race_id, class_id) VALUES (5, 4);
INSERT INTO race_class (race_id, class_id) VALUES (5, 6);
INSERT INTO race_class (race_id, class_id) VALUES (5, 8);
-- Undead: Warrior, Rogue, Priest, Mage, Warlock
INSERT INTO race_class (race_id, class_id) VALUES (6, 1);
INSERT INTO race_class (race_id, class_id) VALUES (6, 4);
INSERT INTO race_class (race_id, class_id) VALUES (6, 5);
INSERT INTO race_class (race_id, class_id) VALUES (6, 7);
INSERT INTO race_class (race_id, class_id) VALUES (6, 8);
-- Tauren: Warrior, Hunter, Shaman, Druid
INSERT INTO race_class (race_id, class_id) VALUES (7, 1);
INSERT INTO race_class (race_id, class_id) VALUES (7, 3);
INSERT INTO race_class (race_id, class_id) VALUES (7, 6);
INSERT INTO race_class (race_id, class_id) VALUES (7, 9);
-- Troll: Warrior, Hunter, Rogue, Priest, Shaman, Mage
INSERT INTO race_class (race_id, class_id) VALUES (8, 1);
INSERT INTO race_class (race_id, class_id) VALUES (8, 3);
INSERT INTO race_class (race_id, class_id) VALUES (8, 4);
INSERT INTO race_class (race_id, class_id) VALUES (8, 5);
INSERT INTO race_class (race_id, class_id) VALUES (8, 6);
INSERT INTO race_class (race_id, class_id) VALUES (8, 7);

-- ==================== PROFESSIONS ====================
INSERT INTO professions (id, name, description, type) VALUES (1, 'Alchemy', 'Create potions, elixirs, and flasks from herbs.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (2, 'Blacksmithing', 'Forge weapons and armor from metal bars.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (3, 'Enchanting', 'Enchant weapons and armor with magical properties.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (4, 'Engineering', 'Create gadgets, explosives, and mechanical devices.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (5, 'Herbalism', 'Gather herbs from the world for alchemy.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (6, 'Leatherworking', 'Craft leather and mail armor from hides.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (7, 'Mining', 'Mine ore and gems from mineral veins.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (8, 'Skinning', 'Skin beasts for leather and hides.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (9, 'Tailoring', 'Create cloth armor and bags from cloth.', 'PRIMARY');
INSERT INTO professions (id, name, description, type) VALUES (10, 'Cooking', 'Prepare food that provides temporary buffs.', 'SECONDARY');
INSERT INTO professions (id, name, description, type) VALUES (11, 'First Aid', 'Create bandages to heal wounds outside of combat.', 'SECONDARY');
INSERT INTO professions (id, name, description, type) VALUES (12, 'Fishing', 'Catch fish from bodies of water across Azeroth.', 'SECONDARY');

