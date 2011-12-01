local E, L, DF = unpack(ElvUI); -- Import Functions/Constants, Config, Locales

----------------------------------------------------------------------
-- 							By Cadayron
-- Inspired by Tukz, Elv, Hydra codes and lduvall for icons
----------------------------------------------------------------------

 -- Config variables
font = DF.core.font            			-- Font to be used for button text
fontsize = 12                       	-- Size of font for button text
tabwidth = 27    	-- Width of chatframe
tabspacing = DF.actionbar.buttonspacing
chatheight = DF.core.panelHeight    		-- Height of chatframe
tabheight = 23 -- Height of tab
firstposition = ((chatheight-((tabheight*4)+(tabspacing*5)))/2)+tabheight/4  --Set the positon for default chat height size
selectioncolor = {r = 23/255,g = 132/255,b = 209/255}


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


tab = CreateFrame("Frame", "tab", RightChatPanel) 	-- Tab creation
--[[
	tb = CreateFrame("Button", "Tab1", tab)
	tb:Size(tabwidth,tabheight)
	tb:SetTemplate("Default")
	tb:Point('RIGHT', RightChatPanel, 'LEFT', 1, firstposition)
	tb.text = tb:CreateFontString(nil, 'OVERLAY')
	tb.text:FontTemplate()
	tb.text:SetPoint('CENTER')
	tb.text:SetText("A")
	((]]
tab:RegisterEvent("PLAYER_ENTERING_WORLD")


for i = 1, 4 do
	tab[i] = CreateFrame("Button", "tab"..i, tab)
	tab[i]:SetFrameLevel(0)
	tab[i]:Size(tabwidth,tabheight)
	tab[i]:SetTemplate("Default")
	
	if i == 1 then
		tab[i]:Point("TOPRIGHT", RightChatPanel, "TOPLEFT", 1, -firstposition)
	else
		tab[i]:Point("TOP", tab[i-1], "BOTTOM", 0, -tabspacing)
	end
	tab[i]:EnableMouse(true	)
	tab[i]:RegisterForClicks("AnyUp")
	tab[i]:SetAlpha(0)
	tab[i].text = tab[i]:CreateFontString(nil, font, fontsize)
	tab[i].text:SetPoint("CENTER", 0, 0)
		
	if i == 1 then 		-- Atlasloot
	
		-- Set Texture
		TTALoot = tab[i]:CreateTexture(nil, "ARTWORK")
		TTALoot:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
		TTALoot:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
		TTALoot:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\AL")
		
		tab[i]:SetScript("OnEnter", function()
			GameTooltip:SetOwner(tab[i], "ANCHOR_TOP", 0, E:Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", tab[i], "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("AtlasLoot : ", HIDE,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("AtlasLoot : ", SHOW,1,1,1,selectioncolor)
			end
			GameTooltip:Show()
			if TLock[i] == true then return end;
			E.ToggleTab(tab[i], TabIn[i], 1); 
		end) 
		
		tab[1]:SetScript("OnLeave", function()
			GameTooltip:Hide()
			if TLock[i] == true then return end;
			E.ToggleTab(tab[i], TabIn[i], 1);
			
		end)
		
		tab[i]:SetScript("OnMouseDown", function()
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("AtlasLoot : ", SHOW,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("AtlasLoot : ", HIDE,1,1,1,selectioncolor)
			end
			if not IsAddOnLoaded("AtlasLoot") then AtlasLoot:LoadModule("AtlasLoot") end
			ToggleFrame(AtlasLootDefaultFrame)
			E.UpdateTabLock(TTALoot, TLock[i], 1); 
		end)
		

	elseif i == 2 then 	-- Omen
	
		-- Set Texture
		TTOmen = tab[i]:CreateTexture(nil, "ARTWORK")
		TTOmen:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
		TTOmen:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
		TTOmen:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\Omen")
		
		tab[i]:SetScript("OnEnter", function()
			GameTooltip:SetOwner(tab[i], "ANCHOR_TOP", 0, E:Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", tab[i], "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Omen : ", HIDE,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("Omen : ", SHOW,1,1,1,selectioncolor)
			end
			GameTooltip:Show()
			if TLock[i] == true then return end;
			E.ToggleTab(tab[i], TabIn[i], 2);
		end) 
		
		tab[i]:SetScript("OnLeave", function()
			GameTooltip:Hide()
			if TLock[i] == true then return end;
			E.ToggleTab(tab[i], TabIn[i], 2);
		end)
		
		tab[i]:SetScript("OnMouseDown", function()
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Omen : ", SHOW,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("Omen : ", HIDE,1,1,1,selectioncolor)
			end
			ToggleFrame(Omen.Anchor);
			E.UpdateTabLock(TTOmen, TLock[i], 2);
		end)
		
		
	elseif i == 3 then 	-- Recount
		
		-- Set Texture
		TTRecount = tab[i]:CreateTexture(nil, "ARTWORK")
		TTRecount:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
		TTRecount:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
		TTRecount:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\Recount")
		
		tab[i]:SetScript("OnEnter", function()
			GameTooltip:SetOwner(tab[i], "ANCHOR_TOP", 0, E:Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", tab[i], "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Recount : ", HIDE,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("Recount : ", SHOW,1,1,1,selectioncolor)
			end
			GameTooltip:Show() 
			if TLock[i] == true then return end; 
			E.ToggleTab(tab[i], TabIn[i], 3); 
		end) 
		
		tab[i]:SetScript("OnLeave", function() 
			GameTooltip:Hide()
			if TLock[i] == true then return end;
			E.ToggleTab(tab[i], TabIn[i], 3); 
		end)
		
		tab[i]:SetScript("OnMouseDown", function()
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Recount : ", SHOW,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("Recount : ", HIDE,1,1,1,selectioncolor)
			end 
			ToggleFrame(Recount.MainWindow); 
			Recount.RefreshMainWindow(); 
			E.UpdateTabLock(TTRecount, TLock[i], 3); 
		end)
		
	elseif i == 4 then 		-- Encounter Journal
	
		-- Set Texture
		TTEncJourn = tab[i]:CreateTexture(nil, "ARTWORK")
		TTEncJourn:Point("TOPLEFT", tab[i], E:Scale(4), E:Scale(-4))
		TTEncJourn:Point("BOTTOMRIGHT",tab[i], E:Scale(-4), E:Scale(4))
		TTEncJourn:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\EJ")
		
		tab[i]:SetScript("OnEnter", function()
			GameTooltip:SetOwner(tab[i], "ANCHOR_TOP", 0, E:Scale(6));
			GameTooltip:ClearAllPoints()
			GameTooltip:SetPoint("BOTTOM", tab[i], "TOP", 0, E.mult)
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Encounter Journal : ", HIDE,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("Encounter Journal : ", SHOW,1,1,1,selectioncolor)
			end
			GameTooltip:Show()  
			if TLock[i] == true then return end; 
			E.ToggleTab(tab[i], TabIn[i], 4); 
		end) 
		
		tab[i]:SetScript("OnLeave", function()
			GameTooltip:Hide()
			if TLock[i] == true then return end; 
			E.ToggleTab(tab[i], TabIn[i], 4); 
		end)
		
		tab[i]:SetScript("OnMouseDown", function()
			GameTooltip:ClearLines()
			if TLock[i] == true then
				GameTooltip:AddDoubleLine("Encounter Journal : ", SHOW,1,1,1,selectioncolor)
			else
				GameTooltip:AddDoubleLine("Encounter Journal : ", HIDE,1,1,1,selectioncolor)
			end 
			if not IsAddOnLoaded('Blizzard_EncounterJournal') then LoadAddOn('Blizzard_EncounterJournal'); end
			ToggleFrame(EncounterJournal);
			E.UpdateTabLock(TTEncJourn, TLock[i], 4); 
		end)
		
	-- elseif i == 4 then 		-- Elvui ConfigUi
	
		--Set Texture
		-- TTElvconf = tab[i]:CreateTexture(nil, "ARTWORK")
		-- TTElvconf:SetPoint("TOPLEFT", tab[i], T.Scale(4), T.Scale(-4))
		-- TTElvconf:SetPoint("BOTTOMRIGHT",tab[i], T.Scale(-4), T.Scale(4))
		-- TTElvconf:SetTexture("Interface\\AddOns\\KdOTabMenu\\media\\ec")
		
		-- tab[i]:SetScript("OnEnter", function(self)
			-- GameTooltip:SetOwner(self, "ANCHOR_TOP", 0, T.Scale(6));
			-- GameTooltip:ClearAllPoints()
			-- GameTooltip:SetPoint("BOTTOM", self, "TOP", 0, T.mult)
			-- GameTooltip:ClearLines()
			-- if TLock[i] == true then
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", HIDE,1,1,1,selectioncolor)
			-- else
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", SHOW,1,1,1,selectioncolor)
			-- end
			-- GameTooltip:Show()  
			-- if TLock[i] == true then return end; 
			-- T.ToggleTab(self, TabIn[i], 4); 
		-- end) 
		
		-- tab[i]:SetScript("OnLeave", function(self)
			-- GameTooltip:Hide()
			-- if TLock[i] == true then return end; 
			-- T.ToggleTab(self, TabIn[i], 4); 
		-- end)
		
		-- tab[i]:SetScript("OnMouseDown", function(self)
			-- GameTooltip:ClearLines()
			-- if TLock[i] == true then
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", SHOW,1,1,1,selectioncolor)
			-- else
				-- GameTooltip:AddDoubleLine("ElvUi ConfigUi : ", HIDE,1,1,1,selectioncolor)
			-- end 
			--SlashCmdList.CONFIG1('');
			-- InterfaceOptionsFrame_OpenToCategory(ElvuiConfig.optionsFrames.Media)
			-- T.UpdateTabLock(TTElvconf, TLock[i], 4); 
		-- end)
	end 
		
end 