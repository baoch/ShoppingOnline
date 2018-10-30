<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 10/20/18
  Time: 6:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%--<head>--%>
    <%--<title>Login Form</title>--%>
    <%--<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <%--<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>--%>
    <%--<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>--%>
<%--</head>--%>
<head>
    <title>Login Page</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="${pageContext.request.contextPath}/resources/">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/icons/favicon.ico"/>
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/main.css">
    <!--===============================================================================================-->
</head>
<body>
    <form method="post" action="<c:url value="/j_spring_security_check"/>">
        <div class="limiter">
            <div class="container-login100" style="background-image: url('${pageContext.request.contextPath}/resources/images/bg-01.jpg');">
                <div class="wrap-login100">
                    <form class="login100-form validate-form">
					<span class="login100-form-logo">
						<i class="zmdi zmdi-landscape"></i>
					</span>

                        <span class="login100-form-title p-b-34 p-t-27">
						Log in
					</span>

                        <div class="wrap-input100 validate-input" data-validate = "Enter username">
                            <input class="input100" type="text" name="username" placeholder="Username">
                            <span class="focus-input100" data-placeholder="&#xf207;"></span>
                        </div>

                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <input class="input100" type="password" name="password" placeholder="Password">
                            <span class="focus-input100" data-placeholder="&#xf191;"></span>
                        </div>

                        <div class="contact100-form-checkbox">
                            <%--<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">--%>
                            <label style="color: red;">
                                ${message}
                            </label>
                        </div>

                        <div class="container-login100-form-btn">
                            <%--<button class="login100-form-btn">--%>
                                <%--Login--%>
                            <%--</button>--%>
                            <input type="submit" value="Login" name="btnLogin" class="login100-form-btn"/>
                        </div>

                        <div class="text-center p-t-90">
                            <a class="txt1" href="#">
                                Welcome to baoch project
                            </a>
                        </div>
                        <div class="text-center p-t-90">
                            <a class="txt1" href="${pageContext.request.contextPath}/user/register">Register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<td colspan="2" style="color: red">${message}</td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>Username:</td>--%>
                <%--<td><input type="text" name="username"/></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td>Password:</td>--%>
                <%--<td><input type="password" name="password" /></td>--%>
            <%--</tr>--%>
            <%--<tr>--%>
                <%--<td colspan="2"><input type="submit" value="Login" name="btnLogin" /></td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    </form>
    <div id="dropDownSelect1"></div>

    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>
