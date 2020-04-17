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

local frame = CreateFrame("Frame")
frame:Hide()
frame:RegisterEvent("PLAYER_ENTERING_WORLD")
frame:SetScript(
	"OnEvent",
	function(self, event, ...)
	    if event == "PLAYER_ENTERING_WORLD" then
	        for i = 1, 8 do
				CreatMarkButton(i)
			end
	    end
	end
)