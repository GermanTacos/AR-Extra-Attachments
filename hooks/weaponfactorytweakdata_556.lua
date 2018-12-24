------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       |||||||   	   ||||   ||||||        ||    			--
--                         ||||      ||    ||     || ||   ||            ||				--
--                        ||  ||     ||   ||         ||   ||            ||           	--
--                       ||||||||    ||||||          ||   |||||    ||||||||||||        	--
--                      ||      ||   ||   ||         ||       ||        ||             	--
--                     ||        ||  ||    ||        ||       ||		||			    --
--                    ||          || ||     ||    ||||||| |||||  		||				--
--                                                                                      --
------------------------------------------------------------------------------------------
--																						--
--									   > [Arrays]		   								--
--									   > [Override]				    					--
--									   > [Adds] 										--
--									   > [Forbids] 										--
--									   > [Stance]										--
--									   > [Underbarrel] 							    	--
--									   > [Tweaks] 										--
--									   > [WIP] 											--
--																						--
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------


Hooks:PostHook( WeaponFactoryTweakData, "init", "AR15EXTRAModInit", function(self)

------------------------------------------
----<A><R><1><5> -Arrays- <A><R><1><5>----
------------------------------------------

if self.wpn_fps_ass_stoy_556 then

--- Stocks ---

--- Handguard  ---
-- Default length --
local all_ar15handguard = {
	"wpn_fps_ass_stoy_556_hg_ar15",
	"wpn_fps_ass_stoy_556_hg_m16",
	"wpn_fps_ass_stoy_556_hg_m16a2",
	"wpn_fps_ass_stoy_556_hg_m607",
	"wpn_fps_ass_stoy_556_hg_m4",
	"wpn_fps_ass_stoy_556_hg_m4a1"
}

--- Barrel ---
-- Default length --
-- Short -- 
local ar15shortbarrel = { 
	"wpn_fps_ass_stoy_556_ba_m4",
	"wpn_fps_ass_stoy_556_ba_car15",
	"wpn_fps_ass_stoy_556_ba_m733"
}
--- Front Sights ---

--- Gas Blocks ---
local all_ar15gb = {
	"wpn_fps_ass_stoy_556_gb_ar15",
	"wpn_fps_ass_stoy_556_gb_m16a1",
	"wpn_fps_ass_stoy_556_gb_m16a4"
}


--- Barrel Extensions --

--- Gadgets (Flashlights/Lasers) ---
local all_ar15fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Sights ---


--- Grips ---


--- Compatibility Array Insertion ---

-----------------------------------------
----<A><R><1><5> -CAFCW- <A><R><1><5>----
-----------------------------------------



--------------------------------------------
----<A><R><1><5> -Override- <A><R><1><5>----
--------------------------------------------
for id, fl_id in pairs(all_ar15fl) do
	if fl_id ~= "wpn_fps_addon_ris" then
		self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[fl_id] = {override={wpn_fps_ass_stoy_556_rrc_m4a1={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}}, a_obj="a_fl_m4a1"}
	end
end
--GB override--
for id, ba_id in pairs(ar15shortbarrel) do
	self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_mk18 = {}
	self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_ddm4 = {}
	self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_mk18.override = deep_clone(self.parts.wpn_fps_ass_stoy_556_hg_mk18.override)
	self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_ddm4.override = deep_clone(self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override)
	self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_mk18.forbids = {"wpn_fps_ass_stoy_556_fo_commando"} --deep_clone(self.parts.wpn_fps_ass_stoy_556_hg_mk18.forbids) or {}
	self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_ddm4.forbids = {"wpn_fps_ass_stoy_556_fo_commando"} --deep_clone(self.parts.wpn_fps_ass_stoy_556_hg_ddm4.forbids) or {}
end
for id, gb_id in pairs(all_ar15gb) do
	self.parts.wpn_fps_ass_stoy_556_hg_t86.override[gb_id] = {a_obj="a_gb_t86"}
	self.parts.wpn_fps_ass_stoy_556_hg_t65.override[gb_id] 	= {a_obj="a_gb_t65"}
	self.parts.wpn_fps_ass_stoy_556_hg_moe.override[gb_id] = {a_obj="a_gb_car15"}
	self.parts.wpn_fps_ass_stoy_556_hg_mk18.override[gb_id] = {a_obj="a_gb_mk18"}
	self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override[gb_id] = {a_obj="a_gb_ddm4"}
	for id, ba_id in pairs(ar15shortbarrel) do
		self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_mk18.override[gb_id] = {unit="units/mods/weapons/wpn_fps_ass_stoy_556_commando_pts/wpn_fps_ass_stoy_556_fo_commando"}
		self.parts[ba_id].override.wpn_fps_ass_stoy_556_hg_ddm4.override[gb_id] = {unit="units/mods/weapons/wpn_fps_ass_stoy_556_commando_pts/wpn_fps_ass_stoy_556_fo_commando"}
	end
end
----------------------------------------
----<A><R><1><5> -Adds- <A><R><1><5>----
----------------------------------------
	
-------------------------------------------
----<A><R><1><5> -Forbids- <A><R><1><5>----
-------------------------------------------
for id, hg_id in pairs(all_ar15handguard) do
	if hg_id ~= "wpn_fps_ass_stoy_556_hg_m4a1" then
		table.insert(self.parts[hg_id].forbids, "wpn_fps_ass_stoy_556_lrc_m4a1")
		table.insert(self.parts[hg_id].forbids, "wpn_fps_ass_stoy_556_fo_commando")
	end
end
table.insert(self.parts.wpn_fps_ass_stoy_556_ca_m16a3.forbids, "wpn_fps_ass_stoy_556_ro_commando")
table.insert(self.parts.wpn_fps_ass_stoy_556_ur_ar15.forbids, "wpn_fps_ass_stoy_556_ro_commando")
table.insert(self.parts.wpn_fps_ass_stoy_556_ur_m16a2.forbids, "wpn_fps_ass_stoy_556_ro_commando")
table.insert(self.parts.wpn_fps_ass_stoy_556_ur_m16a1.forbids, "wpn_fps_ass_stoy_556_ro_commando")
table.insert(self.parts.wpn_fps_ass_stoy_556_ur_ar15.forbids, "wpn_fps_ass_stoy_556_str_commando")
table.insert(self.parts.wpn_fps_ass_stoy_556_ur_m16a2.forbids, "wpn_fps_ass_stoy_556_str_commando")
table.insert(self.parts.wpn_fps_ass_stoy_556_ur_m16a1.forbids, "wpn_fps_ass_stoy_556_str_commando")

------------------------------------------
----<A><R><1><5> -Stance- <A><R><1><5>----
------------------------------------------

------------------------------------------
----<A><R><1><5> -Tweaks- <A><R><1><5>----
------------------------------------------

------------------------------------------
----<A><R><1><5> -CLONES- <A><R><1><5>----
------------------------------------------

---------------------------------------
----<A><R><1><5> -WIP- <A><R><1><5>----
---------------------------------------
end
end )
