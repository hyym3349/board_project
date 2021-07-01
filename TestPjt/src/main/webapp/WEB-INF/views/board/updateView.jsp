<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.3.2/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='updateForm']");
			
			$(".cancel2_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/readView?bno=${update.bno}"
					   + "&page=${scri.page}"
					   + "&perPageNum=${scri.perPageNum}"
					   + "&searchType=${scri.searchType}"
					   + "&keyword=${scri.keyword}";
			})
			
			$(".save_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				formObj.attr("action", "/board/update");
				formObj.attr("method", "post");
				formObj.submit();
			})
		})
			
		function fn_valiChk(){
			var updateForm = $("form[name='updateForm'] .chk").length;
			for(var i = 0; i<updateForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					alert($(".chk").eq(i).attr("title"));
					return true;
				}
			}
		}
		
	</script>
	
		<div class="container">
			<header>
				<h1> 게시판 - 글 수정 </h1>
			</header>
			<hr />
			
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="updateForm" role="form" method="post" action="/board/update">
					<input type="hidden" name="bno" value="${update.bno}" readonly="readonly"/>
					<table class="table table-hover">
					
					
					<div class="form-group">
						<label for="title">제목</label>
						<input type="text" id="title" name="title" value="${update.title}" class="form-control" title="제목을 입력하세요."/>
					</div>
			
					<div class="form-group">
						<label for="content" class="col-sm-2 control-label">내용</label>
						<textarea name="content" id="content" rows="10" cols="156"><c:out value="${update.content}" /></textarea>
					</div>
		
					<div class="form-group">
						<label for="writer" class="col-sm-2 control-label">작성자</label>
						<input type="text" id="writer" name="writer" class="form-control" value="${update.writer}" readonly="readonly"/>
					</div>
						
					<div class="form-group">
						<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
						<fmt:formatDate value="${update.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/>					
					</div>
					
					<div class="form-group">
						<label for="editor" class="col-sm-2 control-label">수정자</label>
						<input type="text" id="editor" name="editor" class="form-control" value="${update.editor}"/>
					</div>
					
					<div class="form-group">
						<label for="editdate" class="col-sm-2 control-label">수정날짜</label>
						<fmt:formatDate value="${update.editdate}" pattern="yyyy-MM-dd HH:mm:ss"/>					
					</div>
					
					
					
					</table>
					<div>
						<button type="submit" class="save_btn btn btn-outline-info">저장</button>
						<button type="submit" class="cancel2_btn btn btn-outline-info">취소</button>
					</div>
				</form>
			</section>
			<hr />
		</div>
		<script type="text/javascript">
		
			var oEditors = [];
			nhn.husky.EZCreator.createInIFrame({
 			oAppRef: oEditors,
 			elPlaceHolder: "content",
 			sSkinURI: "/resources/se2/SmartEditor2Skin.html",
 			fCreator: "createSEditor2"
			});
			function submitContents(elClickedObj) {
		         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		   /*       document.getElementById("ir1").submit(); */
		         // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.

		         try {
		            elClickedObj.form.submit();
		         } catch (e) {
		         }
		      }
		</script>
	</body>
</html>