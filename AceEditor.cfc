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
            var modes = CodeEditorService.getCustomPopulatedModes();
            for( var mode in modes ) {
                if( CodeEditorService.getCodeEditorSetting( "defaultMode", "ace" ) == mode.mode ) {
                    modeCombo &= "<option selected=true value='ace/mode/#mode.mode#'>#mode.name#</option>";
                    defaultMode = mode.mode;
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
            var themes = CodeEditorService.getCustomPopulatedThemes();
            for( var theme in themes ) {
                if( CodeEditorService.getCodeEditorSetting( "defaultTheme", "ace" ) == replaceNoCase( theme.path, "ace/theme/", "" ) ) {
                    themeCombo &= "<option selected=true value='#theme.path#'>#theme.name#</option>";
                    defaultTheme = theme.path;
                }
                else {
                    themeCombo &= "<option value='#theme.path#'>#theme.name#</option>";
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
    function loadAssets(){
        var js = "";
        var event = requestService.getContext();
        var moduleRoot = cb.getModuleSettings( "CodeEditor" ).mapping;
        // only include if ace is active
        if( CodeEditorService.getCodeEditorSetting( "active", "ace" ) ) {
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