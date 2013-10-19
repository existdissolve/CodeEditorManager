<cfoutput>
<div class="full tab-pane active" id="ace">
    <fieldset>
        <legend><strong>Ace Code Editor</strong></legend>
        <div class="control-group">
            <div class="controls">
                <cfset color = prc.Ace.active ? "success" : "danger">
                <label class="btn btn-#color# btn-toggle" for="AceActive">
                    <input type="checkbox" id="AceActive" name="AceActive" <cfif prc.Ace.active>checked=checked</cfif> />  Active?
                </label>
            </div>
        </div>
        <div class="control-group">
            <label class="control-label" for="AceDefaultTheme">Default Theme:</label>
            <div class="controls">
                <select name="AceDefaultTheme" id="AceDefaultTheme">
                    <cfloop array="#prc.Ace.themes#" index="theme" >
                        <option value="#theme.theme#" <cfif prc.Ace.defaultTheme eq theme.theme>selected="selected"</cfif>>#theme.name#</option>
                    </cfloop>
                </select>
            </div>
        </div>  
        <div class="control-group">
            <label class="control-label" for="AceThemes">Allowed Themes:</label>
            <label class="btn btn-info btn-toggle" for="AceThemeCheckAll">
                <input type="checkbox" id="AceThemeCheckAll" name="AceThemeCheckAll" /> Check/Uncheck All
            </label>
            <div class="controls">
                <table border="0" width="100%">
                    <tr>
                    <cfset counter = 1>
                    <cfloop array="#prc.Ace.themes#" index="theme">
                        <td>
                            <input type="checkbox" name="AceThemes" value="#theme.theme#" <cfif arrayFindNoCase( prc.Ace.allowedThemes, theme.theme ) OR NOT arrayLen( prc.Ace.allowedThemes )>checked="checked"</cfif> /> #theme.name#
                        </td>
                        <cfif counter MOD 6 eq 0>
                            </tr>
                            <tr>
                        </cfif>
                        <cfset counter++>
                    </cfloop>
                    <cfif counter MOD 6 gt 0>
                        <td colspan="#6-(counter MOD 6)+1#">&nbsp;</td>
                    </cfif>
                    </tr>
                </table>
            </div>
        </div>  
        <div class="control-group">
            <label class="control-label" for="AceDefaultMode">Default Mode:</label>
            <div class="controls">
                <select name="AceDefaultMode" id="AceDefaultMode">
                    <cfloop array="#prc.Ace.modes#" index="mode" >
                        <option value="#mode.mode#" <cfif prc.Ace.defaultMode eq mode.mode>selected="selected"</cfif>>#mode.name#</option>
                    </cfloop>
                </select>
            </div>
        </div>  
        <div class="control-group">
            <label class="control-label" for="defaultMode">Allowed Modes:</label>
            <label class="btn btn-info btn-toggle" for="AceModeCheckAll">
                <input type="checkbox" id="AceModeCheckAll" name="AceModeCheckAll" /> Check/Uncheck All
            </label>
            <div class="controls">
                <table border="0" width="100%">
                    <tr>
                    <cfset counter = 1>
                    <cfloop array="#prc.Ace.modes#" index="mode">
                        <td>
                            <input type="checkbox" name="AceModes" value="#mode.mode#" <cfif arrayFindNoCase( prc.Ace.allowedModes, mode.mode ) OR NOT arrayLen( prc.Ace.allowedModes )>checked="checked"</cfif> /> #mode.name#
                        </td>
                        <cfif counter MOD 6 eq 0>
                            </tr>
                            <tr>
                        </cfif>
                        <cfset counter++>
                    </cfloop>
                    <cfif counter MOD 6 gt 0>
                        <td colspan="#6-(counter MOD 6)+1#">&nbsp;</td>
                    </cfif>
                    </tr>
                </table>
            </div>
        </div>  
    </fieldset>
</div>
</cfoutput>