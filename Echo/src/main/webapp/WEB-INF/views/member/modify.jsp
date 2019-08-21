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
			
			<button class="btn btn-danger ModifyBtn">
              	Modify
      		</button>
			</div>
			
			<div class="col-md-1">
			
			<button class="btn btn-default listBtn" onClick="location.href='../member/list'">
              List
      		</button>
			</div>
		</div>

		</div>
	<form id='form1'>
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
					
					<td><input type="text" name="uid"
						 placeholder="아이디"  
						value='<c:out value="${vo.uid}"/>'></td>
					<td><input type="text" name="pw"
						 placeholder="패스워드"  
						value='<c:out value="${vo.pw}"/>'></td>
					<td><input type="text" name="username"
						 placeholder="사용자이름"  
						value='<c:out value="${vo.username}"/>'></td>
					<td><input type="text" name="mobile"
						 placeholder="핸드폰 번호"  
						value='<c:out value="${vo.mobile}"/>'></td>
					<td><input type="text" name="ufid"
						 placeholder="액자 고유번호"  
						value='<c:out value="${vo.ufid}"/>'></td>
					<td></td>
					<td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${vo.updateDate}"
							pattern="yyyy-MM-dd" /></td>

				</tr>



			</tbody>
			
		</table>
	<input type="hidden" name="page" value="${cri.page}"> <input
			type="hidden" name="amount" value="${cri.amount}"> <input
			type="hidden" name="type" value="${cri.type}"> <input
			type="hidden" name="keyword" value="${cri.keyword}">
			<input type="hidden" name="mno" value="${cri.mno}">

	</form>



	</section>
	<%@include file="../includes/footer.jsp"%> </main>


	
	

	<script type="text/javascript" src="/resources/js/photo.js"> </script>
	<script>
		var actionForm = $("#actionForm");
		var uid = "${vo.uid}";
		
		
	
		
		
		$(".listBtn").on("click",function(e){
			actionForm.find("input[name='mno']").remove();	
			actionForm.attr("action","/member/list").submit();
		});
		
		$(".btn-danger").on(
				"click",
				function() {
					console.log("modify button clicked");

					var formObj = $("#form1");
					console.log(formObj);
					formObj.attr("action", "/member/modify").attr("method", "post")
							.submit();
				});
		
		
		</script>


	</body>
	</html>