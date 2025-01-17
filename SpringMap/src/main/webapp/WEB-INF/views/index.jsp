<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!doctype html>
<html lang="en">
<head>
<title>Sidebar 04</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700,800,900"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">


</head>
<body>

	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" class="order-last" class="img"
			style="background-image: url(${pageContext.request.contextPath}/resources/images/bg_1.jpg);">
			<div class="custom-menu">
				<button type="button" id="sidebarCollapse" class="btn btn-primary">
				</button>
			</div>
			<div class="">
				<h1>
					<a href="index.html" class="logo">IF <span>분실물 조회</span></a>
				</h1>
				<ul class="list-unstyled components mb-5">
					<li class="active"><a href="#"><span
							class="fa fa-home mr-3"></span> Home</a></li>
					<li><a href="#"><span class="fa fa-user mr-3"></span>
							About</a></li>
					<li><a href="#"><span class="fa fa-sticky-note mr-3"></span>
							Blog</a></li>
					<li><a href="#"><span class="fa fa-cogs mr-3"></span>
							Services</a></li>
					<li><a href="#"><span class="fa fa-paper-plane mr-3"></span>
							Contacts</a></li>
				</ul>

				<div class="mb-5 px-4">
					<h3 class="h6 mb-3">Subscribe for newsletter</h3>
					<form action="#" class="subscribe-form">
						<div class="form-group d-flex">
							<div class="icon">
								<span class="icon-paper-plane"></span>
							</div>
							<input type="text" class="form-control"
								placeholder="Enter Email Address">
						</div>
					</form>
				</div>
				<div class="footer px-4">
					<p>
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib.com</a>
					</p>
				</div>
			</div>

		</nav>

		<!-- Page Content  -->
		<div id="content" class="p-4 p-md-5 pt-5">
			<h2 class="mb-4">Sidebar #04</h2>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed
				do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut
				enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi
				ut aliquip ex ea commodo consequat. Duis aute irure dolor in
				reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla
				pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
				culpa qui officia deserunt mollit anim id est laborum.</p>
		</div>
	</div>

	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/popper.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/main.js"></script>
</body>
</html>