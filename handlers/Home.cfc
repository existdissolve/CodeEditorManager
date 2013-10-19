component displayName="Home" {
    property name="settingService" inject="settingService@cb";
    property name="cb" inject="cbHelper@cb";
    property name="EditorService" inject="EditorService@cb";
    property name="AceEditor" inject="AceEditor@CodeEditor";
    property name="CodeMirrorEditor" inject="CodeMirrorEditor@CodeEditor";

    function index( required any event, required struct rc, required struct prc){
        // get custom settings
        var editors = [ 
            { name="ace", editor=AceEditor }, 
            { name="codemirror", editor=CodeMirrorEditor }
        ];
        // loop over editors and build prc
        for( var config in editors ) {
            var name = config.name;
            var editor = config.editor;
            prc[ name ] = {
                modes = editor.getModeDefs(),
                themes = editor.getThemeDefs(),
                allowedModes = editor.getSetting( "modes" ),
                allowedThemes = editor.getSetting( "themes" ),
                defaultMode = editor.getSetting( "defaultMode" ),
                defaultTheme = editor.getSetting( "defaultTheme" ),
                active = editor.getSetting( "active" )
            };
        }
        prc.tabModules_CodeEditor = true;
        prc.xehSaveSettings = cb.buildModuleLink( "CodeEditor", "home.saveSettings" );
        event.setView( "home/index" );
    }

    function saveSettings( required any event, required struct rc, required struct prc ) {
        var editors = [ 
            { name="ace", editor=AceEditor }, 
            { name="codemirror", editor=CodeMirrorEditor }
        ];
        for( var config in editors ) {
            var name = config.name;
            var editor = config.editor;
            var args = {
                "defaultMode" = editor.getSetting( "defaultMode" ),
                "defaultTheme" = editor.getSetting( "defaultTheme" ),
                "modes" = editor.getSimpleModeList(),
                "themes" = editor.getSimpleThemeList(),
                "active" = false
            };
            if( structKeyExists( rc, "#name#Modes" ) ) {
                args[ "modes" ] = listToArray( rc[ "#name#Modes" ] );
            }
            // handle themes
            if( structKeyExists( rc, "#name#Themes" ) ) {
                args[ "themes" ] = listToArray( rc[ "#name#Themes" ] );
            }
            // handle defaults
            if( structKeyExists( rc, "#name#DefaultMode" ) ) {
                args[ "defaultMode" ] = rc[ "#name#DefaultMode" ];
            }
            if( structKeyExists( rc, "#name#DefaultTheme" ) ) {
                args[ "defaultTheme" ] = rc[ "#name#DefaultTheme" ];
            }
            if( structKeyExists( rc, "#name#Active" ) ) {
                args[ "active" ] = true;
                EditorService.registerEditor( editor );
            }
            else {
                EditorService.unregisterEditor( name );
            }
            // save settings
            var saveArgs = { name="codeeditor-#name#" };
            var setting = settingService.findWhere( criteria=saveArgs );
            saveArgs.value = serializeJSON( args );
            if( isNull( setting ) ) {
                var newsetting = settingService.new( properties=saveArgs );
                settingService.save( newsetting );
            }
            else {
                setting.setValue( saveArgs.value );
                settingService.save( setting );
            }
        }
        // Messagebox
        getPlugin("MessageBox").info("Settings Saved & Updated!");
        cb.setNextModuleEvent( "CodeEditor", "home.index" );
    }
}