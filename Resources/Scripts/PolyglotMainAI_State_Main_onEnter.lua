--------------------------------------------------------------------------------
--  State............ : Main
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function PolyglotMainAI.Main_onEnter ( )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    -- Make sure I18N is loaded up
    
    user.sendEventImmediate ( this.getUser ( ), "I18N", "onInit" ) 
    
    -- Create the HUD
    
    hud.newTemplateInstance ( hUser, "PolyglotHUD", "polyglotHUD" )
    
    -- localize the strings
    
    local count = hud.getComponentCount ( hUser )
    for i = 0, count - 1 do
        local hComponent = hud.getComponentAt ( hUser, i )
        local sComponentTag = hud.getComponentTag ( hComponent )
        user.sendEventImmediate ( hUser, "I18N", "onLocalizeHudComponent", sComponentTag )
    end
    
    -- prepare the string counter so we can shuffle next srings in
    
    this.nNumStrings ( user.getAIVariable ( hUser, "I18N", "nStringCount" ) )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
