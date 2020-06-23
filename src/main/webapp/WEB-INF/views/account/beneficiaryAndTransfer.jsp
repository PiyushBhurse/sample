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
                                    <h3 class="panel-title">Add Beneficiary</h3>
                                </div>



                                <div class="panel-body">
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
                <!-- start of modal -->
                <div class="modal fade" id="modalForm" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document" style="width:80%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="modalTitle">Open Term Account</h4>
                            </div>
                            <div class="modal-body">
                                <div style="width: 100%;" id="termFormDiv">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <form 
                                                <form:form cssClass="form-horizontal" action="../account/createTermAccount?${_csrf.parameterName}=${_csrf.token}" method="post" modelAttribute="account" name="form1" id="form1">
                                                    <!--Customer details-->
                                                    <div class="panel panel-default" style="margin-top: 1%;">
                                                        <div class="panel-heading">
                                                            <h3 class="panel-title"><b><i>Basic Details</i></b></h3>
                                                        </div>

                                                        <div class="row" style="margin-top: 8%">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="req col-md-4 control-label">Deposite Amount</label>
                                                                    <div class="col-md-7 col-xs-12">
                                                                        <form:input path="depositeAmount" cssClass="form-control number depAmt" value="1000"/>
                                                                        <form:hidden path="acctStatus" value="A"/>
                                                                        <form:hidden path="acctType" value="T"/>
                                                                        <span id="depAmtMsg" style="color: red;display: none;"></span>
                                                                        <span class="help-block">Please enter deposite amount</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="req col-md-4 control-label">Deposite Tenure</label>
                                                                    <div class="col-md-7 col-xs-12">
                                                                        <form:select path="depositeTenure" cssClass="form-control select depAmt"> 
                                                                            <c:forEach items="${tenure}" var="map">
                                                                                <option value="${map.key}">${map.value}</option>
                                                                            </c:forEach>
                                                                        </form:select>
                                                                        <span class="help-block">Please select deposite tenure</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div><br/>

                                                        <div class="row"  id="intrestMaturityDiv" style="display: none;">
                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="req col-md-4 control-label">Interest rate</label>
                                                                    <div class="col-md-7 col-xs-12">
                                                                        <form:input path="intRate" readonly="true" cssClass="form-control"/>
                                                                        <span class="help-block">Interest rate calculated based on your deposite tenure and amt</span>
                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <div class="col-md-6">
                                                                <div class="form-group">
                                                                    <label class="req col-md-4 control-label">Maturity Amount</label>
                                                                    <div class="col-md-7 col-xs-12">
                                                                        <form:input path="maturityAmt" readonly="true" cssClass="form-control"/>
                                                                        <span class="help-block">Maturity amount calculated based on your deposite tenure and amt</span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div><br/>
                                                        <div class="modal-footer">
                                                            <button type="submit" class="btn btn-success"><spring:message code="button.Submit"/></button>
                                                            <button type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="button.Close"/></button>
                                                        </div>
                                                    </form:form>
                                                </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of modal -->
                <!-- start of transaction modal -->
                <div class="modal fade" id="tranModal" tabindex="-1" role="dialog" aria-labelledby="gridSystemModalLabel">
                    <div class="modal-dialog" role="document" style="width:80%;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" >Transaction Details</h4>
                            </div>
                            <div class="modal-body">
                                <div style="width: 100%;" id="termFormDiv">
                                    <!-- START FILTER PANEL -->
                                    <div class="panel panel-warning">
                                        <div class="panel-body">
                                            <form name="tranForm" id="tranForm">
                                                <div class="row">
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <label>Start Date</label>
                                                            <input name="startDate" id="startDate" readonly="true" class="form-control datepicker" value="${startDate}"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2">
                                                        <div class="form-group">
                                                            <label>End Date</label>
                                                            <input name="endDate" id="endDate" readonly="true" class="form-control datepicker" value="${endDate}"/>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-2 btn-filter">
                                                        <button type="button" onclick="getTransactions();"  class="btn-info btn-sm" name="btnSubmit">Go</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- END FILTER PANEL -->

                                    <div class="row">
                                        <div class="col-md-12 scrollable">
                                            <table class="table table-bordered" id="transTable">
                                                <thead>
                                                    <tr>
                                                        <th>Transaction Id</th>
                                                        <th>Transaction Desc</th>
                                                        <th>Transaction Type</th>
                                                        <th>Transaction Amount</th>
                                                        <th>Transaction Date</th>
                                                        <th>Transfered to</th>
                                                    </tr>
                                                </thead>
                                                <tbody id="transtablebody">

                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end of transaction modal -->
            </div>
            <!-- START PAGE CONTAINER -->
        </div>
        <%@include file="../common/script.jsp"%>
        <!-- START THIS PAGE PLUGINS-->        
        <script type="text/javascript" src="../js/datatables/jquery.dataTables.min.js"></script> 
        <script type="text/javascript" src="../js/bootstrap/bootstrap-select.js"></script>
        <script type='text/javascript' src='../js/jquery-validation/jquery.validate.js'></script>
        <script type="text/javascript" src="../js/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
        <script type="text/javascript" src="../js/jquery/jquery-dateformat.min.js"></script>
        <!-- END THIS PAGE PLUGINS-->        
        <script type="text/javascript">
                                                            $('.table').dataTable({
                                                                "order": []
                                                            });
                                                            $(".datepicker").datepicker({format: 'dd-mm-yyyy', autoclose: true});
                                                            $('#user td').click(function () {
                                                                $('#userId').val($(this).parent().data("user-id"));
                                                                $('#form2').prop('action', '../customer/activateCustomer');
                                                                $('#form2').submit();
                                                            });
                                                            $(".depAmt").change(function () {
                                                                var depAmount = $("#depositeAmount").val();
                                                                var tenure = $("#depositeTenure").val();
                                                                var actualBal = ${savingAccount.acctBalance};
                                                                if ($.isNumeric(depAmount)) {
                                                                    if (depAmount >= 1000 && depAmount <= 10000000) {
                                                                        if (depAmount > actualBal) {
                                                                            $("#depAmtMsg").text("You have insufficient account balance");
                                                                            $("#depAmtMsg").show();
                                                                        } else {
                                                                            getIntValueAndMaturityAmt(depAmount, tenure)
                                                                            $("#depAmtMsg").hide();
                                                                        }
                                                                    } else {
                                                                        $("#depAmtMsg").text("Please enter amount between 1000 and 1,00,00,000");
                                                                        $("#depAmtMsg").show();
                                                                    }

                                                                } else {
                                                                    $("#depAmtMsg").text("Please enter amount between 1000 and 1,00,00,000");
                                                                    $("#depAmtMsg").show();
                                                                }
                                                            });
                                                            function getIntValueAndMaturityAmt(depAmt, tenure) {
                                                                $.ajax({
                                                                    data: ({
                                                                        'depAmt': depAmt,
                                                                        'tenure': tenure
                                                                    }),
                                                                    url: "../ajax/calculateInterestAndMatAmount",
                                                                    dataType: "json",
                                                                    success: function (json) {
                                                                        if (json != null) {
                                                                            $("#intRate").val(json.intRate);
                                                                            $("#maturityAmt").val(json.maturityAmt);
                                                                            $("#intrestMaturityDiv").show();
                                                                        } else {
                                                                            $("#intrestMaturityDiv").hide()();
                                                                        }
                                                                    }
                                                                });
                                                            }

                                                            var jvalidate = $("#form1").validate({
                                                                ignore: [],
                                                                rules: {
                                                                    depositeAmount: {
                                                                        required: true
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
                                                            function getTransactions() {
                                                                $.ajax({
                                                                    data: ({
                                                                        'startDate': $("#startDate").val(),
                                                                        'endDate': $("#endDate").val()
                                                                    }),
                                                                    url: "../ajax/getAccountTransactions",
                                                                    dataType: "json",
                                                                    success: function (json) {
                                                                        if (json != null) {
                                                                            var table = $('#transTable').DataTable();
                                                                            table.clear().draw();
                                                                            for (var i = 0; i < json.length; i++) {
                                                                                var tds = [json[i].tranId, json[i].tranDesc, json[i].tranType, json[i].tranAmt, $.format.date(json[i].tranDtTime, 'dd-MM-yyyy HH:mm'), ((json[i].beneficiaries == null) ? '-' : 'beni')];
                                                                                table.row.add(tds).draw();
                                                                            }
                                                                        }
                                                                    }
                                                                });
                                                            }

                                                            var jvalidate = $("#form1").validate({
                                                                ignore: [],
                                                                rules: {
                                                                    depositeAmount: {
                                                                        required: true
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