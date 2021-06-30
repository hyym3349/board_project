<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<style>
      .outer{
      text-align: center;
      }
      </style>
      <style>
      div.absolute{
      position: absolute;
      left: 658px;
      }
      </style>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>게시판</title>

	</head>
	<body>
		<div class="container">
			<header>
				<h1> 게시판 </h1>
				
			</header>
			<hr />
			 
			<div>
				<%@include file="nav.jsp" %>
			</div>
			<hr />
			
			<section id="container">
				<form role="form" method="get" action="/board/write">
					<table class="table table-hover">
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>수정자</th>
							<th>수정일</th>
							<th>조회수</th>
						</tr>
						
						<c:forEach items="${list}" var = "list">
						<c:choose>
						<c:when test="${list.deleted == 'N'}">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="/board/readView?bno=${list.bno}&
									page=${scri.page}&
									perPageNum=${scri.perPageNum}&
									searchType=${scri.searchType}&
									keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
								</td>
								<td><c:out value="${list.writer}" /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${list.editor}" /></td>
								<td><fmt:formatDate value="${list.editdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td><c:out value="${list.hit}" /></td>
							</tr>	
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</table>
					<br>
		
					<div class="outer">
						<select name="searchType" style="width:100px; height:34px; fontsize:20px;">
      						<option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>----전체----</option>
     				    	<option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
     			   	    	<option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>내용</option>
   					    	<option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
  					    	<option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+내용</option>
 					    </select>
				
		

  					    <input type="text" name="keyword" id="keywordInput" style="width:180px; height:34px;" value="${scri.keyword}"/>


  					    <button id="searchBtn" type="button" class="btn btn-success">검색</button>
  					  </div>
  					  
  					  
  					  	<div class="absolute">
 						 <ul class="pagination">
    						<c:if test="${pageMaker.prev}">
    							<li><a href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    						</c:if> 

    						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
    							<li <c:out value="${pageMaker.cri.page == idx ? 'class=info' : ''}" />>
    							<a href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
    						</c:forEach>

    						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
    							<li><a href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    						</c:if> 
 						 </ul>
 						 </div>
  					  
  					  <script>
 					     $(function(){
   					     $('#searchBtn').click(function() {
     					     self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
    					    });
   					   });   
  					  </script>
					<br><br><br>
				</form>
			</section>
			<hr />
		</div>
	</body>
</html>