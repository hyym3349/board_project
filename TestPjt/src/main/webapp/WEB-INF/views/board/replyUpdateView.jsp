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

<title>Reply_Update</title>

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
										<h1 class="h4 text-gray-900 mb-4">댓글 수정</h1>
									</div>
									<form id="updateForm" name="updateForm" method="post">
										<input type="hidden" name="bno" value="${replyUpdate.bno}"
											readonly="readonly" /> <input type="hidden" id="rno"
											name="rno" value="${replyUpdate.rno}" /> <input
											type="hidden" id="page" name="page" value="${scri.page}">
										<input type="hidden" id="perPageNum" name="perPageNum"
											value="${scri.perPageNum}"> <input type="hidden"
											id="searchType" name="searchType" value="${scri.searchType}">
										<input type="hidden" id="keyword" name="keyword"
											value="${scri.keyword}">

										<div class="form-group">
											<label for="userno" class="col-sm-3 control-label">작성자</label>
											<label for="userno" class="form-control"
												style="border: 1px solid; padding: 10px; border-radius: 10px; background-color: #eaecf4; border-color: #d1d3e2">${member.userName}</label>
											<input type="hidden" id="userno" name="userno"
												value="${member.userNo}" />

										</div>

										<div class="form-group">
											<label for="content" class="col-sm-4 control-label">댓글
												내용</label>
											<textarea placeholder="수정할 내용을 입력해주세요" maxlength="500"
												class="form-control content" name="content" id="content"
												rows="10" cols="36">${replyUpdate.content}</textarea>
											<span style="color: #aaa;" id="counter">(0 / 최대 500자)</span>
										</div>




										<div>
											<button type="button" onclick="validateForm()"
												class="btn btn-outline-primary">저장</button>
											<button type="button"
												class="cancel_btn btn btn-outline-primary">취소</button>
										</div>
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
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

	<script type="text/javascript">
	function validateForm(){
		
	var form = document.updateForm;
	
	if(form.content.value.length == 0){
		Swal.fire("내용을 입력하세요","","warning");
		return false;
	}
	  var formObj = $("form[name='updateForm']");
	  formObj.attr("action", "/board/replyUpdate");
	  formObj.submit();
	}
	</script>

	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel_btn").on("click", function(){
				location.href = "/board/readView?bno=${replyUpdate.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
		})
		</script>
	<script>
	//서류사항 textarea 체크
	$('.content').keyup(function (e){
	    var content = $(this).val();
	    $('#counter').html("("+content.length+" / 최대 500자)");    //글자수 실시간 카운팅

	    if (content.length > 500){
	        Swal.fire("500자까지 입력 가능합니다.","","info");
	        $(this).val(content.substring(0, 500));
	        $('#counter').html("(500 / 최대 500자)");
	    }
	});
	
	</script>

</body>

	</html>
</c:if>
<c:if test="${member.userId == null}">
	<script>
location.href = "/home";
</script>
</c:if>