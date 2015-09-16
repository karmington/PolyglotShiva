--------------------------------------------------------------------------------
--  Function......... : fixHudComponentTextOverflow
--  Author........... : 
--  Description...... : 
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
function I18N.fixHudComponentTextOverflow ( hComp, bAllowMultiline )
--------------------------------------------------------------------------------
   
    --local hComp = hud.getComponent ( application.getCurrentUser ( ), sComp )
    
    if(bAllowMultiline == nil)
    then
        bAllowMultiline = false
    end
    
    if ( hComp ) then
   
        -- dismiss components with no Text
        local kType = hud.getComponentType ( hComp )
        local sText = ""
        if ( kType==hud.kComponentTypeButton ) then
            sText = hud.getButtonText ( hComp )
        elseif ( kType==hud.kComponentTypeLabel ) then
            sText = hud.getLabelText ( hComp )
        elseif ( kType==hud.kComponentTypeCheck ) then
            sText = hud.getCheckText ( hComp )
        end
        
        if string.getLength ( sText ) == 0 then
            return
        end
        
        local nLines=0
        local nHgt=0
        local bChecking=true
       
        while ( bChecking ) do
       
            if ( kType==hud.kComponentTypeButton ) then
                nLines = hud.getButtonTextTotalLineCount ( hComp )
                nHgt = hud.getButtonTextHeight ( hComp )
            elseif ( kType==hud.kComponentTypeLabel ) then
                nLines = hud.getLabelTextTotalLineCount ( hComp )
                nHgt = hud.getLabelTextHeight ( hComp )
            elseif ( kType==hud.kComponentTypeCheck ) then
                nLines = hud.getCheckTextTotalLineCount ( hComp )
                nHgt = hud.getCheckTextHeight ( hComp )
            end
           
            
            if ( 
                ( bAllowMultiline and nLines*nHgt>100 )
                or
                ( not bAllowMultiline and nLines > 1 )
                )
            then
                if ( kType==hud.kComponentTypeButton ) then
                    hud.setButtonTextHeight ( hComp, nHgt*0.95 )
                elseif ( kType==hud.kComponentTypeLabel ) then
                    hud.setLabelTextHeight ( hComp, nHgt*0.95 )
                elseif ( kType==hud.kComponentTypeCheck ) then
                    hud.setCheckTextHeight ( hComp, nHgt*0.95 )
                end
            else
                bChecking=false
                
                -- fix (sometimes nLines = 1 is rendered as 2 lines, this should fix it)
                if ( kType==hud.kComponentTypeButton ) then
                    hud.setButtonTextHeight ( hComp, nHgt*0.99 )
                elseif ( kType==hud.kComponentTypeLabel ) then
                    hud.setLabelTextHeight ( hComp, nHgt*0.99 )
                elseif ( kType==hud.kComponentTypeCheck ) then
                    hud.setCheckTextHeight ( hComp, nHgt*0.99 )
                end
            end
       
        end
       
    end
   
--------------------------------------------------------------------------------
end
--------------------------------------------------------------------------------
