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
    <form:form method="post" action="${pageContext.request.contextPath}/user/edit" modelAttribute="user">
        <div class="content mt-3">
            <div class="animated fadeIn">

                <div class="row">

                    <div class="col-xs-6 col-sm-6">
                        <div class="card">
                            <div class="card-header">
                                <strong>Register</strong>
                            </div>
                            <div class="card-body card-block">
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="username">Username:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-font"></i></div>
                                        <form:hidden class="form-control" path="username" />
                                    </div>
                                    <small class="form-text text-muted"><form:errors path="username" cssStyle="color:red;display: block"/></small>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="password">Password:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-font"></i></div>
                                        <form:password class="form-control" path="password" />
                                    </div>
                                    <small class="form-text text-muted"><form:errors path="password" cssStyle="color:red;display: block"/></small>
                                </div>
                                <div class="form-group">
                                    <form:label class=" form-control-label" path="fullName">Full name:</form:label>
                                    <div class="input-group">
                                        <div class="input-group-addon"><i class="fa fa-font"></i></div>
                                        <form:input class="form-control" path="fullName" />
                                    </div>
                                    <small class="form-text text-muted"><form:errors path="fullName" cssStyle="color:red;display: block"/></small>
                                </div>
                                <%--<div class="form-group">--%>
                                    <%--<form:label class=" form-control-label" path="category.id">Category:</form:label>--%>
                                    <%--<div class="input-group">--%>
                                        <%--<form:select cssClass="selectpicker" path="">--%>
                                            <%--<form:option value="ROLE_USER">ROLE_USER</form:option>--%>
                                            <%--<form:option value="ROLE_ADMIN">ROLE_ADMIN</form:option>--%>
                                        <%--</form:select>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
                            </div>
                            <input type="submit" class="btn btn-success" value="Register"/>
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