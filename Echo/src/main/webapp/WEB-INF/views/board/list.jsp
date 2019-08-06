<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../includes/header.jsp"%>
<style>

.form-control{
	width: auto;
}
.opt{
	width: 100px;
}
.keywordOpt{
	width: 100px;
	white-space:nowrap;
}
.searchKeyword{
width: 200px;
padding-right: 10px
}

.btn-default{
height: 37.99px;
}
</style>
		
<!-- partial -->
<div class="page-wrapper mdc-toolbar-fixed-adjust">
	<main class="content-wrapper">

	<div class="mdc-layout-grid">

		<div class="mdc-layout-grid__inner">


			<div class="mdc-layout-grid__cell stretch-card mdc-layout-grid__cell--span-12">


				<div class="mdc-card">
					<section class="mdc-card__primary">
						<h1 class="mdc-card__title mdc-card__title--large">Board Tables</h1>

					</section>
					
					<div class='form-row'>
					<div class="col-md-10">
			
						<div class='form-row'>
						<select name = 'typeView' class="form-control keywordOpt">
							 <option value="">--</option>
							 <option value="B" ${cri.type == 'B'? "selected":""} >bno</option>
							 <option value="U" ${cri.type == 'U'? "selected":""} >userid</option>
							 <option value="S" ${cri.type == 'S'? "selected":""} >writer</option>
					 	</select>
					 	
					 	<input type='text' name="searchKeyword" class='form-control' value="${cri.keyword}">
					 	
					 	<button class="btn btn-default searchBtn ">Search</button>
					 	
						<select class="form-control opt">
						
							<option value="10" ${cri.amount ==10? "selected":"" }>10</option>
							<option value="20" ${cri.amount ==20? "selected":"" }>20</option>
							<option value="50" ${cri.amount ==50? "selected":"" }>50</option>
							
						</select>
					</div>
					</div>
					<div class="col-md-2">
						<button class="btn btn-default registerBtn">Register</button>
					</div>
					</div>
					<div class="template-demo">
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
								<c:forEach items="${list}" var="vo">
									<tr>
										<td><a href='${vo.bno}' class='view'><c:out
													value="${vo.bno}" /></a></td>
										<td><c:out value="${vo.uid }" /></td>
										<td><fmt:formatDate value="${vo.regDate}"
												pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${vo.updateDate}"
												pattern="yyyy-MM-dd" /></td>
										<td><c:out value="${vo.sent}" /></td>
										<td><a href='${vo.bno}' class='deleteIcon'><i class="mdi mdi-delete text-red" data-toggle="modal"
							data-target="#deleteModal"></i></a></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>

						<div class="table-responsive">
							<ul class="pagination justify-content-center">

								<c:if test="${pm.prev}">

									<li class="page-item"><a class="page-link"
										href='${pm.start -1}'>Previous</a></li>
								</c:if>

								<c:forEach begin="${pm.start}" end="${pm.end}" var="idx">
									<li class="page-item  ${pm.current==idx?"active":"" }"><a
										class="page-link" href='${idx}'>${idx}</a></li>
								</c:forEach>

								<c:if test="${pm.next}">
									<li class="page-item"><a class="page-link"
										href='${pm.end +1}'>Next</a></li>
								</c:if>
							</ul>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>
	</main>
	<form id="actionForm" action="/board/list" method="get">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="amount" value="${cri.amount}"> 
		<input type="hidden" name="type" value="${cri.type}"> 
		<input type="hidden" name="keyword" value="${cri.keyword}">

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
	
	<script>
		var actionForm = $("#actionForm");

		$(".searchBtn").on("click", function(e){
			var keyword = $("input[name='searchKeyword']");
			var keywordValue = keyword.val();
			
			if(keywordValue.trim().length==0){
				alert("검색어를 입력하세요");
				return;
			}
			
			$("input[name='keyword']").val(keywordValue);
			$("input[name='page']").val(1);
			
			var selectValue =$("select[name='typeView']").val();
			
			//alert(selectValue);
			
			$("input[name='type']").val(selectValue);
			actionForm.submit();
			
		});
		
		$(".registerBtn").on("click", function(e){
			e.preventDefault();
			
			actionForm.attr("action", "/board/register")
			.submit();
			
		})
		
		$('.deleteIcon').on("click",function(e){
			e.preventDefault();
			var targetBno = $(this).attr("href");
			/* Open modal, write the content and needed data*/
			var modalBody = $(".modal-body-wrapper")
			modalBody.html("");
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
		
		
		$(".view").on("click", function(e) {
			e.preventDefault();
			var targetBno = $(this).attr("href");
			
			actionForm.attr("action", "/board/read")
			.append("<input type ='hidden' name='bno' value="+targetBno+">")
			.submit();
		});

		$(".page-link").on("click", function(e) {
			e.preventDefault();
			var targetPage = $(this).attr("href");
			console.log("targetPage: " + targetPage);
			actionForm.find("input[name='page']").val(targetPage);
			actionForm.submit();
		});

		$('.opt').on("change", function(e) {
			console.log(this.value);
			var amountValue = this.value;

			actionForm.find("input[name='page']").val(1);
			actionForm.find("input[name='amount']").val(amountValue);
			actionForm.submit();
		});
		
	</script>


	<%@include file="../includes/footer.jsp"%>