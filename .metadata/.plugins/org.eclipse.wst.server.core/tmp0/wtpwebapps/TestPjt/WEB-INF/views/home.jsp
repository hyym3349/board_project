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
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Board_Login</title>

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

	<!-- 로그인 창 시작-->
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
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form class="user" name='homeForm' method="post"
										action="/member/home">
										<c:if test="${member == null}">
											<div class="form-group">
												<input type="text" class="form-control form-control-user"
													id="userId" name="userId" placeholder="ID를 입력하세요...">
											</div>
											<div class="form-group">
												<input type="password"
													class="form-control form-control-user" id="userPass"
													name="userPass" placeholder="비밀번호">
											</div>
											<!-- <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">로그인 유지</label>
                                            </div>
                                        </div> -->
											<c:if test="${msg == false}">
												<p style="color: red;">로그인 실패! 아이디와 비밀번호 확인해주세요.</p>
											</c:if>
											<div class="form-group">
												<button class="btn btn-primary btn-user btn-block"
													type="submit">로그인</button>
											</div>
											<div class="form-group">
												<a href="/member/register"><button
														class="btn btn-info btn-user btn-block" type="button">회원가입</button></a>
											</div>
											<hr>

											<a href="/board/index"
												class="btn btn-facebook btn-user btn-block"> <i
												class="fab -f fa-fw"></i>홈
											</a>
										</c:if>
										<c:if test="${member != null }">
											<div class="form-group">
												<p style="text-align: center;">${member.userName}님환영
													합니다!</p>
												<div class="form-group">
													<button class="btn btn-info btn-user btn-block"
														id="boardList" type="button">게시판</button>
												</div>
												<div class="form-group">
													<button class="btn btn-primary btn-user btn-block"
														id="memberCheckBtn" type="button">회원정보 관리</button>
												</div>

												<button class="btn btn-facebook btn-user btn-block"
													id="logoutBtn" type="button">로그아웃</button>
											</div>
										</c:if>


										<hr>




									</form>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>

		</div>

	</div>
	<!-- 로그인 창 끝-->

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
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="member/register";
		})
		
		$("#memberDeleteBtn").on("click", function(){
			location.href="member/memberDeleteView";
		})
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
		$("#boardList").on("click", function(){
			location.href="board/list";
		})
		$("#memberCheckBtn").on("click", function(){
			location.href="member/memberCheckView";
		})
	})
</script>
</body>

</html>