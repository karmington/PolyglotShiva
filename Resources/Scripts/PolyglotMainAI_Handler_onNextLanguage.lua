--------------------------------------------------------------------------------
--  Handler.......... : onNextLanguage
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function PolyglotMainAI.onNextLanguage (  )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local nIndex = this.nLanguageIndex ( )
    
    -- reference the fontTable
    
    local htFontDefs = user.getAIVariable ( hUser, "I18N", "htFontDefinitions" )
    local htFileTable = hashtable.getAt ( htFontDefs, 0 )
    local sLanguageOverride = hashtable.getKeyAt ( htFileTable, nIndex )
    local sFontOverride = hashtable.getAt ( htFileTable, nIndex )
    
    -- Send Overrides to I18N
    
    log.message ( "Override to ",sLanguageOverride, " ",nIndex, " font: ",sFontOverride )
    user.sendEventImmediate ( hUser, "I18N", "onSetLanguageOverride", sLanguageOverride )
    if string.getLength ( sFontOverride ) > 0 then user.sendEvent ( hUser, "I18N", "onSetFontOverride", sFontOverride ) end
    
    -- Increment and Reload
    
    local nTableSize = hashtable.getSize ( htFileTable )
    nIndex = nIndex+1
    if nIndex > nTableSize - 1 then nIndex = 0 end
    this.nLanguageIndex ( nIndex )
    
    -- Rude Reset
    
    this.Idle()
    this.Main()
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
