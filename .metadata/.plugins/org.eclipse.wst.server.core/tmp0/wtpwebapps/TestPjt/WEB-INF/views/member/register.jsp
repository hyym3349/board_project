<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>

	
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		
		<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
		
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
<title>회원가입</title>
</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				
				location.href = "/login";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#userId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#userId").focus();
					return false;
				}
				if($("#userPass").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userPass").focus();
					return false;
				}
				if($("#userName").val()==""){
					alert("성명을 입력해주세요.");
					$("#userName").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		});
		function fn_idChk(){
			$.ajax({
				url : "/member/idChk",
				type : "post",
				dataType : "json",
				data : {"userId" : $("#userId").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
	
	<script type="text/javascript">
   		function goBack(){
     	 window.history.back();
   		}
	</script>

<body>
	<div class="container" style="border: 3px solid gray;margin: auto;padding: 20px;width: 600px;overflow: auto;">
			<header>
				<h1> 회원가입 </h1>
			</header>
				<hr />
			 <section id="container">
			 
			<form action="/member/register" method="post">
				<table class="table table-hover" style='display:inline-block; width:100%; min-width:100px'>
			
				<div class="form-group">
					<label class="col-sm-2 control-label" for="userId">아이디</label>
					<input class="form-control" type="text" id="userId" name="userId" />
					<br />
					<button class="idChk btn btn-outline-info" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<br />
				<div class="form-group">
					<label class="col-sm-2 control-label" for="userPass">패스워드</label>
					<input class="form-control" type="password" id="userPass" name="userPass" />
				</div>
				
				<div class="form-group">
					<label class="col-sm-2 control-label" for="userName">성명</label>
					<input class="form-control" type="text" id="userName" name="userName" />
				</div>
				
				<div class="form-group">
					<button class="btn btn-outline-info" type="submit" id="submit">회원가입</button>
					<input type="button" value="취소" class="btn btn-outline-info" onclick="goBack();"/>
				</div>
				
				</table>
			</form>
		</section>
		</div>
</body>
</html>