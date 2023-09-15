<!--A Design by W3layouts
Author: W3layout
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tg" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE HTML>
<html>

<head>

<title>Hydra Gaming Store</title>
<link
	href="${pageContext.request.contextPath }/resources/user/css/style.css"
	rel="stylesheet" type="text/css" media="all" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/user/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/user/js/easyResponsiveTabs.js"
	type="text/javascript"></script>
<script
	src="${pageContext.request.contextPath }/resources/user/js/login.js"></script>
<script
	src="${pageContext.request.contextPath }/resources/user/js/register.js"></script>
<link href='http://fonts.googleapis.com/css?family=Droid+Sans'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>
<!-- the jScrollPane script -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/user/js/jquery.easing.1.3.js"></script>
<!-- the jScrollPane script -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/user/js/jquery.mousewheel.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/user/js/jquery.contentcarousel.js"></script>
</head>
<script>
	function err() {
		alert("Unknow Username or Password");
	}
	function success() {
		alert("Successful");
	}
	function account() {
		alert("Please Login");
	}
</script>
<body onload="${err=='err'?'err()':success=='success'?'success()':''}">
	<div class="header">
		<div class="wrap">
			<div class="header-top">
				<div class="header-left">
					<div class="logo">
						<a href="index.html"><img
							src="${pageContext.request.contextPath }/resources/user/images/logo.png"
							alt="" /></a>
					</div>
					<div class="cssmenu">
						<ul>
							<li class="active"><a
								href="${pageContext.request.contextPath }/home/index"><span>Home</span></a></li>
							<li><a
								href="${pageContext.request.contextPath }/products/1/page/0"><span>Products</span></a></li>
							<li><a href="${pageContext.request.contextPath }/aboutus"><span>About
										Us</span></a></li>

							<li class="last"><a
								href="${pageContext.request.contextPath }/contactus"><span>Contact
										Us</span></a></li>

							<div class="clear"></div>
						</ul>
					</div>
				</div>

				<div class="header-right">
					<div
						style="color: white;opacity:${sessionScope.account.username!=null?'1':'0'} ">
						${account.username }</div>
					<div id="loginContainer"
						style="opacity: ${sessionScope.account.username!=null?'1':'0'}">
						<span>Logout</span><a id="logoutButton"
							href="${pageContext.request.contextPath }/home/logout"><img
							src="${pageContext.request.contextPath }/resources/user/images/plus.png"
							alt="" /></a>
					</div>
					<div id="loginContainer"
						style="opacity: ${sessionScope.account.username!=null?'0':'1'}">
						<span>Login</span><a id="loginButton"><img
							src="${pageContext.request.contextPath }/resources/user/images/plus.png"
							alt="" /></a>
						<div id="loginBox">
							<form id="loginForm"
								action="${pageContext.request.contextPath }/home/login"
								method="get">
								<div>
									<span><label>Username</label></span> <span><input
										name="username" type="text" class="textbox"></span>
								</div>
								<div>
									<span><label>Password</label></span> <span><input
										name="password" type="password" class="textbox"></span>
								</div>
								<div>
									<span><input type="submit" value="Login"></span>

								</div>
							</form>
						</div>
					</div>

					<div id="registerContainer"
						style="opacity: ${sessionScope.account.username!=null?'0':'1'}">
						<span>Register</span><a id="registerButton"><img
							src="${pageContext.request.contextPath }/resources/user/images/plus.png"
							alt="" /></a>
						<div id="registerBox">

							<form id="registerForm"
								action="${pageContext.request.contextPath }/home/register">

								<div>
									<span><label>Username</label></span> <span><input
										name="username" type="text" class="textbox"></span>
								</div>
								<div>
									<span><label>Password</label></span> <span><input
										name="password" type="password" class="textbox"></span>
								</div>
								<div>
									<span><label>Fullname</label></span> <span><input
										name="fullname" type="text" class="textbox"></span>
								</div>
								<div>
									<span><label>Gender</label></span> <span><input
										name="gender" type="radio" value="Male" class="textbox">Male</span><span><input
										name="gender" type="radio" value="Female" class="textbox">Female</span>
								</div>
								<div>
									<span><label>Birthday</label></span> <span><input
										name="birthday" type="text" class="textbox"></span>
								</div>
								<div>
									<span><input type="submit" value="Register"></span>

								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header-bottom">
				<ul class="follow_icon">
					<li><a href="#" style="opacity: 1;"><img
							src="${pageContext.request.contextPath }/resources/user/images/fb.png"
							alt=""></a></li>
					<li><a href="#" style="opacity: 1;"><img
							src="${pageContext.request.contextPath }/resources/user/images/tw.png"
							alt=""></a></li>
					<li><a href="#" style="opacity: 1;"><img
							src="${pageContext.request.contextPath }/resources/user/images/rss.png"
							alt=""></a></li>
				</ul>
				<div class="banner-img"></div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<tiles:insertAttribute name="content"></tiles:insertAttribute>
	<div class="footer">
		<div class="wrap">
			<div class="bottom-content">
				<div class="col_1_of_footer span_1_of_footer">
					<div class="footer-logo">
						<a href="index.html"><img
							src="${pageContext.request.contextPath }/resources/user/${pageContext.request.contextPath }/resources/user/images/logo.png"
							alt="" /></a>
					</div>
					<div class="footer-border">
						<p>USE THESE WAYS TO CONTACT WITH US</p>
						<ul class="footer_icon">
							<li><a href="#" style="opacity: 1;"><img
									src="${pageContext.request.contextPath }/resources/user/images/fb.png"
									alt=""></a></li>
							<li><a href="#" style="opacity: 1;"><img
									src="${pageContext.request.contextPath }/resources/user/images/tw.png"
									alt=""></a></li>
							<li><a href="#" style="opacity: 1;"><img
									src="${pageContext.request.contextPath }/resources/user/images/rss.png"
									alt=""></a></li>
						</ul>
					</div>
				</div>
				<div class="col_1_of_footer span_1_of_footer1">
					<div class="col_1_of_footer span_1_of_footer">
						<div class="sidebar-nav">
							<div class="footer-middle-right">
								<h4>Pump Psd</h4>
								<ul>
									<li><a
										href="${pageContext.request.contextPath }/home/index">Home</a></li>
									<li><a
										href="${pageContext.request.contextPath }/products/1/page/0">Products</a></li>
									<li><a href="${pageContext.request.contextPath }/aboutus">About
											Us</a></li>

									<li><a
										href="${pageContext.request.contextPath }/contactus">Contact
											Us</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col_1_of_footer span_1_of_footer">
						<div class="sidebar-nav1">
							<div class="footer-right">
								<h4>About Us</h4>
								<ul>
									<li><a href="">Supporters</a></li>
									<li><a href="">Design</a></li>
									<li><a href="">Our Team</a></li>
									<li><a href="">Shoe Blog</a></li>
									<li><a href="">RSS</a></li>
									<li><a href="">Twitter</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="copy">
				<p class="copy">
					© 2019 Designed by <a style="color: red">Hydra Gaming Store</a>
				</p>
			</div>
		</div>
	</div>
</body>

</html>