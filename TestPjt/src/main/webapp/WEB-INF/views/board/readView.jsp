<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>

	
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>
	</head>
	
	<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/board/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 선택삭제
			$(".delete_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 삭제
			$(".deleteCol_btn").on("click", function(){
				
				var deleteYN = confirm("삭제하시겠습니까?");
				if(deleteYN == true){
					
				formObj.attr("action", "/board/deleteCol");
				formObj.attr("method", "post");
				formObj.submit();
					
				}
			})
			
			// 목록
			$(".list_btn").on("click", function(){
			location.href = "/board/list?page=${scri.page}"
			+"&perPageNum=${scri.perPageNum}"
			+"&searchType=${scri.searchType}&keyword=${scri.keyword}";
			})
		
		})
	</script>
	
	<body>
	
		<div class="container">
			<header>
				<h1> 게시판 - 상세</h1>
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form name="readForm" role="form" method="post">
 					 <input type="hidden" id="bno" name="bno" value="${read.bno}" />
 					 <input type="hidden" id="page" name="page" value="${scri.page}"> 
 					 <input type="hidden" id="perPageNum" name="perPageNum" value="${scri.perPageNum}"> 
 					 <input type="hidden" id="searchType" name="searchType" value="${scri.searchType}"> 
					 <input type="hidden" id="keyword" name="keyword" value="${scri.keyword}"> 
				</form>
							<div class="form-group">
								<label for="bno" class="col-sm-2 control-label">게시물 번호</label>
								${read.bno}
							</div>

							<div class="form-group">
								<label for="title" class="col-sm-2 control-label">제목</label>
								${read.title}
							</div>
							
							<div class="form-group">
								<label for="content" class="col-sm-2 control-label">내용</label>
								<div>${read.content}</div>
							</div>
							
							<div class="form-group">
								<label for="writer" class="col-sm-2 control-label">작성자</label>
								${read.writer}
								
							</div>
								
							<div class="form-group">
								<label for="regdate" class="col-sm-2 control-label">작성날짜</label>
								<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />					
							</div>
							
							<div class="form-group">
								<label for="editor" class="col-sm-2 control-label">수정자</label>
								${read.editor}
								
							</div>
								
							<div class="form-group">
								<label for="editdate" class="col-sm-2 control-label">수정날짜</label>
								<fmt:formatDate value="${read.editdate}" pattern="yyyy-MM-dd HH:mm:ss" />					
							</div>		
							
				<div>
					<button type="button" class="update_btn btn btn-outline-info">수정</button>
					<!-- <button type="button" class="deleteCol_btn btn btn-outline-info">삭제</button> -->
					<button type="button" class="list_btn btn btn-outline-info">목록</button>	
				</div>
			</section>
			<hr />
		</div>
	</body>
</html>