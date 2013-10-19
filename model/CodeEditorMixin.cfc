component accessors="true" cache=false {
   /**
    * Constructor
    */
    public CodeEditorMixin function init( required Any editor ) {
        variables.editor = arguments.editor;
        // mixin to custom editor
        var fns = getMetaData( this ).functions;
        for( var i=1; i<=arrayLen( fns ); i++ ) {
            var name = fns[ i ].name;
            if( name != "init" ) {
                variables.editor[ name ] = variables[ name ];
            }            
        }
        return this;
    }


    /**
     * Gets setting, either from custom setting json or from module root
     * @name {String} the name of the setting key
     * return Any
     */
    public Any function getSetting( required String name ) {
        // grab custom settings
        var args = { name="codeeditormanager-#getName()#" };
        var customSettings = SettingService.findWhere( criteria=args );
        var hasCustomSetting=false;
        var settingValue = "";
        if( !isNull( customSettings ) ) {
            var values = deserializeJSON( customSettings.getValue() );
            if( structKeyExists( values, arguments.name ) ) {
                settingValue = values[ arguments.name ]; 
                hasCustomSetting = true;
            }
        }
        // fallback...get default editor setting
        if( !hasCustomSetting ) {
            settingValue = settings[ arguments.name ];
        }
        return settingValue;
    }

    /**
     * Gets mode definitions for editor
     * return Array
     */
    public Array function getModeDefs() {
        return settings.modes;
    }

    /**
     * Get populated, user-defined modes
     * return Array
     */
    public Array function getCustomModes() {
        var populatedModes = [];
        var customModeList = this.getSetting( "modes" );
        for( var mode in settings[ "modes" ] ) {
            if( arrayFindNoCase( customModeList, mode.mode ) ) {
                arrayAppend( populatedModes, mode );
            }
        }
        return populatedModes;
    }

    /**
     * Gets theme definitions for editor
     * return Array
     */
    public Array function getThemeDefs() {
        return settings.themes;
    }

    /**
     * Get populated, user-defined themes
     * return Array
     */
    public Array function getCustomThemes() {
        var populatedThemes = [];
        var customThemeList = this.getSetting( "themes" );
        for( var theme in settings[ "themes" ] ) {
            if( arrayFindNoCase( customThemeList, theme.theme ) ) {
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
        for( var mode in settings[ "modes" ] ) {
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
        for( var theme in settings[ "themes" ] ) {
            arrayAppend( themes, theme.theme );
        }
        return themes;
    }
}