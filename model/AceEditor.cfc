/**
********************************************************************************
ContentBox - A Modular Content Platform
Copyright 2012 by Luis Majano and Ortus Solutions, Corp
www.gocontentbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
Apache License, Version 2.0

Copyright Since [2012] [Luis Majano and Ortus Solutions,Corp]

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
********************************************************************************
* Simple textarea editor
*/
component implements="contentbox.model.ui.editors.IEditor" accessors="true" singleton{

    // DI
    property name="log"     inject="logbox:logger:{this}";
    property name="html"    inject="coldbox:plugin:HTMLHelper";
    property name="cb"      inject="cbHelper@cb";
    property name="SettingService" inject="SettingService@cb";
    
    settings = {
        "active" = false,
        "defaultMode" = "coldfusion",
        "modes" = [
            { name="ABAP", mode="abap" },
            { name="ActionScript", mode="actionscript" },
            { name="ADA", mode="ada" },
            { name="AsciiDoc", mode="asciidoc" },
            { name="Assembly_x86", mode="assembly_x86" },
            { name="AutoHotKey", mode="autohotkey" },
            { name="BatchFile", mode="batchfile" },
            { name="C9Search", mode="c9search" },
            { name="C/C++", mode="c_cpp" },
            { name="Clojure", mode="clojure" },
            { name="Cobol", mode="cobol" },
            { name="CoffeeScript", mode="coffee" },
            { name="ColdFusion", mode="coldfusion" },
            { name="C##", mode="csharp" },
            { name="CSS", mode="css" },
            { name="Curly", mode="curly" },
            { name="D", mode="d" },
            { name="Dart", mode="dart" },
            { name="Diff", mode="diff" },
            { name="Dot", mode="dot" },
            { name="Erlang", mode="erlang" },
            { name="EJS", mode="ejs" },
            { name="Forth", mode="forth" },
            { name="FreeMarker", mode="ftl" },
            { name="Glsl", mode="glsl" },
            { name="Go", mode="golang" },
            { name="Groovy", mode="groovy" },
            { name="HAML", mode="haml" },
            { name="Handlebars", mode="handlebars" },
            { name="Haskell", mode="haskell" },
            { name="haXe", mode="haxe" },
            { name="HTML", mode="html" },
            { name="HTML (Ruby)", mode="html_ruby" },
            { name="INI", mode="ini" },
            { name="Jack", mode="jack" },
            { name="Jade", mode="jade" },
            { name="Java", mode="java" },
            { name="JavaScript", mode="javascript" },
            { name="JSON", mode="json" },
            { name="JSONiq", mode="jsoniq" },
            { name="JSP", mode="jsp" },
            { name="JSX", mode="jsx" },
            { name="Julia", mode="julia" },
            { name="LaTeX", mode="latex" },
            { name="LESS", mode="less" },
            { name="Liquid", mode="liquid" },
            { name="Lisp", mode="lisp" },
            { name="LiveScript", mode="livescript" },
            { name="LogiQL", mode="logiql" },
            { name="LSL", mode="lsl" },
            { name="Lua", mode="lua" },
            { name="LuaPage", mode="luapage" },
            { name="Lucene", mode="lucene" },
            { name="Makefile", mode="makefile" },
            { name="MATLAB", mode="matlab" },
            { name="Markdown", mode="markdown" },
            { name="MySQL", mode="mysql" },
            { name="MUSHCode", mode="mushcode" },
            { name="Nix", mode="nix" },
            { name="Objective-C", mode="objectivec" },
            { name="OCaml", mode="ocaml" },
            { name="Pascal", mode="pascal" },
            { name="Perl", mode="perl" },
            { name="pgSQL", mode="pgsql" },
            { name="PHP", mode="php" },
            { name="Powershell", mode="powershell" },
            { name="Prolog", mode="prolog" },
            { name="Properties", mode="properties" },
            { name="Protobuf", mode="protobuf" },
            { name="Python", mode="python" },
            { name="R", mode="r" },
            { name="RDoc", mode="rdoc" },
            { name="RHTML", mode="rhtml" },
            { name="Ruby", mode="ruby" },
            { name="Rust", mode="rust" },
            { name="SASS", mode="sass" },
            { name="SCAD", mode="scad" },
            { name="Scala", mode="scala" },
            { name="Scheme", mode="scheme" },
            { name="SCSS", mode="scss" },
            { name="SH", mode="sh" },
            { name="SJS", mode="sjs" },
            { name="Space", mode="space" },
            { name="snippets", mode="snippets" },
            { name="Soy_Template", mode="soy_template" },
            { name="SQL", mode="sql" },
            { name="Stylus", mode="stylus" },
            { name="Tcl", mode="tcl" },
            { name="Tex", mode="tex" },
            { name="Text", mode="text" },
            { name="Textile", mode="textile" },
            { name="Toml", mode="toml" },
            { name="Twig", mode="twig" },
            { name="Typescript", mode="typescript" },
            { name="VBScript", mode="vbscript" },
            { name="Velocity", mode="velocity" },
            { name="Verilog", mode="verilog" },
            { name="XML", mode="xml" },
            { name="XQuery", mode="xquery" },
            { name="YAML", mode="yaml" }
        ],
        "defaultTheme" = "tomorrow_night",
        "themes" = [
            { name="Ambiance", theme="ambiance" },
            { name="Chaos", theme="chaos" },
            { name="Chrome", theme="chrome" },
            { name="Clouds", theme="clouds" },
            { name="Clouds Midnight", theme="clouds_midnight" },
            { name="Cobalt", theme="cobalt" },
            { name="Crimson Editor", theme="crimson_editor" },
            { name="Dawn", theme="dawn" },
            { name="Dreamweaver", theme="dreamweaver" },
            { name="Eclipse", theme="eclipse" },
            { name="Github", theme="github" },
            { name="Idle Fingers", theme="idle_fingers" },
            { name="Kr Theme", theme="kr_theme" },
            { name="Merbivore", theme="merbivore" },
            { name="Merbivore Soft", theme="merbivore_soft" },
            { name="Monokai", theme="monokai" },
            { name="Mono Industrial", theme="mono_industrial" },
            { name="Pastel On Dark", theme="pastel_on_dark" },
            { name="Solarized Dark", theme="solarized_dark" },
            { name="Solarized Light", theme="solarized_light" },
            { name="Terminal", theme="terminal" },
            { name="Textmate", theme="textmate" },
            { name="Tomorrow", theme="tomorrow" },
            { name="Tomorrow Night", theme="tomorrow_night" },
            { name="Tomorrow Night Blue", theme="tomorrow_night_blue" },
            { name="Tomorrow Night Bright", theme="tomorrow_night_bright" },
            { name="Tomorrow Night Eighties", theme="tomorrow_night_eighties" },
            { name="Twilight", theme="twilight" },
            { name="Vibrant Ink", theme="vibrant_ink" },
            { name="Xcode", theme="xcode" }
        ]
    };

    /**
    * Constructor
    * @coldbox.inject coldbox
    */
    function init( required coldbox ){
        
        // register dependencies
        variables.coldbox   = arguments.coldbox;
        requestService      = arguments.coldbox.getRequestService();
        // get helper
        helper = coldbox.getWireBox().getInstance( name="CodeEditorHelper", initArguments={
            "editor" = this,
            "settings" = variables.settings
        });
        // Store admin entry point and base URL settings
        ADMIN_ENTRYPOINT = arguments.coldbox.getSetting( "modules" )[ "contentbox-admin" ].entryPoint;
        
        return this;
    }

    /**
    * Get the internal name of an editor
    */
    function getName(){
        return "ace";
    }
    
    /**
    * Get the display name of an editor
    */
    function getDisplayName(){
        return "Ace Editor";
    };

    /**
    * Startup the editor(s) on a page
    */
    function startup(){
        var js = "";
        var defaultMode = "";
        var defaultTheme = "";
        // build out comboboxes for modes and themes
        savecontent variable="modes" {
            var modeCombo = "<label class='control-label' for=Mode>Language:</label>";
            modeCombo &= "<select name='Mode'>";
            var modes = this.getCustomModes();
            for( var mode in modes ) {
                if( this.getSetting( "defaultMode" ) == mode.mode ) {
                    modeCombo &= "<option selected=true value='ace/mode/#mode.mode#'>#mode.name#</option>";
                    defaultMode = "ace/mode/#mode.mode#";
                }
                else {
                    modeCombo &= "<option value='ace/mode/#mode.mode#'>#mode.name#</option>";
                }  
            }
            writeoutput( modeCombo );
        }
        savecontent variable="themes" {
            var themeCombo = "<label class='control-label' for=Theme>Theme:</label>";
            themeCombo &= "<select name='Theme'>";
            var themes = this.getCustomThemes();
            for( var theme in themes ) {
                if( this.getSetting( "defaultTheme", "ace" ) == theme.theme ) {
                    themeCombo &= "<option selected=true value='ace/theme/#theme.theme#'>#theme.name#</option>";
                    defaultTheme = "ace/theme/#theme.theme#";
                }
                else {
                    themeCombo &= "<option value='ace/theme/#theme.theme#'>#theme.name#</option>";
                }                
            }
            writeoutput( themeCombo );
        }
        // We build the compiled JS with the knowledge of some inline variables we have context to
        // $excerpt - The excerpt jquery object
        // $content - The content jquery object
        // withExcerpt - an argument telling us if an excerpt is available to render or not
        savecontent variable="js"{
            writeOutput("
                // add div for Ace editor
                var val = $content.val();
                $content.before( '<div class=ace-wrapper><div id=ace-content-toolbar class=""ace-toolbar well well-small""></div><div id=content_ace  class=""ace-area full""></div></div>' );
                var toolbar = $( '##ace-content-toolbar' );
                // hide textarea
                $content.hide();
                // init new editor
                var editor = ace.edit( 'content_ace' );
                    editor.setValue( val );
                    editor.setTheme( '#defaultTheme#' );
                    editor.getSession().setMode( '#defaultMode#' );
                    // add change event so we can still use the textarea value
                    editor.getSession().on('change', function(e) {
                        $content.val( editor.getSession().getValue() );
                    });
                    editor.setShowPrintMargin( false );

                var modeCombo = $( ""#modes#"" );
                toolbar.append( modeCombo );
                modeCombo.on( 'change', function() {
                    editor.getSession().setMode( $( this ).val() );
                });

                var themeCombo = $( ""#themes#"" );
                toolbar.append( themeCombo );
                themeCombo.on( 'change', function() {
                    editor.setTheme( $( this ).val() );
                });
                // if we have an excerpt
                if( withExcerpt ){
                    var val = $excerpt.val();
                    $excerpt.before( '<div class=ace-wrapper><div id=ace-excerpt-toolbar class=""ace-toolbar well well-small""></div><div id=content_ace_excerpt class=""ace-area excerpt""></div></div>' );
                    var toolbar = $( '##ace-excerpt-toolbar' );
                    // hide textarea
                    $excerpt.hide();
                    // init new editor
                    var Eeditor = ace.edit( 'content_ace_excerpt' );
                        Eeditor.setValue( val );
                        Eeditor.setTheme( '#defaultTheme#' );
                        Eeditor.getSession().setMode( '#defaultMode#' );
                        // add change event so we can still use the textarea value
                        Eeditor.getSession().on('change', function(e) {
                            $excerpt.val( Eeditor.getSession().getValue() );
                        });

                    var modeCombo = $( ""#modes#"" ).clone();
                    toolbar.append( modeCombo );
                    modeCombo.on( 'change', function() {
                        Eeditor.getSession().setMode( $( this ).val() );
                    });

                    var themeCombo = $( ""#themes#"" ).clone();
                    toolbar.append( themeCombo );
                    themeCombo.on( 'change', function() {
                        Eeditor.setTheme( $( this ).val() );
                    });
                }
            ");
        }
        
        return js;
    }
    
    /**
    * This is fired once editor javascript loads, you can use this to return back functions, asset calls, etc. 
    * return the appropriate JavaScript
    */
    public function loadAssets(){
        var js = "";
        var event = requestService.getContext();
        var moduleRoot = cb.getModuleSettings( "CodeEditor" ).mapping;
        // only include if ace is active
        if( this.getSetting( "active" ) ) {
            // Loaad JS assets
            html.addAsset("#moduleRoot#/includes/ace/js/src/ace.js");
            html.addAsset("#moduleRoot#/includes/ace/css/ace.css");            
            // Required JS Functions
            savecontent variable="js"{
                writeOutput("
                function checkIsDirty(){
                    return false;
                }
                function getEditorContent(){
                    return $( '##content' ).val();
                }
                ");
            }
        }        
        return js;
    };

    /**
    * Shutdown the editor(s) on a page
    */
    function shutdown(){
        
    }

} 