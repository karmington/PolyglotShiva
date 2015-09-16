--------------------------------------------------------------------------------
--  Handler.......... : onNextStrings
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function PolyglotMainAI.onNextStrings (  )
--------------------------------------------------------------------------------
	
    -- Reset text scaling by reloading hud
    
    local hUser = this.getUser ( )
    hud.destroyTemplateInstance ( hUser, "polyglotHUD" )
    hud.newTemplateInstance ( hUser, "PolyglotHUD", "polyglotHUD" )
    
    -- Next set
    
    this.setDemoStrings ( )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
