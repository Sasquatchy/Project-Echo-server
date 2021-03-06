<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>

	<style>
	.col-md-4  {
	 text-align: center;
	}
	.bigPictureWrapper{
	position:absolute;
	display: none;
	justify-content: center;
	align-items: center;
	top: 0%;
	width: 100%;
	height:100%;
	background-color: black;
	z-index: 100;
	background:rgba(33,33,33,0.7);
	}
	
	.bigPicture{
	position:relative;
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
		<h1 class="mdc-typography--title">Member information</h1>
		<div class="container-fluid">
		<div class="row">
			<div class="col-md-10">
			
			</div>
			<div class="col-md-1">
			
			<button class="btn btn-default ModifyBtn">
              	Modify
      		</button>
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
                 <th>mno</th>
                 <th>uid</th>
                 <th>pw</th>
                 <th>username</th>
                 <th>mobile</th>
                 <th>ufid</th>
                 <th>auth</th>
                 <th>regdate</th>
                 <th>updatedate</th>
               </tr>
             </thead>
                     <tbody>
                <tr>
                    <td><c:out value="${vo.mno}" /></td>
                    <td><c:out value="${vo.uid}" /></td>
                    <td><c:out value="${vo.pw }"/></td>
                    <td><c:out value="${vo.username}" /></td>
                    <td><c:out value="${vo.mobile}" /></td>
                     <td><c:out value="${vo.ufid}" /></td>
                    <td></td>
                    <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${vo.updateDate}" pattern="yyyy-MM-dd"/></td>
                    
                </tr>



             </tbody>
                  </table>
	
		<hr>
		<h1 class="mdc-typography--title">Photos</h1>
		<hr>
		<div class="container">
		<div class="row photoList">
			
		</div>
		

		</div>     		
		     		

	</section>
	<%@include file="../includes/footer.jsp"%>

       	<div class='bigPictureWrapper'>
			<div class='bigPicture'>
			
			</div>
		</div>
		
      </main>
	<form id="actionForm" action="/member/read" method="get">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="amount" value="${cri.amount}"> 
		<input type="hidden" name="type" value="${cri.type}"> 
		<input type="hidden" name="keyword" value="${cri.keyword}">

	</form>
	<script type="text/javascript" src="/resources/js/photo.js"> </script>
		<script>
		var actionForm = $("#actionForm");
		var uid = "${vo.uid}";
		var photoList = $(".photoList");
		
		showPhotos();
		
		$(".ModifyBtn")
		.on("click",function(e) {
					e.preventDefault();
					
					var targetMno = "${vo.mno}";
					
					actionForm
							.attr("action", "/member/modify")
							.append(
									"<input type ='hidden' name='mno' value="+targetMno+">")
							.submit();
				}//end function		
		);
		
		function showPhotos(){
			console.log("showphotos....")
			console.log(uid)
			photoList.html("")
			
			photoService.getList2(uid, function (arr) {
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
	                "<div class='col-md-4'>"+
	    			"<img src=/photo/viewPhoto?file="+fileCallPath+" width=200px data-path ='"+folderPath+"' data-uuid='"+uuid+"' data-photoname='"+originalPhotoName+"'>"+
	    			"</div>";
	    			
	    			console.log(temp);
	                	
	                str += temp;
	          		}
	            
	            photoList.append(str);
	        });
			
		}
		
		$(".photoList").on("click", "img", function(e){
			console.log("view image");
			
			var liObj = $(this);
			
			var path = encodeURIComponent(liObj.data("path")+"/"+ liObj.data("uuid") + "_" + liObj.data("photoname"));
			
			console.log("path: "+path)
			
			showImage(path.replace(new RegExp(/\\/g),"/"));
		});
		
		function showImage(fileCallPath){
			
			//alert(fileCallPath);
			
			$(".bigPictureWrapper").css("display","flex").show();
			
			$(".bigPicture")
			.html("<img src='/photo/viewPhoto?file="+fileCallPath+"'>")
			
		};
		
		$(".bigPictureWrapper").on("click",function(e){
				$('.bigPictureWrapper').hide();
		})
		
		$(".listBtn").on("click",function(e){
			actionForm.find("input[name='mno']").remove();	
			actionForm.attr("action","/member/list").submit();
		});
		
		$('.deleteIcon').on("click",function(e){
			e.preventDefault();
			var targetMno = $(this).attr("href");
			
			actionForm.attr("action", "/member/remove")
			.attr("method","post")
			.append("<input type ='hidden' name='mno' value="+targetMno+">")
			.submit(); 
			});
		
		</script>


</body>
</html>