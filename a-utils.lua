if not _G.charSelectExists then return end

CT_LUCAS = nil
CT_FH = nil
CT_PC = nil
CT_MX = nil

function character_is_85()
	local currChar = _G.charSelect.character_get_current_number(0)
	local modChars = {CT_LUCAS, CT_FH, CT_PC, CT_MX}

	for _, char in ipairs(modChars) do
		if currChar == char and char ~= nil then
			return true
		end
	end

	return false
end
