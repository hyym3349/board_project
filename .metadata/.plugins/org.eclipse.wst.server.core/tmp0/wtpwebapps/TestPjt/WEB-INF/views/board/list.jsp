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

	<script src="http://code.jquery.com/jquery-1.6.4.min.js"></script>

	  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

	
<script type="text/javascript">

$(function(){
	var chkObj = document.getElementsByName("RowCheck");
	var rowCnt = chkObj.length;
	
	$("input[name='allCheck']").click(function(){
		var chk_listArr = $("input[name='RowCheck']");
		for (var i=0; i<chk_listArr.length; i++){
			chk_listArr[i].checked = this.checked;
		}
	});
	$("input[name='RowCheck']").click(function(){
		if($("input[name='RowCheck']:checked").length == rowCnt){
			$("input[name='allCheck']")[0].checked = true;
		}
		else{
			$("input[name='allCheck']")[0].checked = false;
		}
	});
});



function deleteValue(){
	var url = "delete";    // Controller로 보내고자 하는 URL (.dh부분은 자신이 설정한 값으로 변경해야됨)
	var valueArr = new Array();
    var list = $("input[name='RowCheck']");
    for(var i = 0; i < list.length; i++){
        if(list[i].checked){ //선택되어 있으면 배열에 값을 저장함
            valueArr.push(list[i].value);
        }
    }
    if (valueArr.length == 0){
    	Swal.fire("선택된 글이 없습니다.","삭제할 게시물을 선택해주세요.","info");
    }
    else{
    	
    	Swal.fire({
            title: '정말 삭제하시겠습니까?',
            icon: 'question',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: '삭제하기',
            cancelButtonText: '취소'
          }).then((chk) => {  if(chk.isConfirmed){
			$.ajax({
			    url : url,                    // 전송 URL
			    type : 'POST',                // GET or POST 방식
			    traditional : true,
			    data : {
			    	valueArr : valueArr        // 보내고자 하는 data 변수 설정
			    },
	            success: function(jdata){
	                if(jdata = 1) {
	                	Swal.fire("삭제 성공","","success");
	                    location.replace("list")
	                }
	                else{
	                	  Swal.fire("삭제 실패","","error");
	                }
	            }
			});
		}
		else{
			Swal.fire("취소하셨습니다.","","info");
			}
		})
    }
}
</script>
	

	<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Board_Table</title>
	 <style type="text/css">
			li {list-style: none; float: left; padding: 1px;}
		</style>
    <!-- Custom fonts for this template -->
    <link href="/resources/boot/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="/resources/boot/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="/resources/boot/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    
	<style>
    .paging a {
        /*
        display: inline-block 인라인 요소의 특징과 블록 요소의 특징을 모두 갖는다
        크기를 가질 수 있으며 텍스트 정렬도 적용받는다
        */
        
        
        text-decoration: none;
        padding: 4px 8px;
        border: 1px solid #4e73df;
        color: #000;

    }
    /* 현재 페이징에 select 클래스를 적용한다*/
    .paging a.select {
        color: #4e73df;
        background-color: white;
        border-radius: .35rem;
    }
    </style>


	
    
</head>
<script type="text/javascript">
	$(document).ready(function(){
		$("#logoutBtn").on("click", function(){
			location.href="member/logout";
		})
		$("#registerBtn").on("click", function(){
			location.href="/member/register";
		})
		
		
		
		$("#memberUpdateBtn").on("click", function(){
			location.href="member/memberUpdateView";
		})
		
	})
</script>




<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="index">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">DH<sup>PAGE</sup></div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="index">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span>HOME</span></a>
            </li>


             <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
<!--              <div class="sidebar-heading">
                Interface
            </div>  -->

            <!-- Nav Item - Pages Collapse Menu -->
             <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Components</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Components:</h6>
                        <a class="collapse-item" href="buttons.html">Buttons</a>
                        <a class="collapse-item" href="cards.html">Cards</a>
                    </div>
                </div>
            </li>  -->

            <!-- Nav Item - Utilities Collapse Menu -->
             <!-- <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
                    aria-expanded="true" aria-controls="collapseUtilities">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Utilities</span>
                </a>
                <div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
                    data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Custom Utilities:</h6>
                        <a class="collapse-item" href="utilities-color.html">Colors</a>
                        <a class="collapse-item" href="utilities-border.html">Borders</a>
                        <a class="collapse-item" href="utilities-animation.html">Animations</a>
                        <a class="collapse-item" href="utilities-other.html">Other</a>
                    </div>
                </div>
            </li>  -->

            <!-- Divider -->
<!--              <hr class="sidebar-divider"> -->

            <!-- Heading -->
            <div class="sidebar-heading">
                Addons
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
                    aria-expanded="true" aria-controls="collapsePages">
                    <i class="fas fa-fw fa-folder"></i>
                    <span>USER</span>
                </a>
                <div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">Login Screens:</h6>
                        <a class="collapse-item" href="/home">Login</a>
                        <a class="collapse-item" id="registerBtn" type="button">Register</a>
<!--                          <a class="collapse-item" href="forgot-password.html">Forgot Password</a>
                         <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a> -->
                    </div>
                </div>
            </li>

            <!-- Nav Item - Charts -->
            <!--  <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a> 
            </li> -->
            

            <!-- Nav Item - Tables -->
            <li class="nav-item active">
                <a class="nav-link" href="list">
                    <i class="fas fa-fw fa-table"></i>
                    <span>BOARD</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->














        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
            
            
            
            
        
                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <form class="form-inline">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </form>

                    <!-- Topbar Search -->
                     <form
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">BOARD
                                           
<!--                              <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div> -->
                        </div>

                    </form> 

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>













                        <div class="topbar-divider d-none d-sm-block"></div>
						
                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">
                        
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" > 
                                <c:if test="${member.userId != null}">
							사용자 : ${member.userId} 
							</c:if>
							<c:if test="${member.userId == null}">
							로그인해주세요.
							</c:if>
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                                <img class="img-profile rounded-circle"
                                    src="/resources/boot/img/undraw_profile.svg">
                            </a>
                            
                            
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="/member/memberUpdateView">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Profile
                                </a>
                                
<!--                                  <a class="dropdown-item" href="#">
                                    <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Settings
                                </a> 
                                
                                 <a class="dropdown-item" href="#">
                                    <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Activity Log
                                </a>  -->
                                
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/member/logout" data-toggle="modal" data-target="#logoutModal">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->



















                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800"></h1>
                  


                  
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <a class="m-0 font-weight-bold text-primary">Board list</a>
                         </div>    
                            
                          
                       
                        <div>
                        <div class="card-body">
                            <div class="table-responsive" >
                            
                            <input style="width:90px; height:35px;" type="button" value="선택삭제" class="btn btn-outline-primary" onclick="deleteValue();">
                            
                            
                            <div class="search" style ="float: right;">
                            <span style="display:inline-block; width:110px; height:35px;">
   							 <select style="width:110px; height:35px;" class="form-control navbar-left list-group"  name="searchType">
      							<%-- <option value="n"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>--전체--</option> --%>
     							 <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>제목</option>
     							 <option value="w"<c:out value="${scri.searchType eq 'w' ? 'selected' : ''}"/>>작성자</option>
     							 <option value="tw"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>>제목+작성자</option>
    						</select>
    						<script>
    						
							function enterkey() {
								if (window.event.keyCode == 13) {
								if($('#keywordInput').val() == ''){
									Swal.fire("검색어를 입력해주세요","","warning")
  								   
  							   }
  							   else{
   						    self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
  						   }
								}
								else{
									
								}
						}
	   						</script>
	
							</span>
							<span style="display:inline-block; width:200px; height:36px;">
    						<input class="form-control navbar-left list-group" style="width:200px; height:36px;" type="search" placeholder="검색하기..." name="keyword" id="keywordInput" onkeyup="enterkey()" value="${scri.keyword}"/>
							</span>


							<span style="display:inline-block; width:62px; height:36px;">
    						<button  style="width:60px; height:34px;" id="searchBtn" type="button" class="btn btn-outline-primary">검색</button>
    						</span>
    						
    						<span style="display:inline-block; width:110px; height:36px;">
    						<a href = "/board/list"><button style="width:110px; height:34px;" id="searchBtn" type="button" class="btn btn-outline-primary">전체글보기</button></a>
    						</span>

    						<script>
     						 $(function(){
     						   $('#searchBtn').click(function() {
     							   if($('#keywordInput').val() == ''){
     								  Swal.fire("검색어를 입력해주세요","","warning")
     							   }
     							   else{
      						    self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
     						   }
     
     							   });
    						  });   
   						 </script>

 						 </div>
 						 <br />
 						 
 						     <!-- DataTales Example -->
                                <table class="table table-bordered"  style="table-layout:fixed">
                                    <thead>
                                    
                                        <tr>
                                        	<!-- <th class="text-center"><input name="select_all" id="select-all" type="checkbox" /></th> -->
                                            <th style="text-align:center; width:5%;"><input  id="allCheck" type="checkbox" name="allCheck" disabled="disabled"/></th>
                                           
											<th style="text-align:center; width:7%;">번호</th>
											<th style="text-align:center; width:70%;">제목</th>
											<th style="text-align:center; width:13%;">작성자</th>
											<th style="text-align:center; width:20%;">등록일</th>
											<th style="text-align:center; width:8%;">조회수</th>
                                        </tr>
                                    </thead>
                                    
                                    <tbody>
                                   <c:choose>
   										<c:when test="${empty list || fn:length(list) == 0 }">
											<td style="text-align:center;" colspan="6">게시물이 없습니다.</td>
                                      </c:when>
   
 										  <c:otherwise>
                                    
                                        <c:forEach items="${list}" var = "list">
											<c:choose>
												<c:when test="${list.deleted == 'N'}">
													<tr>
													<c:if test="${list.writer == member.userId}">
														<td style="text-align:center;"><input name="RowCheck" type="checkbox" value="${list.bno}"/></td>
														</c:if>
														<c:if test="${list.writer != member.userId}">
														<td style="text-align:center;"><input name="RowCheck" type="checkbox" disabled="disabled" value="${list.bno}"/></td>
														</c:if>
														<%-- <td class="text-center">${list.bno}</td> --%>
														<td style="text-align:center;"><c:out value="${list.bno}" /></td>
														<td title="${list.title}"style="text-overflow: ellipsis; overflow: hidden; white-space: nowrap;">
														<a href="/board/readView?bno=${list.bno}&
														page=${scri.page}&
														perPageNum=${scri.perPageNum}&
														searchType=${scri.searchType}&
														keyword=${scri.keyword}"><c:out value="${list.title}" /></a>
														</td>
														<td style="text-align:center;"><c:out value="${list.writer}" /></td>
														<td style="text-align:center;"><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
														<td style="text-align:center;"><c:out  value="${list.hit}" /></td>
													</tr>	
							
												</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
						</c:forEach>
                      
                          </c:otherwise>
							</c:choose> 
							</tbody>
                     </table>
                                
                                <div style="display:inline-block; float: right;">
                                <a href ="/board/writeView"><input  type="button" value="글 작성" class="btn btn-outline-primary"></a>
								</div>
							 
							
							
							<%-- <li>현제 페이지 : ${scri.page}</li> --%>
							<br>

                            </div>
                             <div class="paging">
							    <c:if test="${pageMaker.prev}">
							    	<li><a class="select" href="list${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
							    </c:if> 
							
							    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							    	<li class="action"><a class="select" href="list${pageMaker.makeSearch(idx)}">${idx}</a></li>
							    </c:forEach>
							
							    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							    	<li><a class="select" href="list${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
							    </c:if> 
							    
							  </div>
							  <br>
							    </div>
                        </div>
                    </div>
				
                </div>
                <!-- /.container-fluid -->
                
            </div>
            <!-- End of Main Content -->






            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; DH's Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->




    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">로그아웃시 로그인 페이지로 이동합니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">취소</button>
                    <a class="btn btn-primary" href="/member/logout">로그아웃</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/boot/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/boot/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/boot/js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="/resources/boot/vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="/resources/boot/vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="/resources/boot/js/demo/datatables-demo.js"></script>
    

	<style>
	.table-responsive{
	overflow-x: clip;
	}
	</style>
			  <!-- 합쳐지고 최소화된 최신 CSS -->
	<script src="/resources/css/bootstrap.min.css"></script>
	<!-- 부가적인 테마 -->
	<script src="/resources/css/bootstrap.css"></script>
			  <!-- 합쳐지고 최소화된 최신 CSS -->
	<script src="/resources/js/bootstrap.min.js"></script>
	<!-- 부가적인 테마 -->
	<script src="/resources/js/bootstrap.js"></script>
    
</body>

</html>