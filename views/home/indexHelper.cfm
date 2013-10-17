<script>
$( document ).ready( function() {
    $("#AceThemeCheckAll").on( 'change', function() {
        if( !this.checked ) {
            $( '[name=AceThemes]' ).prop( 'checked', false );
        }
        else {
            $( '[name=AceThemes]' ).prop( 'checked', true );
        }        
    });
    $("#AceModeCheckAll").on( 'change', function() {
        if( !this.checked ) {
            $( '[name=AceModes]' ).prop( 'checked', false );
        }
        else {
            $( '[name=AceModes]' ).prop( 'checked', true );
        }        
    });
    $("#AceActive").on( 'change', function() {
        if( !this.checked ) {
            $(this).parent().addClass( 'btn-danger' );
            $(this).parent().removeClass( 'btn-success' );
        }
        else {
            $(this).parent().addClass( 'btn-success' );
            $(this).parent().removeClass( 'btn-danger' );
        }
    });

    $("#CodeMirrorThemeCheckAll").on( 'change', function() {
        if( !this.checked ) {
            $( '[name=CodeMirrorThemes]' ).prop( 'checked', false );
        }
        else {
            $( '[name=CodeMirrorThemes]' ).prop( 'checked', true );
        }        
    });
    $("#CodeMirrorModeCheckAll").on( 'change', function() {
        if( !this.checked ) {
            $( '[name=CodeMirrorModes]' ).prop( 'checked', false );
        }
        else {
            $( '[name=CodeMirrorModes]' ).prop( 'checked', true );
        }        
    });
    $("#CodeMirrorActive").on( 'change', function() {
        if( !this.checked ) {
            $(this).parent().addClass( 'btn-danger' );
            $(this).parent().removeClass( 'btn-success' );
        }
        else {
            $(this).parent().addClass( 'btn-success' );
            $(this).parent().removeClass( 'btn-danger' );
        }
    });
});
</script>