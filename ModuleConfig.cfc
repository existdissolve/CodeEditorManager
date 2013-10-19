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
component hint="Module Configuration for Custom Code Editor" {
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
    this.title              = "Custom Code Editor Manager";
    this.author             = "Joel Watson";
    this.webURL             = "http://existdissolve.com";
    this.description        = "A simple module to enable use of multiple custom code editors for pages and entries";
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
            configuredEditors = {
                "ace" = { "instancePath" = "AceEditor" },
                "codemirror" = { "instancePath" = "CodeMirrorEditor" }
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
    }

    /**
     * Fired when the module is registered and activated.
     */
    function onLoad(){
        var EditorService = controller.getWireBox().getInstance( "EditorService@cb" );
        for( name in settings.configuredEditors ) {
            var path = settings.configuredEditors[ name ].instancePath;
            var editor =  controller.getWireBox().getInstance( path );
            if( editor.getSetting( "active" ) ) {
                EditorService.registerEditor( editor );
            }
        }
        // Let's add ourselves to the main menu in the Modules section
        var menuService = controller.getWireBox().getInstance( "AdminMenuService@cb" );
        // Add Menu Contribution
        menuService.addSubMenu( 
            topMenu=menuService.MODULES, 
            name="CodeEditor", 
            label="Custom Code Editor Manager", 
            href="#menuService.buildModuleLink('CodeEditor','home')#" 
        );
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
        var EditorService = controller.getWireBox().getInstance( "EditorService@cb" );
        // unregister all custom editors
        for( name in settings.configuredEditors ) {
            EditorService.unregisterEditor( name );
        }
        // Let's remove ourselves to the main menu in the Modules section
        var menuService = controller.getWireBox().getInstance( "AdminMenuService@cb" );
        // Remove Menu Contribution
        menuService.removeSubMenu( topMenu=menuService.MODULES, name="CodeEditor" );
    }
    /**
     * Fired when the module is deactivated by ContentBox
     */
    function onDeactivate(){
        var SettingService = controller.getWireBox().getInstance( "SettingService@cb" );
        for( name in settings.configuredEditors ) {
            var args = {name="codeeditor-#name#"};
            var setting = SettingService.findWhere( criteria=args );
            if( !isNull( setting ) ){
                SettingService.delete( setting );
            }
        }
    }

}