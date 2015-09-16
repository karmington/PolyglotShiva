--------------------------------------------------------------------------------
--  Function......... : getString
--  Author........... : 
--  Description...... : Fetch the given string, sStringToGet is in the format "File.name"
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.getString ( sStringToGet )
--------------------------------------------------------------------------------
	
    --
    -- Split the input argument at '|' ( pipe ) for Filename|STRING_ID
    
    local sFile, sString
    local tSplit = table.newInstance ( )
    string.explode ( sStringToGet, tSplit, "|" )
    
    if table.getSize ( tSplit ) ~= 2 then
        log.warning ( "Invalid argument passed to getString: ", sStringToGet )
        return nil
    end
    
    sFile = table.getFirst ( tSplit )
    sString = table.getLast ( tSplit )
    
    -- Check for {} formations, currently supporting
    -- Usual form: MENU_LABEL_MUSIC{ : Skaven}  or GAME_INVENTORY_AMMO{ : 10}
    -- Dual form: MENU_IO_SAVE{ / }MENU_LABEL_LANGUAGE
    
    -- We decompose the string into pieces:
    -- sString will be the first String ID
    -- sAppend will be the optional {} stuff inside braces
    -- sSecondString will be the optional second localized String ID
    -- Note this could be considerably improved to support more varied structures.
    
    local sAppend = ""
    local sSecondLocalization = ""
    
    if string.contains ( sString, "{" ) then
    
        local nBracketStartIndex = string.findFirst ( sString, "{", 0 )
        local nBracketEndIndex = string.findFirst ( sString, "}", nBracketStartIndex )
        sAppend = string.getSubString ( sString, nBracketStartIndex + 1, nBracketEndIndex-nBracketStartIndex-1 )
        
        -- The string ends with the brackets
        
        local nStringLength = string.getLength ( sString )
        if nBracketEndIndex == nStringLength -  1 then
        
            sString = string.getSubString ( sString, 0, nBracketStartIndex )
            
        -- There is another localizable string after the brackets
        
        else
        
            sSecondLocalization = string.getSubString ( sString, nBracketEndIndex + 1, nStringLength - nBracketEndIndex - 1 )
            sString = string.getSubString ( sString, 0, nBracketStartIndex )
        end
    end
    
    --
    -- Load the XML into our hash of hashes if it isn't loaded
    --
    I18N.loadXML ( sFile )
    
    --
    -- return the desired string assembled from the pieces above
    --
    
    local ht = this.htLoadedFiles ( )
    
    local innerHash = hashtable.get ( ht, sFile )
    local translatedString = innerHash and hashtable.get ( innerHash, sString ) or ""
    
    if string.getLength ( sAppend ) > 0 then
        translatedString = translatedString..sAppend
    end
    
    if string.getLength ( sSecondLocalization ) > 0 then
        local sSecondLocalized = innerHash and hashtable.get ( innerHash, sSecondLocalization ) or ""
        translatedString = translatedString..sSecondLocalized
    end
    
    return translatedString
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
