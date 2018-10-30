<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 9/29/18
  Time: 8:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<jsp:include page="../admin-header.jsp"></jsp:include>
<body>
<jsp:include page="../left_panel.jsp"/>
<div id="right-panel" class="right-panel">

    <!-- Header-->
    <!-- /header -->
    <jsp:include page="../right_panel_header.jsp"/>
    <!-- Header-->
    <form:form method="post" action="${pageContext.request.contextPath}/product/category" modelAttribute="product">
        <div class="content mt-3">
            <div class="animated fadeIn">

                <div class="row">

                    <div class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>Product details</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="name">Name:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <form:input class="form-control" path="name" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="description">Name:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <form:input class="form-control" path="description" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="price">Name:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <form:input class="form-control" path="price" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="amount">Name:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <form:input class="form-control" path="amount" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="category">Name:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-calendar"></i></div>
                                        <form:input class="form-control" path="category.name" readonly="true"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="category">Image description:</form:label>
                                    <div class="input-group">
                                        <c:choose>
                                            <c:when test="${product.thumbnailUrl != null && !product.thumbnailUrl.trim().equals('')}">
                                                <img width="200px" height="200px" class="img-rounded" src="${pageContext.request.contextPath}/img/${product.thumbnailUrl}" alt="">
                                            </c:when>
                                            <c:otherwise>
                                                <img width="200px" height="200px" class="img-rounded" src="${pageContext.request.contextPath}/img/default.png" alt="">
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div><!-- .animated -->
        </div><!-- .content -->
    </form:form>
</div>
<jsp:include page="../admin_footer.jsp"/>
</body>
</html>
