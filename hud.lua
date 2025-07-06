--------------------------
-- MARIO '85 / SMB1 HUD --
----- by Squishy6094 -----
--------------------------

-- localize functions to improve performance - hud.lua
local string_lower,string_upper,math_floor,math_ceil,audio_stream_load,hud_hide,djui_hud_set_resolution,djui_hud_get_screen_width,hud_get_value,tostring,get_level_name,audio_stream_play,djui_hud_set_font,djui_hud_set_color,djui_hud_print_text,max,math_max,math_sin,djui_hud_measure_text,set_mario_action,get_current_save_file_num,djui_hud_render_rect,get_star_name,save_file_get_star_flags,min,math_min,save_file_get_course_coin_score,play_secondary_music,warp_to_level,stop_secondary_music,obj_get_first_with_behavior_id = string.lower,string.upper,math.floor,math.ceil,audio_stream_load,hud_hide,djui_hud_set_resolution,djui_hud_get_screen_width,hud_get_value,tostring,get_level_name,audio_stream_play,djui_hud_set_font,djui_hud_set_color,djui_hud_print_text,max,math.max,math.sin,djui_hud_measure_text,set_mario_action,get_current_save_file_num,djui_hud_render_rect,get_star_name,save_file_get_star_flags,min,math.min,save_file_get_course_coin_score,play_secondary_music,warp_to_level,stop_secondary_music,obj_get_first_with_behavior_id

local ommActive = false
for i in pairs(gActiveMods) do
	if gActiveMods[i].relativePath == "omm-coop" then
		ommActive = true
		break
	end
end

local gamemode = false
for i in pairs(gActiveMods) do
	if gActiveMods[i].incompatible == "gamemode" and gActiveMods[i].name ~= "Personal Star Counter" then
		gamemode = true
		break
	end
end

local fontInfoNES = { -- Maps textures in a spritesheet to letters
	["0"] = {x = 1,   y = 1, width = 7, height = 7},
	["1"] = {x = 9,   y = 1, width = 7, height = 7},
	["2"] = {x = 17,  y = 1, width = 7, height = 7},
	["3"] = {x = 25,  y = 1, width = 7, height = 7},
	["4"] = {x = 33,  y = 1, width = 7, height = 7},
	["5"] = {x = 41,  y = 1, width = 7, height = 7},
	["6"] = {x = 49,  y = 1, width = 7, height = 7},
	["7"] = {x = 57,  y = 1, width = 7, height = 7},
	["8"] = {x = 65,  y = 1, width = 7, height = 7},
	["9"] = {x = 73,  y = 1, width = 7, height = 7},
	["A"] = {x = 81,  y = 1, width = 7, height = 7},
	["B"] = {x = 89,  y = 1, width = 7, height = 7},
	["C"] = {x = 97,  y = 1, width = 7, height = 7},
	["D"] = {x = 105, y = 1, width = 7, height = 7},
	["E"] = {x = 113, y = 1, width = 7, height = 7},
	["F"] = {x = 121, y = 1, width = 7, height = 7},

	["G"] = {x = 1,   y = 9, width = 7, height = 7},
	["H"] = {x = 9,   y = 9, width = 7, height = 7},
	["I"] = {x = 17,  y = 9, width = 7, height = 7},
	["J"] = {x = 25,  y = 9, width = 7, height = 7},
	["K"] = {x = 33,  y = 9, width = 7, height = 7},
	["L"] = {x = 41,  y = 9, width = 7, height = 7},
	["M"] = {x = 49,  y = 9, width = 7, height = 7},
	["N"] = {x = 57,  y = 9, width = 7, height = 7},
	["O"] = {x = 65,  y = 9, width = 7, height = 7},
	["P"] = {x = 73,  y = 9, width = 7, height = 7},
	["Q"] = {x = 81,  y = 9, width = 7, height = 7},
	["R"] = {x = 89,  y = 9, width = 7, height = 7},
	["S"] = {x = 97,  y = 9, width = 7, height = 7},
	["T"] = {x = 105, y = 9, width = 7, height = 7},
	["U"] = {x = 113, y = 9, width = 7, height = 7},
	["V"] = {x = 121, y = 9, width = 7, height = 7},

	["W"] = {x = 1,  y = 17, width = 7, height = 7},
	["X"] = {x = 9,  y = 17, width = 7, height = 7},
	["Y"] = {x = 17, y = 17, width = 7, height = 7},
	["Z"] = {x = 25, y = 17, width = 7, height = 7},
	[","] = {x = 33, y = 17, width = 7, height = 7},
	["!"] = {x = 41, y = 17, width = 7, height = 8},
	["'"] = {x = 49, y = 17, width = 7, height = 7},
	["&"] = {x = 57, y = 17, width = 7, height = 7},
	["."] = {x = 65, y = 17, width = 7, height = 7},
	['"'] = {x = 73, y = 17, width = 7, height = 7},
	["?"] = {x = 81, y = 17, width = 7, height = 7},
	["-"] = {x = 89, y = 17, width = 7, height = 7},
	["x"] = {x = 96, y = 17, width = 7, height = 7},
}

-- Font can use a unique variable, or an existing font to overwrite it
FONT_NES = djui_hud_add_font(get_texture_info("NES-Font"), fontInfoNES, 1, 0, "x", 1)

	---@param levelname string
local function string_abbriviate(levelname)
	local s = ''
	local space = true
	-- Check for if levels actually have the 2d format like "1-2 Mushroom Caverns"
	_, _, format_name = string.find(levelname, "^(%d-%d)")
	if format_name then
		return levelname:sub(1,3)
	end
	-- Otherwise abbriviate level name
	for i = 1, #levelname do
		local c = levelname:sub(i,i)
		if space then
			if i ~= 1 or string_lower(levelname:sub(1,4)) ~= "the " then
				s = s..string_upper(c)
			end
			space = false
		end
		if c == " " or c == "-" then
			space = true
		end
	end
	return s
end

local function round_eights(input)
	return math_floor(input/8)*8
end

local function math_round(x)
	return x>=0 and math_floor(x+0.5) or math_ceil(x-0.5)
end

local OPTION_HUD = _G.charSelect.add_option("SMB1 HUD", 1, 2, {"Off", "M96' Chars", "On"}, {"Toggles the SMB1 HUD", "built-in with the M96' Pack", "(Font Handler v0.5)"})
local OPTION_TIMER = _G.charSelect.add_option("SMB1 Timer", 0, 2, {"SM64", "SMB1 Accurate", "SMB1 Real Time"}, {"Toggles if the Timer acts as", "it would in SM64 or SMB1"})
local OPTION_STAR_SELECT = nil
if not gamemode then
	OPTION_STAR_SELECT = _G.charSelect.add_option("SMB1 Star Select", 1, 1, nil, {"Toggles if the custom SMB1", "star select is shown"})
end

local function hud_allow_smb1()
	local optionToggle = _G.charSelect.get_options_status(OPTION_HUD)
	if optionToggle == 0 then return false end
	if optionToggle == 1 and not character_is_85() then return false end
	if _G.OmmApi then
		local ommHud = _G.OmmApi.omm_get_setting(gMarioStates[0], _G.OmmApi["OMM_SETTING_HUD"])
		if ommHud ~= _G.OmmApi["OMM_SETTING_HUD_NONE"] then return false end
	end
	return true
end

local TEX_ICONS = get_texture_info("NES-Icons")

local SOUND_WARNING = audio_stream_load("generic_warning.ogg")

local TEXT_WORLD = "WORLD"
local TEXT_TIME = "TIME"
local TEXT_LEVEL = nil

local MATH_MULTIPLY_TIME_ACCURATE = 20
local MATH_MULTIPLY_TIME_REAL = 30
local MATH_DIVIDE_TIME_ACCURATE = 1/MATH_MULTIPLY_TIME_ACCURATE
local MATH_DIVIDE_TIME_REAL = 1/MATH_MULTIPLY_TIME_REAL

local coinTimer = 0
local coinFrame = 0
local smb1TimerDefault = 500.99*(_G.charSelect.get_options_status(OPTION_TIMER) == 2 and MATH_MULTIPLY_TIME_REAL or MATH_MULTIPLY_TIME_ACCURATE)
local smb1Timer = smb1TimerDefault
local prevTimerWarningPos = 0
local timerWarningCount = 0
local diedToTimer = false

local prevCourse = nil
local prevLevel = nil
local actSelect = false
local function smb1_hud()
	-- Toggle Check
	if not hud_allow_smb1() then
		if _G.PersonalStarCounter then
			_G.PersonalStarCounter.hide_star_counters(false)
		end
		return	
	end

	local m = gMarioStates[0]
	local np = gNetworkPlayers[0]
	local charTable = _G.charSelect.character_get_current_table()

	hud_hide()
	djui_hud_set_resolution(RESOLUTION_N64)
	local width = djui_hud_get_screen_width()
	local timeToggle = _G.charSelect.get_options_status(OPTION_TIMER)

	local TEXT_NAME = string_upper(charTable.name)
	local TEXT_STARS = string.format("%02d", tostring(hud_get_value(HUD_DISPLAY_STARS)))
	local TEXT_COINS = string.format("%02d", tostring(hud_get_value(HUD_DISPLAY_COINS)))
	local MATH_DIVIDE_TIME = (timeToggle == 2 and MATH_DIVIDE_TIME_REAL or MATH_DIVIDE_TIME_ACCURATE)
	local MATH_MULTIPLY_TIME = (timeToggle == 2 and MATH_MULTIPLY_TIME_REAL or MATH_MULTIPLY_TIME_ACCURATE)
	local TEXT_TIMER = string.format("%03d", tostring(math_floor(hud_get_value(HUD_DISPLAY_TIMER)*MATH_DIVIDE_TIME)))
	if prevLevel ~= np.currLevelNum then
		TEXT_LEVEL = string_abbriviate(get_level_name(np.currCourseNum, np.currLevelNum, np.currAreaIndex))
		prevLevel = np.currLevelNum
	end
	smb1TimerDefault = 500.99*MATH_MULTIPLY_TIME

	-- Warning audio
	if smb1Timer > smb1TimerDefault then
		smb1Timer = smb1TimerDefault
	end
	if math_floor(smb1Timer) == 101*MATH_MULTIPLY_TIME then
		audio_stream_play(SOUND_WARNING, true, 1.5)
	end

	-- Name
	djui_hud_set_font(FONT_NES)
	djui_hud_set_color(255, 255, 255, 255)
	djui_hud_print_text(TEXT_NAME, 16, 8, 1)
	-- Health
	local health = math_ceil((m.health - 256)/256)
	if health > 0 then
		for i = 1, health do
			local playerColor = charTable.color
			djui_hud_set_color(playerColor.r*0.5 + 127, playerColor.g*0.5 + 127, playerColor.b*0.5 + 127, 255)
			djui_hud_render_texture_tile(TEX_ICONS, 8 + 8*i, 18, 1, 1, 42, 0, 8, 8)
		end
	end
	
	-- Stars (Wife said that it looked bad when x positions NES accurate, blame her)
	djui_hud_set_color(229, 155, 38, 255)
	djui_hud_render_texture_tile(TEX_ICONS, round_eights(width*0.4) - 9, 8, 1, 1, 33, 0, 8, 8)
	djui_hud_set_color(255, 255, 255, 255)
	djui_hud_print_text("x"..TEXT_STARS, round_eights(width*0.4), 8, 1)

	local y = 18
	if _G.PersonalStarCounter then
		_G.PersonalStarCounter.hide_star_counters(true)
		
		-- Personal Stars
		local TEXT_PSC_STARS = string.format("%02d", tostring(_G.PersonalStarCounter.get_star_counter()))
		djui_hud_set_color(178, 16, 48, 255)
		djui_hud_render_texture_tile(TEX_ICONS, round_eights(width*0.4) - 9, 18, 1, 1, 33, 0, 8, 8)
		djui_hud_set_color(255, 255, 255, 255)
		djui_hud_print_text("x"..TEXT_PSC_STARS, round_eights(width*0.4), 18, 1)
		
		local TEXT_PSC_TOTAL_STARS = string.format("%02d", tostring(_G.PersonalStarCounter.get_total_star_counter()))
		djui_hud_set_color(73, 170, 16, 255)
		djui_hud_render_texture_tile(TEX_ICONS, round_eights(width*0.4) - 9, 28, 1, 1, 33, 0, 8, 8)
		djui_hud_set_color(255, 255, 255, 255)
		djui_hud_print_text("x"..TEXT_PSC_TOTAL_STARS, round_eights(width*0.4), 28, 1)
		y = 38
	end

	-- Coins
	coinTimer = coinTimer + 1
	coinFrame = math_floor(math_max((math_sin(coinTimer*0.25))*2.5 - 1, -1))
	djui_hud_render_texture_tile(TEX_ICONS, round_eights(width*0.4) - 8, y, 1, 1, 8 + 8*coinFrame, 0, 8, 8)
	djui_hud_print_text("x"..TEXT_COINS, round_eights(width*0.4), y, 1)

	-- World
	if TEXT_LEVEL ~= nil then
		djui_hud_print_text(TEXT_WORLD, round_eights(width*0.6), 8, 1)
		djui_hud_print_text(TEXT_LEVEL, round_eights(width*0.6 + 16 - math_floor(#TEXT_LEVEL*0.5)*8), 18, 1)
	end

	-- Timer
	local timerToggle = _G.charSelect.get_options_status(OPTION_TIMER)
	if timerToggle == 0 then
		if hud_get_value(HUD_DISPLAY_TIMER) > 0 then
			djui_hud_print_text(TEXT_TIME, round_eights(width - 16 - djui_hud_measure_text(TEXT_TIME)), 8, 1)
			djui_hud_print_text(TEXT_TIMER, round_eights(width - 16 - djui_hud_measure_text(TEXT_TIMER)), 18, 1)
		end
	else
		local currCourse = gNetworkPlayers[0].currCourseNum
		if currCourse ~= 0 then
			if m.area.camera ~= nil and m.area.camera.cutscene == 0 and not actSelect then
				smb1Timer = smb1Timer - 1
			end
			local TEXT_TIMER = string.format("%03d", tostring(math_max(math_floor(smb1Timer*MATH_DIVIDE_TIME), 0)))
			djui_hud_print_text(TEXT_TIME, round_eights(width - 16 - djui_hud_measure_text(TEXT_TIME)), 8, 1)
			djui_hud_print_text(TEXT_TIMER, round_eights(width - 16 - djui_hud_measure_text(TEXT_TIMER)), 18, 1)
			
			if m.health > 255 then
				if diedToTimer then
					smb1Timer = smb1TimerDefault
				end
				diedToTimer = false
			else
				diedToTimer = true
			end

			if smb1Timer < 0 and not diedToTimer then
				set_mario_action(m, ACT_BACKWARD_AIR_KB, 0)
				m.health = 255
				m.forwardVel = -15
				m.vel.y = 30
				diedToTimer = true
			end
		end
		if prevCourse ~= currCourse then
			prevCourse = currCourse
			smb1Timer = smb1TimerDefault
		end
	end
end

-- Star Select Screen
---@param m MarioState
local function nullify_inputs(m)
	local c = m.controller
	c.buttonDown = 0
	c.buttonPressed = 0
	c.extStickX = 0
	c.extStickY = 0
	c.rawStickX = 0
	c.rawStickY = 0
	c.stickMag = 0
	c.stickX = 0
	c.stickY = 0
end

local starHover = 1
local maxStars = nil
local saveFile = get_current_save_file_num() - 1
local function smb1_star_select()
	if _G.charSelect.get_options_status(OPTION_STAR_SELECT) == 0 then return end
	if not hud_allow_smb1() then return end
	if not actSelect then return end
	djui_hud_set_resolution(RESOLUTION_N64)
	local width = djui_hud_get_screen_width() + 1
	local course = gNetworkPlayers[0].currCourseNum
	local np = gNetworkPlayers[0]

	if TEXT_LEVEL == nil then return end
	
	djui_hud_set_color(0, 0, 0, 255)
	djui_hud_render_rect(0, 0, width, 240)
	djui_hud_set_color(255, 255, 255, 255)

	local TEXT_STAR = string_upper(get_star_name(course, starHover))
	local TEXT_LEVEL = string_upper(get_level_name(np.currCourseNum, np.currLevelNum, np.currAreaIndex))
	local x = round_eights(width*0.5 - djui_hud_measure_text(TEXT_LEVEL)*0.5)
	local y = 88
	djui_hud_print_text(TEXT_LEVEL, x, y - 16, 1)
	djui_hud_print_text(TEXT_STAR, round_eights(width*0.5 - djui_hud_measure_text(TEXT_STAR)*0.5), y, 1)
	-- Detirmine amount of stars that display
	if not maxStars then
		maxStars = 1
		for i = 1, 6 do
			if save_file_get_star_flags(saveFile, course - 1) & (1 << (i - 1)) ~= 0 then
				maxStars = math_min(i + 1, 6)
			end
		end
	end
	-- Render Stars
	for i = 1, maxStars do
		local x = round_eights(width*0.5 - maxStars*8 - 16) + i*16
		if i == starHover then
			djui_hud_print_text("V", x, y + 16, 1)
		end
		if save_file_get_star_flags(saveFile, course - 1) & (1 << (i - 1)) ~= 0 then
			djui_hud_set_color(229, 155, 38, 255)
		else
			djui_hud_set_color(1, 26, 81, 255)
		end
		djui_hud_render_texture_tile(TEX_ICONS, x, y + 32, 1, 1, 33, 0, 8, 8)
		djui_hud_set_color(255, 255, 255, 255)
		djui_hud_print_text(tostring(i), x, y + 48, 1)
	end
	-- Render Lives
	x = round_eights(width*0.5 - 48)
	local TEXT_LIVES = "x"..tostring(hud_get_value(HUD_DISPLAY_LIVES))
	djui_hud_render_texture_tile(TEX_ICONS, x, y + 72, 1, 1, 24, 0, 8, 8)
	djui_hud_print_text(TEXT_LIVES, x + 8, y + 72, 1)
	-- Render Coin Record
	x = round_eights(width*0.5 + 8)
	local TEXT_COINS = "x"..tostring(save_file_get_course_coin_score(saveFile, course - 1))
	djui_hud_render_texture_tile(TEX_ICONS, x, y + 72, 1, 1, 8 + 8*coinFrame, 0, 8, 8)
	djui_hud_print_text(TEXT_COINS, x + 8, y + 72, 1)
	djui_hud_render_texture_tile(TEX_ICONS, x, y + 72, 1, 1, 8 + 8*coinFrame, 0, 8, 8)
	if save_file_get_star_flags(saveFile, course - 1) & (1 << 6) ~= 0 then
		djui_hud_set_color(229, 155, 38, 255)
	else
		djui_hud_set_color(1, 26, 81, 255)
	end
	djui_hud_render_texture_tile(TEX_ICONS, x + 16 + djui_hud_measure_text(TEXT_COINS), y + 72, 1, 1, 33, 0, 8, 8)
end


local inputStallTimerButton = 0
local inputStallTimerDirectional = 0
local inputStallToDirectional = 6
local inputStallToButton = 10
local function smb1_star_select_inputs(m)
	if m.playerIndex ~= 0 or not actSelect then return end
	local course = gNetworkPlayers[0].currCourseNum
	if course == 0 or course > 15 then
		actSelect = false
		return
	end
	if inputStallTimerDirectional == 0 then
		if (m.controller.buttonPressed & R_JPAD) ~= 0 or m.controller.stickX > 60 then
			starHover = math_min(starHover + 1, maxStars)
			inputStallTimerDirectional = inputStallToDirectional
		end
		if (m.controller.buttonPressed & L_JPAD) ~= 0 or m.controller.stickX < -60 then
			starHover = math_max(starHover - 1, 1)
			inputStallTimerDirectional = inputStallToDirectional
		end
	else
		inputStallTimerDirectional = inputStallTimerDirectional - 1
	end
	local posX = m.pos.x
	local posY = m.pos.y
	local posZ = m.pos.z
	set_mario_action(m, ACT_DISAPPEARED, 0)
	play_secondary_music(0, 0, 0, 0) -- Mute actual music
	if inputStallTimerButton == 0 then
		local button = m.controller.buttonPressed
		if (button & A_BUTTON) ~= 0 or (button & B_BUTTON) ~= 0 or (button & START_BUTTON) ~= 0 then
			warp_to_level(gNetworkPlayers[0].currLevelNum, 1, starHover)
			m.pos.x = posX
			m.pos.y = posY
			m.pos.z = posZ
			stop_secondary_music(0) -- Unmute actual music
			actSelect = false
		end
	else
		inputStallTimerButton = inputStallTimerButton - 1
	end
	nullify_inputs(m)
end

local function hud_render()
	if _G.charSelect.is_menu_open() then return end
	if obj_get_first_with_behavior_id(id_bhvActSelector) ~= nil then return end
	smb1_star_select()
	smb1_hud()
end

local function act_select()
	if _G.charSelect.get_options_status(OPTION_STAR_SELECT) == 0 then return end
	if not hud_allow_smb1() then return end
	if gamemode then return end
	if ommActive then return end
	actSelect = true
	starHover = 1
	inputStallTimerButton = inputStallToButton
	maxStars = nil
	play_secondary_music(0, 0, 0, 0) -- Mute actual music
	return false
end

hook_event(HOOK_ON_HUD_RENDER, hud_render)
hook_event(HOOK_USE_ACT_SELECT, act_select)
hook_event(HOOK_BEFORE_MARIO_UPDATE, smb1_star_select_inputs)