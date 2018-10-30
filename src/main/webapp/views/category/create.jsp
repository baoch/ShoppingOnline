<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 9/29/18
  Time: 8:09 PM
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
<form:form method="post" action="${pageContext.request.contextPath}/category/create" modelAttribute="category">
    <div class="content mt-3">
        <div class="animated fadeIn">

            <div class="row">

                <div class="col-xs-6 col-sm-6">
                    <div class="card">
                        <div class="card-header">
                            <strong>Create new Category</strong>
                        </div>
                        <div class="card-body card-block">
                            <div class="form-group">
                                <form:label class=" form-control-label" path="name">Name:</form:label>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="fa fa-font"></i></div>
                                    <form:input class="form-control" path="name" />
                                    <form:errors path="name" cssStyle="color:red;display: block"/>
                                </div>
                                <small class="form-text text-muted">ex. Apartment</small>
                            </div>
                        </div>
                        <input type="submit" class="btn btn-success" value="Create"/>
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