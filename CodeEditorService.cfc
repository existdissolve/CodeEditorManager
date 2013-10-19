component accessors="true" singleton {
    property name="settings" inject="coldbox:moduleSettings:CodeEditor";
    property name="settingService" inject="settingService@cb";

    public CodeEditorService function init() {
        return this;
    }

    /**
     * Gets setting, either from custom setting json or from module root
     * @name {String} the name of the setting key
     * @editor {String} the name of the editor for which the key is being retrieved
     * return Any
     */
    public Any function getCodeEditorSetting( required String name, required String editor ) {
        var args = { name="codeeditor" };
        var setting = settingService.findWhere( criteria=args );
        var hasCustomSetting=false;
        var settingValue = "";
        if( !isNull( setting ) ) {
            var values = deserializeJSON( setting.getValue() );
            if( structKeyExists( values, arguments.editor ) ) {
                if( structKeyExists( values[ arguments.editor ], arguments.name ) ) {
                    settingValue = values[ arguments.editor ][ arguments.name ]; 
                    hasCustomSetting = true;
                }
            }
        }
        // fallback...get module setting
        if( !hasCustomSetting ) {
            settingValue = settings[ arguments.editor ][ arguments.name ];
            if( editor=="ace" && name=="modes" ) {
                settingValue = getSimpleModeList();
            }
            if( editor=="ace" && name=="themes" ) {
                settingValue = getSimpleThemeList();
            }
        }
        return settingValue;
    }

    /**
     * Get populated, user-defined modes
     * @editor {String} the name of the editor for which the custom modes are being retrieved
     * return Array
     */
    public Array function getCustomModes( required String editor ) {
        var populatedModes = [];
        var customModeList = getCodeEditorSetting( "modes", arguments.editor );
        for( var mode in settings[ arguments.editor ].modes ) {
            if( arrayFindNoCase( customModeList, mode.mode ) ) {
                arrayAppend( populatedModes, mode );
            }
        }
        return populatedModes;
    }

    /**
     * Get populated, user-defined themes
     * @editor {String} the name of the editor for which the custom themes are being retrieved
     * return Array
     */
    public Array function getCustomThemes( required String editor ) {
        var populatedThemes = [];
        var customThemeList = getCodeEditorSetting( "themes", arguments.editor );
        for( var theme in settings[ arguments.editor ].themes ) {
            if( arrayFindNoCase( customThemeList, theme.theme ) ) {
                arrayAppend( populatedThemes, theme );
            }
        }
        return populatedThemes;
    }

    /**
     * Returns a simplified list of modes
     * @editor {String} the name of the editor for which the themes are being retrieved
     * return Array
     */
    public Array function getSimpleModeList( required String editor ) {
        var modes = [];
        for( var mode in settings[ editor ].modes ) {
            arrayAppend( modes, mode.mode );
        }
        return modes;
    }
    /**
     * Returns a simplified list of themes
     * @editor {String} the name of the editor for which the themes are being retrieved
     * return Array
     */
    public Array function getSimpleThemeList( required String editor ) {
        var themes = [];
        for( var theme in settings[ editor ].themes ) {
            arrayAppend( themes, theme.theme );
        }
        return themes;
    }
}