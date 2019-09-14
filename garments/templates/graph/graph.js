//LOGOUT AJAX
$('.modal-content').find('#logout').click(function () {
      $.ajax({
        type: 'GET',
        url: '/logout/',
        cache: true,
<!--        data: {-->
<!--          'username': username-->
<!--        },-->
<!--        dataType: 'json',-->
        success: function () {

            window.location.replace("http://127.0.0.1:8000/logout/");
        }
      });

    });


//DRAW CHART AJAX
$('.modal-content').find('#chartSubmit').click(function () {
       var product = $("#selectProduct option:selected" ).val();
       var xfield =  $("#selectX option:selected" ).val();
       var yfield =  $("#selectY option:selected" ).val();
       debugger;
      $.ajax({
        type: 'GET',
        url: '/charts/',
        cache: true,
        data: {
                 'product': product,
                 'xfield': xfield,
                 'yfield': yfield
            },
        success: function (result) {
            $('#myModal').modal('toggle');
            Highcharts.chart('container', result);

        }
      });

    });