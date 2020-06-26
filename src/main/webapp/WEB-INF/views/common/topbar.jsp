<style>
.navbar, .dropdown-menu {
	background: rgba(255, 255, 255, 0.25);
	border: none;
}

.nav>li>a, .dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover,
	.dropdown-menu>li>a, .dropdown-menu>li {
	border-bottom: 3px solid transparent;
}

.nav>li>a:focus, .nav>li>a:hover, .nav .open>a, .nav .open>a:focus, .nav .open>a:hover,
	.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {
	border-bottom: 3px solid transparent;
	/*background: none;*/
	background: #333;
}

.navbar a, .dropdown-menu>li>a, .dropdown-menu>li>a:focus,
	.dropdown-menu>li>a:hover, .navbar-toggle {
	color: #fff;
}

.dropdown-menu {
	-webkit-box-shadow: none;
	box-shadow: none;
}

.navbar-toggle .icon-bar {
	color: #fff;
	background: #fff;
}

.dropdown-toggle {
	background: #1D2127;
}

.navbar-nav>li>.dropdown-menu {
	margin-top: 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	background: #1D2127;
}

.datepicker {
	background: white;
}
</style>

<!-- START X-NAVIGATION VERTICAL -->
<div>
	<ul class="x-navigation x-navigation-horizontal x-navigation-panel">
		<li class="xn-titleText"><spring:message code="appName" />
			&nbsp;&nbsp;&nbsp;</span></li>
		<!-- SIGN OUT -->
		<li class="pull-right"><a href="#" class="mb-control"
			onclick="formSubmit()">Logout <span class="fa fa-sign-out"></span></a>
		</li>
		<li class="pull-right" style="margin-top: 1%; margin-left: 15px;">
			<span class="mb-control"
			style="color: white; text-align: center; font-size: medium;">&nbsp;|</span>
		</li>
		<li class="pull-right" style="margin-top: 1%;"><span
			class="mb-control"
			style="color: white; text-align: center; font-size: medium;">
				Welcome ${curUser.user.firstName} ${curUser.user.lastName}</span></li>
		<!-- END SIGN OUT -->
	</ul>
</div>
<!-- END X-NAVIGATION VERTICAL -->
<c:if test="${curUser.user.userRole eq 'C'.charAt(0)}">
	<div>
		<div class="navbar-wrapper">
			<div class="container-fluid" style="padding: 0; margin: 0;">
				<nav class="navbar" style="background: #1D2127; margin-top: 3.7%;">
					<!--<nav class="navbar navbar-fixed-top" style="margin-top: 3.7%;background: #1D2127;padding-top: 0px;padding-bottom: 1px;">-->
					<div class="container" style="width: 100%; padding: 0;">
						<div id="navbar" class="navbar-collapse collapse">
							<ul class="nav navbar-nav">
								<li class=""><a href="../home/index" class="">Home</a></li>
								<li class=" dropdown"><a href="#" class="dropdown-toggle "
									data-toggle="dropdown" role="button" aria-haspopup="true"
									aria-expanded="false">Accounts<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<c:choose>
											<c:when test="${savingAccount.acctBalance ==0}">
												<li class=" dropdown"><a
													href="../account/createSavingsAccount">Open Saving
														Account</a></li>
											</c:when>
											<c:otherwise>
												<li><a href="#"
													onclick="$('.depAmt').change();$('#modalForm').modal('show');">Open
														Term Account</a></li>
											</c:otherwise>
										</c:choose>
									</ul></li>
								<c:if test="${savingAccount.acctBalance !=0}">
									<li><a href="#" class="dropdown-toggle "
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">Fund Transfer<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li class=" dropdown"><a
												href="../account/beneficiaryAdd">Add Beneficiary</a></li>
											<li><a href="../account/transferFunds">Transfer
													Funds</a></li>
										</ul></li>
									<li><a href="#" class="dropdown-toggle "
										data-toggle="dropdown" role="button" aria-haspopup="true"
										aria-expanded="false">Service Request<span class="caret"></span></a>
										<ul class="dropdown-menu">
											<li><a onclick="$('#tranModal').modal('show');">Account
													Statements</a></li>
											<li><a onclick="$('#ServReqModal').modal('show');">Cheque
													Book Request</a></li>
										</ul></li>


								</c:if>
							</ul>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
</c:if>
<form action="../logout" method="post" id="logoutForm">
	<input type="hidden" name="${_csrf.parameterName}"
		value="${_csrf.token}" />
</form>
<script>
	function formSubmit() {
		document.getElementById("logoutForm").submit();
	}
</script>
