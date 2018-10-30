<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 10/16/18
  Time: 1:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<%--<jsp:include page="../header.jsp"></jsp:include>--%>
<jsp:include page="../admin-header.jsp"></jsp:include>
<body>
<jsp:include page="../home_top_navigate.jsp"></jsp:include>
<h1>Cart</h1>
<a href="${pageContext.request.contextPath}/home/index?page=0&keyword=">Continue Order</a>
<c:if test="${myCart.size() > 0}">
    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Cart</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Product Name</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${myCart}">
                                    <c:if test="${row.quantity > 0}">
                                        <tr>
                                            <td>${row.product.name}</td>
                                            <td>${row.quantity}</td>
                                            <td>${row.product.price * row.quantity}</td>
                                            <td>
                                                <a class="btn btn-danger" style="margin-left: 40px ; width: 80px; float: right;"
                                                   href="${pageContext.request.contextPath}/shop/remove?id=${row.product.id}">Delete</a>
                                                <a class="btn btn-warning" style="margin-left: 40px ; width: 80px; float: right;"
                                                   href="${pageContext.request.contextPath}/shop/order?id=${row.product.id}&quantity=-1">Minus</a>
                                                <a class="btn btn-success" style="margin-left: 40px ; width: 80px; float: right;"
                                                   href="${pageContext.request.contextPath}/shop/order?id=${row.product.id}&quantity=1">Add</a>


                                            </td>
                                        </tr>
                                    </c:if>
                                </c:forEach>
                                <tr>
                                    <td colspan="3">Total: ${total}</td>
                                    <%--<sec:authorize access="isAuthenticated()">--%>
                                        <td><a class="btn btn-primary" style="width: 80px; text-align: center; float: right;"
                                               href="${pageContext.request.contextPath}/shop/payment?price=${total}">Payment</a>
                                        </td>
                                    <%--</sec:authorize>--%>

                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- .animated -->
    </div>
    <!-- .content -->
</c:if>
<jsp:include page="../admin_footer.jsp"/>

</body>
</html>