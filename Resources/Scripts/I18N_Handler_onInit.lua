--------------------------------------------------------------------------------
--  Handler.......... : onInit
--  Author........... : Originally by Error454, adapted and expanded by Karmington
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.onInit (  )
--------------------------------------------------------------------------------
	
    log.message ( "I18N init" )
    
    this.getSystemLanguage ( ) 
    this.loadXMLFontDefinitions ( )
    
    -- this.sLanguage is the value found by the system, and is left untouched
    -- this.sLangOverride is used if it is set either via save or set in AI Variables
    
    local sCurrentLangCode = this.sLanguage()
    local sLangOverride = this.sLanguageOverride()
    
    -- Check for saved value : it will override a manually set AI Variable if it exists.
    
    local sSavedLangOverride = application.getCurrentUserEnvironmentVariable ( "language" )
    if sSavedLangOverride and string.getLength ( sSavedLangOverride ) > 0 then
        sLangOverride = sSavedLangOverride
        this.sLanguageOverride( sLangOverride )
    end
    
    -- Use the sLangOverride if it exists
    
    if sLangOverride and string.getLength ( sLangOverride ) > 0 then
        log.message ( "langOverride ",sLangOverride )
        sCurrentLangCode = sLangOverride
    end
    
    -- Load up Fonts
    
    local htFontDefs = this.htFontDefinitions()
    local htFileTable = hashtable.getAt ( htFontDefs, 0 )
    
    if htFileTable then
    
    local sFontName = hashtable.get ( htFileTable, sCurrentLangCode )
    
        if string.getLength ( sFontName ) > 0 then
            log.message ( "onEnter, font : ",sFontName )
            this.sFontOverride ( sFontName )
        end
    
    else
        log.warning ( "No Font Definitions enabled for this language." )
    end
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
