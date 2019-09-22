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
                $.notify("Chart added to dashboard "+dashboardName+".", "success");

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
    var containerDiv = $('.wrapper').find('#DashboardChartDiv').find('.highcharts-container')
    if(containerDiv.length > 0){
        for(var z = 0; z < containerDiv.length; z++){
            containerDiv[z].remove()
        }
    }
    for(var x = 0; x < chartData.chartData.length; x++){
          data = JSON.parse(chartData.chartData[x])
          $('.wrapper').find('#DashboardChartDiv').data('chart', data)
          $('.wrapper').find('#DashboardChartDiv').append('<div class="col-sm-6" id="container'+x+'"></div')
          Highcharts.chart('container'+x, data);

    }

}