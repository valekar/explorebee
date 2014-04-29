$('#masonry-container').masonry({

    // set columnWidth a fraction of the container width
    columnWidth: function( containerWidth ) {
        return containerWidth /6;
    },

    isAnimated: false,
    animationOptions: {
        duration: 750,
        easing: 'linear',
        queue: false
    }

});


$('#interest-container').masonry({

    // set columnWidth a fraction of the container width
    columnWidth: function( containerWidth ) {
        return containerWidth/6 ;
    }



});