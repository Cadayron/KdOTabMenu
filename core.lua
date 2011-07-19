local E, C, L = unpack(ElvUI) -- Import Functions/Constants, Config, Locales

----------------------------------------------------------------------
-- 							By Cadayron
-- Inspired by Tukz, Elv, Hydra codes and lduvall for icons
----------------------------------------------------------------------


 -- Config variables
font = C.media.font            			-- Font to be used for button text
fontsize = 12                       	-- Size of font for button text
tabwidth = C.actionbar.buttonsize     	-- Width of chatframe
tabspacing = C.actionbar.buttonspacing
chatheight = C.chat.chatheight     		-- Height of chatframe
tabheight = ((chatheight - (5 * tabspacing)) / 4) -- Height of tab
local firstposition = (chatheight/2)-(tabheight/2)-tabspacing  --Set the positon for default chat height size

----------------------------------------------------------------------
-- Array for Toggle and Lock functions
----------------------------------------------------------------------
TabIn = {}
TabIn[1] = false
TabIn[2] = false
TabIn[3] = false
TabIn[4] = false
TLock = {}
TLock[1] = false
TLock[2] = false
TLock[3] = false
TLock[4] = false


----------------------------------------------------------------------
-- Functions (Toggle and Update lock)
----------------------------------------------------------------------
E.ToggleTab = function(square,indexIn, id)
	if indexIn == true then
		square:Hide()
		TabIn[id] = false
		square:Show()
		square:SetAlpha(0)
	else
		square:SetAlpha(1);
		square:Show()
		TabIn[id] = true
	end
end

E.UpdateTabLock = function(skin,indexLock, id)
 if indexLock == true then
 	TLock[id] = false
  	skin:SetVertexColor(1,1,1)
 else
 	TLock[id] = true;
 	skin:SetVertexColor(35/255,164/255,255/255)
 end
end


tab = CreateFrame("Button", "Tab", ChatRBGDummy) 	-- Tab creation
tab:RegisterEvent("PLAYER_ENTERING_WORLD")

for i = 1, 4 do
	tab[i] = CreateFrame("Button", "Tab"..i, ChatRBGDummy)
	tab[i]:CreatePanel(tab[i], tabwidth, tabheight, "RIGHT", ChatRBGDummy, "LEFT", 1, firstposition)
	tab[i]:CreateShadow("Default")
	if i == 1 then
		tab[i]:SetPoint("RIGHT", ChatRBGDummy, "LEFT", 1, firstposition)
	else
		tab[i]:SetPoint("TOP", tab[i-1], "BOTTOM", 0, -tabspacing)
	end
	tab[i]:EnableMouse(true)
	tab[i]:RegisterForClicks("AnyUp")
	tab[i]:SetAlpha(0)
	tab[i]:FontString(nil, font, fontsize)
	tab[i].text:SetPoint("CENTER", 0, 0)
		
	if i == 1 then 		-- Atlasloot
	
		-- Set Texture
		TTALoot = tab[i]:CreateTexture(nil, "ARTWORK")
		TTALoot:SetPoint("TOPLEFT", tab[i], E.Scale(4), E.Scale(-4))
		TTALoot:SetPoint("BOTTOMRIGHT",tab[i], E.Scale(-4), E.Scale(4))
		TTALoot:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\AL")
		
		tab[i]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E.Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("AtlasLoot : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("AtlasLoot : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			end
			GameTooltip:Show()
			if TLock[i] == true then return end;
			E.ToggleTab(self, TabIn[i], 1); 
		end) 
		
		tab[1]:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
			if TLock[i] == true then return end;
			E.ToggleTab(self, TabIn[i], 1);
			
		end)
		
		tab[i]:SetScript("OnMouseDown", function(self)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("AtlasLoot : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("AtlasLoot : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			end
			-- if not IsAddOnLoaded("AtlasLoot") then AtlasLoot:LoadModule("AtlasLoot") end
			ToggleFrame(AtlasLootDefaultFrame)
			E.UpdateTabLock(TTALoot, TLock[i], 1); 
		end)
		
		
	elseif i == 2 then 	-- Omen
	
		-- Set Texture
		TTOmen = tab[i]:CreateTexture(nil, "ARTWORK")
		TTOmen:SetPoint("TOPLEFT", tab[i], E.Scale(4), E.Scale(-4))
		TTOmen:SetPoint("BOTTOMRIGHT",tab[i], E.Scale(-4), E.Scale(4))
		TTOmen:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\Omen")
		
		tab[2]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E.Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Omen : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("Omen : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			end
			GameTooltip:Show()
			if TLock[i] == true then return end;
			E.ToggleTab(self, TabIn[i], 2);
		end) 
		
		tab[i]:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
			if TLock[i] == true then return end;
			E.ToggleTab(self, TabIn[i], 2);
		end)
		
		tab[i]:SetScript("OnMouseDown", function(self)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Omen : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("Omen : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			end
			ToggleFrame(Omen.Anchor);
			E.UpdateTabLock(TTOmen, TLock[i], 2);
		end)
		
		
	elseif i == 3 then 	-- Recount
		
		-- Set Texture
		TTRecount = tab[i]:CreateTexture(nil, "ARTWORK")
		TTRecount:SetPoint("TOPLEFT", tab[i], E.Scale(4), E.Scale(-4))
		TTRecount:SetPoint("BOTTOMRIGHT",tab[i], E.Scale(-4), E.Scale(4))
		TTRecount:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\Recount")
		
		tab[i]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E.Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Recount : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("Recount : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			end
			GameTooltip:Show() 
			if TLock[i] == true then return end; 
			E.ToggleTab(self, TabIn[i], 3); 
		end) 
		
		tab[i]:SetScript("OnLeave", function(self) 
			GameTooltip:Hide()
			if TLock[i] == true then return end;
			E.ToggleTab(self, TabIn[i], 3); 
		end)
		
		tab[i]:SetScript("OnMouseDown", function(self)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Recount : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("Recount : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			end 
			ToggleFrame(Recount.MainWindow); 
			Recount.RefreshMainWindow(); 
			E.UpdateTabLock(TTRecount, TLock[i], 3); 
		end)
		
	elseif i == 4 then 		-- Encounter Journal
	
		-- Set Texture
		TTEncJourn = tab[i]:CreateTexture(nil, "ARTWORK")
		TTEncJourn:SetPoint("TOPLEFT", tab[i], E.Scale(4), E.Scale(-4))
		TTEncJourn:SetPoint("BOTTOMRIGHT",tab[i], E.Scale(-4), E.Scale(4))
		TTEncJourn:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\EJ")
		
		tab[i]:SetScript("OnEnter", function(self)
			GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E.Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Encounter Journal : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("Encounter Journal : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			end
			GameTooltip:Show()  
			if TLock[i] == true then return end; 
			E.ToggleTab(self, TabIn[i], 4); 
		end) 
		
		tab[i]:SetScript("OnLeave", function(self)
			GameTooltip:Hide()
			if TLock[i] == true then return end; 
			E.ToggleTab(self, TabIn[i], 4); 
		end)
		
		tab[i]:SetScript("OnMouseDown", function(self)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Encounter Journal : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			else
				GameTooltip:AddDoubleLine("Encounter Journal : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			end 
			--SlashCmdList.CONFIG1('');
			ToggleFrame(EncounterJournal);
			E.UpdateTabLock(TTEncJourn, TLock[i], 4); 
		end)
		
	-- elseif i == 4 then 		-- Elvui ConfigUi
	
		--Set Texture
		-- TTElvconf = tab[i]:CreateTexture(nil, "ARTWORK")
		-- TTElvconf:SetPoint("TOPLEFT", tab[i], E.Scale(4), E.Scale(-4))
		-- TTElvconf:SetPoint("BOTTOMRIGHT",tab[i], E.Scale(-4), E.Scale(4))
		-- TTElvconf:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\ec")
		
		-- tab[i]:SetScript("OnEnter", function(self)
			-- GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, E.Scale(6));
			-- GameTooltip:ClearAllPoints()
			-- GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, E.mult)
			-- GameTooltip:ClearLines()
			-- if TLock[i] == true then
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			-- else
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			-- end
			-- GameTooltip:Show()  
			-- if TLock[i] == true then return end; 
			-- E.ToggleTab(self, TabIn[i], 4); 
		-- end) 
		
		-- tab[i]:SetScript("OnLeave", function(self)
			-- GameTooltip:Hide()
			-- if TLock[i] == true then return end; 
			-- E.ToggleTab(self, TabIn[i], 4); 
		-- end)
		
		-- tab[i]:SetScript("OnMouseDown", function(self)
			-- GameTooltip:ClearLines()
			-- if TLock[i] == true then
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", SHOW,1,1,1,unpack(C["media"].valuecolor))
			-- else
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", HIDE,1,1,1,unpack(C["media"].valuecolor))
			-- end 
			--SlashCmdList.CONFIG1('');
			-- InterfaceOptionsFrame_OpenToCategory(ElvuiConfig.optionsFrames.Media)
			-- E.UpdateTabLock(TTElvconf, TLock[i], 4); 
		-- end)
	
	end
		
end