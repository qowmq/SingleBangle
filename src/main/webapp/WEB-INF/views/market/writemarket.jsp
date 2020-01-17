<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
 	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
	<script>
		$(function(){
			$("#boardfrm").on("submit", function(){
				$("#content").val($(".note-editable").html());
			})
		})
	</script>
	
</head>
<body>
<form action="write.do" method="post" id="frm" enctype="multipart/form-data" id="boardfrm">
<div style="width: 700px; margin: auto;">
<input style="width: 100%;" type="text" name="title" id="title" placeholder="제목을 입력하세요" required="required"><br>
<input style="width: 30%;" type="text" name="price" id="price" placeholder="가격을 입력하세요" required="required">원
<select name="category">
	<option>디지털/가전</option>
	<option>가구/인테리어</option>
	<option>생활/가공식품</option>
	<option>의류</option>
	<option>잡화</option>
	<option>뷰티</option>
	<option>스포츠/레저</option>
	<option>게임/취미</option>
	<option>기타</option>
</select><br>
<textarea style="display:none;" name="content" id="content"></textarea>
<div id="summernote"></div>
	 <button type="button" id="confirm")>제출</button>
	 </div>
</form>
    <script>
      $('#summernote').summernote({
    	  height: 500,
    	  placeholder: "내용을 입력하세요"
      })
      
      $("#price").on("focusout",function(){
    	  var regex = /^[0-9]*$/;
          var data = $("#price").val();
          var result = regex.exec(data);
    	  if($("#price").val() == "" || result == null){
    		  $("#price").val("");
    	  	alert("가격은 숫자만 입력이 가능합니다.");
    	  }
      })
      
      $("#confirm").on("click",function(){
    	  $("#content").val($(".note-editable").html());
    	  var regex = /<img src/;
          var data = $("#content").val();
          var result = regex.exec(data);
    	  if($("#content").val() == "" || result == null){
    	  	alert("내용을 모두 입력해주세요.<br>(이미지는 반드시 한장 이상 첨부해야합니다.)");
    	  	return;
    	  }else {
    		 $("#frm").submit();
    	  }
    		  
      })
    </script>
</body>
</html>