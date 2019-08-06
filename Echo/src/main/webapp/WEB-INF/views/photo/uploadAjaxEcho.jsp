<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<style>

#bigPicture {
	display: flex;
	width:100vw;
	heigth:auto;
	z-index:100;
	position: absolute;
	duration: 1s;
}


</style>


<h1>upload ajax page</h1>

<div>
	<input type="file" name="uploadFile" multiple>
		uid<input type="text" name='uid' value='baba'>
	bno<input type="number" name='bno' value=2>
</div>
<button id='uploadBtn'> upload </button>

<ul id="uploadResult">

</ul>
<div id="bigPicture" class='hide'>

</div>




<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	  crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
	
	var uploadResult = $("#uploadResult");
	
	var bigPicture = $("#bigPicture");
	
	bigPicture.hide();
	
	uploadResult.on("click", "img", function(e){
		var originName = $(this).attr("data-origin");
		
		bigPicture.html("<img src='/viewPhoto?file="+originName+"'>");
		
		bigPicture.show();
		
	});
	
	//////////////////////AJAX부분
	$("#uploadBtn").click(function(e){
		//input중 유일하게 무조건 ReadOnly는 파일이다. 파일을 바꿀수 있다면 해킹도 가능
		var inputFile = $("input[name='uploadFile']");	
		
		console.log(inputFile);
		//파일 추가하기
		var formData = new FormData();
		var files = inputFile[0].files;
		
		//다중의 파일에 대해서 콘솔에 나온다.
		console.log(formData);
		console.log(files);
		
		for(var i = 0; i < files.length; i++){
			formData.append("uploadFiles", files[i]);
		}
		console.log( $("input[name='uid']").val());
		console.log($("input[name='bno']").val());
		formData.append("uid", $("input[name='uid']").val());
		formData.append("bno",  $("input[name='bno']").val());
		
		console.log(formData)
		$.ajax({
			url:'/photo/uploadAjaxAction',
			processData: false,
			contentType: false,
			data: formData,
			dataType:'json',
			type:'post',
			success: function(result){
				//success:는 ajax에 이미 있는것으로 끝나고 콜백 함수를 발동한다. result는 서버에서 결과로 받은 값.
				console.log("upload...");
				console.log('result=== '+result);
				
				for(var i = 0; i < result.length; i++){
					var path = result[i].folderPath;
					console.log('folderPath=== '+path);
					var uri = path +"\\thumbnail\\thumb_"+result[i].photoname;
					console.log('uri=== '+uri);
					var photoname = result[i].photoname;
					console.log('photoname=== '+photoname);
					
					uploadResult.append("<li><img src='/photo/viewPhoto?file="+encodeURIComponent(uri)+"'> </li>")
				}//end for
			}//end success
		});//end $.ajax
	});//end #uploadBtn event
});//end document
</script>

</body>
</html>