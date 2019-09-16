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
       var chartType = ""
       $('#chartConfig').css("visibility", "visible");
       $('#chartConfigSelect').css("visibility", "visible");
       drawChart(product, xfield, yfield, chartType);
    });

$('#chartConfig').find('#chartConfigSelect').change(function () {
       var product = $("#selectProduct option:selected" ).val();
       var xfield =  $("#selectX option:selected" ).val();
       var yfield =  $("#selectY option:selected" ).val();
       var chartType = $("#chartConfigSelect option:selected").val()
       drawChart(product, xfield, yfield, chartType);
    });

function drawChart(product, xfield, yfield, chartType){

    $.ajax({
        type: 'GET',
        url: '/charts/',
        cache: true,
        data: {
                 'product': product,
                 'xfield': xfield,
                 'yfield': yfield,
                 'chartType': chartType
            },
        success: function (result) {
            if(chartType == "")
                $('#myModal').modal('toggle');
                $('#chart-div').data('chart', result)
            Highcharts.chart('container', result);

        }
      });

 }