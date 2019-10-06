var showNotification = function(type, message) {
//    disableLoading();
    noty({
        text: '<div><strong>' + type.toUpperCase() +
            ':</strong><div  class="pull-right">X</div> <br/>' + message +
            '!</div>',
        layout: 'topRight',
        type: type,
        theme: 'relax',
        timeout: 10000,
        closeWith: ['click'],
        animation: {
            open: 'animated bounceInRight',
            close: 'animated bounceOutRight'
        }
    });
};