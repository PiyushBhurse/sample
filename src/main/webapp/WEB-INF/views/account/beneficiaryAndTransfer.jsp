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
                    <li><a href="#">Add Beneficiary and Fund Transfer</a></li>
                </ul>
                <!-- END BREADCRUMB --> 
                <div class="page-content-wrap" >
                    <%@include file="../common/message.jsp"%>
                    <!-- PAGE TITLE -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default" style="background: #ffffffde!important;">
                                <div class="panel-heading">
                                    <h3 class="panel-title">Beneficiary</h3>
                                </div>

                                <div class="panel-body">

                                    <div class="row">
                                        <div class="col-md-12">
                                            <form:form cssClass="form-horizontal" action="../account/addBeneficiary?${_csrf.parameterName}=${_csrf.token}" modelAttribute="beneficiary" method="POST" name="form1" id="form1">
                                                <!--Customer details-->
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h3 class="panel-title"><b><i>Add Beneficiary</i></b></h3>
                                                    </div>

                                                    <div class="row" style="margin-top: 5%">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="req col-md-3 control-label">Nick Name</label>
                                                                <div class="col-md-8 col-xs-12">
                                                                    <form:input path="benNickName" maxlength="100" cssClass="form-control"/>                                       
                                                                    <form:hidden path="benType" value="I"/>                                       
                                                                    <span class="help-block">Please enter nick name</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="req col-md-3 control-label">Beneficiary Name</label>
                                                                <div class="col-md-8 col-xs-12">
                                                                    <form:input path="benName" maxlength="100" cssClass="form-control"/>                                       
                                                                    <span class="help-block">Please enter beneficiary name</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div><br/>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="req col-md-3 control-label">Account Number</label>
                                                                <div class="col-md-8 col-xs-12">
                                                                    <form:input path="benAccNum" maxlength="20" cssClass="form-control benCk"/>                                       
                                                                    <span id="acctSpan" style="color: red;display: none;"></span>
                                                                    <span class="help-block">Please enter account number of beneficiary</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="req col-md-3 control-label">Bank Name</label>
                                                                <div class="col-md-8 col-xs-12">
                                                                    <form:input path="benBank" maxlength="100" cssClass="form-control"/>                                       
                                                                    <span class="help-block">Please enter beneficiary bank name</span>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div><br/>
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label class="req col-md-3 control-label">Bank IFSC</label>
                                                                <div class="col-md-8 col-xs-12">
                                                                    <form:input path="benBankIFSC" maxlength="11" cssClass="form-control"/>                                       
                                                                    <span class="help-block">Please enter IFSC of bank</span>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div><br/>
                                                    <div class="panel-footer">
                                                        <div class="pull-right">
                                                            <button id="submitBtn" type="submit" class="btn btn-success"><spring:message code="button.Submit"/></button>
                                                            <button type="button" name="_cancel" class="btn btn-danger" onclick="document.getElementById('form1').reset();">Reset</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form:form>
                                        </div>


                                        <div class="row">
                                            <div class="col-md-12 scrollable" style="padding-left: 23%;padding-right: 23%;">
                                                <table class="table datatable table-bordered" >
                                                    <thead>
                                                        <tr>
                                                            <th>Account No</th>
                                                            <th>Account Type</th>
                                                            <th>Balance</th>
                                                            <th>Created Date</th>
                                                            <th>Last Updated date</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <%--<c:forEach items="${savingAccount}" var="sa">--%>
                                                        <tr>
                                                            <td>${savingAccount.acctId}</td>
                                                            <td>${savingAccount.acctType}</td>
                                                            <td>${savingAccount.acctBalance}</td>
                                                            <td><fmt:formatDate pattern="dd-MM-yyyy hh:mm" value="${savingAccount.accountCreatedDate}"/></td>
                                                            <td><fmt:formatDate pattern="dd-MM-yyyy hh:mm" value="${savingAccount.accountUpdatedDate}"/></td>
                                                        </tr>
                                                        <%--</c:forEach>--%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="panel panel-default" style="background: #ffffffde!important;">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">Transfer Funds</h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12 scrollable">
                                                <table class="table datatable table-bordered" >
                                                    <thead>
                                                        <tr>
                                                            <th>Account No</th>
                                                            <th>Account Type</th>
                                                            <th>Term Amount</th>
                                                            <th>Tenure</th>
                                                            <th>Interest</th>
                                                            <th>Maturity Amount</th>
                                                            <th>Created Date</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${termAccount}" var="ta">
                                                            <tr>
                                                                <td>${ta.acctId}</td>
                                                                <td>${ta.acctType}</td>
                                                                <td>${ta.depositeAmount}</td>
                                                                <td>${ta.depositeTenure}</td>
                                                                <td>${ta.intRate}</td>
                                                                <td>${ta.maturityAmt}</td>
                                                                <td><fmt:formatDate pattern="dd-MM-yyyy hh:mm" value="${ta.accountCreatedDate}"/></td>
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
            <script type="text/javascript" src="../js/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
            <!-- END THIS PAGE PLUGINS-->        
            <script type="text/javascript">
                                                                $("#submitBtn").prop('disabled', true);
                                                                $('.table').dataTable({
                                                                    "order": []
                                                                });
                                                                $(".benCk").change(function () {
                                                                    $.ajax({
                                                                        data: ({
                                                                            'acctId': $("#benAccNum").val()
                                                                        }),
                                                                        url: "../ajax/checkIfAccountExist",
                                                                        dataType: "text",
                                                                        success: function (json) {
                                                                            if (json != null) {
                                                                                if (json == '') {
                                                                                    $("#acctSpan").hide();
                                                                                    $("#acctSpan").text('')
                                                                                    $("#submitBtn").prop('disabled', false);
                                                                                } else {
                                                                                    $("#acctSpan").text(json);
                                                                                    $("#acctSpan").show();
                                                                                    $("#submitBtn").prop('disabled', true);
                                                                                }
                                                                            }
                                                                        }
                                                                    });
                                                                });

                                                                var jvalidate = $("#form1").validate({
                                                                    ignore: [],
                                                                    rules: {
                                                                        benNickName: {
                                                                            required: true,
                                                                            minlength: 2
                                                                        },
                                                                        benName: {
                                                                            minlength: 2,
                                                                            required: true
                                                                        },
                                                                        benAccNum: {
                                                                            required: true
                                                                        },
                                                                        benBank: {
                                                                            minlength: 2,
                                                                            required: true
                                                                        },
                                                                        benBankIFSC: {
                                                                            maxlength: 11,
                                                                            minlength: 11,
                                                                            required: true,
                                                                        }
                                                                    },
                                                                    errorPlacement: function (error, element) {
                                                                        if (element.hasClass('select')) {
                                                                            error.insertAfter(element.next(".bootstrap-select"));
                                                                            element.next("div").addClass("error");
                                                                        } else {
                                                                            error.insertAfter(element);
                                                                        }
                                                                    }
                                                                });
            </script>
    </body>
</html>