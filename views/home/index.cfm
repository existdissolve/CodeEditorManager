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
                                                <cfset useablename = replaceNoCase( theme.path, 'ace/theme/', '', 'all')>
                                                <option value="#useablename#" <cfif prc.Ace.defaultTheme eq useablename>selected="selected"</cfif>>#theme.name#</option>
                                            </cfloop>
                                        </select>
                                    </div>
                                </div>  
                                <div class="control-group">
                                    <label class="control-label" for="AceThemes">Allowed Themes:</label>
                                    <label class="btn btn-info btn-toggle" for="ThemeCheckAll">
                                        <input type="checkbox" id="ThemeCheckAll" name="ThemeCheckAll" /> Check/Uncheck All
                                    </label>
                                    <div class="controls">
                                        <table border="0" width="100%">
                                            <tr>
                                            <cfset counter = 1>
                                            <cfloop array="#prc.Ace.themes#" index="theme">
                                                <cfset useablename = replaceNoCase( theme.path, 'ace/theme/', '', 'all')>
                                                <td>
                                                    <input type="checkbox" name="AceThemes" value="#useablename#" <cfif arrayFindNoCase( prc.Ace.allowedThemes, useablename ) OR NOT arrayLen( prc.Ace.allowedThemes )>checked="checked"</cfif> /> #theme.name#
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
                                                <cfset useablename = replaceNoCase( mode.path, 'ace/mode/', '', 'all')>
                                                <option value="#useablename#" <cfif prc.Ace.defaultMode eq useablename>selected="selected"</cfif>>#mode.name#</option>
                                            </cfloop>
                                        </select>
                                    </div>
                                </div>  
                                <div class="control-group">
                                    <label class="control-label" for="defaultMode">Allowed Modes:</label>
                                    <label class="btn btn-info btn-toggle" for="ModeCheckAll">
                                        <input type="checkbox" id="ModeCheckAll" name="ModeCheckAll" /> Check/Uncheck All
                                    </label>
                                    <div class="controls">
                                        <table border="0" width="100%">
                                            <tr>
                                            <cfset counter = 1>
                                            <cfloop array="#prc.Ace.modes#" index="mode">
                                                <cfset useablename = replaceNoCase( mode.path, 'ace/mode/', '', 'all')>
                                                <td>
                                                    <input type="checkbox" name="AceModes" value="#useablename#" <cfif arrayFindNoCase( prc.Ace.allowedModes, useablename ) OR NOT arrayLen( prc.Ace.allowedModes )>checked="checked"</cfif> /> #mode.name#
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
                            Code Mirror Stuff
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