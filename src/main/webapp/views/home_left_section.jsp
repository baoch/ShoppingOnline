<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 10/25/18
  Time: 12:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-3">
    <p class="lead">Shop Name</p>
    <div class="list-group">
        <c:forEach items="${listCategory}" var="item">
            <a href="TODO-GET PRODUCT BY CATEGORY ID" class="list-group-item">${item.name}</a>
        </c:forEach>
    </div>
</div>
