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

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript"
	src="/resources/se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>게시판 - 테이블</title>

<!-- Custom fonts for this template -->
<link href="/resources/boot/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/resources/boot/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link
	href="/resources/boot/vendor/datatables/dataTables.bootstrap4.min.css"
	rel="stylesheet">


<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>

<!-- 작성버튼을 눌렀을때 벨리데이션을 체크하기 위한 함수  -->
<!-- chk라는 클래스의 i번째가 공백이거나 null이면 알러트로 i번째의 타이틀을 출력해주는 함수  -->
<script type="text/javascript">
		var oEditors = [];
		$(document).ready(function(){
			
			nhn.husky.EZCreator.createInIFrame({
 			oAppRef: oEditors,
 			elPlaceHolder: "content",
 			sSkinURI: "/resources/se2/SmartEditor2Skin.html",
 			htParams : { bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음) 
			bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
 			bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
			//aAdditionalFontList : aAdditionalFontSet, // 추가 글꼴 목록 
			fOnBeforeUnload : function() { 
				//alert("완료!"); 
				} 
 			}, //boolean 
 			fOnAppLoad : function() { 
 				// Editor 에 값 셋팅 
 				oEditors.getById["content"].exec("PASTE_HTML", [""]); 
 				},
 			fCreator: "createSEditor2"
			});
			var formObj = $("form[name='writeForm']");
			
			$(".write_btn").on("click", function(){
				if(fn_valiChk()){
					return false;
				}
				if(fileCheck(file)){
					return false;
				}
				formObj.attr("action", "/board/write");
				formObj.attr("method", "post");
				formObj.submit();
				


			});
		
			$(".cancel_btn").on("click", function(){
				event.preventDefault();
				location.href = "/board/list";
			})
		})
		
		function fn_valiChk(){
			var regForm = $("form[name='writeForm'] .chk").length;
			for(var i = 0; i<regForm; i++){
				if($(".chk").eq(i).val() == "" || $(".chk").eq(i).val() == null){
					Swal.fire($(".chk").eq(i).attr("title"),$(".chk").eq(i).attr("title2"),"warning");
					return true;
				}
			}
			oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
			 var content = document.getElementById("content").value;;
	         if(content == "" || content == null || content == '&nbsp;' || 
	         content == '<br>' || content == '<br/>' || content == '<p>&nbsp;</p>' || content == '<p><br></p>'){ 
	        	 Swal.fire("본문을 작성해주세요.","","warning"); 
	        	 oEditors.getById["content"].exec("FOCUS"); //포커싱 
	        	 return true; 
	        	 }
		}
		function fileCheck( file )
		{
		        // 사이즈체크
		        var maxSize  = 100 * 1024 * 1024    //100MB
		        var fileSize = 0;

			// 브라우저 확인
			var browser=navigator.appName;
			
			// 익스플로러일 경우
			if (browser=="Microsoft Internet Explorer")
			{
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile( file.value ).size;
			}
			// 익스플로러가 아닐경우
			else
			{
				fileSize = file.files[0].size;
			}

		        if(fileSize > maxSize)
		        {
		            Swal.fire("첨부파일 100MB 이하로 등록!!","","error");
		            return "/board/writeView";
		        }

		        document.writeForm.submit();
		}
		</script>

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
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="index">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div>
				<div class="sidebar-brand-text mx-3">
					DH<sup>PAGE</sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item"><a class="nav-link" href="index.html">
					<i class="fas fa-fw fa-tachometer-alt"></i> <span>HOME</span>
			</a></li>


			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<!-- <div class="sidebar-heading">
                Interface
            </div> -->

			<!-- Nav Item - Pages Collapse Menu -->
			<!--             <li class="nav-item">
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
            </li> -->

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
            </li> -->

			<!-- Divider -->
			<!-- <hr class="sidebar-divider"> -->

			<!-- Heading -->
			<div class="sidebar-heading">USER ADMIN</div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>USER</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<h6 class="collapse-header">Login Screens:</h6>
						<a class="collapse-item" href="/home">Login Menu</a>
						<c:if test="${member.userId == null}">
							<a class="collapse-item" id="registerBtn" type="button">Register</a>
						</c:if>
						<c:if test="${member.userId != null}">
						</c:if>
						<!-- <a class="collapse-item" href="forgot-password.html">Forgot Password</a> -->
						<!-- <div class="collapse-divider"></div>
                        <h6 class="collapse-header">Other Pages:</h6>
                        <a class="collapse-item" href="404.html">404 Page</a>
                        <a class="collapse-item" href="blank.html">Blank Page</a> -->
					</div>
				</div></li>

			<!-- Nav Item - Charts -->
			<!--             <li class="nav-item">
                <a class="nav-link" href="charts.html">
                    <i class="fas fa-fw fa-chart-area"></i>
                    <span>Charts</span></a> 
            </li> -->


			<!-- Nav Item - Tables -->
			<li class="nav-item active"><a class="nav-link" href="list">
					<i class="fas fa-fw fa-table"></i> <span>BOARD</span>
			</a></li>

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
			<div id="contents">






				<!-- Topbar -->
				<nav
					class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

					<!-- Sidebar Toggle (Topbar) -->
					<form class="form-inline">
						<button id="sidebarToggleTop"
							class="btn btn-link d-md-none rounded-circle mr-3">
							<i class="fa fa-bars"></i>
						</button>
					</form>

					<!-- Topbar Search -->
					<form
						class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
						<div class="input-group">
							BOARD

							<!-- <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
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
						<li class="nav-item dropdown no-arrow d-sm-none"><a
							class="nav-link dropdown-toggle" href="#" id="searchDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <i class="fas fa-search fa-fw"></i>
						</a> <!-- Dropdown - Messages -->
							<div
								class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
								aria-labelledby="searchDropdown">
								<form class="form-inline mr-auto w-100 navbar-search">
									<div class="input-group">
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="Search for..." aria-label="Search"
											aria-describedby="basic-addon2">
										<div class="input-group-append">
											<button class="btn btn-primary" type="button">
												<i class="fas fa-search fa-sm"></i>
											</button>
										</div>
									</div>
								</form>
							</div></li>







						<!--                         Nav Item - Alerts
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                Counter - Alerts
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a>
                            Dropdown - Alerts
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>
 -->






						<!--                         Nav Item - Messages
                        <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-envelope fa-fw"></i>
                                Counter - Messages
                                <span class="badge badge-danger badge-counter">7</span>
                            </a>
                            Dropdown - Messages
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">
                                    Message Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/boot/img/undraw_profile_1.svg"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div class="font-weight-bold">
                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                            problem I've been having.</div>
                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/boot/img/undraw_profile_2.svg"
                                            alt="...">
                                        <div class="status-indicator"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                            would you like them sent to you?</div>
                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="/resources/boot/img/undraw_profile_3.svg"
                                            alt="...">
                                        <div class="status-indicator bg-warning"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                            the progress so far, keep up the good work!</div>
                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="dropdown-list-image mr-3">
                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                            alt="...">
                                        <div class="status-indicator bg-success"></div>
                                    </div>
                                    <div>
                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                            told me that people say this to all dogs, even if they aren't good...</div>
                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                            </div>
                        </li> -->






						<div class="topbar-divider d-none d-sm-block"></div>

						<!-- Nav Item - User Information -->
						<li class="nav-item dropdown no-arrow"><a
							class="nav-link dropdown-toggle" href="#" id="userDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false"> <c:if test="${member.userId != null}">
							사용자 : ${member.userName} 
							</c:if> <c:if test="${member.userId == null}">
							로그인해주세요.
							</c:if> <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
								<img class="img-profile rounded-circle"
								src="/resources/boot/img/undraw_profile.svg">
						</a> <!-- Dropdown - User Information --> <c:if
								test="${member.userId != null}">
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/member/memberUpdateView"> <i
										class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
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
									<a class="dropdown-item" href="/member/logout"
										data-toggle="modal" data-target="#logoutModal"> <i
										class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
										Logout
									</a>
								</div>
							</c:if> <c:if test="${member.userId == null}">
								<div
									class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
									aria-labelledby="userDropdown">
									<a class="dropdown-item" href="/home"> <i
										class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i> Login
									</a> </a> <a class="dropdown-item" href="/member/register"> <i
										class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
										Register
									</a>
								</div>
							</c:if></li>

					</ul>

				</nav>
				<!-- End of Topbar -->



















				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800"></h1>



					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<a style="text-decoration: none;"
								class="m-0 font-weight-bold text-primary">Board writeView</a>
						</div>

						<div class="container">

							<br />

							<section id="container">
								<form name="writeForm" method="post" action="/board/write"
									enctype="multipart/form-data">

									<c:if test="${member.userId != null}">
										<div class="form-group">
											<label for="title" class="col-sm-2 control-label"
												style="font-weight: bold; font-size: 18px; color: #4e73df;">제목</label>
											<input type="text" maxlength="50" id="title" name="title"
												class="chk form-control" title="제목을 입력하세요."
												title2="*참고 : 50자 이하로 입력해주세요*" />
										</div>

										<div class="form-group">
											<label for="writer" class="col-sm-2 control-label"
												style="font-weight: bold; font-size: 18px; color: #4e73df;">작성자</label>
											<label for="writer" class="form-control">${member.userName}</label>
											<input type="hidden" value="${member.userId}" id="writer"
												name="writer" class="chk form-control" />
										</div>

										<div class="form-group">
											<label for="content" class="col-sm-2 control-label"
												style="font-weight: bold; font-size: 18px; color: #4e73df;">내용</label>
											<textarea name="content" maxlength="2000" id="content"
												rows="20" cols="121"></textarea>
											<p class="count">
												<span>0</span> / 2000
											</p>
										</div>

										
										<div id="fileIndex">
											<div>
												<input type='file' id="file" style='cursor: pointer; color: #4e73df;'name='file_"+(fileIndex++)+"'></input>
												<button type='button'style='cursor: pointer; color: #4e73df;' id='fileDelBtn' class="btn btn-outline-error">삭제</button>
												<span style="color: red; font-size: 8px;">**100MB 미만 파일만 첨부 가능**</span>
											</div>
										</div>
										
										
										<hr />
										<span>
											<button class="fileAdd_btn btn btn-outline-primary"type="button">파일추가</button>
											<button type="button" class="write_btn btn btn-outline-primary">작성</button>
										</span>
											<button class="cancel_btn btn btn-outline-primary">취소</button>

									</c:if>
									<c:if test="${member.userId == null}">
								게시글은<a style="text-decoration: none;" href="/home"> 로그인</a> 후에 작성하실 수 있습니다.
							</c:if>
								</form>
							</section>
							<br />
							
							
							
							

<%-- 							<form name="fileForm">
								<input type="file" name="file1" /> <input type="button"
									value="upload" onclick="fileCheck( this.form.file1 )">
							</form>

							<p>
								<br />
							</p>
							<p>
								<br />
							</p>
							<p>
								<br />
							</p> --%>







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
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Logout Modal-->
	<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
					<button class="close" type="button" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">로그아웃시 로그인 페이지로 이동합니다.</div>
				<div class="modal-footer">
					<button class="btn btn-secondary" type="button"
						data-dismiss="modal">취소</button>
					<a class="btn btn-primary" href="/member/logout">로그아웃</a>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap core JavaScript-->
	<script src="/resources/boot/vendor/jquery/jquery.min.js"></script>
	<script
		src="/resources/boot/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script src="/resources/boot/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="/resources/boot/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="/resources/boot/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="/resources/boot/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="/resources/boot/js/demo/datatables-demo.js"></script>

	<!--  jquery validate -->
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<script src="/resources/boot/js/write.js"></script>


	<script> 
	var EDITORS = []; 
	window.onload = function() { 
	// smartEditor 세팅 
	
	// editor에 글자를 쳤을 때 글자 수 표출되는 이벤트 
	// setTimeout 을 안하면 iframe이 만들어지기 전에 이벤트가 등록되어 영역을 찾지 못한다 
		setTimeout(function() { 
			var ctntarea = document.querySelector("iframe").contentWindow.document.querySelector("iframe").contentWindow.document.querySelector(".se2_inputarea"); 
			ctntarea.addEventListener("keyup", function(e) { 
				var text = this.innerHTML; 
				text = text.replace(/<br>/ig, ""); // br 제거 
				text = text.replace(/&nbsp;/ig, "");// 공백 제거 
				text = text.replace(/<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>/ig, ""); // html 제거 
					
				var len = text.length; 
				document.querySelector(".count span").innerHTML = len; 
					
				if(len > 2000) { 
					Swal.fire("최대 2000자까지 입력 가능합니다.","","warning"); 
					} 
				}); 
			}, 1000) }
	</script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		var fileIndex = 1;
		//$("#fileIndex").append("<div><input type='file' style='float:left;' name='file_"+(fileIndex++)+"'>"+"<button type='button' style='float:right;' id='fileAddBtn'>"+"추가"+"</button></div>");
		$(".fileAdd_btn").on("click", function(){
			$("#fileIndex").append("<div><input type='file' style='cursor: pointer; color:#4e73df;' name='file_"+(fileIndex++)+"'>"+"</button>"+"<button type='button' style='cursor: pointer; color:#4e73df;' id='fileDelBtn' class='btn btn-outline-error'>"+"&nbsp삭제"+"</button><span style='color:red; font-size:8px;'>**100MB 미만 파일만 첨부 가능**</span></div>");
		});
		$(document).on("click","#fileDelBtn", function(){
			$(this).parent().remove();
			
		});
	});
	    
	</script>

	<!-- 파일 용량 체크 -->	
	<script>
	/* 업로드 체크 */
	
	</script>

</body>

</html>