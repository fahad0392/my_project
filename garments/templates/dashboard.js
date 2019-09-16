$('#myDashboardModal').find('#addDashBoardmodal').click(function(){
    dashboardName = $( "input[name=dashboardName]" ).val();
    chartData = $('.wrapper').find('#chart-div').data('chart')
    $.ajax({
        type: 'GET',
        url: '/adddashboard',
        cache: true,
        data: {
                 'dashboardName': dashboardName,
                 'chartData': JSON.stringify(chartData)
            },
        success: function (result) {
                $('#myDashboardModal').modal('toggle');
                $( "input[name=dashboardName]" ).val('Enter DashBoard Name')
        }
      });

})
$('.wrapper').find('#dashboardSection').change(function(){
    ajaxCall()
});
function ajaxCall(){
    var dashboardName = $('.wrapper').find('#dashboardSection  option:selected').val();
    $.ajax({
        type: 'GET',
        url: '/getadddashboard/',
        data: {
                 'dashboardName': dashboardName,
            },
        cache: true,
        success: function (chartData) {
            drowDashboard(chartData)
        }
      });

}
function drowDashboard(chartData){
    for(var x = 0; chartData.chartData.length; x++){
          data = JSON.parse(chartData.chartData[x])
          $('.wrapper').find('#DashboardChartDiv').data('chart', data)
          $('.wrapper').find('#DashboardChartDiv').append('<div class="col-sm-6" id="container'+x+'"></div')
          Highcharts.chart('container'+x, data);

    }

}