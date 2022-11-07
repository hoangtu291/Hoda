
/* global dataChart */

(function ($) {
    'use strict';

    $(function () {
        if ($("#datepicker-popup").length) {
            $('#datepicker-popup').datepicker({
                enableOnReadonly: true,
                todayHighlight: true,
            });
            $("#datepicker-popup").datepicker("setDate", "0");
        }
        if ($("#doughnutChart").length) {
            var doughnutChartCanvas = $("#doughnutChart").get(0).getContext("2d");
            var doughnutPieData = {
                datasets: [{
                        data: dataChart,
                        backgroundColor: [
                            "#1F3BB3",
                            "#FDD0C7",
                            "#52CDFF",
                            "#81DADA",
                            "#24de49",
                            "#ff82f7",
                            "#d4ff52",
                            "#285d5d",
                            "#4fb3a5",
                            "#e8e427",
                            "#ffd30d",
                            "#1d9000",
                            "#5f647b",
                            "#f04bfc",
                            "#931d36",
                            "#196623",
                            "#781fb3",
                            "#729b25"
                        ],
                        borderColor: [
                            "#1F3BB3",
                            "#FDD0C7",
                            "#52CDFF",
                            "#81DADA",
                            "#24de49",
                            "#ff82f7",
                            "#d4ff52",
                            "#285d5d",
                            "#4fb3a5",
                            "#e8e427",
                            "#ffd30d",
                            "#1d9000",
                            "#5f647b",
                            "#f04bfc",
                            "#931d36",
                            "#196623",
                            "#781fb3",
                            "#729b25"
                        ]
                    }],
                // These labels appear in the legend and in the tooltips when hovering different arcs
                labels: dataLabels
            };
            var doughnutPieOptions = {
                cutoutPercentage: 50,
                animationEasing: "easeOutBounce",
                animateRotate: true,
                animateScale: false,
                responsive: true,
                maintainAspectRatio: true,
                showScale: true,
                legend: false,
                legendCallback: function (chart) {
                    var text = [];
                    text.push('<div class="chartjs-legend"><ul class="justify-content-center row">');
                    for (var i = 0; i < chart.data.datasets[0].data.length; i++) {
                        text.push('<li class="col-md-3"><span style="background-color:' + chart.data.datasets[0].backgroundColor[i] + '">');
                        text.push('</span>');
                        if (chart.data.labels[i]) {
                            text.push(chart.data.labels[i]);
                        }
                        text.push('</li>');
                    }
                    text.push('</div></ul>');
                    return text.join("");
                },
                layout: {
                    padding: {
                        left: 0,
                        right: 0,
                        top: 0,
                        bottom: 0
                    }
                },
                tooltips: {
                    callbacks: {
                        title: function (tooltipItem, data) {
                            return data['labels'][tooltipItem[0]['index']];
                        },
                        label: function (tooltipItem, data) {
                            return data['datasets'][0]['data'][tooltipItem['index']];
                        }
                    },
                    backgroundColor: '#fff',
                    titleFontSize: 14,
                    titleFontColor: '#0B0F32',
                    bodyFontColor: '#737F8B',
                    bodyFontSize: 11,
                    displayColors: false
                }
            };
            var doughnutChart = new Chart(doughnutChartCanvas, {
                type: 'doughnut',
                data: doughnutPieData,
                options: doughnutPieOptions
            });
            document.getElementById('doughnut-chart-legend').innerHTML = doughnutChart.generateLegend();
        }

    });
})(jQuery);
$('.btn-deletePost').click(function () {
    var pid = $(this).attr('id');
    pid = pid.substring(pid.lastIndexOf("_") + 1);
    var pid = $(this).attr('id');
    pid = pid.substring(pid.lastIndexOf("_") + 1);
    var result = confirm("Bạn có chắc muốn xóa bài viết này không?");
    if (result) {
        deletePost(pid);
    }
});
$('.btn-deleteReport').click(function () {
    var pid = $(this).attr('id');
    pid = pid.substring(pid.lastIndexOf("_") + 1);
    var pid = $(this).attr('id');
    pid = pid.substring(pid.lastIndexOf("_") + 1);
    var result = confirm("Bạn có chắc bài viết này không vi phạm không?");
    if (result) {
        deleteReport(pid);
    }
});
function deletePost(pid) {
    data = {};
    data['pid'] = pid;
    console.log(JSON.stringify(data));
    $('#item-Post_' + pid).addClass('d-none');
    $.ajax({
        type: "DELETE",
        url: "/api-post?type=report",
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
//        success: function () {
//            window.location.href = "/admin/report";
//        },
//        error: function () {
//            window.location.href = "/admin/report";
//        }

    });
}

function deleteReport(pid) {
    data = {};
    data['pid'] = pid;
    console.log(JSON.stringify(data));
    $('#item-Post_' + pid).addClass('d-none');
    $.ajax({
        type: "DELETE",
        url: "/api-report",
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
//        success: function () {
//            window.location.href = "/admin/report";
//        },
//        error: function () {
//            window.location.href = "/admin/report";
//        }

    });
}

