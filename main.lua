-- name: [CS] MARIO '96
-- description: The OFFICIAL \\#8B0000\\MARIO '85\\#FFFFFF\\ in \\#FF0000\\S\\#007FFF\\M\\#00FF00\\6\\#FFFF00\\4\\#FFFFFF\\ Character Select Pack!\n\nCredits:\nModels by \\#007FFF\\5UP34\\#FFFFFF\\\nCode by \\#CA8DFE\\DM-kun\\#FFFFFF\\ and \\#06402B\\Squishy\\#FFFFFF\\\nVoice Acting By Sunset + The Hall Monitor\nCharacters Owned by RazzDazzleDoo\n\\#ffffff\\\n\nThis Pack requires Character Select to use as a Library!

local TEXT_MOD_NAME = "MARIO '96 Pack"

if not _G.charSelectExists then
	djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
	return 0
end

local E_MODEL_LUCAS = smlua_model_util_get_id("lucas_geo")
local E_MODEL_FH = smlua_model_util_get_id("falsehero_geo")
local E_MODEL_PC = smlua_model_util_get_id("pipecrawler_geo")
local E_MODEL_MX = smlua_model_util_get_id("mx_geo")

local TEX_LUCAS = get_texture_info("icon_lucas")
local TEX_FH = get_texture_info("icon_fh")
local TEX_PC = get_texture_info("icon_pc")
local TEX_MX = get_texture_info("icon_mx")

--[[ -- Uncomment when there's actual cap models - DM --
local CAPTABLE_LUCAS = {
	normal = smlua_model_util_get_id("lucas_cap_geo"),
	wing = smlua_model_util_get_id("lucas_wing_cap_geo"),
	metal = smlua_model_util_get_id("lucas_metal_cap_geo"),
	metalWing = smlua_model_util_get_id("lucas_metalwing_cap_geo")
}

local CAPTABLE_FH = {
	normal = smlua_model_util_get_id("fh_cap_geo"),
	wing = smlua_model_util_get_id("fh_wing_cap_geo"),
	metal = smlua_model_util_get_id("fh_metal_cap_geo"),
	metalWing = smlua_model_util_get_id("fh_metalwing_cap_geo")
}

local CAPTABLE_PC = {
	normal = smlua_model_util_get_id("pc_cap_geo"),
	wing = smlua_model_util_get_id("pc_wing_cap_geo"),
	metal = smlua_model_util_get_id("pc_metal_cap_geo"),
	metalWing = smlua_model_util_get_id("pc_metalwing_cap_geo")
}

local CAPTABLE_MX = {
	normal = smlua_model_util_get_id("mx_cap_geo"),
	wing = smlua_model_util_get_id("mx_wing_cap_geo"),
	metal = smlua_model_util_get_id("mx_metal_cap_geo"),
	metalWing = smlua_model_util_get_id("mx_metalwing_cap_geo")
}
]]

local VOICETABLE_LUCAS = {
	-- [CHAR_SOUND_HELLO] =             'lucas-hello.ogg', -- Unused (Can be used for a moveset sound)
	-- [CHAR_SOUND_OKEY_DOKEY] =        'lucas-okey-dokey.ogg', -- Starting game
	[CHAR_SOUND_LETS_A_GO] =         'lucas-lets-a-go.ogg', -- Starting level
	[CHAR_SOUND_PUNCH_YAH] =         'lucas-punch1.ogg', -- Punch 1
	[CHAR_SOUND_PUNCH_WAH] =         'lucas-punch2.ogg', -- Punch 2
	[CHAR_SOUND_PUNCH_HOO] =         'lucas-kick.ogg', -- Punch 3
	[CHAR_SOUND_YAH_WAH_HOO] =       {'lucas-jump-yah.ogg', 'lucas-jump-wah.ogg', 'lucas-jump-hoo.ogg'}, -- First Jump Sounds
	[CHAR_SOUND_HOOHOO] =            'lucas-hoohoo.ogg', -- Second jump sound
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'lucas-jump-yahoo.ogg', 'lucas-waha.ogg', 'lucas-yippee.ogg'}, -- Triple jump sounds
	[CHAR_SOUND_UH] =                'lucas-uh.ogg', -- Wall bonk
	[CHAR_SOUND_UH2] =               'lucas-uh2.ogg', -- Landing after long jump
	[CHAR_SOUND_UH2_2] =             'lucas-uh3.ogg',
	[CHAR_SOUND_HAHA] =              'lucas-haha.ogg', -- Landing triple jump
	[CHAR_SOUND_HAHA_2] =            'lucas-haha.ogg',
	[CHAR_SOUND_WAH2] =              'lucas-jump-wah.ogg',
	[CHAR_SOUND_YAHOO] =             'lucas-yahoo.ogg', -- Long jump
	[CHAR_SOUND_DOH] =               'lucas-doh.ogg', -- Long jump wall bonk
	[CHAR_SOUND_WHOA] =              'lucas-whoa.ogg', -- Grabbing ledge
	[CHAR_SOUND_EEUH] =              'lucas-eeuh.ogg', -- Climbing over ledge
	[CHAR_SOUND_WAAAOOOW] =          'lucas-scream.ogg', -- Falling a long distance
	[CHAR_SOUND_TWIRL_BOUNCE] =      'lucas-boing.ogg', -- Bouncing off of a flower spring
	[CHAR_SOUND_GROUND_POUND_WAH] =  'lucas-gp-wah.ogg',
	[CHAR_SOUND_OOOF] =              'lucas-ooof.ogg',
	[CHAR_SOUND_OOOF2] =             'lucas-ooof2.ogg',
	[CHAR_SOUND_HRMM] =              'lucas-hrmm.ogg', -- Lifting something
	[CHAR_SOUND_HERE_WE_GO] =        'lucas-star.ogg', -- Star get
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'lucas-bowser.ogg', -- Throwing Bowser
	[CHAR_SOUND_PANTING_COLD] =      'lucas-panting.ogg',
	[CHAR_SOUND_ATTACKED] =          'lucas-ahow.ogg', -- Damaged
	[CHAR_SOUND_PANTING] =           'lucas-panting.ogg', -- Low health
	[CHAR_SOUND_ON_FIRE] =           'lucas-fire.ogg', -- Burned
	[CHAR_SOUND_IMA_TIRED] =         'lucas-tired.ogg', -- Mario feeling tired
	[CHAR_SOUND_YAWNING] =           'lucas-yawn.ogg', -- Mario yawning before he sits down to sleep
	[CHAR_SOUND_SNORING1] =          'lucas-inhale.ogg', -- Snore Inhale
	[CHAR_SOUND_SNORING2] =          'lucas-exhale.ogg', -- Exhale
	[CHAR_SOUND_SNORING3] =          'lucas-sleeptalk.ogg', -- Sleep talking / mumbling
	[CHAR_SOUND_COUGHING1] =         'lucas-cough1.ogg', -- Cough take 1
	[CHAR_SOUND_COUGHING2] =         'lucas-cough2.ogg', -- Cough take 2
	[CHAR_SOUND_COUGHING3] =         'lucas-cough3.ogg', -- Cough take 3
	[CHAR_SOUND_DYING] =             'lucas-die.ogg', -- Dying from damage
	[CHAR_SOUND_DROWNING] =          'lucas-drown.ogg', -- Running out of air underwater
	[CHAR_SOUND_MAMA_MIA] =          'lucas-mamamia.ogg' -- Booted out of level
}

local VOICETABLE_FH = {
	[CHAR_SOUND_HELLO] =             'fh-hello.ogg',
	-- [CHAR_SOUND_OKEY_DOKEY] =        'fh-okey-dokey.ogg',
	[CHAR_SOUND_LETS_A_GO] =         'fh-letsgo.ogg',
	[CHAR_SOUND_PUNCH_YAH] =         'fh-yah.ogg',
	[CHAR_SOUND_PUNCH_WAH] =         'fh-wah.ogg',
	[CHAR_SOUND_PUNCH_HOO] =         'fh-hoo.ogg',
	[CHAR_SOUND_YAH_WAH_HOO] =       {'fh-yah.ogg', 'fh-wah.ogg', 'fh-hoo.ogg'},
	[CHAR_SOUND_HOOHOO] =            'fh-hoohoo.ogg',
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'fh-yahoo.ogg', 'fh-waha.ogg', 'fh-yippee.ogg'},
	[CHAR_SOUND_UH] =                'fh-uh1.ogg',
	[CHAR_SOUND_UH2] =               'fh-uh2.ogg',
	[CHAR_SOUND_UH2_2] =             'fh-uh3.ogg',
	[CHAR_SOUND_HAHA] =              'fh-haha.ogg',
	[CHAR_SOUND_HAHA_2] =            'fh-haha2.ogg',
	[CHAR_SOUND_WAH2] =              'fh-wah2.ogg',
	[CHAR_SOUND_YAHOO] =             'fh-yahoo.ogg',
	[CHAR_SOUND_DOH] =               'fh-doh.ogg',
	[CHAR_SOUND_WHOA] =              'fh-whoa.ogg',
	[CHAR_SOUND_EEUH] =              'fh-eeuh.ogg',
	[CHAR_SOUND_WAAAOOOW] =          'fh-scream.ogg',
	[CHAR_SOUND_TWIRL_BOUNCE] =      'fh-yippee.ogg',
	[CHAR_SOUND_GROUND_POUND_WAH] =  'fh-gp-wah.ogg',
	[CHAR_SOUND_OOOF] =              'fh-ooof.ogg',
	[CHAR_SOUND_OOOF2] =             'fh-ooof2.ogg',
	[CHAR_SOUND_HRMM] =              'fh-hrmm.ogg',
	[CHAR_SOUND_HERE_WE_GO] =        'fh-herego.ogg',
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'fh-solong.ogg',
	[CHAR_SOUND_PANTING_COLD] =      'fh-panting2.ogg',
	[CHAR_SOUND_ATTACKED] =          'fh-hurt.ogg',
	[CHAR_SOUND_PANTING] =           'fh-panting.ogg',
	[CHAR_SOUND_ON_FIRE] =           'fh-fire.ogg',
	[CHAR_SOUND_IMA_TIRED] =         'fh-tired.ogg',
	[CHAR_SOUND_YAWNING] =           'fh-yawn.ogg',
	[CHAR_SOUND_SNORING1] =          'fh-snore1.ogg',
	[CHAR_SOUND_SNORING2] =          'fh-snore2.ogg',
	[CHAR_SOUND_SNORING3] =          {'fh-snore1.ogg', 'fh-snore2.ogg'},
	[CHAR_SOUND_COUGHING1] =         'fh-cough1.ogg',
	[CHAR_SOUND_COUGHING2] =         'fh-cough2.ogg',
	[CHAR_SOUND_COUGHING3] =         'fh-cough3.ogg',
	[CHAR_SOUND_DYING] =             'fh-die.ogg',
	[CHAR_SOUND_DROWNING] =          'fh-drown.ogg',
	[CHAR_SOUND_MAMA_MIA] =          'fh-mamamia.ogg'
}

local VOICETABLE_PC = {
	-- [CHAR_SOUND_HELLO] =             'pc-hello.ogg',
	-- [CHAR_SOUND_OKEY_DOKEY] =        'pc-okey-dokey.ogg',
	[CHAR_SOUND_LETS_A_GO] =         'pc-letsgo.ogg',
	[CHAR_SOUND_PUNCH_YAH] =         'pc-yah.ogg',
	[CHAR_SOUND_PUNCH_WAH] =         'pc-wah.ogg',
	[CHAR_SOUND_PUNCH_HOO] =         'pc-hoo.ogg',
	[CHAR_SOUND_YAH_WAH_HOO] =       {'pc-jump1.ogg', 'pc-jump2.ogg'},
	[CHAR_SOUND_HOOHOO] =            'pc-jump2.ogg',
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'pc-yahoo.ogg', 'pc-waha.ogg', 'pc-yippee.ogg'},
	[CHAR_SOUND_UH] =                'pc-uh1.ogg',
	[CHAR_SOUND_UH2] =               'pc-uh2.ogg',
	[CHAR_SOUND_UH2_2] =             'pc-uh3.ogg',
	[CHAR_SOUND_HAHA] =              'pc-haha.ogg',
	[CHAR_SOUND_HAHA_2] =            'pc-haha.ogg',
	[CHAR_SOUND_WAH2] =              'pc-wah2.ogg',
	[CHAR_SOUND_YAHOO] =             'pc-yahoo.ogg',
	[CHAR_SOUND_DOH] =               'pc-doh.ogg',
	[CHAR_SOUND_WHOA] =              'pc-whoa.ogg',
	[CHAR_SOUND_EEUH] =              'pc-eeuh.ogg',
	[CHAR_SOUND_WAAAOOOW] =          'pc-scream.ogg',
	[CHAR_SOUND_TWIRL_BOUNCE] =      'pc-yippee.ogg',
	[CHAR_SOUND_GROUND_POUND_WAH] =  'pc-gp-wah.ogg',
	[CHAR_SOUND_OOOF] =              'pc-ooof.ogg',
	[CHAR_SOUND_OOOF2] =             'pc-ooof2.ogg',
	[CHAR_SOUND_HRMM] =              'pc-hrmm.ogg',
	[CHAR_SOUND_HERE_WE_GO] =        'pc-herego.ogg',
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'pc-solong.ogg',
	[CHAR_SOUND_PANTING_COLD] =      'pc-panting.ogg',
	[CHAR_SOUND_ATTACKED] =          'pc-hurt.ogg',
	[CHAR_SOUND_PANTING] =           'pc-panting.ogg',
	[CHAR_SOUND_ON_FIRE] =           'pc-fire.ogg',
	[CHAR_SOUND_IMA_TIRED] =         'pc-tired.ogg',
	[CHAR_SOUND_YAWNING] =           'pc-yawn.ogg',
	[CHAR_SOUND_SNORING1] =          'pc-snore1.ogg',
	[CHAR_SOUND_SNORING2] =          'pc-snore2.ogg',
	[CHAR_SOUND_SNORING3] =          'pc-snore3.ogg',
	[CHAR_SOUND_COUGHING1] =         'pc-cough1.ogg',
	[CHAR_SOUND_COUGHING2] =         'pc-cough2.ogg',
	[CHAR_SOUND_COUGHING3] =         'pc-cough3.ogg',
	[CHAR_SOUND_DYING] =             'pc-die.ogg',
	[CHAR_SOUND_DROWNING] =          'pc-drown.ogg',
	[CHAR_SOUND_MAMA_MIA] =          'pc-mamamia.ogg'
}

local VOICETABLE_MX = {
	-- [CHAR_SOUND_HELLO] =             'mx-hello.ogg',
	-- [CHAR_SOUND_OKEY_DOKEY] =        'mx-okey-dokey.ogg',
	[CHAR_SOUND_LETS_A_GO] =         'mx-lets-a-go.ogg',
	[CHAR_SOUND_PUNCH_YAH] =         'mx-yah.ogg',
	[CHAR_SOUND_PUNCH_WAH] =         'mx-wah.ogg',
	[CHAR_SOUND_PUNCH_HOO] =         'mx-hoo.ogg',
	[CHAR_SOUND_YAH_WAH_HOO] =       {'mx-yah.ogg', 'mx-jump-wah.ogg', 'mx-jump-hoo.ogg'},
	[CHAR_SOUND_HOOHOO] =            'mx-hoo.ogg',
	[CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'mx-wahoo.ogg', 'mx-waha.ogg', 'mx-yippee.ogg'},
	[CHAR_SOUND_UH] =                'mx-uh.ogg',
	[CHAR_SOUND_UH2] =               'mx-uh2.ogg',
	[CHAR_SOUND_UH2_2] =             'mx-uh3.ogg',
	[CHAR_SOUND_HAHA] =              'mx-haha.ogg',
	[CHAR_SOUND_HAHA_2] =            'mx-haha.ogg',
	[CHAR_SOUND_WAH2] =              'mx-wah2.ogg',
	[CHAR_SOUND_YAHOO] =             'mx-wahoo.ogg',
	[CHAR_SOUND_DOH] =               'mx-doh.ogg',
	[CHAR_SOUND_WHOA] =              'mx-whoa.ogg',
	[CHAR_SOUND_EEUH] =              'mx-eeuh.ogg',
	[CHAR_SOUND_WAAAOOOW] =          'mx-scream.ogg',
	[CHAR_SOUND_TWIRL_BOUNCE] =      'mx-boing.ogg',
	[CHAR_SOUND_GROUND_POUND_WAH] =  'mx-gp-wah.ogg',
	[CHAR_SOUND_OOOF] =              'mx-ooof.ogg',
	[CHAR_SOUND_OOOF2] =             'mx-ooof2.ogg',
	[CHAR_SOUND_HRMM] =              'mx-hrmm.ogg',
	[CHAR_SOUND_HERE_WE_GO] =        'mx-star.ogg',
	[CHAR_SOUND_SO_LONGA_BOWSER] =   'mx-bowser.ogg',
	[CHAR_SOUND_PANTING_COLD] =      'mx-panting.ogg',
	[CHAR_SOUND_ATTACKED] =          'mx-hurt.ogg',
	[CHAR_SOUND_PANTING] =           'mx-panting.ogg',
	[CHAR_SOUND_ON_FIRE] =           'mx-fire.ogg',
	[CHAR_SOUND_IMA_TIRED] =         'mx-tired.ogg',
	[CHAR_SOUND_YAWNING] =           'mx-yawn.ogg',
	[CHAR_SOUND_SNORING1] =          'mx-snore1.ogg',
	[CHAR_SOUND_SNORING2] =          'mx-snore2.ogg',
	[CHAR_SOUND_SNORING3] =          'mx-snore3.ogg',
	[CHAR_SOUND_COUGHING1] =         'mx-cough1.ogg',
	[CHAR_SOUND_COUGHING2] =         'mx-cough2.ogg',
	[CHAR_SOUND_COUGHING3] =         'mx-cough3.ogg',
	[CHAR_SOUND_DYING] =             'mx-dying.ogg',
	[CHAR_SOUND_DROWNING] =          'mx-fuckingdrowns.ogg',
	[CHAR_SOUND_MAMA_MIA] =          'mx-mamamia.ogg'
}

local PALETTE_LUCAS = {
	[PANTS]  = "ffffff",
	[SHIRT]  = "346300",
	[GLOVES] = "346300",
	[SHOES]  = "346300",
	[HAIR]   = "346300",
	[SKIN]   = "C79040",
	[CAP]    = "ffffff",
	[EMBLEM] = "C79040"
}

local PALETTE_FH = {
	[PANTS]  = "41110C",
	[SHIRT]  = "292A00",
	[GLOVES] = "292A00",
	[SHOES]  = "292A00",
	[HAIR]   = "292A00",
	[SKIN]   = "C79040",
	[CAP]    = "41110C",
	[EMBLEM] = "C79040",
}

local PALETTE_PC = {
	[PANTS]  = "41110C",
	[SHIRT]  = "000000",
	[GLOVES] = "E8CFA9",
	[SHOES]  = "000000",
	[HAIR]   = "000000",
	[SKIN]   = "E8CFA9",
	[CAP]    = "41110C",
	[EMBLEM] = "E8CFA9",
}

local PALETTE_MX = {
	[PANTS]  = "421207",
	[SHIRT]  = "000000",
	[GLOVES] = "000000",
	[SHOES]  = "000000",
	[HAIR]   = "000000",
	[SKIN]   = "FFFFFF",
	[CAP]    = "421207",
	[EMBLEM] = "FFFFFF",
}

local ANIMS_LUCAS = {
	[charSelect.CS_ANIM_MENU] = LUCAS_ANIM_MENU,
	[CHAR_ANIM_IDLE_HEAD_LEFT] = LUCAS_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = LUCAS_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_CENTER] = LUCAS_ANIM_IDLE,
	[CHAR_ANIM_SINGLE_JUMP] = LUCAS_ANIM_JUMP,
	[CHAR_ANIM_LAND_FROM_SINGLE_JUMP] = LUCAS_ANIM_JUMP
}

local ANIMS_FH = {
	[charSelect.CS_ANIM_MENU] = FH_ANIM_MENU,
	[CHAR_ANIM_IDLE_HEAD_LEFT] = FH_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = FH_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_CENTER] = FH_ANIM_IDLE,
	[CHAR_ANIM_SINGLE_JUMP] = FH_ANIM_JUMP,
	[CHAR_ANIM_LAND_FROM_SINGLE_JUMP] = FH_ANIM_JUMP
}

local ANIMS_PC = {
	[charSelect.CS_ANIM_MENU] = PC_ANIM_MENU,
	[CHAR_ANIM_IDLE_HEAD_LEFT] = PC_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = PC_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_CENTER] = PC_ANIM_IDLE,
	[CHAR_ANIM_SINGLE_JUMP] = PC_ANIM_JUMP,
	[CHAR_ANIM_LAND_FROM_SINGLE_JUMP] = PC_ANIM_JUMP
}

local ANIMS_MX = {
	[charSelect.CS_ANIM_MENU] = MX_ANIM_MENU,
	[CHAR_ANIM_IDLE_HEAD_LEFT] = MX_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_RIGHT] = MX_ANIM_IDLE,
	[CHAR_ANIM_IDLE_HEAD_CENTER] = MX_ANIM_IDLE,
	[CHAR_ANIM_SINGLE_JUMP] = MX_ANIM_JUMP,
	[CHAR_ANIM_LAND_FROM_SINGLE_JUMP] = MX_ANIM_JUMP,
}

CT_LUCAS = nil
CT_FH = nil
CT_PC = nil
CT_MX = nil

local CSloaded = false
local function on_character_select_load()
	CT_LUCAS = _G.charSelect.character_add("Lucas", {"GET ME OUTTA HERE!"}, "5UP, Razz and Hall Monitor", {r = 0, g = 225, b = 0}, E_MODEL_LUCAS, CT_MARIO, TEX_LUCAS, 0.8)
	CT_FH = _G.charSelect.character_add("False Hero", {"Heya bro!", "It's just-a me!"}, "5UP, Razz and Sunset", {r = 225, g = 0, b = 0}, E_MODEL_FH, CT_MARIO, TEX_FH)
	CT_PC = _G.charSelect.character_add("Pipe Crawler", {"FALLEN FOR MY DECEIT,", "I WILL TEAR YOU TO PIECES."}, "5UP, Razz and Sunset", {r = 156, g = 132, b = 99}, E_MODEL_PC, CT_MARIO, TEX_PC)
	CT_MX = _G.charSelect.character_add("MX", {"IT'S FUN, ISN'T IT?", "PLAYING AROUND HERE."}, "5UP, Razz and Sunset", {r = 100, g = 0, b = 0}, E_MODEL_MX, CT_MARIO, TEX_MX, 1.4)

	_G.charSelect.character_add_animations(E_MODEL_LUCAS, ANIMS_LUCAS)
	_G.charSelect.character_add_animations(E_MODEL_FH, ANIMS_FH)
	_G.charSelect.character_add_animations(E_MODEL_PC, ANIMS_PC)
	_G.charSelect.character_add_animations(E_MODEL_MX, ANIMS_MX)

	--[[ -- Uncomment when there's actual cap models - DM --
	_G.charSelect.character_add_caps(E_MODEL_LUCAS, CAPTABLE_LUCAS)
	_G.charSelect.character_add_caps(E_MODEL_FH, CAPTABLE_FH)
	_G.charSelect.character_add_caps(E_MODEL_PC, CAPTABLE_MX)
	_G.charSelect.character_add_caps(E_MODEL_MX, CAPTABLE_MX)
	]]

	_G.charSelect.character_add_voice(E_MODEL_LUCAS, VOICETABLE_LUCAS)
	_G.charSelect.character_add_voice(E_MODEL_FH, VOICETABLE_FH)
	_G.charSelect.character_add_voice(E_MODEL_PC, VOICETABLE_PC)
	_G.charSelect.character_add_voice(E_MODEL_MX, VOICETABLE_MX)

	_G.charSelect.config_character_sounds()

	_G.charSelect.character_add_palette_preset(E_MODEL_LUCAS, PALETTE_LUCAS)
	_G.charSelect.character_add_palette_preset(E_MODEL_FH, PALETTE_FH)
	_G.charSelect.character_add_palette_preset(E_MODEL_PC, PALETTE_PC)
	_G.charSelect.character_add_palette_preset(E_MODEL_MX, PALETTE_MX)

	_G.charSelect.character_set_category(CT_LUCAS, TEXT_MOD_NAME)
	_G.charSelect.character_set_category(CT_FH, TEXT_MOD_NAME)
	_G.charSelect.character_set_category(CT_PC, TEXT_MOD_NAME)
	_G.charSelect.character_set_category(CT_MX, TEXT_MOD_NAME)

	_G.charSelect.credit_add(TEXT_MOD_NAME, "5UP34", "Model Creator")
	_G.charSelect.credit_add(TEXT_MOD_NAME, "Sunset", "Voice Actor")
	_G.charSelect.credit_add(TEXT_MOD_NAME, "The Hall Monitor", "Voice Actor")
	_G.charSelect.credit_add(TEXT_MOD_NAME, "Squishy", "Coder")
	_G.charSelect.credit_add(TEXT_MOD_NAME, "Demi-kun", "Coder")
	_G.charSelect.credit_add(TEXT_MOD_NAME, "RazzDazzleDoo", "Character Owner")

	CSloaded = true
end

hook_event(HOOK_ON_MODS_LOADED, on_character_select_load)

function character_is_85()
	local char = _G.charSelect.character_get_current_number(0)
	if char ~= CT_LUCAS and char ~= CT_FH and char ~= CT_PC and char ~= CT_MX then
		return false
	end
	return true
end
