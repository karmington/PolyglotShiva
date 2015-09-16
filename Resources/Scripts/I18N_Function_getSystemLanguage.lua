--------------------------------------------------------------------------------
--  Function......... : getSystemLanguage
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.getSystemLanguage ( )
--------------------------------------------------------------------------------
	
    local sLanguage = system.getOSLanguage ( )
    
    -- Polyglot language filename link to shiva's language constants.
    -- Polyglot uses IGDA Localization SIG guidelines on langugage code formatting.
    -- Filename formatting best practice is unclear.
    
    if     sLanguage == system.kLanguageArabic              then this.sLanguage ( "arSA" )
    elseif sLanguage == system.kLanguageBrazilianPortuguese then this.sLanguage ( "ptBR" )      
    elseif sLanguage == system.kLanguageBritishEnglish      then this.sLanguage ( "enUS_enGB" )    
    elseif sLanguage == system.kLanguageBulgarian           then this.sLanguage ( "bgBG" )    
    elseif sLanguage == system.kLanguageCzech               then this.sLanguage ( "csCZ" )    
    elseif sLanguage == system.kLanguageDanish              then this.sLanguage ( "daDK" )    
    elseif sLanguage == system.kLanguageDutch               then this.sLanguage ( "nlNL" )    
    elseif sLanguage == system.kLanguageEnglish             then this.sLanguage ( "enUS_enGB" )    
    elseif sLanguage == system.kLanguageFinnish             then this.sLanguage ( "fiFI" )    
    elseif sLanguage == system.kLanguageFrench              then this.sLanguage ( "frFR" )    
    elseif sLanguage == system.kLanguageGerman              then this.sLanguage ( "deDE_deCH_deAT" )    
    elseif sLanguage == system.kLanguageGreek               then this.sLanguage ( "elGR" )    
    elseif sLanguage == system.kLanguageHebrew              then this.sLanguage ( "heIL" )
    elseif sLanguage == system.kLanguageHungarian           then this.sLanguage ( "huHU" )    
    elseif sLanguage == system.kLanguageItalian             then this.sLanguage ( "itIT_itCH" )    
    elseif sLanguage == system.kLanguageJapanese            then this.sLanguage ( "jaJP" )    
    elseif sLanguage == system.kLanguageKorean              then this.sLanguage ( "koKR" )   
    elseif sLanguage == system.kLanguageNorwegian           then this.sLanguage ( "noNB" )    
    elseif sLanguage == system.kLanguagePolish              then this.sLanguage ( "plPL" )    
    elseif sLanguage == system.kLanguagePortuguese          then this.sLanguage ( "ptPT" )  
    elseif sLanguage == system.kLanguageRomanian            then this.sLanguage ( "roRO" )    
    elseif sLanguage == system.kLanguageRussian             then this.sLanguage ( "ruRU" )    
    elseif sLanguage == system.kLanguageSpanish             then this.sLanguage ( "esES_esAR_esMX" )    
    elseif sLanguage == system.kLanguageSwedish             then this.sLanguage ( "svSE" )    
    elseif sLanguage == system.kLanguageSimplifiedChinese   then this.sLanguage ( "zhCN_zhSG" )       
    elseif sLanguage == system.kLanguageTraditionalChinese  then this.sLanguage ( "zhTW_zhHK_zhMO" )  
    elseif sLanguage == system.kLanguageThai                then this.sLanguage ( "thTH" )    
    elseif sLanguage == system.kLanguageTurkish             then this.sLanguage ( "trTR" )        
    elseif sLanguage == system.kLanguageUnknown             then this.sLanguage ( "" )
    end
	
    
    log.message ( "System Language code: ", this.sLanguage ( ) )
    
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
