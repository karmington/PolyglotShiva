--------------------------------------------------------------------------------
--  Function......... : loadXML
--  Author........... : 
--  Description...... : Loads the given XML file into the hashtable (if not loaded)
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.loadXML ( sXMLFileName )
--------------------------------------------------------------------------------
	
    local hUser = application.getCurrentUser ( )
    local sCurrentLanguage = this.sLanguage ( ) 
    local sLocalizedFilename
    
    --
    -- Use the language override if it exists ( but do not overwrite it )
    --
    if not string.isEmpty ( this.sLanguageOverride ( ) ) then
        sCurrentLanguage = this.sLanguageOverride ( )
    end
    
    --
    -- Make sure the resource is referenced, if not, fall back to english
    --
    if not application.isResourceReferenced ( sXMLFileName .. "_" .. sCurrentLanguage, application.kResourceTypeXML ) then
        -- try to fallback to default of en
        if application.isResourceReferenced ( sXMLFileName .. "_enUS_enGB", application.kResourceTypeXML ) then
            log.warning ( "Falling back to english" )
            sLocalizedFilename = sXMLFileName .. "_enUS_enGB"
        else
            log.warning ( "Can't fall back to english!" )
            return 0
        end
    else
        sLocalizedFilename = sXMLFileName .. "_" .. sCurrentLanguage
    end
    
    local ht = this.htLoadedFiles ( )
    local hXML = this.hXML ( )
    
    -- only load the file if it doesn't exist already
    if not hashtable.contains ( ht, sXMLFileName ) then
        xml.empty ( hXML )
        xml.createFromResource ( hXML, sLocalizedFilename )
        
        local hRoot = xml.getRootElement ( hXML )
        
        if(hRoot) then
        
            local htNewHash = hashtable.newInstance ( )
            for child = 0, xml.getElementChildCount ( hRoot ) - 1 do
                local hChild = xml.getElementChildAt ( hRoot, child )
                local sAttribute = xml.getAttributeValue ( xml.getElementAttributeWithName ( hChild, "n" ) )
                local sValue = xml.getElementValue ( hChild )
                hashtable.add ( htNewHash, sAttribute, sValue )
            end
            
            hashtable.add ( ht, sXMLFileName, htNewHash )
            
            this.nStringCount ( xml.getElementChildCount ( hRoot ) )
            
            log.message ( "Added ", this.nStringCount(), " entries for ", sXMLFileName )
            
        end
    end
    
    xml.empty ( hXML )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
