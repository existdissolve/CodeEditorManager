<cfoutput>
    <style>
        input[type="checkbox"] {margin: -2px 0 0;margin-top: 1px \9;}
    </style>
    #html.startForm(name="settingsForm", action=prc.xehSaveSettings, novalidate="novalidate")#
    <div class="main" id="main_column">
        <div class="box" style="min-height:600px;">
            <!--- Body Header --->
            <div class="header">
                <i class="icon-wrench icon-large"></i>
                Custom Content Editor Settings
            </div>
            <!--- Body --->
            <div class="body">
                <!--- messageBox --->
                #getPlugin("MessageBox").renderit()#
                <div class="tabbable tabs-left">           
                    <!--- Navigation Bar --->
                    <ul class="nav nav-tabs" id="widget-sidebar">
                        <li class="active"><a href="##ace" class="current" data-toggle="tab">Ace Code Editor</a></li>
                        <li><a href="##codemirror" data-toggle="tab">Code Mirror</a></li>
                    </ul>
                    <!--- ContentBars --->
                    <div class="tab-content">
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
                        <div class="full tab-pane" id="codemirror">
                            <fieldset>
                                <legend><strong>CodeMirror Editor</strong></legend>
                                <div class="control-group">
                                    <div class="controls">
                                        <cfset color = prc.CodeMirror.active ? "success" : "danger">
                                        <label class="btn btn-#color# btn-toggle" for="CodeMirrorActive">
                                            <input type="checkbox" id="CodeMirrorActive" name="CodeMirrorActive" <cfif prc.CodeMirror.active>checked=checked</cfif> />  Active?
                                        </label>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label" for="CodeMirrorDefaultTheme">Default Theme:</label>
                                    <div class="controls">
                                        <select name="CodeMirrorDefaultTheme" id="CodeMirrorDefaultTheme">
                                            <cfloop array="#prc.CodeMirror.themes#" index="theme" >
                                                <option value="#theme.theme#" <cfif prc.CodeMirror.defaultTheme eq theme.theme>selected="selected"</cfif>>#theme.name#</option>
                                            </cfloop>
                                        </select>
                                    </div>
                                </div>  
                                <div class="control-group">
                                    <label class="control-label" for="CodeMirrorThemes">Allowed Themes:</label>
                                    <label class="btn btn-info btn-toggle" for="CodeMirrorThemeCheckAll">
                                        <input type="checkbox" id="CodeMirrorThemeCheckAll" name="CodeMirrorThemeCheckAll" /> Check/Uncheck All
                                    </label>
                                    <div class="controls">
                                        <table border="0" width="100%">
                                            <tr>
                                            <cfset counter = 1>
                                            <cfloop array="#prc.CodeMirror.themes#" index="theme">
                                                <td>
                                                    <input type="checkbox" name="CodeMirrorThemes" value="#theme.theme#" <cfif arrayFindNoCase( prc.CodeMirror.allowedThemes, theme.theme ) OR NOT arrayLen( prc.CodeMirror.allowedThemes )>checked="checked"</cfif> /> #theme.name#
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
                                    <label class="control-label" for="CodeMirrorDefaultMode">Default Mode:</label>
                                    <div class="controls">
                                        <select name="CodeMirrorDefaultMode" id="CodeMirrorDefaultMode">
                                            <cfloop array="#prc.CodeMirror.modes#" index="mode" >
                                                <option value="#mode.mode#" <cfif prc.CodeMirror.defaultMode eq mode.mode>selected="selected"</cfif>>#mode.name#</option>
                                            </cfloop>
                                        </select>
                                    </div>
                                </div>  
                                <div class="control-group">
                                    <label class="control-label" for="defaultMode">Allowed Modes:</label>
                                    <label class="btn btn-info btn-toggle" for="CodeMirrorModeCheckAll">
                                        <input type="checkbox" id="CodeMirrorModeCheckAll" name="CodeMirrorModeCheckAll" /> Check/Uncheck All
                                    </label>
                                    <div class="controls">
                                        <table border="0" width="100%">
                                            <tr>
                                            <cfset counter = 1>
                                            <cfloop array="#prc.CodeMirror.modes#" index="mode">
                                                <td>
                                                    <input type="checkbox" name="CodeMirrorModes" value="#mode.mode#" <cfif arrayFindNoCase( prc.CodeMirror.allowedModes, mode.mode ) OR NOT arrayLen( prc.CodeMirror.allowedModes )>checked="checked"</cfif> /> #mode.name#
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
                    </div>
                    <!--- Button Bar --->
                    <div class="form-actions">
                        #html.submitButton(value="Save Settings", class="btn btn-danger pull-right")#
                    </div>
                </div>
            </div>
        </div>
    </div>
    #html.endForm()#
</cfoutput>