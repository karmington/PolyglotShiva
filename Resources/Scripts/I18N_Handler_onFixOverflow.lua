--------------------------------------------------------------------------------
--  Handler.......... : onFixOverflow
--  Author........... : 
--  Description...... : The huds update takes 1 frame so we need to have a delayed FixOverflow call.
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.onFixOverflow ( sComponent, bAllowMultiline )
--------------------------------------------------------------------------------
	
    local hUser = this.getUser ( )
	local hComponent = hud.getComponent ( hUser, sComponent )
	this.fixHudComponentTextOverflow ( hComponent, bAllowMultiline )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
