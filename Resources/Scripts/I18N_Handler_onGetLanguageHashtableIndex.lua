--------------------------------------------------------------------------------
--  Handler.......... : onGetLanguageHashtableIndex
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.onGetLanguageHashtableIndex ( sUserAI, sVariable )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    
    -- match the current language to the index in hashtable
    
    -- no reason to have doubled fontDefinitions- or is there?
    -- Might be situations where you want more than the one default font?
    
    local htFileTable = hashtable.getAt ( this.htFontDefinitions ( ), 0 )
    local index = hashtable.getIndex ( htFileTable, this.sLanguage ( ) )
	user.setAIVariable ( hUser, sUserAI, sVariable, index )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
