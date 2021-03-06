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
		<%@include file="../common/topbar.jsp"%>
		<!-- PAGE CONTENT -->
		<div class="page-content">
			<!-- START BREADCRUMB -->
			<ul class="breadcrumb">
				<li><a href="#">Home</a></li>
				<li><a href="#">Add Beneficiary</a></li>
			</ul>
			<!-- END BREADCRUMB -->
			<div class="page-content-wrap">
				<%@include file="../common/message.jsp"%>
				<!-- PAGE TITLE -->
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default"
							style="background: #ffffffde !important;">
							<div class="panel-heading">
								<h3 class="panel-title">Beneficiary</h3>
							</div>

							<div class="panel-body">

								<div class="row">
									<div class="col-md-12">
										<div class="col-md-5">
											<div class="row" style="margin-top: 1%;">
												<div class="col-md-12">
													<form:form cssClass="form-horizontal"
														action="../account/addBeneficiary?${_csrf.parameterName}=${_csrf.token}"
														modelAttribute="beneficiary" method="POST" name="form1"
														id="form1">
														<!--Customer details-->
														<div class="panel panel-default">
															<div class="panel-heading">
																<h3 class="panel-title">
																	<b><i>Add Beneficiary</i></b>
																</h3>
															</div>

															<div class="row" style="margin-top: 15%">
																<div class="form-group">
																	<label class="req col-md-3 control-label">Nick
																		Name</label>
																	<div class="col-md-8 col-xs-12">
																		<form:input path="benNickName" maxlength="100"
																			cssClass="form-control" />
																		<form:hidden path="benType" value="I" />
																		<span class="help-block">Please enter nick name</span>
																	</div>
																</div>
															</div>
															<br />

															<div class="row">
																<div class="form-group">
																	<label class="req col-md-3 control-label">Beneficiary
																		Name</label>
																	<div class="col-md-8 col-xs-12">
																		<form:input path="benName" maxlength="100"
																			cssClass="form-control" />
																		<span class="help-block">Please enter
																			beneficiary name</span>
																	</div>
																</div>
															</div>
															<br />
															<div class="row">
																<div class="form-group">
																	<label class="req col-md-3 control-label">Account
																		Number</label>
																	<div class="col-md-8 col-xs-12">
																		<form:input path="benAccNum" maxlength="20"
																			cssClass="form-control benCk" />
																		<span id="acctSpan" style="color: red; display: none;"></span>
																		<span class="help-block">Please enter account
																			number of beneficiary</span>
																	</div>
																</div>
															</div>
															<br />
															<form:hidden path="benBank" maxlength="100" value="DhanJyothi"
																cssClass="form-control" />
																<form:hidden path="benBankIFSC" maxlength="11" value="DHAN001NG89"
																			cssClass="form-control" />
															<!-- 	<div class="row">
																<div class="form-group">
																	<label class="req col-md-3 control-label">Bank
																		Name</label>
																	<div class="col-md-8 col-xs-12">
																		<form:input path="benBank" maxlength="100"
																			cssClass="form-control" />
																		<span class="help-block">Please enter
																			beneficiary bank name</span>
																	</div>
																</div>
															</div>
															<br />
															<div class="row">
																<div class="form-group">
																	<label class="req col-md-3 control-label">Bank
																		IFSC</label>
																	<div class="col-md-8 col-xs-12">
																		<form:input path="benBankIFSC" maxlength="11"
																			cssClass="form-control" />
																		<span class="help-block">Please enter IFSC of
																			bank</span>
																	</div>
																</div>
															</div>-->
															<br />
															<div class="panel-footer">
																<div class="pull-right">
																	<button id="submitBtn" type="submit"
																		class="btn btn-success">
																		<spring:message code="button.Submit" />
																	</button>
																	<button type="button" name="_cancel"
																		class="btn btn-danger"
																		onclick="document.getElementById('form1').reset();">Reset</button>
																</div>
															</div>
														</div>
													</form:form>
												</div>
											</div>
										</div>
										<dir class="col-md-7" style="margin-top: 0%;">
											<div class="row" style="margin-top: 0.5%;">
												<div class="col-md-12">
													<!--Customer details-->
													<div class="panel panel-default">
														<div class="panel-heading">
															<h3 class="panel-title">
																<b><i>Available Beneficiaries</i></b>
															</h3>
														</div>
														<div class="row">
															<div class="col-md-12 scrollable" style="margin-top: 2%;">
																<table class="table datatable table-bordered">
																	<thead>
																		<tr>
																			<th>Beneficiary Id</th>
																			<th>Beneficiary Account No</th>
																			<th>Beneficiary Name</th>
																			<th>Beneficiary Nick Name</th>
																			<th>Beneficiary Account Type</th>
																			<th>Beneficiary Bank</th>
																			<th>Beneficiary Bank IFSC</th>
																		</tr>
																	</thead>
																	<tbody>
																		<c:forEach items="${beneficiaryList}" var="be">
																			<tr>
																				<td>${be.benId}</td>
																				<td>${be.benAccNum}</td>
																				<td>${be.benName}</td>
																				<td>${be.benNickName}</td>
																				<td>${be.benType}</td>
																				<td>${be.benBank}</td>
																				<td>${be.benBankIFSC}</td>
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
								</div>
							</div>
						</div>
					</div>
				</div>
				<br>
				<form name="form2" id="form2" action="" method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" /> <input type="hidden" id="userId"
						name="userId" />
				</form>
				<!-- END PAGE TITLE -->
				<!-- start of modal -->
				<div class="modal fade" id="modalForm" tabindex="-1" role="dialog"
					aria-labelledby="gridSystemModalLabel">
					<div class="modal-dialog" role="document" style="width: 80%;">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="modalTitle">Open Term Account</h4>
							</div>
							<div class="modal-body">
								<div style="width: 100%;" id="termFormDiv">
									<div class="row">
										<div class="col-md-12">
											<form:form cssClass="form-horizontal"
												action="../account/createTermAccount?${_csrf.parameterName}=${_csrf.token}"
												method="post" modelAttribute="account" name="depForm"
												id="depForm">
												<!--Customer details-->
												<div class="panel panel-default" style="margin-top: 1%;">
													<div class="panel-heading">
														<h3 class="panel-title">
															<b><i>Basic Details</i></b>
														</h3>
													</div>

													<div class="row" style="margin-top: 8%">
														<div class="col-md-6">
															<div class="form-group">
																<label class="req col-md-4 control-label">Deposite
																	Amount</label>
																<div class="col-md-7 col-xs-12">
																	<form:input path="depositeAmount"
																		cssClass="form-control number depAmt" value="1000" />
																	<form:hidden path="acctStatus" value="A" />
																	<form:hidden path="acctType" value="T" />
																	<span id="depAmtMsg" style="color: red; display: none;"></span>
																	<span class="help-block">Please enter deposite
																		amount</span>
																</div>
															</div>
														</div>

														<div class="col-md-6">
															<div class="form-group">
																<label class="req col-md-4 control-label">Deposite
																	Tenure</label>
																<div class="col-md-7 col-xs-12">
																	<form:select path="depositeTenure"
																		cssClass="form-control select depAmt">
																		<c:forEach items="${tenure}" var="map">
																			<option value="${map.key}">${map.value}</option>
																		</c:forEach>
																	</form:select>
																	<span class="help-block">Please select deposite
																		tenure</span>
																</div>
															</div>
														</div>
													</div>
													<br />

													<div class="row" id="intrestMaturityDiv"
														style="display: none;">
														<div class="col-md-6">
															<div class="form-group">
																<label class="req col-md-4 control-label">Interest
																	rate</label>
																<div class="col-md-7 col-xs-12">
																	<form:input path="intRate" readonly="true"
																		cssClass="form-control" />
																	<span class="help-block">Interest rate
																		calculated based on your deposite tenure and amt</span>
																</div>
															</div>
														</div>

														<div class="col-md-6">
															<div class="form-group">
																<label class="req col-md-4 control-label">Maturity
																	Amount</label>
																<div class="col-md-7 col-xs-12">
																	<form:input path="maturityAmt" readonly="true"
																		cssClass="form-control" />
																	<span class="help-block">Maturity amount
																		calculated based on your deposite tenure and amt</span>
																</div>
															</div>
														</div>
													</div>
													<br />
													<div class="modal-footer">
														<button type="submit" id="termSubmitBtn"
															class="btn btn-success">
															<spring:message code="button.Submit" />
														</button>
														<button type="button" class="btn btn-primary"
															data-dismiss="modal">
															<spring:message code="button.Close" />
														</button>
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
			<div class="modal fade" id="tranModal" tabindex="-1" role="dialog"
				aria-labelledby="gridSystemModalLabel">
				<div class="modal-dialog" role="document" style="width: 80%;">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
							<h4 class="modal-title">Transaction Details</h4>
						</div>
						<div class="modal-body">
							<div style="width: 100%;" id="termFormDiv">
								<!-- START FILTER PANEL -->
								<div class="panel panel-warning">
									<div class="panel-body">
										<form name="tranForm" id="transForm">
											<div class="row">
												<div class="col-md-2">
													<div class="form-group">
														<label>Start Date</label> <input name="startDate"
															id="startDate" readonly="true"
															class="form-control datepicker" value="${startDate}" />
													</div>
												</div>
												<div class="col-md-2">
													<div class="form-group">
														<label>End Date</label> <input name="endDate" id="endDate"
															readonly="true" class="form-control datepicker"
															value="${endDate}" />
													</div>
												</div>
												<div class="col-md-2 btn-filter">
													<button type="button" onclick="getTransactions();"
														class="btn-info btn-sm" name="btnSubmit">Go</button>
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
													<th>Transaction Date</th>
													<th>Description</th>
													<th>Debit</th>
													<th>Credit</th>
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
			<!-- start of service request modal -->
		<div class="modal fade" id="ServReqModal" tabindex="-1" role="dialog"
			aria-labelledby="gridSystemModalLabel">
			<div class="modal-dialog" role="document" style="width: 80%;">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="modalTitle">Request Cheque Book</h4>
					</div>
					<div class="modal-body">
						<div style="width: 100%;" id="termFormDiv">
							<div class="row">
								<div class="col-md-12">
									<form class="form-horizontal"
										action="../account/sendServiceRequest?${_csrf.parameterName}=${_csrf.token}"
										method="post" name="form1" id="form1">
										<!--Customer details-->
										<div class="panel panel-default" style="margin-top: 1%;">
											<div class="panel-heading">
												<h3 class="panel-title">
													<b><i>Get Cheque Book</i></b>
												</h3>
											</div>

											<div class="row" style="margin-top: 8%">
												<div class="col-md-6">
													<div class="form-group">
														<label class="req col-md-4 control-label">Cheque
															Book</label>
														<div class="col-md-7 col-xs-12">
															<select id="reqDesc" name="reqDesc"
																class="form-control select">
																<c:forEach items="${chequeReqList}" var="map">
																	<option value="${map.value}">${map.value}</option>
																</c:forEach>
															</select> <span id="depAmtMsg" style="color: red; display: none;"></span>
															<span class="help-block">Please select how many
																leaves cheque book you want</span>
														</div>
													</div>
												</div>
												<div class="col-md-6">
													<div class="form-group">
														<div class="col-md-7 col-xs-12">
															<table class="table-bordered" width="100%">
																<thead>
																	<th>Cheque Book Leaves</th>
																	<th>Price Deduction</th>
																</thead>
																<tbody>
																	<c:forEach items="${chequeReqList}" var="map">
																		<tr>
																			<td>${map.value}</td>
																			<td>${map.key}/-</td>
																		</tr>
																	</c:forEach>
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
											<br />
											<div class="modal-footer">
												<button type="submit" id="termSubmitBtn"
													class="btn btn-success">
													<spring:message code="button.Submit" />
												</button>
												<button type="button" class="btn btn-primary"
													data-dismiss="modal">
													<spring:message code="button.Close" />
												</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- end of service modal -->
		</div>
		<!-- START PAGE CONTAINER -->
	</div>
	<%@include file="../common/script.jsp"%>
	<!-- START THIS PAGE PLUGINS-->
	<script type="text/javascript"
		src="../js/datatables/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="../js/bootstrap/bootstrap-select.js"></script>
	<script type='text/javascript'
		src='../js/jquery-validation/jquery.validate.js'></script>
	<script type="text/javascript"
		src="../js/mcustomscrollbar/jquery.mCustomScrollbar.min.js"></script>
	<script type="text/javascript"
		src="../js/jquery/jquery-dateformat.min.js"></script>
	<!-- END THIS PAGE PLUGINS-->
	<script type="text/javascript">
		$("#submitBtn").prop('disabled', true);
		$(".datepicker").datepicker({
			format : 'dd-mm-yyyy',
			autoclose : true
		});
		$('.table').dataTable({
			"order" : []
		});
		$(".benCk").change();
		$(".benCk").change(function() {
			$.ajax({
				data : ({
					'acctId' : $("#benAccNum").val()
				}),
				url : "../ajax/checkIfAccountExist",
				dataType : "text",
				success : function(json) {
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
			ignore : [],
			rules : {
				benNickName : {
					required : true,
					minlength : 2
				},
				benName : {
					minlength : 2,
					required : true
				},
				benAccNum : {
					required : true
				},
				benBank : {
					minlength : 2,
					required : true
				},
				benBankIFSC : {
					maxlength : 11,
					minlength : 11,
					required : true,
				}
			},
			errorPlacement : function(error, element) {
				if (element.hasClass('select')) {
					error.insertAfter(element.next(".bootstrap-select"));
					element.next("div").addClass("error");
				} else {
					error.insertAfter(element);
				}
			}
		});

		$(".depAmt")
				.change(
						function() {
							var depAmount = $("#depositeAmount").val();
							var tenure = $("#depositeTenure").val();
							var actualBal = $
							{
								savingAccount.acctBalance
							}
							;
							if ($.isNumeric(depAmount)) {
								if (depAmount >= 1000 && depAmount <= 10000000) {
									if (depAmount > actualBal) {
										$("#depAmtMsg")
												.text(
														"You have insufficient account balance");
										$("#depAmtMsg").show();
										$("#termSubmitBtn").prop('disabled',
												true);
									} else {
										getIntValueAndMaturityAmt(depAmount,
												tenure)
										$("#depAmtMsg").hide();
										$("#termSubmitBtn").prop('disabled',
												false);
									}
								} else {
									$("#depAmtMsg")
											.text(
													"Please enter amount between 1000 and 1,00,00,000");
									$("#depAmtMsg").show();
									$("#termSubmitBtn").prop('disabled', true);
								}

							} else {
								$("#depAmtMsg")
										.text(
												"Please enter amount between 1000 and 1,00,00,000");
								$("#depAmtMsg").show();
								$("#termSubmitBtn").prop('disabled', true);
							}
						});
		function getIntValueAndMaturityAmt(depAmt, tenure) {
			$.ajax({
				data : ({
					'depAmt' : depAmt,
					'tenure' : tenure
				}),
				url : "../ajax/calculateInterestAndMatAmount",
				dataType : "json",
				success : function(json) {
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

		var jvalidate = $("#transForm").validate({
			ignore : [],
			rules : {
				depositeAmount : {
					required : true
				}
			},
			errorPlacement : function(error, element) {
				if (element.hasClass('select')) {
					error.insertAfter(element.next(".bootstrap-select"));
					element.next("div").addClass("error");
				} else {
					error.insertAfter(element);
				}
			}
		});
		function getTransactions() {
			$
					.ajax({
						data : ({
							'startDate' : $("#startDate").val(),
							'endDate' : $("#endDate").val()
						}),
						url : "../ajax/getAccountTransactions",
						dataType : "json",
						success : function(json) {
							if (json != null) {
								var table = $('#transTable').DataTable();
								table.clear().draw();
								for (var i = 0; i < json.length; i++) {
									var tds = [
											$.format.date(json[i].tranDtTime,
													'dd-MM-yyyy HH:mm'),
											json[i].tranDesc,
											(json[i].tranType == 'Debit') ? json[i].tranAmt
													: '-',
											(json[i].tranType == 'Credit') ? json[i].tranAmt
													: '-' ];
									table.row.add(tds).draw();
								}
							}
						}
					});
		}

		var jvalidate = $("#depForm").validate({
			ignore : [],
			rules : {
				depositeAmount : {
					required : true
				}
			},
			errorPlacement : function(error, element) {
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