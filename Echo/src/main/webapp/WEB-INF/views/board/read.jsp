<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>


 <div class="page-wrapper mdc-toolbar-fixed-adjust">
      <main class="content-wrapper">
      
    <section class="mdc-card__primary">
    
		<h1 class="mdc-typography--title">readasdfsadfasd</h1>
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
	</section>
	
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
	position:absolute;
	display: flex;
	justify-content: center;
	align-items:center;
	}
	
	.bigPicture img{
	width:600px;
	}
</style>
	    <section class="mdc-card__primary">
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
		var bno = ${vo.bno};
		var photoList = $(".photoList");
		
		showPhotos();
		
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
		
		function showPhotos(){
			console.log("showphotos....")
			photoList.html("")
			
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
	                "<div class='col-md-4'>"+
	    			"<img src=/photo/viewPhoto?file="+fileCallPath+" width=200px data-path ='"+folderPath+"' data-uuid='"+uuid+"' data-photoname='"+originalPhotoName+"'>"+
	    			"</div>";
	    			
	    			console.log(temp);
	                	
/* 	                "<li class='list-group-item' data-rno="+rno+">"+
	                "<div class='rno'>"+rno+"</div>"+
	                "<div class='reply'>"+reply+"</div>"+
	                "<div class='replyer'>"+replyer+"</div>"+
	            	"</li>"; */

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
			//.animate({width:'100%', height:'100%'}, 0);
			
		};
		
		$(".bigPictureWrapper").on("click",function(e){
			//$(".bigPicture")
			//.animate({width:'0%', height:'0%'}, 0);
			//setTimeout(function(){
				$('.bigPictureWrapper').hide();
			//	}, 1000);
		})
		
		</script>


</body>
</html>