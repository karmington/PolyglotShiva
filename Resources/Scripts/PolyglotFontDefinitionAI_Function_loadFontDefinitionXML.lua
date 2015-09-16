--------------------------------------------------------------------------------
--  Function......... : loadFontDefinitionXML
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function PolyglotFontDefinitionAI.loadFontDefinitionXML ( )
--------------------------------------------------------------------------------
	
	local hUser = application.getCurrentUser ( )
    local sLanguage = user.getAIVariable ( hUser, "I18N", "sLanguage" )
    local sXMLFileName = "FontDefinition"
	
    if not application.isResourceReferenced ( sXMLFileName, application.kResourceTypeXML ) then
        log.warning ( "No font definitions declared" )
        return 0
    end
    
    local ht = user.getAIVariable ( hUser, "PolyglotFontDefinitionAI", "htFontDefs" )
    local hXml = xml.newInstance ( )
    
    -- only load the file if it doesn't exist already
    
    if not hashtable.contains ( ht, sXMLFileName ) then
    
        xml.createFromResource ( hXml, sXMLFileName )
        
        local hRoot = xml.getRootElement ( hXml )
        
        if(hRoot) then
        
            local htNewHash = hashtable.newInstance ( )
            for child = 0, xml.getElementChildCount ( hRoot ) - 1 do
                local hChild = xml.getElementChildAt ( hRoot, child )
                local sAttribute = xml.getAttributeValue ( xml.getElementAttributeWithName ( hChild, "name" ) )
                local sValue = xml.getElementValue ( hChild )
                hashtable.add ( htNewHash, sAttribute, sValue )
            end
            
            hashtable.add ( ht, sXMLFileName, htNewHash )
            log.message ( "Added ", xml.getElementChildCount ( hRoot ), " entries for ", sXMLFileName )
            
        end
    end
    
    xml.empty ( hXml )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
