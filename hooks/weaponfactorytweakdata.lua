------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
--                                                                                      --
--                          ||       |||||||   	        ||    							--
--                         ||||      ||    ||           ||								--
--                        ||  ||     ||   ||            ||    							--
--                       ||||||||    ||||||        ||||||||||||        					--
--                      ||      ||   ||   ||            ||    							--
--                     ||        ||  ||    ||     		||    							--
--                    ||          || ||     ||     		||    							--
--                                                                                      --
------------------------------------------------------------------------------------------
--																						--
--						  	 		   > [Functions]									--
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


---------------------------------------------------------------
----<A><R><E><X><T><R><A> -Functions- <A><R><E><X><T><R><A>----
---------------------------------------------------------------

--- Forbid Setup ---
function WeaponFactoryTweakData:arpack_setup_forbid( mod_one, mod_two )
	if self.parts[mod_one] and self.parts[mod_two] then
		self.parts[mod_one].forbids = self.parts[mod_one].forbids or {}
		table.insert(self.parts[mod_one].forbids, mod_two)
		self.parts[mod_two].forbids = self.parts[mod_two].forbids or {}
		table.insert(self.parts[mod_two].forbids, mod_one)
	else
		if not self.parts[mod_one] then
			self:ar15_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
		if not self.parts[mod_two] then
			self:ar15_write_error( "forbid_setup", "fti", "part", mod_two )	
		end
	end
end

--- Override Base ---
function WeaponFactoryTweakData:arpack_check_override( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].override = self[mod_woa].override or {}
		else 
			self:ar15_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].override = self.parts[mod_woa].override or {}
		else 
			self:ar15_write_error( "override_check", "fti", mod_type, mod_woa )
		end
	else
		self:ar15_write_error( "override_check", "fti", "mod_type", mod_type )
	end
end

--- Adds Base ---
function WeaponFactoryTweakData:arpack_check_adds( mod_type, mod_woa ) 
	if mod_type == "wpn" then
		if self[mod_woa] then
			self[mod_woa].adds = self[mod_woa].adds or {}
		else 
			self:ar15_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	elseif mod_type == "part" then
		if self.parts[mod_woa] then
			self.parts[mod_woa].adds = self.parts[mod_woa].adds or {}
		else 
			self:ar15_write_error( "adds_check", "fti", mod_type, mod_woa )
		end
	else
		self:ar15_write_error( "adds_check", "fti", "mod_type", mod_type )
	end
end

--- Part Copy Base ---
function WeaponFactoryTweakData:ar15_copy_part( att_og, att_cp )
    if self.parts[att_og] then
        self.parts[att_cp] = deep_clone(self.parts[att_og])
        self.parts[att_cp].pcs = {}
        self.parts[att_cp].is_a_unlockable = true
        table.insert(self.wpn_fps_ass_stoy_556.uses_parts, att_cp)
    else
        self:ar15_write_error( "copy_part", "fti", "part", att_og )    
    end
end

--- ERROR Base ---
function WeaponFactoryTweakData:ar15_write_error( func, cause, error_id, value  )
	if func and cause and error_id then 
		-- fti = failed to index
		if cause == "fti" and value then
			if error_id == "part" then
				log("AR15_ERROR: (" .. func .. ")Attempt to index Part ID: '" .. value .. "' (a nil value)")
			elseif error_id == "wpn" then
				log("AR15_ERROR: (" .. func .. ")Attempt to index Weapon ID: '" .. value .. "' (a nil value)")
			elseif error_id == "mod_type" then
				log("AR15_ERROR: (" .. func .. ")Attempt to index mod_type: '" .. value .. "' (a nil value)")
			end
		end
	end
end 

Hooks:PostHook( WeaponFactoryTweakData, "init", "AREXTRAModInit", function(self)

------------------------------------------------------------
----<A><R><E><X><T><R><A> -Arrays- <A><R><E><X><T><R><A>----
------------------------------------------------------------
local all_ar15fl = {
	"wpn_fps_upg_fl_ass_smg_sho_peqbox",
	"wpn_fps_upg_fl_ass_smg_sho_surefire",
	"wpn_fps_upg_fl_ass_peq15",
	"wpn_fps_upg_fl_ass_laser",
	"wpn_fps_upg_fl_ass_utg",
	"wpn_fps_addon_ris"
}

--- Compatibility Array Insertion ---

-----------------------------------------------------------
----<A><R><E><X><T><R><A> -CAFCW- <A><R><E><X><T><R><A>----
-----------------------------------------------------------
if BeardLib.Utils:FindMod("Custom attachments for custom weapons") then
	local cafcwgadgets_ar15 = { 
		"wpn_fps_upg_fl_ass_spotter",
		"wpn_fps_upg_fl_wml",
		"wpn_fps_upg_fl_anpeq2",
		"wpn_fps_upg_fl_dbal_d2",
		"wpn_fps_upg_fl_m600p",
		"wpn_fps_upg_fl_utg"
	}
	for id, part_id in pairs(cafcwgadgets_ar15) do
		if self.parts[part_id] then
			table.insert(all_ar15fl, part_id)
		end
	end
end
--------------------------------------------------------------
----<A><R><E><X><T><R><A> -Override- <A><R><E><X><T><R><A>----
--------------------------------------------------------------
for id, fl_id in pairs(all_ar15fl) do
	if fl_id ~= "wpn_fps_addon_ris" then
		self.parts.wpn_fps_ass_stoy_556_hg_m4a1.override[fl_id] = {override={wpn_fps_ass_stoy_556_rrc_m4a1={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},wpn_fps_ass_stoy_556_rrc_ddm4={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}}, a_obj="a_fl_m4a1"}
		self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override[fl_id] = {override={wpn_fps_ass_stoy_556_rrc_m4a1={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},wpn_fps_ass_stoy_556_rrc_ddm4={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}}, a_obj="a_fl_m4a1"}
		self.parts.wpn_fps_ass_stoy_556_hg_mk18.override[fl_id] = {override={wpn_fps_ass_stoy_556_rrc_m4a1={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"},wpn_fps_ass_stoy_556_rrc_ddm4={unit="units/payday2/weapons/wpn_upg_dummy/wpn_upg_dummy"}}, a_obj="a_fl_m4a1"}
	end
end

self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override.wpn_fps_ass_stoy_556_lrc_m4a1 = {}
self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override.wpn_fps_ass_stoy_556_lrc_m4a1.adds = deep_clone(self.parts.wpn_fps_ass_stoy_556_lrc_m4a1.adds)
table.insert(self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override.wpn_fps_ass_stoy_556_lrc_m4a1.adds, "wpn_fps_ass_stoy_556_lrc_ddm4")
table.insert(self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override.wpn_fps_ass_stoy_556_lrc_m4a1.adds, "wpn_fps_ass_stoy_556_rrc_ddm4")
table.insert(self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override.wpn_fps_ass_stoy_556_lrc_m4a1.adds, "wpn_fps_ass_stoy_556_trc_ddm4")
table.insert(self.parts.wpn_fps_ass_stoy_556_hg_ddm4.override.wpn_fps_ass_stoy_556_lrc_m4a1.adds, "wpn_fps_ass_stoy_556_brc_ddm4")

----------------------------------------------------------
----<A><R><E><X><T><R><A> -Adds- <A><R><E><X><T><R><A>----
----------------------------------------------------------
	
-------------------------------------------------------------
----<A><R><E><X><T><R><A> -Forbids- <A><R><E><X><T><R><A>----
-------------------------------------------------------------

------------------------------------------------------------
----<A><R><E><X><T><R><A> -Stance- <A><R><E><X><T><R><A>----
------------------------------------------------------------

------------------------------------------------------------
----<A><R><E><X><T><R><A> -Tweaks- <A><R><E><X><T><R><A>----
------------------------------------------------------------

--- Barrel Extensions ---
------------------------------------------------------------
----<A><R><E><X><T><R><A> -CLONES- <A><R><E><X><T><R><A>----
------------------------------------------------------------

---------------------------------------
----<A><R><E><X><T><R><A> -WIP- <A><R><E><X><T><R><A>----
---------------------------------------------------------

end )
