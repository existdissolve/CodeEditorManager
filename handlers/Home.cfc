component displayName="Home" {
    property name="settingService" inject="settingService@cb";
    property name="cb" inject="cbHelper@cb";
    property name="CodeEditorService" inject="CodeEditorService@CodeEditor";
    property name="EditorService" inject="EditorService@cb";
    property name="AceEditor" inject="AceEditor@CodeEditor";

    function index( required any event, required struct rc, required struct prc){
        // get custom settings
        var settings = getModuleSettings( "CodeEditor" ).settings;
        var args = { name="codeeditor" };
        var setting = settingService.findWhere( criteria=args );
        prc.Ace.modes = settings.Ace.modes;
        prc.Ace.themes = settings.Ace.themes;
        prc.Ace.allowedModes = CodeEditorService.getCodeEditorSetting( "modes", "ace" );
        prc.Ace.allowedThemes = CodeEditorService.getCodeEditorSetting( "themes", "ace" );
        prc.Ace.defaultMode = CodeEditorService.getCodeEditorSetting( "defaultMode", "ace" );
        prc.Ace.defaultTheme = CodeEditorService.getCodeEditorSetting( "defaultTheme", "ace" );
        prc.Ace.active = CodeEditorService.getCodeEditorSetting( "active", "ace" );
        prc.tabModules_Ace = true;
        prc.xehSaveSettings = cb.buildModuleLink( "CodeEditor", "home.saveSettings" );
        event.setView( "home/index" );
    }

    function saveSettings( required any event, required struct rc, required struct prc ) {
        var settings = getModuleSettings( "CodeEditor" ).settings;
        // set default args...will be overwritten by form
        var aceArgs = {
            "defaultMode" = settings.Ace.defaultMode,
            "defaultTheme" = settings.Ace.defaultTheme,
            "modes" = CodeEditorService.getSimpleModeList(),
            "themes" = CodeEditorService.getSimpleThemeList(),
            "active" = false
        };
        // handle modes
        if( structKeyExists( rc, "AceModes" ) ) {
            aceArgs[ "modes" ] = listToArray( rc.AceModes );
        }
        // handle themes
        if( structKeyExists( rc, "AceThemes" ) ) {
            aceArgs[ "themes" ] = listToArray( rc.AceThemes );
        }
        // handle defaults
        if( structKeyExists( rc, "AceDefaultMode" ) ) {
            aceArgs[ "defaultMode" ] = rc.AceDefaultMode;
        }
        if( structKeyExists( rc, "AceDefaultTheme" ) ) {
            aceArgs[ "defaultTheme" ] = rc.AceDefaultTheme;
        }
        if( structKeyExists( rc, "AceActive" ) ) {
            aceArgs[ "active" ] = true;
            EditorService.registerEditor( AceEditor );
        }
        else {
            EditorService.unregisterEditor( "ace" );
        }
        // save settings
        var args = { name="codeeditor" };
        var setting = settingService.findWhere( criteria=args );
        args.value = serializeJSON( { "ace"= aceArgs } );
        if( isNull( setting ) ) {
            var newsetting = settingService.new( properties=args );
            settingService.save( newsetting );
        }
        else {
            setting.setValue( args.value );
            settingService.save( setting );
        }
        // Messagebox
        getPlugin("MessageBox").info("Settings Saved & Updated!");
        cb.setNextModuleEvent( "CodeEditor", "home.index" );
    }
}