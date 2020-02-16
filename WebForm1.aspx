<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Production Trend</title>
    <style type="text/css">
        #mychart {
            background-color: white;
            border: 1px solid black;
        }
    </style>
    <link rel="stylesheet" href="Public/CSS/bootstrap.min.css" />
    <link rel="stylesheet" href="Public/CSS/font-awesome.min.css" />
    <link rel="stylesheet" href="Public/CSS/daterangepicker-bs3.css" />


    <script type="text/javascript" src="Public/JS/Chart.bundle.js"></script>
    <script type="text/javascript" src="Public/JS/jquery-1.8.3.min.js"></script>
    <script type="text/javascript" src="Public/JS/bootstrap.min.js"></script>
    <script type="text/javascript" src="Public/JS/moment.js"></script>
    <script type="text/javascript" src="Public/JS/daterangepicker.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <p>
            &nbsp;
        </p>
    </form>



    <div class="well">



        <form class="form-horizontal" accept-charset="UTF-8" >

            <fieldset>

                <div class="control-group">

                    <label class="control-label" for="reservationtime">Choose your start and end times:</label>

                    <div class="controls">

                        <div class="input-prepend input-group">

                            <span class="add-on input-group-addon"><i class="glyphicon glyphicon-calendar fa fa-calendar"></i></span>

                            <input type="text" style="width: 400px" name="reservation" id="reservationtime" class="form-control" value="02/08/2020 1:00 PM - 02/09/2020 1:30 PM" class="span4" />

                            <input type="submit" value="Refresh" style="float: right; margin-right: 1300px; width: 100px; height: 50px" />
                        </div>

                    </div>

                </div>

            </fieldset>


        </form>



        <script type="text/javascript">

            $(document).ready(function () {

                $('#reservationtime').daterangepicker({

                    timePicker: true,

                    timePickerIncrement: 30,

                    format: 'MM/DD/YYYY h:mm A'

                }, function (start, end, label) {

                    console.log(start.toISOString(), end.toISOString(), label);

                });

            });

        </script>



    </div>




    <div class="chart-container" style="position: relative; left: 0px；height:90vh; width: 60vw">
        <canvas id="mychart" style="border: 0;">图标
        </canvas>
    </div>

    <div class="chart-container" style="position: relative; right: 10px； height:50vh; width: 50vw">
        <canvas id="mychartpie" style="border: 0;">图标
        </canvas>
    </div>


    <script>

        //line
        (function () {
            'user strict';
            var type = "line";
            var data = {
                labels: [<%=linedate%>],
                datasets: [
                    {
                        label: "OK",
                        data: [<%=lineokdata%>],
                        borderColor: "green",
                        borderWidth: 2,

                    },

                    {
                        label: "NG",
                        data: [<%=linengdata%>],
                        borderColor: "red",
                        borderWidth: 2,

                    }

                ]
            };

            var options = {
                scales: {
                    yAxes: [{
                        ticks: {
                            min: 0,

                        }
                    }]
                },



                title: {
                    display: true,
                    text: "Production",
                    fontColor: "black",
                    fontSize: "24"
                },

                legend: {
                    position: "top",
                    display: true
                },


                animation: {
                    duration: 1000,
                    easing: "easeOutQuart"
                }

            };



            //
            var ctx = document.getElementById("mychart").getContext("2d");

            var chart = new Chart(ctx, {
                type: type,
                data: data,
                options: options

            });
        })();

    </script>



    <script>
        //pie
        (function () {
            'user strict';
            var type = "pie";
            var data = {
                labels: ['OK', 'NG'],
                datasets: [
                    {
                        data: [<%=piedata%>],
                        backgroundColor: ['green', 'red']
                    },

                ]
            };

            var options = {

                title: {
                    display: true,
                    text: "Proportion",
                    fontColor: "black",
                    fontSize: "24"
                }

            };



            //
            var ctx = document.getElementById("mychartpie").getContext("2d");

            var chart = new Chart(ctx, {
                type: type,
                data: data,
                options: options

            });
        })();

    </script>








</body>
</html>
