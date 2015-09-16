--------------------------------------------------------------------------------
--  Function......... : setDemoStrings
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function PolyglotMainAI.setDemoStrings ( )
--------------------------------------------------------------------------------
	
    --log.message ( "setDemoStrings" )
    
	local hUser = this.getUser ( )
    
    -- All the demo strings are in labels, so we fetch new content for them. They are direct from the localized xml.
    
    local count = hud.getComponentCount ( hUser )
    for i = 0, count - 1 do
    
        local hComponent = hud.getComponentAt ( hUser, i )
        if hud.getComponentType ( hComponent ) == hud.kComponentTypeLabel then
        
            -- get a new string
            local htFiles = user.getAIVariable ( hUser, "I18N", "htLoadedFiles" )
            
            -- it's nested hashtable, but we only load one in this demo
            local htFileTable = hashtable.getAt ( htFiles, 0 )
            local sString = hashtable.getAt ( htFileTable, this.nStringIndex ( ) )
            
            log.message ( "sString: ",sString," at ", this.nStringIndex ( ) )
            
            if  hud.getComponentType ( hComponent ) == hud.kComponentTypeLabel then
                hud.setLabelText ( hComponent, sString )
            elseif  hud.getComponentType ( hComponent ) == hud.kComponentTypeButton then
                hud.setButtonText ( hComponent, sString )
            elseif  hud.getComponentType ( hComponent ) == hud.kComponentTypeCheck then
                hud.setCheckText ( hComponent, sString )
            end
            
            this.nStringIndex ( this.nStringIndex ( ) + 1 )
            if this.nStringIndex ( ) > this.nNumStrings ( ) - 1 then
                this.nStringIndex ( 0 )
            end
        end
    end
	
    -- we need get all the other components localized again too since we are doing a full refresh of the Main state
    
    local count = hud.getComponentCount ( hUser )
    for i = 0, count - 1 do
        local hComponent = hud.getComponentAt ( hUser, i )
        local sComponentTag = hud.getComponentTag ( hComponent )
        user.sendEventImmediate ( hUser, "I18N", "onLocalizeHudComponent", sComponentTag ) -- immediate
        user.sendEvent ( hUser, "I18N", "onFixOverflow", hud.getComponentTag ( hComponent ), false ) -- normal because font update takes a frame
    end
    
    this.nNumStrings ( user.getAIVariable ( hUser, "I18N", "nStringCount" ) )
    
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
