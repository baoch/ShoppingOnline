<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 10/16/18
  Time: 7:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../header.jsp"></jsp:include>
<%--<jsp:include page="../admin-header.jsp"></jsp:include>--%>
<body>

<!-- Navigation -->
<jsp:include page="../home_top_navigate.jsp"></jsp:include>


<!-- Page Content -->
<div class="container">

    <div class="row">

        <jsp:include page="../home_left_section.jsp"></jsp:include>

        <div class="col-md-9">

            <div class="row carousel-holder">

                <div class="col-md-12">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="slide-image" height="500px !important"
                                     src="${pageContext.request.contextPath}/img/vinhome-1.jpg" alt="vinhome">
                            </div>
                            <div class="item">
                                <img class="slide-image" height="500px !important"
                                     src="${pageContext.request.contextPath}/img/vinhome-2.jpg" alt="vinhome">
                            </div>
                            <div class="item">
                                <img class="slide-image" height="500px !important"
                                     src="${pageContext.request.contextPath}/img/vinhome-3.jpg" alt="vinhome">
                            </div>
                        </div>
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>

            </div>

            <div class="row">
                <c:if test="${listProduct.size() > 0}">
                    <c:forEach var="row" items="${listProduct}">
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail" style="height: 300px;">
                                <c:choose>
                                    <c:when test="${row.thumbnailUrl != null && !row.thumbnailUrl.trim().equals('')}">
                                        <img src="${pageContext.request.contextPath}/img/${row.thumbnailUrl}" alt="">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/img/default.png" alt="">
                                    </c:otherwise>
                                </c:choose>

                                <div class="caption">
                                    <h4 class="pull-right">$ ${row.price}</h4>
                                    <h4>
                                        <a href="${pageContext.request.contextPath}/home/detail?id=${row.id}">${row.name}</a>
                                    </h4>
                                    <p>${row.description}</p>
                                    <a href="${pageContext.request.contextPath}/shop/order?id=${row.id}&quantity=1">Buying</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </c:if>
            </div>

        </div>

    </div>

</div>
<div style="display: block; width: 950px; float: right; text-align: center">
        <c:if test="${page > 0}">
            <a href="${pageContext.request.contextPath}/home/index?page=${page-1}&keyword=${keyword}">
                Previous
            </a>
        </c:if>
        ${strPage}
        <c:if test="${(page +1) != totalPage}">
            <a href="${pageContext.request.contextPath}/home/index?page=${page+1}&keyword=${keyword}">
                Next
            </a>
        </c:if>
</div>

<!-- /.container -->

<div class="container">

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; BaoCH Website 2018</p>
            </div>
        </div>
    </footer>

</div>
<!-- /.container -->

<!-- jQuery -->
<script src="js/jquery.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="js/bootstrap.min.js"></script>

</body>
</html>
