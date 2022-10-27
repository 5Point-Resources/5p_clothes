$(function() {
    window.addEventListener( 'message', function( event ) {
        var item = event.data;
        
        switch (item.action) {
            case 'show':
                $('.container').fadeIn(500);
            break;

            case 'hide':
                $('.container').fadeOut(500);
                
                const myTooltipEl = document.querySelectorAll('.myTooltip');
        
                myTooltipEl.forEach(myTool => {
                    const tooltip = bootstrap.Tooltip.getOrCreateInstance(myTool)
                    tooltip.hide()
                })
            break;
        };
    });

    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post(`https://${GetParentResourceName()}/close`, JSON.stringify({}));
        };
    }

    $('.item').on('click', function() {
        if ($(this).hasClass('active')) {
            $(this).removeClass('active');
        } else {
            $(this).addClass('active');
        };

        $.post(`https://${GetParentResourceName()}/select`, JSON.stringify({
            item: this.id
        }));
    });

    $('.option').on('click', function() {
        $.post(`https://${GetParentResourceName()}/reset`);

        $('.item').removeClass('active');
    })

    $('.reset').on('click', function() {
        $.post(`https://${GetParentResourceName()}/reset`);

        $('.item').removeClass('active');
    })

    const myTooltipEl = document.querySelectorAll('.myTooltip');
        
    myTooltipEl.forEach(myTool => {
        const tooltip = bootstrap.Tooltip.getOrCreateInstance(myTool)

        myTool.addEventListener('hidden.bs.tooltip', () => {
  
        })

        tooltip.hide()
    })
});