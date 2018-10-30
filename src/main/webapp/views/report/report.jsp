<%--
  Created by IntelliJ IDEA.
  User: viet
  Date: 30/10/2018
  Time: 12:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../admin-header.jsp"/>
<body>
<jsp:include page="../left_panel.jsp"/>
<div id="right-panel" class="right-panel">

    <!-- Header-->
    <!-- /header -->
    <jsp:include page="../right_panel_header.jsp"/>
    <!-- Header-->

    <div class="breadcrumbs">
    </div>

    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="cart-title">Products' Amount per Category</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-12 col-lg-6">
                                    <div id="product-amount-pie-chart"></div>
                                </div>
                                <div class="col-md-12 col-lg-6">
                                    <div class="table-responsive">
                                        <table class="table">
                                            <tr>
                                                <th>#</th>
                                                <th>Category</th>
                                                <th>Amount</th>
                                            </tr>
                                            <c:forEach items="${productAmountModel.modelList}" var="model"
                                                       varStatus="status">
                                                <tr>
                                                    <td>${status.count}</td>
                                                    <td>${model.name}</td>
                                                    <td>${model.value}</td>
                                                </tr>
                                            </c:forEach>
                                        </table>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="cart-title">Products' Line per Category</h4>
                        </div>
                        <div class="card-body">
                            <div class="col-md-12 col-lg-6">
                                <div id="product-pie-chart"></div>
                            </div>
                            <div class="col-md-12 col-lg-6">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <th>#</th>
                                            <th>Category</th>
                                            <th>Number Of Lines</th>
                                        </tr>
                                        <c:forEach items="${productModel.modelList}" var="model" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${model.name}</td>
                                                <td>${model.value}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <h4 class="cart-title">Max, min, average prices comparision between categories</h4>
                        </div>
                        <div class="card-body">
                            <div class="col-md-12">
                                <div id="max-min-avg-line-chart"></div>
                            </div>
                            <div class="col-md-12">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tr>
                                            <th>#</th>
                                            <th>Category</th>
                                            <th>Max</th>
                                            <th>Min</th>
                                            <th>Avg</th>
                                        </tr>
                                        <c:forEach items="${minMaxAvgProduct.modelList}" var="model" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td>${model.name}</td>
                                                <td>$ ${model.max}</td>
                                                <td>$ ${model.min}</td>
                                                <td>$ ${model.avg}</td>
                                            </tr>
                                        </c:forEach>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- .animated -->
    </div><!-- .content -->
</div>
<jsp:include page="../admin_footer.jsp"/>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script>
    google.charts.load("current", {packages: ["corechart", "line"]});
    google.charts.setOnLoadCallback(drawProductAmountChart);
    google.charts.setOnLoadCallback(drawProductChart);
    google.charts.setOnLoadCallback(drawMaxMinAvgPriceChart);

    function drawProductAmountChart() {
        var data = google.visualization.arrayToDataTable([
            ['Category', 'Products'],
            <c:forEach items="${productAmountModel.modelList}" var="model">
            ["${model.name}", ${model.value}],
            </c:forEach>
        ]);

        var options = {
            title: 'Product per category',
            is3D: true,
            width: 400,
            height: 400
        };

        var chart = new google.visualization.PieChart(document.getElementById('product-amount-pie-chart'));
        chart.draw(data, options);
    }

    function drawProductChart() {
        var data = google.visualization.arrayToDataTable([
            ['Category', 'Products'],
            <c:forEach items="${productModel.modelList}" var="model">
            ["${model.name}", ${model.value}],
            </c:forEach>
        ]);

        var options = {
            title: 'Product lines per category',
            is3D: true,
            width: 400,
            height: 400
        };

        var chart = new google.visualization.PieChart(document.getElementById('product-pie-chart'));
        chart.draw(data, options);
    }

    function drawMaxMinAvgPriceChart() {
        var data = new google.visualization.DataTable();
        data.addColumn("string", "Category");
        data.addColumn('number', 'Max');
        data.addColumn('number', 'Min');
        data.addColumn('number', 'Average');

        data.addRows([
            <c:forEach items="${minMaxAvgProduct.modelList}" var="model">
            ["${model.name}", ${model.max}, ${model.min}, ${model.avg}],
            </c:forEach>
        ]);

        var options = {
            chart: {
                title: 'Max, min, average price per category',
            },
            width: 900,
            height: 500
        };

        var chart = new google.charts.Line(document.getElementById('max-min-avg-line-chart'));

        chart.draw(data, google.charts.Line.convertOptions(options));
    }
</script>
</body>
</html>
