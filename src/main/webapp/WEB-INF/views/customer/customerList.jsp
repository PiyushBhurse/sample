<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <%@include file="../common/meta.jsp"%>
        <%@include file="../common/css.jsp"%>
    </head>
    <body>
        <!-- START PAGE CONTAINER -->
        <div class="page-navigation-toggled page-container-wide">
            <%@include file="../common/topbar.jsp" %>
            <!-- PAGE CONTENT -->
            <div class="page-content">
                <!-- START BREADCRUMB -->
                <ul class="breadcrumb">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Approve Customer Request</a></li>
                </ul>
                <!-- END BREADCRUMB --> 
                <div class="page-content-wrap" >
                    <%@include file="../common/message.jsp"%>
                    <!-- PAGE TITLE -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default" style="background: #ffffffde!important;">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Customer List</h3>
                                    <ul class="panel-controls">
                                        <li><a href="#" class="panel-refresh" onclick="location.reload();"><span class="fa fa-refresh" style="margin-top: 26%;"></span></a></li>
                                    </ul>
                                </div>
                                <div class="panel-body">
                                    <!-- START FILTER PANEL -->
                                    <div class="panel panel-warning">
                                        <div class="panel-body">
                                            <form name="form1" id="form1">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <label>Customer Type</label>
                                                            <select name="userStatus" Class="form-control select">
                                                                <option value="U" <c:if test="${userStatus=='U'}">selected</c:if>>-All-</option>
                                                                <option value="N" <c:if test="${userStatus=='N'}">selected</c:if>>New</option>
                                                                <option value="A" <c:if test="${userStatus=='A'}">selected</c:if>>Active</option>
                                                                </select>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-2 btn-filter">
                                                            <button type="submit"  class="btn-info btn-sm" name="btnSubmit">Go</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                        <!-- END FILTER PANEL -->

                                        <div class="row">
                                            <div class="col-md-12 scrollable">
                                                <table class="table datatable table-bordered" >
                                                    <thead>
                                                        <tr>
                                                            <th>First Name</th>
                                                            <th>Last Name</th>
                                                            <th>Username</th>
                                                            <th>Email Id</th>
                                                            <th>Mobile No</th>
                                                            <th>AADHAR ID</th>
                                                            <th>PAN</th>
                                                            <th>DOB</th>
                                                            <th>User Role</th>
                                                            <th>User Status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${userList}" var="userItem">
                                                        <tr id="user" data-user-id="${userItem.userId}" class="clickableRow">
                                                            <td><c:out value="${userItem.firstName}"/></td>
                                                            <td><c:out value="${userItem.lastName}"/></td>
                                                            <td><c:out value="${userItem.username}"/></td>
                                                            <td><c:out value="${userItem.emailId}"/></td>
                                                            <td><c:out value="${userItem.mobileNumber}"/></td>
                                                            <td><c:out value="${userItem.aadharId}"/></td>
                                                            <td><c:out value="${userItem.pan}"/></td>
                                                            <td><fmt:formatDate value="${userItem.dob}" pattern="dd-MM-yyyy"/></td>
                                                            <td><c:out value="${userItem.userRole}"/></td>
                                                            <td><c:out value="${userItem.userStatus}"/></td>


                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><br>
                <form name="form2" id="form2" action="" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="hidden" id="userId" name="userId"/>
                </form>
                <!-- END PAGE TITLE -->
            </div>
            <!-- START PAGE CONTAINER -->
        </div>
        <%@include file="../common/script.jsp"%>
        <!-- START THIS PAGE PLUGINS-->        
        <script type="text/javascript" src="../js/datatables/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="../js/bootstrap/bootstrap-select.js"></script>
        <script type='text/javascript' src='../js/jquery-validation/jquery.validate.js'></script>
        <!-- END THIS PAGE PLUGINS-->        
        <script type="text/javascript">
                                            $('.table').dataTable({
                                                "order": []
                                            });

                                            $('#user td').click(function () {
                                                $('#userId').val($(this).parent().data("user-id"));
                                                $('#form2').prop('action', '../customer/activateCustomer');
                                                $('#form2').submit();
                                            });
        </script>
    </body>
</html>