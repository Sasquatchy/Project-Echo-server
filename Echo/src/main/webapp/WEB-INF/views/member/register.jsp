<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Material Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="/resources/node_modules/mdi/css/materialdesignicons.min.css">
<!-- endinject -->
<!-- plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<link rel="stylesheet" href="/resources/css/style.css">
<!-- endinject -->
<link rel="shortcut icon" href="/resources/images/favicon.png" />

<!-- Custom fonts for this template-->
<link href="/resources/css/all.min.css" rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body>
	<div class="body-wrapper">
		<!-- partial:/resources/partials/_sidebar.html -->
		<aside class="mdc-persistent-drawer mdc-persistent-drawer--open">
			<nav class="mdc-persistent-drawer__drawer">
				<div class="mdc-persistent-drawer__toolbar-spacer">
					<a href="/resources/index.html" class="brand-logo"> <img
						src="/resources/images/logo.svg" alt="logo">
					</a>
				</div>
				<div class="mdc-list-group">
					<nav class="mdc-list mdc-drawer-menu">
						<div class="mdc-list-item mdc-drawer-item">
							<a class="mdc-drawer-link" href="../board/list"> <i
								class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
								aria-hidden="true">grid_on</i> Board
							</a>
						</div>
						<div class="mdc-list-item mdc-drawer-item">
							<a class="mdc-drawer-link" href="../member/list"> <i
								class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
								aria-hidden="true">grid_on</i> Member
							</a>
						</div>

						<div class="mdc-list-group">
							<div class="mdc-list-item mdc-drawer-item">
								<a class="mdc-drawer-link" href="../album/list"> <i
									class="material-icons mdc-list-item__start-detail mdc-drawer-item-icon"
									aria-hidden="true">desktop_mac</i> Album
								</a>
							</div>
							<div class="mdc-list-item mdc-drawer-item"></div>


						</div>
					</nav>
		</aside>
		<!-- partial -->
		<!-- partial:/resources/partials/_navbar.html -->


		<script src="/resources/node_modules/jquery/dist/jquery.min.js"></script>
		<script
			src="/resources/node_modules/material-components-web/dist/material-components-web.min.js"></script>

		<script src="/resources/js/bootstrap.bundle.min.js"></script>

		<!-- partial -->
		<div class="page-wrapper mdc-toolbar-fixed-adjust">
			<main class="content-wrapper">

			<div class="mdc-layout-grid">
				<div class="mdc-layout-grid__inner">
					<div
						class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4">
					</div>
					<div
						class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4">
						<div class="mdc-card">
							<section class="mdc-card__primary bg-white">
								<form class="user" action="/member/register" method="post">
									<div class="mdc-layout-grid">
										<div class="mdc-layout-grid__inner">

											<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<label class="mdc-text-field w-100"> 
												<input type="text" name = 'username' class="mdc-text-field__input" placeholder="User Name">
												 <span class="mdc-text-field__label"> </span>
												 <div class="mdc-text-field__bottom-line"></div>
												</label>
											</div>
											<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<label class="mdc-text-field w-100"> 
												<input type="text" name = 'mobile' class="mdc-text-field__input" placeholder="Mobile Number"> 
												<span class="mdc-text-field__label"></span>
												<div class="mdc-text-field__bottom-line"></div>
												</label>
											</div>
											
											<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<label class="mdc-text-field w-100"> 
												<input type="text" name = 'uid' class="mdc-text-field__input" placeholder="ID">  
												<span class="mdc-text-field__label"></span>
												<div class="mdc-text-field__bottom-line"></div>
												</label>
											</div>
											<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<label class="mdc-text-field w-100">
												<input type="password" name = 'pw' class="mdc-text-field__input" placeholder="Password">  
												<span class="mdc-text-field__label"></span>
												<div class="mdc-text-field__bottom-line"></div>
												</label>
											</div>

											<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<label class="mdc-text-field w-100">
												<input type="text" name = 'check' class="mdc-text-field__input" placeholder="Password Again">  
												<span class="mdc-text-field__label"></span>
												<div class="mdc-text-field__bottom-line"></div>
												</label>
											</div>


											<div
												class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<a class="selo mdc-button mdc-button--raised w-100"
													data-mdc-auto-init="MDCRipple">Register Now</a>
											</div>
											<div
												class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">
												<span> already have an account? login</span>
											</div>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>
					<div
						class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-4">
					</div>
				</div>
			</div>

			</main>
			<!--  췤 -->
			<script>
			var actionForm = $(".user");
			
			
			
			$(".selo").on("click", function(e) {
			 	//userForm = formData()
			 	var pw = $("input[name = 'pw']").val();
			 	var check = $("input[name = 'check']").val();
				 console.log("babo");
				 console.log(pw);
					 
		       if(pw != check){
				 alert("비밀번호가 다릅니다. 다시 확인해 주세요.");
		    	   return;
		       }
		       actionForm.submit();
			}
			);//on end
			 
			</script>
			
			<!-- partial:../../partials/_footer.html -->
			


			<%@include file="../includes/footer.jsp"%>