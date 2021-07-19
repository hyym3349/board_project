<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type = "text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script>
	$(document).ready(function(){
		
		$("#btn").click(function(){
			
			$("#frm").attr("action","/member/passinsert").submit();
		}); // .click
		
	}); // .ready
</script>
</head>
<body>
	<form id="frm" method="post" action="">
		비밀번호 : <input type="text" id="pass" name="pass" />
		
		<input type="button" id="btn" name="btn" value="전송" />
	</form>

</body>
</html>