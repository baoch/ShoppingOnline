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
<body>

<!-- Navigation -->
<jsp:include page="../home_top_navigate.jsp"></jsp:include>


<!-- Page Content -->

<!-- Navigation -->
<jsp:include page="../home_top_navigate.jsp"></jsp:include>


<!-- Page Content -->
<div class="container">

    <div class="row">

        <jsp:include page="../home_left_section.jsp"></jsp:include>

        <div class="col-md-9">
            <div class="thumbnail">
                <c:choose>
                    <c:when test="${product.thumbnailUrl != null && !product.thumbnailUrl.trim().equals('')}">
                        <img class="img-responsive" src="${pageContext.request.contextPath}/img/${product.thumbnailUrl}"
                             alt="">
                    </c:when>
                    <c:otherwise>
                        <img class="img-responsive" src="${pageContext.request.contextPath}/img/default.png" alt="">
                    </c:otherwise>
                </c:choose>
                <div class="caption-full">
                    <h4 class="pull-right">$ ${product.price}</h4>
                    <h4><a href="#">${product.name}</a>
                    </h4>
                    <p>${product.description}</p>
                    <a href="${pageContext.request.contextPath}/shop/order?id=${product.id}&quantity=1">Buying</a>
                </div>

            </div>

        </div>

    </div>

</div>
<!-- /.container -->

<div class="container">

    <hr>

    <!-- Footer -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <p>Copyright &copy; Your Website 2018</p>
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
