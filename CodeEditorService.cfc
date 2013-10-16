component {
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
     * return Array
     */
    public Array function getCustomPopulatedModes() {
        var populatedModes = [];
        var customModeList = getCodeEditorSetting( "modes", "ace" );
        for( var mode in settings.ace.modes ) {
            if( arrayFindNoCase( customModeList, mode.mode ) ) {
                arrayAppend( populatedModes, mode );
            }
        }
        return populatedModes;
    }

    /**
     * Get populated, user-defined themes
     * return Array
     */
    public Array function getCustomPopulatedThemes() {
        var populatedThemes = [];
        var customThemeList = getCodeEditorSetting( "themes", "ace" );
        for( var theme in settings.ace.themes ) {
            if( arrayFindNoCase( customThemeList, replaceNoCase( theme.path, "ace/theme/", "", "all" ) ) ) {
                arrayAppend( populatedThemes, theme );
            }
        }
        return populatedThemes;
    }

    /**
     * Returns a simplified list of modes
     * return Array
     */
    public Array function getSimpleModeList() {
        var modes = [];
        for( var mode in settings.ace.modes ) {
            arrayAppend( modes, mode.mode );
        }
        return modes;
    }
    /**
     * Returns a simplified list of themes
     * return Array
     */
    public Array function getSimpleThemeList() {
        var themes = [];
        for( var theme in settings.ace.themes ) {
            arrayAppend( themes, replaceNoCase( theme.path, "ace/theme/", "", "all" ) );
        }
        return themes;
    }
}