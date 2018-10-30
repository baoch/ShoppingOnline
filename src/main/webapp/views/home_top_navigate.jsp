<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 10/16/18
  Time: 7:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home/index?page=0">Home</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li>
                    <a href="${pageContext.request.contextPath}/category/index">Category</a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/product/index?page=0">Product</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <sec:authorize access="isAuthenticated()">
                        <sec:authentication var="principal" property="principal" />
                        <a href="${pageContext.request.contextPath}/user/edit">
                            <span class="glyphicon glyphicon-user"></span>
                            Hello: ${principal.username}
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a href="#">
                            <span class="glyphicon glyphicon-user"></span>
                                Sign up
                        </a>
                    </sec:authorize>
                </li>
                <li>
                    <c:url value="/j_spring_security_check" var="logoutUrl" />
                    <sec:authorize access="isAuthenticated()">
                        <a href="${logoutUrl}">
                            <span class="glyphicon glyphicon-log-in"></span>
                            Log out
                        </a>
                    </sec:authorize>
                    <sec:authorize access="!isAuthenticated()">
                        <a href="${pageContext.request.contextPath}/auth/login">
                            <span class="glyphicon glyphicon-user"></span>
                            Login
                        </a>
                    </sec:authorize>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
