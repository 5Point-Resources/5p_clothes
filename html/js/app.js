$( function() {
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        
        switch (item.action) {
            case 'show':
                $('.container').fadeIn(500);
            break;

            case 'hide':
                $('.container').fadeOut(500);
            break;
        };
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://5p_clothes/close', JSON.stringify({}));
        };
    }

    $('.item').on('click', function() {
        $.post('https://5p_clothes/select', JSON.stringify({
            item: this.id
        }));
    });
});