/* 게시판 js */

var lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
        "infoEmpty" : "0개",
        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };

$(document).ready(function() {


/*--------------------------------------------------------------
					게시판 목록 DataTable & 체크박스
--------------------------------------------------------------*/
	var DataTable = $('#dataTable').DataTable({
		"autoWidth": false,
		"info" : false,
		"paging": false, //페이징처리
		"ordering": false, //칼럼별 정렬기능
		"autoWidth": true, //가로자동
		"lengthChange": false, //데이터건수 변경
		"pageLength": false, //기본 데이터건수
		"lengthMenu": false, //데이터건수옵션
		"order": false, //기본 정렬칼럼
		"searching": false, //검색

		"language" : lang_kor /*글씨 바꾸기*/

	});
});
	/*----------------------- 전체체크 ------------------------------*/
	

 















