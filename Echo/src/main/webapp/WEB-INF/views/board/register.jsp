<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@include file="../includes/header.jsp"%>


 <div class="page-wrapper mdc-toolbar-fixed-adjust">
      <main class="content-wrapper">
      
    <section class="mdc-card__primary">
    
		<h1 class="mdc-typography--title">register</h1>
		<div class="container-fluid">
		<div class="row">
			<div class="col-md-11">
			
			</div>
			
			<div class="col-md-1">
			
			<button class="btn btn-default listBtn">
              List
      		</button>
			
			</div>
		</div>
		
		</div>
  <table class="table">
  			<thead>
               <tr>
                 <th>bno</th>
                 <th>uid</th>
                 <th>regdate</th>
                 <th>updatedate</th>
                 <th>sent</th>
                 <th>delete</th>
               </tr>
             </thead>
                     <tbody>
                <tr>

                    <td><c:out value="${vo.bno}" /></td>
                    <td><c:out value="${vo.uid}" /></td>
					<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${vo.updateDate}" pattern="yyyy-MM-dd"/></td>
                    <td><c:out value="${vo.sent}"/></td>
                    <td><a href='${vo.bno}' class='deleteIcon'><i class="mdi mdi-delete text-red"></i></a></td>
                    
                </tr>
                
                </tbody>
                
	</table>
	          <form role="form" class="user" action="/board/register" method="post">
                <div class="form-group">
                  <input type="text" name = 'uid' class="form-control form-control-user" placeholder="uid" value='uid'>
                </div>
                <button  type="submit" class="btn btn-primary btn-user btn-block">Submit</button>
              </form>
                
                          			<div class = "panel-heading">File Attach</div>
          			
          			<div class = "panel-body">
          				<div class = "form-group uploadDiv">
          					<input type ="file" name='uploadFile' multiple>
          				</div>
          				</div>
	</section>
	
	<style>
.col-md-4  {
 text-align: center;
}


</style>
	    <section class="mdc-card__primary">
		<hr>
		<h1 class="mdc-typography--title">Photos</h1>
		<hr>
		<div class="container">
		           			<style>
	.uploadResult{
	
	width:100%;
	background-color:white;
	}
	
	.uploadResult ul{
	display:flex;
	flex-flow:row;
	justify-content: center;
	align-items: center;
	}
	
	.uploadResult ul li{
	list-style: none;
	padding: 10px;
	}
	
	.uploadResult ul li img{
	width:200px;
	}
	
	.uploadResult ul li span{
	color:black;
	}
	
	.bigPictureWrapper{
	position:absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height:100%;
	background-color: gray;
	z-index: 100;
	background:rgba(255,255,255,0.5);
	}
	
	.bigPicture{
	position: relative;
	display: flex;
	justify-content: center;
	align-items:center;
	}
	
	.bigPicture img{
	width:600px;
	}
	</style>
          				
          				
          				<div class='uploadResult'>
          				<ul>
          				</ul>
          				</div>
		<div class="row photoList">
		
		
<!-- 			<div class="col-md-4">
			<img src="/resources/images/attach.png" width=200px>
			</div>
			<div class="col-md-4">
			<img src="/resources/images/attach.png" width=200px>
			</div>
			<div class="col-md-4">
			<img src="/resources/images/attach.png" width=200px>
			</div>
			<div class="col-md-4">
			<img src="/resources/images/attach.png" width=200px>
			</div>
			<div class="col-md-4">
			<img src="/resources/images/attach.png" width=200px>
			</div>
			<div class="col-md-4">
			<img src="/resources/images/attach.png" width=200px>
			</div> -->
		</div>
		
		</div>
		
		</section>
<%@include file="../includes/footer.jsp"%>
      
      </main>
      
</div>  
	<form id="actionForm" action="/board/list" method="get">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="amount" value="${cri.amount}"> 
		<input type="hidden" name="type" value="${cri.type}"> 
		<input type="hidden" name="keyword" value="${cri.keyword}">

	</form>
	<script type="text/javascript" src="/resources/js/photo.js"> </script>
	
		<script>
		var actionForm = $("#actionForm");
		var photoList = $(".photoList");
		
		
		
		
		$(".listBtn").on("click",function(e){
			actionForm.find("input[name='bno']").remove();	
			actionForm.attr("action","/board/list").submit();
		});
		
		$('.deleteIcon').on("click",function(e){
			e.preventDefault();
			var targetBno = $(this).attr("href");
			
			actionForm.attr("action", "/board/remove")
			.attr("method","post")
			.append("<input type ='hidden' name='bno' value="+targetBno+">")
			.submit(); 
		});
		
		$(document).ready(function(e){
			var formObj = $("form[role='form']");
			var uploadResult = $(".uploadResult ul");
			var bigPicture = $("#bigPicture");
/* 			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
			var maxSize = 5242880;//5mb
			
			
			function checkExtension(fileName, fileSize){
				
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				}
				
				if(regex.test(fileName)){
					alert("해당종류파일 안됨");
					return false;
				}
				return true;
			}; */
			
			function showUploadResult(uploadResultArr){
				
				if(!uploadResultArr || uploadResultArr.length == 0){ return; }
				
				var uploadUL = $(".uploadResult ul");
				
				var str ="";
				
				$(uploadResultArr).each(function(i,obj){
					var path = obj.folderPath;
					console.log('folderPath=== '+path);
					var photoName = obj.uuid + "_" + obj.originalPhotoName;
					console.log('photoName=== '+photoName);
					var uri = path +"\\thumbnail\\thumb_"+photoName;
					console.log('uri=== '+uri);
					//image type
					var fileCallPath = encodeURIComponent(uri)
					//var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_"+ obj.uuid + "_" + obj.fileName);
						str += "<li data-path=\'"+obj.folderPath+ "'";
						str += "data-uuid='"+obj.uuid+"'";
						str += "data-photoname='"+obj.originalPhotoName+"'><div>";
						str += "<span> "+ obj.originalPhotoName + "</span>";
						str += "<button type='button' data-file=\'"+fileCallPath+ "\' data-type='image' class='btn btn-warning btn-circle'>x </button><br>";
						str += "<img src = '/photo/viewPhoto?file="+fileCallPath+"'>";
						str += "</div>"
						str +"</li>";
					
				}); 
				
				uploadUL.append(str);
			}
			
			$("input[type='file']").change(function(e){
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
				console.log($("input[name='uid']").val());
				
				formData.append("uid", $("input[name='uid']").val());
				
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
						
						showUploadResult(result);
						
						$("input[type='file']").val("");
						
						/* 
						for(var i = 0; i < result.length; i++){
							var path = result[i].folderPath;
							console.log('folderPath=== '+path);
							var uri = path +"\\thumbnail\\thumb_"+result[i].photoname;
							console.log('uri=== '+uri);
							var photoname = result[i].photoname;
							console.log('photoname=== '+photoname);
							
							uploadResult.append("<li><img src='/photo/viewPhoto?file="+encodeURIComponent(uri)+"'> </li>")
							
						}*/ //end for
					}//end success
				});//end $.ajax
			});//end #uploadBtn event
			
			$(".uploadResult").on("click","button",function(e){
				console.log("delete file");
				
				var targetFile = $(this).data("file");
				var type = $(this).data("type");
				var targetLi = $(this).closest("li");
				targetLi.remove();
/*   				$.ajax({
					url : '/deleteFile',
					data : {fileName : targetFile, type : type},
					dataType: 'text',
					type : 'POST',
					success: function(result){
						alert(result);
						
					} 
				});//$.ajax  */
				
			});
			
			$("button[type='submit']").on("click",function(e){
			
				e.preventDefault();
				
				console.log("submit clicked");
				
				var str = "";
				
				$(".uploadResult ul li").each(function(i,obj){
					
					var jobj = $(obj);
					
					console.log("jobj : "+jobj);
					console.log(i);
					console.log(jobj.data("photoname"));
					console.log(jobj.data("path")); 					
					str += "<input type = 'hidden' name='attachList["+i+"].originalPhotoName' value='"+jobj.data("photoname")+"'>";
					str += "<input type = 'hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
					str += "<input type = 'hidden' name='attachList["+i+"].folderPath' value='"+jobj.data("path")+"'>";
					  
					//photo.js확인할것
					
					});
				
				formObj.append(str)
				.submit();
				//submit대신 ajax를 사용한다면?
				console.log("str : " + str)
				console.log("formObj" +formObj)
		})
	})
		
		/* function showPhotos(){
			console.log("showpotos....")
			photoList.html("")
			console.log("showpotos....")
			
			photoService.getList(bno, function (arr) {
	            console.log("photoService getlist...")
				console.log(arr);
	            //비구조화 분해 문법 , 구조 분해 할당 문법

	            //템플릿 문법
	            var str = '';

	            for(var i = 0; i < arr.length; i++){
	                var {pno,photoname,folderPath,regDate} = arr[i];
	                console.log(folderPath);
	                var temp =
	                "<div class='col-md-4'>"+
	    			"<img src="+folderPath+" width=200px>"+
	    			"</div>";
	    			
	    			console.log(temp);
	                	
 	                "<li class='list-group-item' data-rno="+rno+">"+
	                "<div class='rno'>"+rno+"</div>"+
	                "<div class='reply'>"+reply+"</div>"+
	                "<div class='replyer'>"+replyer+"</div>"+
	            	"</li>";

	                str += temp;
	          		}
	            
	            photoList.append(str);


	        });*/
			
		
		
		</script>


</body>
</html>