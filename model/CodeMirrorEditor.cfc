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
        "defaultMode" = "htmlmixed",
        "modes" = [
            { name="APL", mime="text/apl", mode="apl", type="apl" },
            { name="Asterisk", mime="text/x-asterisk", mode="asterisk", type="asterisk" },
            { name="C", mime="text/x-csrc", mode="clike", type="clike" },
            { name="C++", mime="text/x-c++src", mode="cpp", type="clike" },
            { name="Cobol", mime="text/x-cobol", mode="cobol", type="cobol" },
            { name="Java", mime="text/x-java", mode="java", type="clike" },
            { name="C##", mime="text/x-csharp", mode="csharp", type="clike" },
            { name="Scala", mime="text/x-scala", mode="scala", type="clike" },
            { name="Clojure", mime="text/x-clojure", mode="clojure", type="clojure" },
            { name="CoffeeScript", mime="text/x-coffeescript", mode="coffeescript", type="coffeescript" },
            { name="Common Lisp", mime="text/x-common-lisp", mode="commonlisp", type="commonlisp" },
            { name="CSS", mime="text/css", mode="css", type="css" },
            { name="D", mime="text/x-d", mode="d", type="d" },
            { name="diff", mime="text/x-diff", mode="diff", type="diff" },
            { name="DTD", mime="application/xml-dtd", mode="dtd", type="dtd" },
            { name="ECL", mime="text/x-ecl", mode="ecl", type="ecl" },
            { name="Erlang", mime="text/x-erlang", mode="erlang", type="erlang" },
            { name="Fortran", mime="text/x-fortran", mode="fortran", type="fortran" },
            { name="Gas", mime="text/x-gas", mode="gas", type="gas" },
            { name="GitHub Flavored Markdown", mime="text/x-gfm", mode="gfm", type="gfm" },
            { name="GO", mime="text/x-go", mode="go", type="go" },
            { name="Groovy", mime="text/x-groovy", mode="groovy", type="groovy" },
            { name="HAML", mime="text/x-haml", mode="haml", type="haml" },
            { name="Haskell", mime="text/x-haskell", mode="haskell", type="haskell" },
            { name="Haxe", mime="text/x-haxe", mode="haxe", type="haxe" },
            { name="ASP.NET", mime="application/x-aspx", mode="aspnet", type="htmlembedded" },
            { name="Embedded Javascript", mime="application/x-ejs", mode="embeddedjavascript", type="htmlembedded" },
            { name="JavaServer Pages", mime="application/x-jsp", mode="jsp", type="htmlembedded" },
            { name="HTML", mime="text/html", mode="htmlmixed", type="htmlmixed" },
            { name="HTTP", mime="message/http", mode="http", type="http" },
            { name="Jade", mime="text/x-jade", mode="jade", type="jade" },
            { name="JavaScript", mime="text/javascript", mode="javascript", type="javascript" },
            { name="JSON", mime="application/json", mode="json", type="javascript" },
            { name="TypeScript", mime="application/typescript", mode="typescript", type="javascript" },
            { name="Jinja2", mime="jinja2", mode="jinja2", type="jinja2" },
            { name="LESS", mime="text/x-less", mode="less", type="less" },
            { name="LiveScript", mime="text/x-livescript", mode="livescript", type="livescript" },
            { name="Lua", mime="text/x-lua", mode="lua", type="lua" },
            { name="Markdown (GitHub-flavour)", mime="text/x-markdown", mode="markdown", type="markdown" },
            { name="mIRC", mime="text/mirc", mode="mirc", type="mirc" },
            { name="Nginx", mime="text/x-nginx-conf", mode="nginx", type="nginx" },
            { name="NTriples", mime="text/n-triples", mode="ntriples", type="ntriples" },
            { name="OCaml", mime="text/x-ocaml", mode="ocaml", type="ocaml" },
            { name="Octave", mime="text/x-octave", mode="octave", type="octae" },
            { name="Pascal", mime="text/x-pascal", mode="pascal", type="pascal" },
            { name="Perl", mime="text/x-perl", mode="perl", type="perl" },
            { name="PHP", mime="text/x-php", mode="php", type="php" },
            { name="PHP(HTML)", mime="application/x-httpd-php", mode="phphtml", type="php" },
            { name="Pig", mime="text/x-pig", mode="pig", type="pig" },
            { name="Plain Text", mime="text/plain", mode="null", type="null" },
            { name="Properties files", mime="text/x-properties", mode="properties", type="properties" },
            { name="Python", mime="text/x-python", mode="python", type="python" },
            { name="Cython", mime="text/x-cython", mode="cython", type="python" },
            { name="R", mime="text/x-rsrc", mode="r", type="r" },
            { name="reStructuredText", mime="text/x-rst", mode="rst", type="rst" },
            { name="Ruby", mime="text/x-ruby", mode="ruby", type="ruby" },
            { name="Rust", mime="text/x-rustsrc", mode="rust", type="rust" },
            { name="Sass", mime="text/x-sass", mode="sass", type="sass" },
            { name="Scheme", mime="text/x-scheme", mode="scheme", type="scheme" },
            { name="SCSS", mime="text/x-scss", mode="scss", type="css"},
            { name="Shell", mime="text/x-sh", mode="shell", type="shell" },
            { name="Sieve", mime="application/sieve", mode="sieve", type="sieve" },
            { name="Smalltalk", mime="text/x-stsrc", mode="smalltalk", type="smalltalk" },
            { name="Smarty", mime="text/x-smarty", mode="smarty", type="smarty" },
            { name="SmartyMixed", mime="text/x-smarty", mode="smartymixed", type="smartymixed" },
            { name="SPARQL", mime="application/x-sparql-query", mode="sparql", type="sparql" },
            { name="SQL", mime="text/x-sql", mode="sql", type="sql" },
            { name="MariaDB", mime="text/x-mariadb", mode="mariadb", type="sql" },
            { name="sTeX", mime="text/x-stex", mode="stex", type="stex" },
            { name="LaTeX", mime="text/x-latex", mode="latex", type="stex" },
            { name="Tcl", mime="text/x-tcl", mode="tcl", type="tcl" },
            { name="TiddlyWiki ", mime="text/x-tiddlywiki", mode="tiddlywiki", type="tiddlywiki" },
            { name="Tiki wiki", mime="text/tiki", mode="tiki", type="tiki" },
            { name="TOML", mime="text/x-toml", mode="toml", type="toml" },
            { name="Turtle", mime="text/turtle", mode="turtle", type="turtle" },
            { name="VB.NET", mime="text/x-vb", mode="vb", type="vb" },
            { name="VBScript", mime="text/vbscript", mode="vbscript", type="vbscript" },
            { name="Velocity", mime="text/velocity", mode="velocity", type="vbscript" },
            { name="Verilog", mime="text/x-verilog", mode="verilog", type="verilog" },
            { name="XML", mime="application/xml", mode="xml", type="xml" },
            { name="XQuery", mime="application/xquery", mode="xquery", type="xquery" },
            { name="YAML", mime="text/x-yaml", mode="yaml", type="yaml" },
            { name="Z80", mime="text/x-z80", mode="z80", type="z80" }
        ],
        "defaultTheme" = "monokai",
        "themes" = [
            { name="3024 Day", theme="3024-day" },
            { name="3024 Night", theme="3024-night" },
            { name="Ambiance", theme="ambiance" },
            { name="Base16 Dark", theme="base16-dark" },
            { name="Base16 Light", theme="base16-light" },
            { name="Blackboard", theme="blackboard" },
            { name="Cobalt", theme="cobalt" },
            { name="Eclipse", theme="eclipse" },
            { name="Elegant", theme="elegant" },
            { name="Erlang Dark", theme="erlang-dark" },
            { name="Lesser Dark", theme="lesser-dark" },
            { name="MBO", theme="mbo" },
            { name="Midnight", theme="midnight" },
            { name="Monokai", theme="monokai" },
            { name="Neat", theme="neat" },
            { name="Night", theme="night" },
            { name="Paraiso Dark", theme="paraiso-dark" },
            { name="Paraiso Light", theme="paraiso-light" },
            { name="Rubyblue", theme="rubyblue" },
            { name="Solarized Dark", theme="solarized dark" },
            { name="Solarized Light", theme="solarized light" },
            { name="The Matrix", theme="the-matrix" },
            { name="Tomorrow Night Eighties", theme="tomorrow-night-eighties" },
            { name="Twilight", theme="twilight" },
            { name="Vibrant Ink", theme="vibrant-ink" },
            { name="XQ Dark", theme="xq-dark" },
            { name="XQ Light", theme="xq-light" }
        ]
    };

    /**
    * Constructor
    * @coldbox.inject coldbox
    */
    function init(required coldbox){
        
        // register dependencies
        variables.coldbox   = arguments.coldbox;
        requestService      = arguments.coldbox.getRequestService();
        // mixin helper
        helper = coldbox.getWireBox().getInstance( name="CodeEditorMixin", initArguments={
            "editor" = this
        });
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
        var moduleRoot = cb.getModuleSettings( "CodeEditorManager" ).mapping;
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
            var themes = this.getCustomThemes();
            for( var theme in themes ) {
                if( this.getSetting( "defaultTheme" ) == theme.theme ) {
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
                editor.on( 'change', function( CodeMirror, e ) {
                    CodeMirror.save();
                })
                // if we have an excerpt
                if( withExcerpt ){
                    $excerpt.before( '<div class=codemirror-wrapper><div id=codemirror-excerpt-toolbar class=""codemirror-toolbar well well-small""></div>' );
                    var toolbar = $( '##codemirror-excerpt-toolbar' );
                    var editor2 = CodeMirror.fromTextArea($excerpt[ 0 ], {
                        mode: '#defaultMode#',
                        lineNumbers: true,
                        styleActiveLine: true,
                        matchBrackets: true
                    });
                    editor2.setOption( 'theme', '#defaultTheme#' );

                    var modeCombo = $( ""#modes#"" ).clone();
                    toolbar.append( modeCombo );
                    modeCombo.on( 'change', function() {
                        editor2.setOption( 'mode', $( this ).val() );
                    });

                    var themeCombo = $( ""#themes#"" ).clone();
                    toolbar.append( themeCombo );
                    themeCombo.on( 'change', function() {
                        editor2.setOption( 'theme', $( this ).val() );
                    });

                    editor2.on( 'change', function( CodeMirror, e ) {
                        CodeMirror.save();
                    })
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
        var moduleRoot = cb.getModuleSettings( "CodeEditorManager" ).mapping;
        // only include if codemirror is active
        if( this.getSetting( "active" ) ) {
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