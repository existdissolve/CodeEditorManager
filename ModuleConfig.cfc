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
                    { name="Ambiance", path="ace/theme/ambiance" },
                    { name="Chaos", path="ace/theme/chaos" },
                    { name="Chrome", path="ace/theme/chrome" },
                    { name="Clouds", path="ace/theme/clouds" },
                    { name="Clouds Midnight", path="ace/theme/clouds_midnight" },
                    { name="Cobalt", path="ace/theme/cobalt" },
                    { name="Crimson Editor", path="ace/theme/crimson_editor" },
                    { name="Dawn", path="ace/theme/dawn" },
                    { name="Dreamweaver", path="ace/theme/dreamweaver" },
                    { name="Eclipse", path="ace/theme/eclipse" },
                    { name="Github", path="ace/theme/github" },
                    { name="Idle Fingers", path="ace/theme/idle_fingers" },
                    { name="Kr Theme", path="ace/theme/kr_theme" },
                    { name="Merbivore", path="ace/theme/merbivore" },
                    { name="Merbivore Soft", path="ace/theme/merbivore_soft" },
                    { name="Monokai", path="ace/theme/monokai" },
                    { name="Mono Industrial", path="ace/theme/mono_industrial" },
                    { name="Pastel On Dark", path="ace/theme/pastel_on_dark" },
                    { name="Solarized Dark", path="ace/theme/solarized_dark" },
                    { name="Solarized Light", path="ace/theme/solarized_light" },
                    { name="Terminal", path="ace/theme/terminal" },
                    { name="Textmate", path="ace/theme/textmate" },
                    { name="Tomorrow", path="ace/theme/tomorrow" },
                    { name="Tomorrow Night", path="ace/theme/tomorrow_night" },
                    { name="Tomorrow Night Blue", path="ace/theme/tomorrow_night_blue" },
                    { name="Tomorrow Night Bright", path="ace/theme/tomorrow_night_bright" },
                    { name="Tomorrow Night Eighties", path="ace/theme/tomorrow_night_eighties" },
                    { name="Twilight", path="ace/theme/twilight" },
                    { name="Vibrant Ink", path="ace/theme/vibrant_ink" },
                    { name="Xcode", path="ace/theme/xcode" }
                ]
            },
            "codemirror" = {
                "active" = true,
                "defaultMode" = "",
                "modes" = [
                    { name="APL", mime="text/apl", mode="apl" },
                    { name="Asterisk", mime="text/x-asterisk", mode="asterisk" },
                    { name="C", mime="text/x-csrc", mode="clike" },
                    { name="C++", mime="text/x-c++src", mode="clike" },
                    { name="Cobol", mime="text/x-cobol", mode="cobol" },
                    { name="Java", mime="text/x-java", mode="clike" },
                    { name="C#", mime="text/x-csharp", mode="clike" },
                    { name="Scala", mime="text/x-scala", mode="clike" },
                    { name="Clojure", mime="text/x-clojure", mode="clojure" },
                    { name="CoffeeScript", mime="text/x-coffeescript", mode="coffeescript" },
                    { name="Common Lisp", mime="text/x-common-lisp", mode="commonlisp" },
                    { name="CSS", mime="text/css", mode="css" },
                    { name="D", mime="text/x-d", mode="d" },
                    { name="diff", mime="text/x-diff", mode="diff" },
                    { name="DTD", mime="application/xml-dtd", mode="dtd" },
                    { name="ECL", mime="text/x-ecl", mode="ecl" },
                    { name="Erlang", mime="text/x-erlang", mode="erlang" },
                    { name="Fortran", mime="text/x-fortran", mode="fortran" },
                    { name="Gas", mime="text/x-gas", mode="gas" },
                    { name="GitHub Flavored Markdown", mime="text/x-gfm", mode="gfm" },
                    { name="GO", mime="text/x-go", mode="go" },
                    { name="Groovy", mime="text/x-groovy", mode="groovy" },
                    { name="HAML", mime="text/x-haml", mode="haml" },
                    { name="Haskell", mime="text/x-haskell", mode="haskell" },
                    { name="Haxe", mime="text/x-haxe", mode="haxe" },
                    { name="ASP.NET", mime="application/x-aspx", mode="htmlembedded" },
                    { name="Embedded Javascript", mime="application/x-ejs", mode="htmlembedded" },
                    { name="JavaServer Pages", mime="application/x-jsp", mode="htmlembedded" },
                    { name="HTML", mime="text/html", mode="htmlmixed" },
                    { name="HTTP", mime="message/http", mode="http" },
                    { name="Jade", mime="text/x-jade", mode="jade" },
                    { name="JavaScript", mime="text/javascript", mode="javascript" },
                    { name="JSON", mime="application/x-json", mode="javascript" },
                    { name="JSON", mime="application/json", mode="javascript" },
                    { name="TypeScript", mime="application/typescript", mode="javascript" },
                    { name="Jinja2", mime="jinja2", mode="jinja2" },
                    { name="LESS", mime="text/x-less", mode="less" },
                    { name="LiveScript", mime="text/x-livescript", mode="livescript" },
                    { name="Lua", mime="text/x-lua", mode="lua" },
                    { name="Markdown (GitHub-flavour)", mime="text/x-markdown", mode="markdown" },
                    { name="mIRC", mime="text/mirc", mode="mirc" },
                    { name="Nginx", mime="text/x-nginx-conf", mode="nginx" },
                    { name="NTriples", mime="text/n-triples", mode="ntriples" },
                    { name="OCaml", mime="text/x-ocaml", mode="ocaml" },
                    { name="Octave", mime="text/x-octave", mode="octave" },
                    { name="Pascal", mime="text/x-pascal", mode="pascal" },
                    { name="Perl", mime="text/x-perl", mode="perl" },
                    { name="PHP", mime="text/x-php", mode="php" },
                    { name="PHP(HTML)", mime="application/x-httpd-php", mode="php" },
                    { name="Pig", mime="text/x-pig", mode="pig" },
                    { name="Plain Text", mime="text/plain", mode="null" },
                    { name="Properties files", mime="text/x-properties", mode="properties" },
                    { name="Python", mime="text/x-python", mode="python" },
                    { name="Cython", mime="text/x-cython", mode="python" },
                    { name="R", mime="text/x-rsrc", mode="r" },
                    { name="reStructuredText", mime="text/x-rst", mode="rst" },
                    { name="Ruby", mime="text/x-ruby", mode="ruby" },
                    { name="Rust", mime="text/x-rustsrc", mode="rust" },
                    { name="Sass", mime="text/x-sass", mode="sass" },
                    { name="Scheme", mime="text/x-scheme", mode="scheme" },
                    { name="SCSS", mime="text/x-scss", mode="css" },
                    { name="Shell", mime="text/x-sh", mode="shell" },
                    { name="Sieve", mime="application/sieve", mode="sieve" },
                    { name="Smalltalk", mime="text/x-stsrc", mode="smalltalk" },
                    { name="Smarty", mime="text/x-smarty", mode="smarty" },
                    { name="SmartyMixed", mime="text/x-smarty", mode="smartymixed" },
                    { name="SPARQL", mime="application/x-sparql-query", mode="sparql" },
                    { name="SQL", mime="text/x-sql", mode="sql" },
                    { name="MariaDB", mime="text/x-mariadb", mode="sql" },
                    { name="sTeX", mime="text/x-stex", mode="stex" },
                    { name="LaTeX", mime="text/x-latex", mode="stex" },
                    { name="Tcl", mime="text/x-tcl", mode="tcl" },
                    { name="TiddlyWiki ", mime="text/x-tiddlywiki", mode="tiddlywiki" },
                    { name="Tiki wiki", mime="text/tiki", mode="tiki" },
                    { name="TOML", mime="text/x-toml", mode="toml" },
                    { name="Turtle", mime="text/turtle", mode="turtle" },
                    { name="VB.NET", mime="text/x-vb", mode="vb" },
                    { name="VBScript", mime="text/vbscript", mode="vbscript" },
                    { name="Velocity", mime="text/velocity", mode="velocity" },
                    { name="Verilog", mime="text/x-verilog", mode="verilog" },
                    { name="XML", mime="application/xml", mode="xml" },
                    { name="HTML", mime="text/html", mode="xml" },
                    { name="XQuery", mime="application/xquery", mode="xquery" },
                    { name="YAML", mime="text/x-yaml", mode="yaml" },
                    { name="Z80", mime="text/x-z80", mode="z80" }
                ],
                "defaultTheme" = "",
                "themes" = []
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