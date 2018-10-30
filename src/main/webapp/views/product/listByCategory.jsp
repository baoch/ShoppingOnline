<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 9/29/18
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<jsp:include page="../admin-header.jsp"/>

<!-- Right Panel -->
<body>
<%--<jsp:include page="../left_panel.jsp"/>--%>
<div id="right-panel" class="right-panel" style="margin: 0 auto;">

    <!-- Header-->
    <!-- /header -->
    <%--<jsp:include page="../right_panel_header.jsp"/>--%>
    <!-- Header-->

    <div class="breadcrumbs">
    </div>

    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">List product of ${category.name}</strong>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Price</th>
                                    <th>Amount</th>
                                    <th>Thumbnail</th>
                                    <th>Category</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${listProduct}">
                                    <tr>
                                        <td>${row.id}</td>
                                        <td>${row.name}</td>
                                        <td>${row.description}</td>
                                        <td>${row.price}</td>
                                        <td>${row.amount}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${row.thumbnailUrl != null && !row.thumbnailUrl.trim().equals('')}">
                                                    <img width="300px" src="${pageContext.request.contextPath}/img/${row.thumbnailUrl}" alt="">
                                                </c:when>
                                                <c:otherwise>
                                                    <img width="300px" src="${pageContext.request.contextPath}/img/default.png" alt="">
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${row.category.name}</td>
                                        <td>
                                            <a class="btn btn-primary" href="${pageContext.request.contextPath}/shop/order?id=${row.id}&quantity=1">Buying</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
        </div><!-- .animated -->
    </div><!-- .content -->
</div>
<!-- /#right-panel -->
<div class="modal fade" id="staticModal" tabindex="-1" role="dialog" aria-labelledby="staticModalLabel"
     aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticModalLabel">Confirm Delete</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <p>
                    Do you want to delete this product?
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger" id="btnConfirmDelete"
                   href="${pageContext.request.contextPath}/product/delete?id=${row.id}">Delete</a>
            </div>
        </div>
    </div>
</div>
<script>
    $(".btnDelete").on('click', function (event) {
        var id = $(event.target).val();
        $("#btnConfirmDelete").attr("href", "${pageContext.request.contextPath}/product/delete?id=" + id);
    });
</script>
<jsp:include page="../admin_footer.jsp"/>
</body>
</html>
<!-- Right Panel -->
<%--<c:if test="${page > 0}">--%>
<%--<a href="${pageContext.request.contextPath}/product/index?page=${page-1}&keyword=${keyword}">--%>
<%--Previous--%>
<%--</a>--%>
<%--</c:if>--%>
<%--${strPage}--%>
<%--<c:if test="${(page +1) != totalPage}">--%>
<%--<a href="${pageContext.request.contextPath}/product/index?page=${page+1}&keyword=${keyword}">--%>
<%--Next--%>
<%--</a>--%>
<%--</c:if>--%>

