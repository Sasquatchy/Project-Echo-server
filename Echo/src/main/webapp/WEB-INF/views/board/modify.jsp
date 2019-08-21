<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>

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

<div class="page-wrapper mdc-toolbar-fixed-adjust">
	<main class="content-wrapper">

	<section class="mdc-card__primary">

		<h1 class="mdc-typography--title">modify</h1>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-10"></div>

			<div class="col-md-1">
			
			<button class="btn btn-danger ModifyBtn">
              	Modify
      		</button>
			</div>
				<div class="col-md-1">

					<button class="btn btn-default listBtn">List</button>

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
					<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${vo.updateDate}"
							pattern="yyyy-MM-dd" /></td>
					<td><c:out value="${vo.sent}" /></td>
					<td><a href='${vo.bno}' class='deleteIcon'><i
							class="mdi mdi-delete text-red" data-toggle="modal"
							data-target="#deleteModal"></i></a></td>

				</tr>
			</tbody>
		</table>
		
			<form role="form" class="user" action="/board/modify" method="post">
				<input type="hidden" name="page" value="${cri.page}"> 
				<input type="hidden" name="amount" value="${cri.amount}"> 
				<input type="hidden" name="type" value="${cri.type}"> 
				<input type="hidden" name="keyword" value="${cri.keyword}">
				<input type ='hidden' name='bno' value="${cri.bno }">
			
                <div class="form-group">
                	<input type="hidden" name = 'uid' class="form-control form-control-user" value="${vo.uid}">
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


	<section class="mdc-card__primary">
		<hr>
		<h1 class="mdc-typography--title">Photos</h1>
		<hr>
		<div class="container">

		          	<div class='uploadResult'>
          				<ul>
          				</ul>
         			</div>


		</div>

	</section>
	<%@include file="../includes/footer.jsp"%>

	<div class='bigPictureWrapper'>
		<div class='bigPicture'></div>
	</div>
	</main>

</div>
<form id="actionForm" action="/board/list" method="get">


</form>


<!-- Modal -->
<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Are you sure?</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
 			</div> 
 			<div class="modal-body-wrapper">
			</div>
		</div>
	</div>
</div>



<script type="text/javascript" src="/resources/js/photo.js"> </script>
<script>


		var actionForm = $("#actionForm");
		var bno = ${vo.bno};
		var uploadResult = $(".uploadResult ul");
		
		
		
		showPhotos();
		
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
		
		
		$(".listBtn").on("click",function(e){
			actionForm.find("input[name='bno']").remove();	
			actionForm.attr("action","/board/list").submit();
		});
		
		
		$('.deleteIcon').on("click",function(e){
			e.preventDefault();
			var targetBno = $(this).attr("href");
			/* Open modal, write the content and needed data*/
			var modalBody = $(".modal-body-wrapper")
			modalBody.html("");
/* 			modalBody.html('<div class="modal-body">Board #'+targetBno+' will be deleted.</div>'); */
			modalBody.html(
				'<div class="modal-body">'+
					'<div class="modal-body">Board #'+targetBno+' will be deleted.</div>'+
				'</div>'+
				'<div class="modal-footer">'+
					'<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>'+
					'<button type="button" id="deleteBtn" class="btn btn-danger" data-targetDelete='+targetBno+'>Delete</button>'+
				'</div>'		
			
			); 
			
			
		});
		
		
		
		
		/* Delete post */
		$("#deleteBtn").on("click", function(e){
			var targetBno = $(this).data('targetDelete');
			console.log(targetBno);
			actionForm.attr("action", "/board/remove")
			.attr("method","post")
			.append("<input type ='hidden' name='bno' value="+targetBno+">")
			.submit();
		});
	
		$(".uploadResult").on("click", "button", function(e){
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
		
		
		function showPhotos(){
			console.log("showphotos....")
			uploadResult.html("")
			
			photoService.getList(bno, function (arr) {
	            console.log("photoService getlist...")
				console.log(arr);
	            //비구조화 분해 문법 , 구조 분해 할당 문법

	            //템플릿 문법
	            var str = '';

	            for(var i = 0; i < arr.length; i++){
	                var {pno,uuid,originalPhotoName,folderPath,regDate} = arr[i];
	                console.log(arr[i]);
	                console.log(folderPath);
	                var uri = folderPath +"\\thumbnail\\thumb_"+uuid+"_"+originalPhotoName;
	         		var fileCallPath = encodeURIComponent(uri)
	         		
	         		var temp =
					"<li data-path=\'"+folderPath+ "'"+
					"data-uuid='"+uuid+"'"+
					"data-photoname='"+originalPhotoName+"'><div>"+
					"<span> "+ originalPhotoName + "</span>"+
					"<button type='button' data-file=\'"+fileCallPath+ "\' data-type='image' class='btn btn-warning btn-circle'>x </button><br>"+
					"<img src = '/photo/viewPhoto?file="+fileCallPath+"'>"+
					"</div>"+
					"</li>";	
	         		
/* 	                "<div class='col-md-4'>"+
	                "<span> "+ originalPhotoName + "</span>"+
					"<button type='button' data-file=\'"+fileCallPath+ "\' data-type='image' class='btn btn-circle'>x </button><br>"+
	    			"<img src=/photo/viewPhoto?file="+fileCallPath+" width=200px data-path ='"+folderPath+"' data-uuid='"+uuid+"' data-photoname='"+originalPhotoName+"'>"+
	    			"</div>";
 */	    			
	    			console.log(temp);
	                	
	                str += temp;
	          		}
	            
	            uploadResult.append(str);


	        });
			
		}
		
		$(".uploadResult").on("click", "img", function(e){
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+ liObj.data("uuid") + "_" + liObj.data("photoname"));
			
			console.log("path: "+path)
			
				showImage(path.replace(new RegExp(/\\/g),"/"));
		});
		
		function showImage(fileCallPath){
			
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture")
			.html("<img src='/photo/viewPhoto?file="+fileCallPath+"'>")
			
		};
		
		$(".bigPictureWrapper").on("click",function(e){
				$('.bigPictureWrapper').hide();
		})
		
		
		/* Modal jQuery */
		/* $('#deleteModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		}) */
</script>


</body>
</html>