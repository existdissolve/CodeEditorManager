<cfoutput>
    <style>
        input[type="checkbox"] {margin: -2px 0 0;margin-top: 1px \9;}
    </style>
    #html.startForm(name="settingsForm", action=prc.xehSaveSettings, novalidate="novalidate")#
    <div class="main" id="main_column">
        <div class="box" style="min-height:600px;">
            <!--- Body Header --->
            <div class="header">
                <i class="icon-wrench icon-large"></i>
                Code Editor Manager Settings
            </div>
            <!--- Body --->
            <div class="body">
                <!--- messageBox --->
                #getPlugin("MessageBox").renderit()#
                <div class="tabbable tabs-left">           
                    <!--- Navigation Bar --->
                    <ul class="nav nav-tabs" id="widget-sidebar">
                        <li class="active"><a href="##ace" class="current" data-toggle="tab">Ace Code Editor</a></li>
                        <li><a href="##codemirror" data-toggle="tab">Code Mirror</a></li>
                    </ul>
                    <!--- ContentBars --->
                    <div class="tab-content">
                        #renderView( "home/ace" )#
                        #renderView( "home/codemirror" )#
                    </div>
                    <!--- Button Bar --->
                    <div class="form-actions">
                        #html.submitButton(value="Save Settings", class="btn btn-danger pull-right")#
                    </div>
                </div>
            </div>
        </div>
    </div>
    #html.endForm()#
</cfoutput>