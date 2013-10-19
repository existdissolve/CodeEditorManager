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
    property name="CodeEditorService" inject="CodeEditorService@CodeEditor";

    /**
    * Constructor
    * @coldbox.inject coldbox
    */
    function init(required coldbox){
        
        // register dependencies
        variables.coldbox   = arguments.coldbox;
        requestService      = arguments.coldbox.getRequestService();
        // Store admin entry point and base URL settings
        ADMIN_ENTRYPOINT = arguments.coldbox.getSetting( "modules" )[ "contentbox-admin" ].entryPoint;
        
        return this;
    }

    /**
    * Get the internal name of an editor
    */
    function getName(){
        return "codemirror";
    }
    
    /**
    * Get the display name of an editor
    */
    function getDisplayName(){
        return "Code Mirror";
    };
    
    /**
    * Startup the editor(s) on a page
    */
    function startup(){
        var moduleRoot = cb.getModuleSettings( "CodeEditor" ).mapping;
        var js = "";
        var defaultMode = "";
        var defaultTheme = "";
        // build out comboboxes for modes and themes
        savecontent variable="modes" {
            var modeCombo = "<label class='control-label' for=Mode>Language:</label>";
            modeCombo &= "<select name='Mode'>";
            var modes = CodeEditorService.getCustomModes( "codemirror" );
            for( var mode in modes ) {
                if( CodeEditorService.getCodeEditorSetting( "defaultMode", "codemirror" ) == mode.mode ) {
                    modeCombo &= "<option selected=true value='#mode.mime#'>#mode.name#</option>";
                    defaultMode = mode.mime;
                }
                else {
                    modeCombo &= "<option value='#mode.mime#'>#mode.name#</option>";
                } 
                if( mode.type != 'null' ) {
                    html.addAsset("#moduleRoot#/includes/codemirror/js/mode/#mode.type#/#mode.type#.js");
                }                
            }
            writeoutput( modeCombo );
        }
        savecontent variable="themes" {
            var themeCombo = "<label class='control-label' for=Theme>Theme:</label>";
            themeCombo &= "<select name='Theme'>";
            var themes = CodeEditorService.getCustomThemes( "codemirror" );
            for( var theme in themes ) {
                if( CodeEditorService.getCodeEditorSetting( "defaultTheme", "codemirror" ) == theme.theme ) {
                    themeCombo &= "<option selected=true value='#theme.theme#'>#theme.name#</option>";
                    defaultTheme = theme.theme;
                }
                else {
                    themeCombo &= "<option value='#theme.theme#'>#theme.name#</option>";
                }
                html.addAsset("#moduleRoot#/includes/codemirror/js/theme/#theme.theme#.css");                
            }
            writeoutput( themeCombo );
        }
        // We build the compiled JS with the knowledge of some inline variables we have context to
        // $excerpt - The excerpt jquery object
        // $content - The content jquery object
        // withExcerpt - an argument telling us if an excerpt is available to render or not 
        savecontent variable="js"{
            writeOutput("
                $content.before( '<div class=codemirror-wrapper><div id=codemirror-content-toolbar class=""codemirror-toolbar well well-small""></div>' );
                var toolbar = $( '##codemirror-content-toolbar' );
                var editor = CodeMirror.fromTextArea($content[ 0 ], {
                    mode: '#defaultMode#',
                    lineNumbers: true,
                    styleActiveLine: true,
                    matchBrackets: true
                });
                editor.setOption( 'theme', '#defaultTheme#' );
                var modeCombo = $( ""#modes#"" );
                toolbar.append( modeCombo );
                modeCombo.on( 'change', function() {
                    editor.setOption( 'mode', $( this ).val() );
                });

                var themeCombo = $( ""#themes#"" );
                toolbar.append( themeCombo );
                themeCombo.on( 'change', function() {
                    editor.setOption( 'theme', $( this ).val() );
                });
                // if we have an excerpt
                if( withExcerpt ){
                    $excerpt.before( '<div class=codemirror-wrapper><div id=codemirror-excerpt-toolbar class=""codemirror-toolbar well well-small""></div>' );
                    var toolbar = $( '##codemirror-excerpt-toolbar' );
                    var editor = CodeMirror.fromTextArea($excerpt[ 0 ], {
                        mode: '#defaultMode#',
                        lineNumbers: true,
                        styleActiveLine: true,
                        matchBrackets: true
                    });
                    editor.setOption( 'theme', '#defaultTheme#' );

                    var modeCombo = $( ""#modes#"" ).clone();
                    toolbar.append( modeCombo );
                    modeCombo.on( 'change', function() {
                        editor.setOption( 'mode', $( this ).val() );
                    });

                    var themeCombo = $( ""#themes#"" ).clone();
                    toolbar.append( themeCombo );
                    themeCombo.on( 'change', function() {
                        editor.setOption( 'theme', $( this ).val() );
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
    function loadAssets(){
        var js = "";
        var event = requestService.getContext();
        var moduleRoot = cb.getModuleSettings( "CodeEditor" ).mapping;
        // only include if codemirror is active
        if( CodeEditorService.getCodeEditorSetting( "active", "codemirror" ) ) {
            // Loaad JS assets
            html.addAsset("#moduleRoot#/includes/codemirror/js/lib/codemirror.css"); 
            html.addAsset("#moduleRoot#/includes/codemirror/js/lib/codemirror.js");
            html.addAsset("#moduleRoot#/includes/codemirror/css/codemirror.css");    
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