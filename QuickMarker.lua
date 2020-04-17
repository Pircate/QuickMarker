local function Event(event, handler)
	if _G.event == nil then
		_G.event = CreateFrame("Frame")
		_G.event.handler = {}
		_G.event.OnEvent = function(frame, event, ...)

		for key, handler in pairs(_G.event.handler[event]) do
			handler(...)
		end
	end

	_G.event:SetScript("OnEvent", _G.event.OnEvent)
	end

	if _G.event.handler[event] == nil then
		_G.event.handler[event] = {}
		_G.event:RegisterEvent(event)
	end

	table.insert(_G.event.handler[event], handler)
end

local function CreatMarkButton(index)
	local button = CreateFrame("Button", string.format("Marker%sicon", index), TargetFrame)
	button:SetPoint("TOPLEFT", TargetFrame, 14 * (index - 1) + 5, -5)
	button:SetSize(12, 12)
	button:RegisterForClicks("LeftButtonDown", "RightButtonDown")
	button:SetNormalTexture(string.format("interface\\targetingframe\\ui-raidtargetingicon_%d", index))
	button:SetScript(
		"OnClick",
		function(self, button)
			if button == "LeftButton" then
				SetRaidTarget("target", index)
			elseif button == "RightButton" then
				SetRaidTarget("target", 0)
			end
		end
	)
end

Event(
	"PLAYER_ENTERING_WORLD",
	function()
		for i = 1, 8 do
			CreatMarkButton(i)
		end
	end
)