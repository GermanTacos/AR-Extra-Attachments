Hooks:PostHook( WeaponTweakData, "init", "AR15ModInit", function(self)

if ( self.stoy_556 ) then

---- CAP aka YEEET ----	

--- Base stuff ---	
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_ns", 
        base_a_obj = "a_ns", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_fl", 
        base_a_obj = "a_fl", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_gl", 
        base_a_obj = "a_fl", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_o", 
        base_a_obj = "a_o", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_os", 
        base_a_obj = "a_os", 
        position = Vector3( 0, 0, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
	self:SetupAttachmentPoint("stoy_556", {
        name = "a_bolt_ar15",
        base_a_obj = "a_body",
        part_attach_data = {{"wpn_fps_ass_stoy_556_ch_ar15"},"g_charginghandle"},
        position = Vector3(0, 0, 0),
        rotation = RotationCAP(0, 0, 0)
    })
--- Gas Block ---
	self:SetupAttachmentPoint("stoy_556", {
		name = "a_gb_car15", 
        base_a_obj = "a_body", 
        position = Vector3( 0, -12.75, 0 ),
        rotation = Rotation( 0, 0, 0 ) 
	})
end
end)



