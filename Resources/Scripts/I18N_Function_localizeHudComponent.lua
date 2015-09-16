--------------------------------------------------------------------------------
--  Function......... : localizeHudComponent
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.localizeHudComponent ( sComponentTag )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    local bPadding = false          -- pad blank spaces around the word
    local bDefaultOverride = true   -- even if we don't find a localized string, override the font to match the current override
    
    local sFontOverride = this.sFontOverride ( )
    if bDefaultOverride and not sFontOverride or string.getLength ( sFontOverride ) == 0 then
        log.warning ( "no default fontOverride set" )
        bDefaultOverride = false 
    end
    
    local sComponentText
    local sLocalizedText
    local hComponent = hud.getComponent ( hUser, sComponentTag )
    
    if not hComponent then
        log.warning ( "I18N.localizeHudComponent received an invalid tag." )
        return
    end
    
    -- Get component text, and set fontOverrides if applicable
    
    if      hud.getComponentType ( hComponent ) == hud.kComponentTypeCheck then
        
        sComponentText = hud.getCheckText ( hComponent )
        if bDefaultOverride then hud.setCheckFont ( hComponent, sFontOverride) end
        
    elseif  hud.getComponentType ( hComponent ) == hud.kComponentTypeButton then
        
        sComponentText = hud.getButtonText ( hComponent )
        if bDefaultOverride then hud.setButtonFont ( hComponent, sFontOverride) end
        
    elseif  hud.getComponentType ( hComponent ) == hud.kComponentTypeLabel then
        
        sComponentText = hud.getLabelText ( hComponent )
        if bDefaultOverride then hud.setLabelFont ( hComponent, sFontOverride) end
        
    end
    

    -- If we have component text, search for the localization
    
    if sComponentText and string.getLength ( sComponentText ) > 0 then
        
        sLocalizedText = this.getString ( this.sDefaultFilename ( ).."|"..sComponentText ) -- Note here we have hardcoded the filename. This can be changed to support multiple files
        
    end
    
    -- If we have localized text, add optional padding and set encoding + text
    
    if sLocalizedText and string.getLength ( sLocalizedText ) > 0 then
        
        if bPadding then
            sLocalizedText = " "..sLocalizedText.." "
        end
    
        --log.message ( "Compo: ",sComponentText," loc: ",sLocalizedText )
        
        -- set the check/button/label and make sure we are in UTF8
        
        if  hud.getComponentType ( hComponent ) == hud.kComponentTypeLabel then
            hud.setLabelTextEncoding ( hComponent, hud.kEncodingUTF8 )
            hud.setLabelText ( hComponent, sLocalizedText )
        elseif  hud.getComponentType ( hComponent ) == hud.kComponentTypeButton then
            hud.setButtonTextEncoding ( hComponent, hud.kEncodingUTF8 )
            hud.setButtonText ( hComponent, sLocalizedText )
        elseif  hud.getComponentType ( hComponent ) == hud.kComponentTypeCheck then
            hud.setCheckTextEncoding ( hComponent, hud.kEncodingUTF8 )
            hud.setCheckText ( hComponent, sLocalizedText )
        end
        
        --this.fixHudComponentTextOverflow ( hComponent )
        --user.postEvent ( hUser, application.getLastFrameTime ( ) * 2, "I18N", "onFixOverflow", hud.getComponentTag ( hComponent ) )
        
    end
    
    --user.postEvent ( hUser, application.getLastFrameTime ( ) * 2, "I18N", "onFixOverflow", hud.getComponentTag ( hComponent ) )
	this.fixHudComponentTextOverflow ( hComponent )
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
