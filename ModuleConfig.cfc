/**
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
*/
component hint="Module Configuration for Ace Code Editor"{
/**
Module Directives as public properties
this.title              = "Title of the module";
this.author             = "Author of the module";
this.webURL             = "Web URL for docs purposes";
this.description        = "Module description";
this.version            = "Module Version"

Optional Properties
this.viewParentLookup   = (true) [boolean] (Optional) // If true, checks for views in the parent first, then it the module.If false, then modules first, then parent.
this.layoutParentLookup = (true) [boolean] (Optional) // If true, checks for layouts in the parent first, then it the module.If false, then modules first, then parent.
this.entryPoint         = "" (Optional) // If set, this is the default event (ex:forgebox:manager.index) or default route (/forgebox) the framework
                                           will use to create an entry link to the module. Similar to a default event.

structures to create for configuration
- parentSettings : struct (will append and override parent)
- settings : struct
- datasources : struct (will append and override parent)
- webservices : struct (will append and override parent)
- interceptorSettings : struct of the following keys ATM
    - customInterceptionPoints : string list of custom interception points
- interceptors : array
- layoutSettings : struct (will allow to define a defaultLayout for the module)
- routes : array Allowed keys are same as the addRoute() method of the SES interceptor.
- wirebox : The wirebox DSL to load and use

Available objects in variable scope
- controller
- appMapping (application mapping)
- moduleMapping (include,cf path)
- modulePath (absolute path)
- log (A pre-configured logBox logger object for this object)
- binder (The wirebox configuration binder)

Required Methods
- configure() : The method ColdBox calls to configure the module.

Optional Methods
- onLoad()      : If found, it is fired once the module is fully loaded
- onUnload()    : If found, it is fired once the module is unloaded

*/

    // Module Properties
    this.title              = "Ace";
    this.author             = "Joel Watson";
    this.webURL             = "http://existdissolve.com";
    this.description        = "A simple module to enable use of the Ace code editor";
    this.version            = "1.0";
    // If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
    this.viewParentLookup   = true;
    // If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
    this.layoutParentLookup = true;
    // Module Entry Point
    this.entryPoint         = "CodeEditor";

    function configure(){

        // parent settings
        parentSettings = {

        };

        // module settings - stored in modules.name.settings
        settings = {
            "ace" = {
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
            },
            "codemirror" = {
                "active" = true,
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
                    { name="CoffeeScript", mime="text/x-coffeescript", mode="coffeescript", type="cofeescript" },
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
                    { name="Octave", mime="text/x-octave", mode="octave", type="octabe" },
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
            }
        };

        // Layout Settings
        layoutSettings = {
            defaultLayout = ""
        };

        // datasources
        datasources = {

        };

        // web services
        webservices = {

        };

        // SES Routes
        routes = [
            // Module Entry Point
            {pattern="/", handler="home",action="index"},
            // Convention Route
            {pattern="/:handler/:action?"}
        ];

        // Custom Declared Points
        interceptorSettings = {
            customInterceptionPoints = ""
        };

        // Custom Declared Interceptors
        interceptors = [];

        // Binder Mappings
        binder.map( "AceEditor@CodeEditor" ).to( "#moduleMapping#.AceEditor" );
        binder.map( "CodeMirrorEditor@CodeEditor" ).to( "#moduleMapping#.CodeMirrorEditor" );
        binder.map( "CodeEditorService@CodeEditor" ).to( "#moduleMapping#.CodeEditorService" );
    }

    /**
    * Fired when the module is registered and activated.
    */
    function onLoad(){
        var EditorService = controller.getWireBox().getInstance( "EditorService@cb" );
        var CodeEditorService = controller.getWireBox().getInstance( "CodeEditorService@CodeEditor" );
        if( CodeEditorService.getCodeEditorSetting( "active", "ace" ) ) {
            EditorService.registerEditor( controller.getWireBox().getInstance("AceEditor@CodeEditor") );
        }
        if( CodeEditorService.getCodeEditorSetting( "active", "codemirror" ) ) {
            EditorService.registerEditor( controller.getWireBox().getInstance("CodeMirrorEditor@CodeEditor") );
        }
        // Let's add ourselves to the main menu in the Modules section
        var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
        // Add Menu Contribution
        menuService.addSubMenu(topMenu=menuService.MODULES,name="CodeEditor",label="Code Editor",href="#menuService.buildModuleLink('CodeEditor','home')#");
    }

    /**
    * Fired when the module is activated by ContentBox
    */
    function onActivate(){

    }

    /**
    * Fired when the module is unregistered and unloaded
    */
    function onUnload(){
        // Let's remove ourselves to the main menu in the Modules section
        var menuService = controller.getWireBox().getInstance("AdminMenuService@cb");
        // Remove Menu Contribution
        menuService.removeSubMenu(topMenu=menuService.MODULES,name="CodeEditor");
    }

    /**
    * Fired when the module is deactivated by ContentBox
    */
    function onDeactivate(){

    }

}