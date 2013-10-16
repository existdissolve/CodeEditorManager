<script>
$( document ).ready( function() {
    $("#ThemeCheckAll").on( 'change', function() {
        if( !this.checked ) {
            $( '[name=AceThemes]' ).prop( 'checked', false );
        }
        else {
            $( '[name=AceThemes]' ).prop( 'checked', true );
        }        
    });
    $("#ModeCheckAll").on( 'change', function() {
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
});
</script>