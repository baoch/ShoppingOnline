<%--
  Created by IntelliJ IDEA.
  User: baoch
  Date: 9/29/18
  Time: 8:06 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../admin-header.jsp"/>

<!-- Right Panel -->
<jsp:include page="../left_panel.jsp"/>
<div id="right-panel" class="right-panel">

    <!-- Header-->
    <!-- /header -->
    <jsp:include page="../right_panel_header.jsp"/>
    <!-- Header-->

    <div class="breadcrumbs">
    </div>

    <div class="content mt-3">
        <div class="animated fadeIn">
            <div class="row">

                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header">
                            <strong class="card-title">Data Table</strong>
                            <a class="btn btn-success" style="margin-left: 10px; float: right; width: 80px;"
                               href="${pageContext.request.contextPath}/category/create">Create</a>
                        </div>
                        <div class="card-body">
                            <table id="bootstrap-data-table" class="table table-striped table-bordered">
                                <thead>
                                <tr>
                                    <th>Id</th>
                                    <th>Name</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="row" items="${listCategory}">
                                    <tr>
                                        <td>${row.id}</td>
                                        <td>${row.name}</td>
                                        <td>
                                            <button type="button" class="btn btn-danger btnDelete"
                                                    style="margin-left: 10px; float: right; width: 80px;"
                                                    data-toggle="modal" data-target="#staticModal" value="${row.id}">
                                                Delete
                                            </button>
                                            <a class="btn btn-warning"
                                               style="margin-left: 10px; float: right; width: 80px;"
                                               href="${pageContext.request.contextPath}/category/detail?id=${row.id}">View</a>
                                            <a class="btn btn-success"
                                               style="margin-left: 10px; float: right; width: 80px;"
                                               href="${pageContext.request.contextPath}/category/edit?id=${row.id}">Edit</a>
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
                    Do you want to delete this category?
                </p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                <a class="btn btn-danger" id="btnConfirmDelete"
                   href="${pageContext.request.contextPath}/category/delete?id=${row.id}">Delete</a>
            </div>
        </div>
    </div>
</div>
<script>
    $(".btnDelete").on('click', function (event) {
        var id = $(event.target).val();
        $("#btnConfirmDelete").attr("href", "${pageContext.request.contextPath}/category/delete?id=" + id);
    });
</script>
<jsp:include page="../admin_footer.jsp"/>
<!-- Right Panel -->


