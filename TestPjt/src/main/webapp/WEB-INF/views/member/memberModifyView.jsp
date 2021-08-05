<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0); 
response.setHeader("Cache-Control", "no-cache");
%>
<!DOCTYPE html>
<c:if test="${member.userId != null}">
	<html lang="en">

<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Board_memberCheck</title>

<!-- Custom fonts for this template-->
<link href="/resources/boot/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="/resources/boot/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

	<!-- 탈퇴 창 시작-->
	<div class="container">

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">회원 관리</h1>
									</div>
									<form class="user">

										<div class="form-group">
											<button class="btn btn-primary btn-user btn-block"
												id="memberUpdateBtn" type="button">회원정보수정</button>
										</div>
										<div class="form-group">
											<button class="btn btn-google btn-user btn-block"
												id="memberDeleteBtn" type="button">회원탈퇴</button>
										</div>
										<div class="form-group">
											<button class="btn btn-info btn-user btn-block"
												id="memberPassBtn" type="button">비밀번호변경</button>
										</div>
										<div class="form-group">
											<button class="btn btn-primary btn-user btn-block"
												id="homeBtn" type="button">홈</button>
										</div>
									</form>
									<div></div>

								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- 탈퇴 창 끝-->

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/boot/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/boot/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/boot/js/sb-admin-2.min.js"></script>


	<script type="text/javascript">
	$(document).ready(function(){
		
		
		$("#memberDeleteBtn").on("click", function(){
			location.href="/member/memberDeleteView";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="/member/memberUpdateView";
		})
		$("#memberPassBtn").on("click", function(){
			location.href="/member/memberPassView";
		})
		$("#homeBtn").on("click", function(){
			location.href="/home";
		})

	})
</script>
</body>

	</html>
</c:if>
<c:if test="${member.userId == null}">
	<script>
location.href = "/home";
</script>
</c:if>