-- ============================================================
-- DATA SEED: World of Warcraft Vanilla
-- Datos iniciales para desarrollo y demostracion
-- Sincronizado con el frontend Android (Turtle WoW Companion)
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

-- ==================== ZONES (18 zones) ====================
-- Alliance zones
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (1, 'Elwynn Forest', 'A tranquil woodland south of Stormwind City. Starting zone for Humans, filled with gentle streams, rolling hills, and the occasional threat of kobolds and gnolls.', 1, 10, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, 'https://static.wikia.nocookie.net/wowpedia/images/4/4a/Elwynn_Forest.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (2, 'Westfall', 'Once-fertile farmlands now overrun by the Defias Brotherhood. The People''s Militia struggles to maintain order in the absence of Stormwind''s military.', 10, 20, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, 'https://static.wikia.nocookie.net/wowpedia/images/4/47/Westfall.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (3, 'Duskwood', 'A dark and haunted forest east of Westfall, perpetually shrouded in shadow. Worgen, undead, and other horrors lurk behind every tree.', 18, 30, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, 'https://static.wikia.nocookie.net/wowpedia/images/2/2e/Duskwood.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (4, 'Redridge Mountains', 'A mountainous region east of Elwynn Forest, under constant threat from Blackrock orcs. The town of Lakeshire serves as a bastion of Alliance presence.', 15, 25, 'EASTERN_KINGDOMS', 'OPEN_WORLD', 1, 'https://static.wikia.nocookie.net/wowpedia/images/a/a3/Redridge_Mountains.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (5, 'Stormwind City', 'Capital of the Alliance and the Kingdom of Stormwind. A majestic city rebuilt after the First War, center of human civilization.', 1, 60, 'EASTERN_KINGDOMS', 'CITY', 1, 'https://static.wikia.nocookie.net/wowpedia/images/5/5c/StormwindCity.jpg');

-- Horde zones
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (6, 'Durotar', 'A harsh, rocky land on the eastern coast of Kalimdor. Starting zone for Orcs and Trolls, it is a land of red earth and scorching sun.', 1, 10, 'KALIMDOR', 'OPEN_WORLD', 2, 'https://static.wikia.nocookie.net/wowpedia/images/6/6d/Durotar.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (7, 'The Barrens', 'A vast savanna stretching across central Kalimdor. Home to diverse wildlife and the bustling crossroads, it is a crucible for young Horde adventurers.', 10, 25, 'KALIMDOR', 'OPEN_WORLD', 2, 'https://static.wikia.nocookie.net/wowpedia/images/3/32/Barrens.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (8, 'Thousand Needles', 'A vast canyon filled with towering stone pillars rising from the desert floor. The Shimmering Flats host goblin-run rocket car races.', 25, 35, 'KALIMDOR', 'OPEN_WORLD', 2, 'https://static.wikia.nocookie.net/wowpedia/images/f/f1/Thousand_Needles.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (9, 'Stonetalon Mountains', 'A mountainous region in central Kalimdor contested by druids and the Venture Company. The Horde maintains a strong presence in its southern reaches.', 15, 27, 'KALIMDOR', 'OPEN_WORLD', 2, 'https://static.wikia.nocookie.net/wowpedia/images/0/05/Stonetalon_Mountains.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (10, 'Orgrimmar', 'Capital of the Horde, built into the red cliffs of Durotar. A fortress city of iron and stone, seat of the Warchief.', 1, 60, 'KALIMDOR', 'CITY', 2, 'https://static.wikia.nocookie.net/wowpedia/images/0/05/Orgrimmar.jpg');

-- Contested / Neutral zones
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (11, 'Ashenvale', 'An ancient forest in northern Kalimdor, sacred to the Night Elves but fiercely contested by the Horde. Its ancient trees hide dark secrets.', 18, 30, 'KALIMDOR', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/a/a4/Ashenvale.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (12, 'Stranglethorn Vale', 'A dense jungle filled with trolls, pirates, and wild beasts. The Gurubashi trolls are rebuilding their empire in the ancient city of Zul''Gurub.', 30, 45, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/7/71/Stranglethorn_Vale.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (13, 'Tanaris', 'A vast desert in southern Kalimdor, home to the port city of Gadgetzan. The Caverns of Time lie hidden beneath its sands.', 40, 50, 'KALIMDOR', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/c/c0/Tanaris.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (14, 'Un''Goro Crater', 'A lush, primordial crater teeming with dinosaurs and exotic plant life. A land untouched by time, rich in rare crystals and mysterious power pylons.', 48, 55, 'KALIMDOR', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/2/27/UnGoro_Crater.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (15, 'Winterspring', 'A frozen valley nestled in the mountains of northern Kalimdor. Home to frostsaber cats, blue dragonspawn, and the goblin town of Everlook.', 53, 60, 'KALIMDOR', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/3/35/Winterspring.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (16, 'Silithus', 'A desolate desert in southwestern Kalimdor, swarming with the insectoid Silithid. The gates of Ahn''Qiraj loom in the south.', 55, 60, 'KALIMDOR', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/7/7c/Silithus.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (17, 'Eastern Plaguelands', 'The heart of the Scourge''s domain in Lordaeron. The land is blighted and crawling with undead, centered around the dread citadel of Stratholme.', 53, 60, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/4/4e/Eastern_Plaguelands.jpg');
INSERT INTO zones (id, name, description, min_level, max_level, continent, zone_type, faction_id, image_url) VALUES (18, 'Western Plaguelands', 'Lands devastated by the Scourge in northern Eastern Kingdoms. The Argent Dawn fights to reclaim this blighted territory from the undead.', 51, 58, 'EASTERN_KINGDOMS', 'CONTESTED', NULL, 'https://static.wikia.nocookie.net/wowpedia/images/2/24/Western_Plaguelands.jpg');

-- ==================== NPCS (25 NPCs) ====================
-- Alliance NPCs
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (1, 'Marshal Dughan', 'Marshal of Goldshire', 'The marshal of Goldshire, defender of Elwynn Forest and leader of the local militia.', 'QUEST_GIVER', true, 15, 1, 1, 'https://static.wikia.nocookie.net/wowpedia/images/1/1e/Marshal_Dughan.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (2, 'Gryan Stoutmantle', 'Captain of the People''s Militia', 'Leader of the People''s Militia in Westfall, fighting against the Defias Brotherhood.', 'QUEST_GIVER', true, 30, 2, 1, 'https://static.wikia.nocookie.net/wowpedia/images/e/e8/Gryan_Stoutmantle.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (3, 'Hemet Nesingwary', 'Big Game Hunter', 'A famous dwarven hunter in Stranglethorn Vale who challenges adventurers to hunt exotic beasts.', 'QUEST_GIVER', true, 45, 12, 1, 'https://static.wikia.nocookie.net/wowpedia/images/5/57/Hemet_Nesingwary.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (4, 'Innkeeper Farley', 'Innkeeper', 'The innkeeper at the Lion''s Pride Inn in Goldshire, Elwynn Forest.', 'INNKEEPER', true, 10, 1, 1, 'https://static.wikia.nocookie.net/wowpedia/images/3/37/Innkeeper_Farley.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (5, 'Dungar Longdrink', 'Gryphon Master', 'The gryphon master at Stormwind City who provides flight paths to Alliance adventurers.', 'FLIGHT_MASTER', false, 55, 5, 1, 'https://static.wikia.nocookie.net/wowpedia/images/f/f0/Dungar_Longdrink.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (6, 'Woo Ping', 'Weapon Master', 'Weapon master trainer in Stormwind City who teaches proficiency with various weapon types.', 'TRAINER', false, 60, 5, 1, 'https://static.wikia.nocookie.net/wowpedia/images/a/a9/Woo_Ping.jpg');

-- Horde NPCs
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (7, 'Thrall', 'Warchief of the Horde', 'Warchief of the Horde and leader of the Orcs. A powerful shaman who freed his people from demonic corruption.', 'QUEST_GIVER', false, 63, 10, 2, 'https://static.wikia.nocookie.net/wowpedia/images/2/2a/Thrall.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (8, 'Rexxar', 'Champion of the Horde', 'A legendary half-ogre beastmaster who wanders the wilds with his animal companions.', 'QUEST_GIVER', true, 60, 7, 2, 'https://static.wikia.nocookie.net/wowpedia/images/f/fe/Rexxar.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (9, 'Orgrimmar Grunt', 'City Guard', 'Guards of Orgrimmar, loyal to the Warchief. They patrol the streets and maintain order.', 'HUMANOID', false, 55, 10, 2, 'https://static.wikia.nocookie.net/wowpedia/images/8/82/Orgrimmar_Grunt.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (10, 'Vendor Turen', 'General Goods Vendor', 'A general goods vendor in Orgrimmar selling supplies to Horde adventurers.', 'VENDOR', false, 30, 10, 2, 'https://static.wikia.nocookie.net/wowpedia/images/4/4a/Vendor_Turen.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (11, 'Drek''Thar', 'Farseer of the Frostwolf Clan', 'The blind but powerful shaman elder of the Frostwolf Clan, a mentor to Thrall.', 'TRAINER', false, 62, 10, 2, 'https://static.wikia.nocookie.net/wowpedia/images/d/dd/DrekThar.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (12, 'Doras', 'Wind Rider Master', 'The wind rider master in Orgrimmar who provides flight paths for Horde adventurers.', 'FLIGHT_MASTER', false, 55, 10, 2, 'https://static.wikia.nocookie.net/wowpedia/images/c/c9/Doras_WRM.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (13, 'Sergra Darkthorn', 'Quest Giver', 'A quest giver at the Crossroads in the Barrens, sending adventurers to tame the wild savanna.', 'QUEST_GIVER', true, 25, 7, 2, 'https://static.wikia.nocookie.net/wowpedia/images/9/99/Sergra_Darkthorn.jpg');

-- Neutral NPCs
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (14, 'Gazlowe', 'Chief Engineer of Ratchet', 'Chief engineer and leader of Ratchet in the Barrens. A shrewd goblin businessman.', 'QUEST_GIVER', true, 35, 7, 3, 'https://static.wikia.nocookie.net/wowpedia/images/5/5a/Gazlowe.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (15, 'Auctioneer Beardo', 'Auctioneer', 'Goblin auctioneer at Gadgetzan in Tanaris. Open for business with both factions.', 'VENDOR', false, 40, 13, 3, 'https://static.wikia.nocookie.net/wowpedia/images/7/71/Auctioneer_Beardo.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (16, 'Chromie', 'Bronze Dragon', 'A bronze dragon disguised as a gnome, guardian of the timeways. Found investigating the plague in Andorhal.', 'QUEST_GIVER', true, 55, 18, 4, 'https://static.wikia.nocookie.net/wowpedia/images/b/b3/Chromie.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (17, 'Mux Manascrambler', 'Goblin Engineer', 'A goblin engineer in Gadgetzan who offers engineering supplies and training.', 'TRAINER', false, 45, 13, 3, 'https://static.wikia.nocookie.net/wowpedia/images/e/e0/Mux_Manascrambler.jpg');

-- Hostile / Boss NPCs (no faction)
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (18, 'Hogger', 'Gnoll Chieftain', 'The fearsome gnoll chieftain of Elwynn Forest. Terror of low-level adventurers everywhere.', 'BOSS', false, 11, 1, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/7/73/Hogger.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (19, 'Edwin VanCleef', 'Defias Kingpin', 'Leader of the Defias Brotherhood. Once a stonemason betrayed by the nobles of Stormwind, now a ruthless criminal mastermind.', 'BOSS', false, 21, 2, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/5/53/Edwin_VanCleef.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (20, 'Onyxia', 'Broodmother of the Black Dragonflight', 'Daughter of Deathwing, she secretly manipulated Stormwind politics disguised as Lady Prestor.', 'DRAGON', false, 63, 12, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/a/a4/Onyxia.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (21, 'Ragnaros', 'The Firelord', 'The elemental lord of fire, summoned by the Dark Iron dwarves. Resides in the molten depths of Blackrock Mountain.', 'ELEMENTAL', false, 63, 17, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/4/4e/Ragnaros.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (22, 'Lady Anacondra', 'Corrupted Druid', 'A druid corrupted by the Emerald Nightmare, now a boss in the Wailing Caverns.', 'BOSS', false, 20, 7, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/0/0b/Lady_Anacondra.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (23, 'Mor''Ladim', 'Undead Knight', 'A cursed undead knight who wanders the graveyard of Duskwood, once a hero of the Alliance.', 'UNDEAD', false, 28, 3, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/d/d4/MorLadim.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (24, 'Stitches', 'Abomination', 'A terrifying undead abomination that patrols the roads of Duskwood, feared by all travelers.', 'UNDEAD', false, 35, 3, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/a/a2/Stitches.jpg');
INSERT INTO npcs (id, name, title, description, npc_type, is_quest_giver, level, zone_id, faction_id, image_url) VALUES (25, 'King Bangalash', 'White Tiger', 'A rare and powerful white tiger prowling the jungles of Stranglethorn Vale. Coveted by hunters.', 'BEAST', false, 43, 12, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/b/b0/King_Bangalash.jpg');

-- ==================== QUESTS (25 quests) ====================
-- Alliance quests
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (1, 'A Threat Within', 'Marshal Dughan is concerned about the growing threat of kobolds in the mines of Elwynn Forest. Investigate the Fargodeep Mine and report back.', 4, 1, 'ALLIANCE', '250 XP, 1 silver', 250, 1, 1, 'https://static.wikia.nocookie.net/wowpedia/images/e/ef/Elwynn_Forest_Screenshot.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (2, 'The Defias Brotherhood', 'Gryan Stoutmantle needs help uncovering the Defias threat in Westfall. Track down clues about their leadership and hidden fortress.', 14, 10, 'ALLIANCE', '1150 XP, 8 silver, Chain quest reward', 1150, 2, 2, 'https://static.wikia.nocookie.net/wowpedia/images/4/47/Westfall.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (3, 'The People''s Militia', 'Help the People''s Militia defend Westfall from the Defias Brotherhood. Eliminate their scouts and saboteurs threatening the farmlands.', 12, 9, 'ALLIANCE', '900 XP, 6 silver', 900, 2, 2, 'https://static.wikia.nocookie.net/wowpedia/images/4/47/Westfall.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (4, 'Elwynn Forest Wolves', 'Clear the wolves threatening the farmers of Elwynn Forest. The beasts have grown bold and are attacking livestock near Goldshire.', 2, 1, 'ALLIANCE', '170 XP, 75 copper', 170, 1, 4, 'https://static.wikia.nocookie.net/wowpedia/images/4/4a/Elwynn_Forest.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (5, 'The Legend of Stalvan', 'Investigate the dark history of Stalvan Mistmantle in Duskwood. Uncover the tragic tale of love and madness that haunts the region.', 22, 18, 'ALLIANCE', '1800 XP, 18 silver', 1800, 3, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/2/2e/Duskwood.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (6, 'Ashenvale Outrunners', 'Eliminate the Horde scouts in Ashenvale forest. They are surveying Alliance positions for a potential offensive.', 20, 18, 'ALLIANCE', '1750 XP, 15 silver', 1750, 11, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/a/a4/Ashenvale.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (7, 'Blackrock Menace', 'Drive back the Blackrock orcs threatening Redridge Mountains. The town of Lakeshire is under siege and needs reinforcements.', 18, 15, 'ALLIANCE', '1400 XP, 12 silver', 1400, 4, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/a/a3/Redridge_Mountains.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (8, 'Wanted: Hogger', 'Hogger, the gnoll chieftain, has been terrorizing travelers in Elwynn Forest. Bring his head to Marshal Dughan for a reward.', 11, 5, 'ALLIANCE', '850 XP, 5 silver', 850, 1, 1, 'https://static.wikia.nocookie.net/wowpedia/images/7/73/Hogger.jpg');

-- Horde quests
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (9, 'Chen''s Empty Keg', 'Find the ingredients for Chen Stormstout''s legendary brew somewhere in the Barrens. A quest of taste, adventure, and hops.', 15, 11, 'HORDE', '1350 XP, 10 silver', 1350, 7, 14, 'https://static.wikia.nocookie.net/wowpedia/images/3/32/Barrens.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (10, 'Lost in Battle', 'Find a fallen warrior in the Barrens and return his belongings to his family. Honor the sacrifice of those who fell defending the Horde.', 10, 7, 'HORDE', '630 XP, 3 silver 50 copper', 630, 7, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/3/32/Barrens.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (11, 'Sergra''s Challenge', 'Sergra Darkthorn at the Crossroads challenges you to hunt the fierce raptors of the Barrens and prove your worth as a hunter.', 13, 10, 'HORDE', '1100 XP, 7 silver', 1100, 7, 13, 'https://static.wikia.nocookie.net/wowpedia/images/3/32/Barrens.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (12, 'The Spirits of Stonetalon', 'Commune with the ancestral spirits in the Stonetalon Mountains and defend the sacred groves from the Venture Company''s deforestation.', 18, 15, 'HORDE', '1500 XP, 13 silver', 1500, 9, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/0/05/Stonetalon_Mountains.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (13, 'Call of the Frostwolf', 'Drek''Thar calls upon champions to defend the Frostwolf clan''s honor in Alterac Valley against the Stormpike dwarves.', 51, 48, 'HORDE', '5000 XP, 50 silver', 5000, 10, 11, 'https://static.wikia.nocookie.net/wowpedia/images/0/05/Orgrimmar.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (14, 'Consumed by Hatred', 'The quilboar threat in the Barrens grows stronger. Eliminate their war leaders before they unite against the Crossroads.', 16, 12, 'HORDE', '1250 XP, 9 silver', 1250, 7, 13, 'https://static.wikia.nocookie.net/wowpedia/images/3/32/Barrens.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (15, 'The Thousand Needles Race', 'Participate in the goblin-sponsored races across the Shimmering Flats. Win glory and prizes by defeating the competition.', 28, 25, 'HORDE', '2200 XP, 22 silver', 2200, 8, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/f/f1/Thousand_Needles.jpg');

-- Neutral quests
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (16, 'Welcome to the Jungle', 'Hemet Nesingwary challenges you to hunt the wild beasts of Stranglethorn Vale. Prove yourself against panthers, tigers, and raptors.', 30, 28, NULL, '2400 XP, 25 silver', 2400, 12, 3, 'https://static.wikia.nocookie.net/wowpedia/images/7/71/Stranglethorn_Vale.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (17, 'Raptor Mastery', 'Hemet Nesingwary wants you to prove yourself by hunting the deadliest raptors in Stranglethorn Vale.', 33, 29, NULL, '2800 XP, 30 silver', 2800, 12, 3, 'https://static.wikia.nocookie.net/wowpedia/images/7/71/Stranglethorn_Vale.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (18, 'A Plague Upon Thee', 'Chromie needs help investigating the plague in the Western Plaguelands. The bronze dragon senses temporal disturbances.', 53, 50, NULL, '5500 XP, 55 silver', 5500, 18, 16, 'https://static.wikia.nocookie.net/wowpedia/images/2/24/Western_Plaguelands.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (19, 'Gadgetzan Water Survey', 'Investigate the water shortage in Tanaris for the goblins of Gadgetzan. Someone is diverting the underground streams.', 42, 40, NULL, '3200 XP, 35 silver', 3200, 13, 15, 'https://static.wikia.nocookie.net/wowpedia/images/c/c0/Tanaris.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (20, 'The Apes of Un''Goro', 'Explore the mysterious Un''Goro Crater and study the intelligent apes that dwell there. Collect samples for research.', 50, 48, NULL, '4800 XP, 48 silver', 4800, 14, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/2/27/UnGoro_Crater.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (21, 'Frostsaber Provisions', 'Help the Frostsaber trainers in Winterspring by gathering provisions. The harsh winter has depleted their supplies.', 55, 53, NULL, '5200 XP, 52 silver', 5200, 15, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/3/35/Winterspring.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (22, 'The Calling of Silithus', 'The Cenarion Circle needs champions to investigate the growing Silithid threat in Silithus before the gates of Ahn''Qiraj open.', 58, 55, NULL, '6000 XP, 60 silver', 6000, 16, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/7/7c/Silithus.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (23, 'Light''s Hope Chapel', 'Travel to Light''s Hope Chapel in the Eastern Plaguelands and assist the Argent Dawn in their crusade against the Scourge.', 55, 52, NULL, '5800 XP, 57 silver', 5800, 17, NULL, 'https://static.wikia.nocookie.net/wowpedia/images/4/4e/Eastern_Plaguelands.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (24, 'Big Game Hunter', 'Track and defeat King Bangalash, the legendary white tiger of Stranglethorn Vale, for Hemet Nesingwary.', 38, 35, NULL, '3100 XP, 32 silver', 3100, 12, 3, 'https://static.wikia.nocookie.net/wowpedia/images/b/b0/King_Bangalash.jpg');
INSERT INTO quests (id, name, description, level, min_level, faction_required, rewards, reward_xp, zone_id, quest_giver_id, image_url) VALUES (25, 'Plagued Lands', 'Scout the Western Plaguelands and report on the Scourge activity to the Argent Dawn. The undead forces are massing.', 54, 51, NULL, '5600 XP, 56 silver', 5600, 18, 16, 'https://static.wikia.nocookie.net/wowpedia/images/2/24/Western_Plaguelands.jpg');

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

