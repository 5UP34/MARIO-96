-- name: [CS] MARIO '96
-- description: The OFFICIAL \\#8B0000\\MARIO '85\\#FFFFFF\\ in \\#FF0000\\S\\#007FFF\\M\\#00FF00\\6\\#FFFF00\\4\\#FFFFFF\\ Character Select Pack!\n\nCommands:\n/hud96 [on|off] - toggle the custom hud\n\nCredits:\nModels by \\#007FFF\\5UP34\\#FFFFFF\\\nCode by \\#CA8DFE\\DM-kun\\#FFFFFF\\ and \\#06402B\\Squishy\\#FFFFFF\\\nVoice Acting By Sunset + The Hall Monitor\nCharacters Owned by RazzDazzleDoo\n\\#ffffff\\Extra Credits:\nHUD Template by \\#FF0000\\Sunk\\#FFFFFF\\\n\nThis Pack requires Character Select to use as a Library!

local TEXT_MOD_NAME = "MARIO '96 Pack"

if not _G.charSelectExists then
    djui_popup_create("\\#ffffdc\\\n"..TEXT_MOD_NAME.."\nRequires the Character Select Mod\nto use as a Library!\n\nPlease turn on the Character Select Mod\nand Restart the Room!", 6)
    return 0
end

local E_MODEL_MX = smlua_model_util_get_id("mx_geo")
local E_MODEL_LUCAS = smlua_model_util_get_id("lucas_geo")
local E_MODEL_FH = smlua_model_util_get_id("fh_geo")
local E_MODEL_PC = smlua_model_util_get_id("pc_geo")

local TEX_MX = get_texture_info("icon_mx")
local TEX_LUCAS = get_texture_info("icon_lucas")
local TEX_FH = get_texture_info("icon_fh")
local TEX_PC = get_texture_info("icon_pc")

local CAPTABLE_MX = {
	normal = smlua_model_util_get_id("mx_cap_geo"),
	wing = smlua_model_util_get_id("mx_wing_cap_geo"),
	metal = smlua_model_util_get_id("mx_metal_cap_geo"),
	metalWing = smlua_model_util_get_id("mx_metalwing_cap_geo")
}

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

local VOICETABLE_MX = {
    [CHAR_SOUND_ATTACKED] = 'mx-hurt.ogg',
    [CHAR_SOUND_COUGHING1] = 'mx-cough1.ogg',
    [CHAR_SOUND_COUGHING2] = 'mx-cough2.ogg',
    [CHAR_SOUND_COUGHING3] = 'mx-cough3.ogg',
    [CHAR_SOUND_DOH] = 'mx-doh.ogg',
    [CHAR_SOUND_DROWNING] = 'mx-fuckingdrowns.ogg',
    [CHAR_SOUND_DYING] = 'mx-die.ogg',
    [CHAR_SOUND_EEUH] = 'mx-eeuh.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'mx-gp-wah.ogg',
    [CHAR_SOUND_HAHA] = 'mx-haha.ogg',
    [CHAR_SOUND_HAHA_2] = 'mx-haha.ogg',
    --[CHAR_SOUND_HELLO] = 'no-sound.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'mx-herego.ogg',
    [CHAR_SOUND_HOOHOO] = 'mx-jump2.ogg',
    [CHAR_SOUND_HRMM] = 'mx-hrmm.ogg',
    [CHAR_SOUND_IMA_TIRED] = 'mx-imatire.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'mx-lets-a-go.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'mx-mamamia.ogg',
    [CHAR_SOUND_ON_FIRE] = 'mx-fire.ogg',
    [CHAR_SOUND_OOOF] = 'mx-ooof.ogg',
    [CHAR_SOUND_OOOF2] = 'mx-ooof2.ogg',
    [CHAR_SOUND_PANTING] = 'mx-panting.ogg',
    [CHAR_SOUND_PANTING_COLD] = 'mx-panting2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'mx-kick.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'mx-punch2.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'mx-punch1.ogg',
    [CHAR_SOUND_SNORING1] = 'mx-snore1.ogg',
    [CHAR_SOUND_SNORING2] = 'mx-snore2.ogg',
    [CHAR_SOUND_SNORING3] = 'mx-snore3.ogg',
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'mx-so-long.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'mx-boing.ogg',
    [CHAR_SOUND_UH] = 'mx-uh1.ogg',
    [CHAR_SOUND_UH2] = 'mx-uh2.ogg',
    [CHAR_SOUND_UH2_2] = 'mx-uh3.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'mx-fuckingdies.ogg',
    [CHAR_SOUND_WAH2] = 'mx-wah2.ogg',
    [CHAR_SOUND_WHOA] = 'mx-whoa.ogg',
    [CHAR_SOUND_YAHOO] = 'mx-jump3.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = 'mx-jump3.ogg',
    [CHAR_SOUND_YAH_WAH_HOO] = {'mx-jump1.ogg', 'mx-jump2.ogg', 'mx-wah2.ogg'},
    [CHAR_SOUND_YAWNING] = 'mx-yawn.ogg',
}

local VOICETABLE_LUCAS = {
    [CHAR_SOUND_ATTACKED] = 'both-hurt.ogg',
    [CHAR_SOUND_COUGHING1] = 'lucas-cough.ogg',
    [CHAR_SOUND_COUGHING2] = 'lucas-cough.ogg',
    [CHAR_SOUND_COUGHING3] = 'lucas-cough.ogg',
    [CHAR_SOUND_DOH] = 'both-bump.ogg',
    --[CHAR_SOUND_DROWNING] = 'no-sound.ogg',
    [CHAR_SOUND_DYING] = 'both-die.ogg',
    [CHAR_SOUND_EEUH] = 'both-pickup.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'both-pound.ogg',
    --[CHAR_SOUND_HAHA] = 'no-sound.ogg',
    --[CHAR_SOUND_HAHA_2] = 'no-sound.ogg',
    --[CHAR_SOUND_HELLO] = 'no-sound.ogg',
    --[CHAR_SOUND_HERE_WE_GO] = 'no-sound.ogg',
    [CHAR_SOUND_HOOHOO] = 'lucas-jump2.ogg',
    [CHAR_SOUND_HRMM] = 'both-pickup.ogg',
    --[CHAR_SOUND_IMA_TIRED] = 'no-sound.ogg',
    --[CHAR_SOUND_LETS_A_GO] = 'no-sound.ogg',
    --[CHAR_SOUND_MAMA_MIA] = 'no-sound.ogg',
    --[CHAR_SOUND_ON_FIRE] = 'no-sound.ogg',
    --[CHAR_SOUND_OOOF] = 'no-sound.ogg',
    --[CHAR_SOUND_OOOF2] = 'no-sound.ogg',
    --[CHAR_SOUND_PANTING] = 'no-sound.ogg',
    --[CHAR_SOUND_PANTING_COLD] = 'no-sound.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'lucas-kick.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'lucas-punch2.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'lucas-punch1.ogg',
    [CHAR_SOUND_SNORING1] = 'lucas-snore1.ogg',
    [CHAR_SOUND_SNORING2] = 'lucas-snore2.ogg',
    [CHAR_SOUND_SNORING3] = {'lucas-snore2.ogg', 'lucas-snore1.ogg'},
    --[CHAR_SOUND_SO_LONGA_BOWSER] = 'no-sound.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'lucas-jump3.ogg',
    [CHAR_SOUND_UH] = 'both-bump.ogg',
    [CHAR_SOUND_UH2] = 'both-bump.ogg',
    [CHAR_SOUND_UH2_2] = 'both-bump.ogg',
    --[CHAR_SOUND_WAAAOOOW] = 'no-sound.ogg',
    --[CHAR_SOUND_WAH2] = 'no-sound.ogg',
    --[CHAR_SOUND_WHOA] = 'no-sound.ogg',
    [CHAR_SOUND_YAHOO] = 'lucas-jump3.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = 'lucas-jump2.ogg',
    [CHAR_SOUND_YAH_WAH_HOO] = 'lucas-jump1.ogg',
    --[CHAR_SOUND_YAWNING] = 'no-sound.ogg',
}

local VOICETABLE_FH = {
    [CHAR_SOUND_ATTACKED] = 'fh-hurt.ogg',
    [CHAR_SOUND_COUGHING1] = 'fh-cough1.ogg',
    [CHAR_SOUND_COUGHING2] = 'fh-cough2.ogg',
    [CHAR_SOUND_COUGHING3] = 'fh-cough3.ogg',
    [CHAR_SOUND_DOH] = 'fh-doh.ogg',
    [CHAR_SOUND_DROWNING] = 'fh-drown.ogg',
    [CHAR_SOUND_DYING] = 'fh-die.ogg',
    [CHAR_SOUND_EEUH] = 'fh-eeuh.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'fh-gp-wah.ogg',
    [CHAR_SOUND_HAHA] = 'fh-haha.ogg',
    [CHAR_SOUND_HAHA_2] = 'fh-haha2.ogg',
    [CHAR_SOUND_HELLO] = 'fh-hello.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'fh-herego.ogg',
    [CHAR_SOUND_HOOHOO] = 'fh-hoohoo.ogg',
    [CHAR_SOUND_HRMM] = 'fh-hrmm.ogg',
    [CHAR_SOUND_IMA_TIRED] = 'fh-tired.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'fh-letsgo.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'fh-mamamia.ogg',
    [CHAR_SOUND_ON_FIRE] = 'fh-fire.ogg',
    [CHAR_SOUND_OOOF] = 'fh-ooof.ogg',
    [CHAR_SOUND_OOOF2] = 'fh-ooof2.ogg',
    [CHAR_SOUND_PANTING] = 'fh-panting.ogg',
    [CHAR_SOUND_PANTING_COLD] = 'fh-panting2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'fh-hoo.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'fh-wah.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'fh-yah.ogg',
    [CHAR_SOUND_SNORING1] = 'fh-snore1.ogg',
    [CHAR_SOUND_SNORING2] = 'fh-snore2.ogg',
    [CHAR_SOUND_SNORING3] = {'fh-snore1.ogg', 'fh-snore2.ogg'},
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'fh-solong.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'fh-yippee.ogg',
    [CHAR_SOUND_UH] = 'fh-uh1.ogg',
    [CHAR_SOUND_UH2] = 'fh-uh2.ogg',
    [CHAR_SOUND_UH2_2] = 'fh-uh3.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'fh-scream.ogg',
    [CHAR_SOUND_WAH2] = 'fh-wah2.ogg',
    [CHAR_SOUND_WHOA] = 'fh-whoa.ogg',
    [CHAR_SOUND_YAHOO] = 'fh-yahoo.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'fh-yahoo.ogg', 'fh-yippee.ogg', 'fh-waha.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'fh-yah.ogg', 'fh-wah.ogg', 'fh-hoo.ogg'},
    [CHAR_SOUND_YAWNING] = 'fh-yawn.ogg',
}

local VOICETABLE_PC = {
    [CHAR_SOUND_ATTACKED] = 'pc-hurt.ogg',
    [CHAR_SOUND_COUGHING1] = 'pc-cough1.ogg',
    [CHAR_SOUND_COUGHING2] = 'pc-cough2.ogg',
    [CHAR_SOUND_COUGHING3] = 'pc-cough3.ogg',
    [CHAR_SOUND_DOH] = 'pc-doh.ogg',
    [CHAR_SOUND_DROWNING] = 'pc-drown.ogg',
    [CHAR_SOUND_DYING] = 'pc-die.ogg',
    [CHAR_SOUND_EEUH] = 'pc-eeuh.ogg',
    [CHAR_SOUND_GROUND_POUND_WAH] = 'pc-gp-wah.ogg',
    [CHAR_SOUND_HAHA] = 'pc-haha.ogg',
    [CHAR_SOUND_HAHA_2] = 'pc-haha.ogg',
    [CHAR_SOUND_HELLO] = 'pc-hello.ogg',
    [CHAR_SOUND_HERE_WE_GO] = 'pc-herego.ogg',
    [CHAR_SOUND_HOOHOO] = 'pc-jump2.ogg',
    [CHAR_SOUND_HRMM] = 'pc-hrmm.ogg',
    [CHAR_SOUND_IMA_TIRED] = 'pc-tired.ogg',
    [CHAR_SOUND_LETS_A_GO] = 'pc-letsgo.ogg',
    [CHAR_SOUND_MAMA_MIA] = 'pc-mamamia.ogg',
    [CHAR_SOUND_ON_FIRE] = 'pc-fire.ogg',
    [CHAR_SOUND_OOOF] = 'pc-ooof.ogg',
    [CHAR_SOUND_OOOF2] = 'pc-ooof2.ogg',
    [CHAR_SOUND_PANTING] = 'pc-panting.ogg',
    [CHAR_SOUND_PANTING_COLD] = 'pc-panting2.ogg',
    [CHAR_SOUND_PUNCH_HOO] = 'pc-hoo.ogg',
    [CHAR_SOUND_PUNCH_WAH] = 'pc-wah.ogg',
    [CHAR_SOUND_PUNCH_YAH] = 'pc-yah.ogg',
    [CHAR_SOUND_SNORING1] = 'pc-snore1.ogg',
    [CHAR_SOUND_SNORING2] = 'pc-snore2.ogg',
    [CHAR_SOUND_SNORING3] = {'pc-snore1.ogg', 'pc-snore2.ogg'},
    [CHAR_SOUND_SO_LONGA_BOWSER] = 'pc-solong.ogg',
    [CHAR_SOUND_TWIRL_BOUNCE] = 'pc-yippee.ogg',
    [CHAR_SOUND_UH] = 'pc-uh1.ogg',
    [CHAR_SOUND_UH2] = 'pc-uh2.ogg',
    [CHAR_SOUND_UH2_2] = 'pc-uh3.ogg',
    [CHAR_SOUND_WAAAOOOW] = 'pc-scream.ogg',
    [CHAR_SOUND_WAH2] = 'pc-wah2.ogg',
    [CHAR_SOUND_WHOA] = 'pc-whoa.ogg',
    [CHAR_SOUND_YAHOO] = 'pc-yahoo.ogg',
    [CHAR_SOUND_YAHOO_WAHA_YIPPEE] = {'pc-yahoo.ogg', 'pc-yippee.ogg', 'pc-waha.ogg'},
    [CHAR_SOUND_YAH_WAH_HOO] = {'pc-jump1.ogg', 'pc-jump2.ogg',},
    [CHAR_SOUND_YAWNING] = 'pc-yawn.ogg',
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

local ANIMS_MX = {
    [charSelect.CS_ANIM_MENU] = MX_ANIM_MENU
}

local ANIMS_PC = {
    [charSelect.CS_ANIM_MENU] = PC_ANIM_MENU
}

local ANIMS_FH = {
    [charSelect.CS_ANIM_MENU] = FH_ANIM_MENU
}

local ANIMS_LUCAS = {
    [charSelect.CS_ANIM_MENU] = LUCAS_ANIM_MENU
}

CT_MX = _G.charSelect.character_add("MX", {"IT'S FUN, ISN'T IT?", "PLAYING AROUND HERE."}, "5UP34 and Razz", {r = 100, g = 0, b = 0}, E_MODEL_MX, CT_MARIO, TEX_MX, 1.4)
CT_LUCAS = _G.charSelect.character_add("Lucas", {"GET ME OUT OF HERE!"}, "5UP34 and Razz", {r = 0, g = 225, b = 0}, E_MODEL_LUCAS, CT_MARIO, TEX_LUCAS, 0.8)
CT_FH = _G.charSelect.character_add("False Hero", {"Heya bro!", "It's-a me, Mario!"}, "5UP34 and Razz", {r = 225, g = 0, b = 0}, E_MODEL_FH, CT_MARIO, TEX_FH)
CT_PC = _G.charSelect.character_add("Pipe Crawler", {"GET oOVER HErE LUCAAAS!"}, "5UP34 and Razz", {r = 156, g = 132, b = 99}, E_MODEL_PC, CT_MARIO, TEX_PC)

_G.charSelect.character_add_animations(E_MODEL_MX, ANIMS_MX)
_G.charSelect.character_add_animations(E_MODEL_PC, ANIMS_PC)
_G.charSelect.character_add_animations(E_MODEL_FH, ANIMS_FH)
_G.charSelect.character_add_animations(E_MODEL_LUCAS, ANIMS_LUCAS)

_G.charSelect.character_add_caps(E_MODEL_MX, CAPTABLE_MX)
_G.charSelect.character_add_caps(E_MODEL_LUCAS, CAPTABLE_LUCAS)
_G.charSelect.character_add_caps(E_MODEL_FH, CAPTABLE_FH)
_G.charSelect.character_add_caps(E_MODEL_PC, CAPTABLE_MX)

_G.charSelect.character_add_voice(E_MODEL_MX, VOICETABLE_MX)
_G.charSelect.character_add_voice(E_MODEL_LUCAS, VOICETABLE_LUCAS)
_G.charSelect.character_add_voice(E_MODEL_FH, VOICETABLE_FH)
_G.charSelect.character_add_voice(E_MODEL_PC, VOICETABLE_PC)

_G.charSelect.character_add_palette_preset(E_MODEL_MX, PALETTE_MX)
_G.charSelect.character_add_palette_preset(E_MODEL_LUCAS, PALETTE_LUCAS)
_G.charSelect.character_add_palette_preset(E_MODEL_FH, PALETTE_FH)
_G.charSelect.character_add_palette_preset(E_MODEL_PC, PALETTE_PC)

local function on_character_sound(m, sound)
    if _G.charSelect.character_get_voice(m) == VOICETABLE_MX then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_LUCAS then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_FH then return _G.charSelect.voice.sound(m, sound) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_PC then return _G.charSelect.voice.sound(m, sound) end
end

local function on_character_snore(m)
    if _G.charSelect.character_get_voice(m) == VOICETABLE_MX then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_LUCAS then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_FH then return _G.charSelect.voice.snore(m) end
    if _G.charSelect.character_get_voice(m) == VOICETABLE_PC then return _G.charSelect.voice.snore(m) end
end

hook_event(HOOK_CHARACTER_SOUND, on_character_sound)
hook_event(HOOK_MARIO_UPDATE, on_character_snore)

function character_is_85()
    local char = _G.charSelect.character_get_current_number(0)
    if char ~= CT_MX and char ~= CT_LUCAS and char ~= CT_FH and char ~= CT_PC then
        return false
    end
    return true
end