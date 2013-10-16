component extends="coldbox.system.Interceptor" {
    property name="EditorService" inject="EditorService@cb";

    function preViewRender() {
        writedump( var=event.getValue( "defaultEditor", '', true ) );
        abort;
    }
}