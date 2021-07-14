/**
 * 
 *//* 유효성검사 jquery validation*/

 $(document).ready(function(){
   console.log("유효성검사");
/*--------------------------------------------------------------
               게시글 작성 유효성검사 
--------------------------------------------------------------*/   
      $("#writeForm").validate({        
rules: {
	  title: {
                
                
            }

	},
        //규칙체크 실패시 출력될 메시지
        messages : {
            title: {
                maxlength : "50글자까지 입력 가능합니다."
            },
            
            content: {
                maxlength : "50글자까지 입력 가능합니다."
            }
        }
    });

});