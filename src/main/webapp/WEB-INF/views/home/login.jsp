<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="../common/meta.jsp"%>
<link rel="stylesheet" type="text/css" href="../css/style.css" />
<title>Login</title>
</head>
<body>
	<h1></h1>

	<div class="form-w3ls">
		<ul class="tab-group cl-effect-4">
			<li class="tab active"><a href="#signin-agile">Sign In</a></li>
			<!--<li class="tab"><a href="#signup-agile">Sign Up</a></li>-->
		</ul>
		<div class="tab-content">
			<div id="signin-agile">
				<form method="post">
					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<p class="header">User Name</p>
					<input type="text" name="username" id="username"
						placeholder="User Name" required="required">

					<p class="header">Password</p>
					<input type="password" name="password" id="password"
						placeholder="Password" required="required"> <label
						for="brand"><span></span> Don't have account? <a
						href="../home/signup">sign-up here</a></label>

					<c:if test="${param.error != null}">
						<br />
						<br />
                            # <span style="color: red"
							class="text-danger">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</span>
					</c:if>
					<%@include file="../common/message.jsp"%>
					<button type="submit" class="sign-in">Sign In</button>
				</form>

			</div>
			<div id="signup-agile">
				<form action="#" method="post">

					<p class="header">User Name</p>
					<input type="text" name="user" placeholder="Your Full Name"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {
                                    this.value = 'Your Full Name';
                                }"
						required="required">

					<p class="header">Email Address</p>
					<input type="email" name="email" placeholder="Email"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {
                                    this.value = 'Email';
                                }"
						required="required">

					<p class="header">Password</p>
					<input type="password" name="password" placeholder="Password"
						onfocus="this.value = '';"
						onblur="if (this.value == '') {
                                    this.value = 'Password';
                                }"
						required="required">

					<p class="header">Confirm Password</p>
					<input type="password" name="password"
						placeholder="Confirm Password" onfocus="this.value = '';"
						onblur="if (this.value == '') {
                                    this.value = 'Confirm Password';
                                }"
						required="required"> <input type="submit" class="register"
						value="Sign up">
				</form>

			</div>
		</div>
		<!-- tab-content -->
	</div>
	<!-- /form -->
	<p class="copyright">
		Design by piyush.bhurse@hcl.com<a href=""></a>
	</p>
	<!-- js files -->
	<script src='js/jquery.min.js'></script>
	<script src="js/index.js"></script>
	<!-- /js files -->
</body>
</html>
</body>
</html>