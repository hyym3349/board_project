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
	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Board_memberDelete</title>

    <!-- Custom fonts for this template-->
    <link href="/resources/boot/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/boot/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

<!-- 업데이트 창 시작-->
    <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                    <div class="col-lg-7">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">회원 정보 수정</h1>
                            </div>
                            <form class="user" action="/member/memberUpdate" method="post">
  								<div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label class="control-label" for="userId">아이디</label>
                                        <input type="text" class="form-control form-control-user" maxlength="15" id="userId" name="userId"
                                            placeholder="ID" value="${member.userId}" readonly="readonly">
                                    </div>
                                    <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label class="control-label" for="Password">비밀번호</label>
                                        <input type="password" class="form-control form-control-user"
                                             maxlength="20" id="userPass" name="userPass" placeholder="Password">
                                    </div>
                                    <div class="col-sm-6">
                                    <label class="control-label" for="userPass2">비밀번호 확인</label>
                                        <input type="password" class="form-control form-control-user"
                                            maxlength="20" id="userPass2" name="userPass2" onchange="passchk()" placeholder="Repeat Password">
                                    </div>
                                </div>

                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label class="control-label" for="userName">이름</label>
                                        <input type="text" class="form-control form-control-user" maxlength="12" id="userName" name="userName"
                                            placeholder="Name" value="${member.userName}">
                                    </div>
                                    <div class="col-sm-6">
                                    <label class="control-label" for="userNick">닉네임</label>
                                        <input type="text" class="form-control form-control-user" maxlength="12" id="userNick" name="userNick"
                                            placeholder="NickName" value="${member.userNick}">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                    <label class="control-label" for="userTell">전화번호</label>
                                        <input type="text" class="form-control form-control-user" maxlength="13" id="userTell" name="userTell"
                                            placeholder="Tell" value="${member.userTell}">
                                    </div>
                                    <div class="col-sm-6">
                                    <label class="control-label" for="userBirth">생년월일</label>
                                        <input type="text" class="form-control form-control-user" maxlength="8" id="userBirth" name="userBirth"
                                            placeholder="Birth ex) 19991201" value="${member.userBirth}">
                                    </div>
                                </div>
                                <div class="form-group">
                                <label class="control-label" for="userEmail">이메일</label>
                                    <input type="email" class="form-control form-control-user" maxlength="20" id="userEmail" name="userEmail"
                                        placeholder="Email Address" value="${member.userEmail}">
                                </div>
                                
                                
 								<div class="form-group row">
 									<div class="col-sm-6 mb-3 mb-sm-0">	
										<label class="box-radio-input"><input type="radio" name="userGender" value="M" checked="checked"><span>남자</span></label>
								</div>
									<div class="col-sm-6">
                    					<label class="box-radio-input"><input type="radio" name="userGender" value="F" ><span>여자</span></label>
                    				</div>
								</div>
								
                                <button class="btn btn-primary btn-user btn-block" type="submit" id="submit">회원정보수정</button>
                                <hr>
                                <a href="/home" class="btn btn-google btn-user btn-block">
                                    <i class="fab  fa-fw"></i> 취소
                                </a>
                                <a href="/board/list" class="btn btn-facebook btn-user btn-block">
                                    <i class="fab -f fa-fw"></i> 게시판
                                </a>
                            </form>
                            <hr>
                            <div class="text-center">
                                <!-- <a class="small" href="forgot-password.html">Forgot Password?</a> -->
                            </div>
                            <div class="text-center">
                                <a class="small" href="/home">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
<!-- 업데이트 창 끝-->

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/boot/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/boot/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/boot/js/sb-admin-2.min.js"></script>

		<script type="text/javascript">
   		function goBack(){
     	 window.history.back();
   		}
	</script>
		<style>
	.box-radio-input input[type="radio"]{
  display:none;
}

.box-radio-input input[type="radio"] + span{
  background:none;
  border:1px solid #dfdfdf;  
  text-align:center;
  height:35px;
  line-height:33px;
  font-weight:500;
  cursor:pointer;
  font-size: .8rem;
    border-radius: 10rem;
    padding: .75rem 1rem;
    width: 100%;
}

.box-radio-input input[type="radio"]:checked + span{
	color: #fff;
    background-color: #4e73df;
    border-color: #4e73df;
    font-size: .8rem;
    border-radius: 10rem;
    padding: .75rem 1rem;
    width: 100%;
}
	</style>
		<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userPass").val()==""){
					Swal.fire("비밀번호를 입력해주세요.","","warning");
					$("#userPass").focus();
					return false;
				}
				if($("#userPass").val().length <= 5){
					Swal.fire("패스워드 6글자 이상으로 입력!","","warning");
					$("#userPass").focus();
					return false;
				}
				if($("#userPass2").val()==""){
					Swal.fire("비밀번호확인을 입력해주세요.","","warning");
					$("#userPass2").focus();
					return false;
				}
				if($("#userPass2").val().length <= 5){
					Swal.fire("패스워드확인 6글자 이상으로 입력!","","warning");
					$("#userPass2").focus();
					return false;
				}
				if($("#userName").val()==""){
					Swal.fire("성명을 입력해주세요.","","warning");
					$("#userName").focus();
					return false;
				}
				if($("#userNick").val()==""){
					Swal.fire("닉네임을 입력해주세요.","","warning");
					$("#userNick").focus();
					return false;
				}
				if($("#userTell").val()==""){
					Swal.fire("전화번호를 입력해주세요.","","warning");
					$("#userTell").focus();
					return false;
				}
				if($("#userBirth").val()==""){
					Swal.fire("생년월일을 입력해주세요.","","warning");
					$("#userBirth").focus();
					return false;
				}
				if($("#userEmail").val()==""){
					Swal.fire("이메일을 입력해주세요.","","warning");
					$("#userEmail").focus();
					return false;
				}
				
				var regx = /^[a-zA-Z0-9]*$/;
				if (!num_regx.test($("#userTell").val())){
					Swal.fire("숫자만 입력해주세요.","","warning");
					   $("#userTell").focus();
					   return false;
					}
				var userPass = $("#userPass").val()
				 var userPass2 = $("#userPass2").val()
				 if (userPass2.length != userPass2) {
					 Swal.fire($("#chk").text("비밀번호를 입력하세요"),"","warning");
				 } 

			});
		})
			function passchk(){
		 var userPass = $("#userPass").val()
		 var userPass2 = $("#userPass2").val()
		 if (userPass2.length == 0 || userPass2 == null) {
			 $("#chk").text("비밀번호를 입력하세요");
			 right = 0;
		 } else if (userPass != userPass2) {
				Swal.fire("비밀번호가 다릅니다.","다시 입력해주세요","warning");
			 right = 0;
		 } else {   
				Swal.fire("비밀번호가 동일합니다.","","success");
			 right = 1;
		 }
		 return;
		}
	</script>
</body>

</html>