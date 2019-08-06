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
			<h1 class="mdc-card__title mdc-card__title--large">Member Table</h1>
		</section>
		<div class='form-row'>
			<div class="col-md-8">
				<div class='form-row'>
					<select name='typeView' class="form-control keywordOpt">
						<option value="">--</option>
						<option value="B" ${cri.type == 'B'? "selected":""}>mno</option>
						<option value="U" ${cri.type == 'U'? "selected":""}>userid</option>
						<option value="N" ${cri.type == 'N'? "selected":""}>username</option>
					</select> <input type='text' name="searchKeyword" class='form-control' value="${cri.keyword}">

					<button class="btn btn-default searchBtn ">Search</button>

								<select class="form-control opt">

									<option value="10" ${cri.amount ==10? "selected":"" }>10</option>
									<option value="20" ${cri.amount ==20? "selected":"" }>20</option>
									<option value="50" ${cri.amount ==50? "selected":"" }>50</option>

								</select>
							</div>
						</div>
						<div class="col-md-2">
						<button class="btn btn-default listBtn" onClick="location.href='../member/list'">List</button>
					</div>
						<div class="col-md-2">
						<button class="btn btn-default registerBtn">Register</button>
					</div>
					</div>
						<div class="template-demo">
							<table class="table">

								<thead>
									<tr>
										<th>mno</th>
										<th>uid</th>
										<th>pw</th>
										<th>username</th>
										<th>mobile</th>
										<th>auth</th>
										<th>regdate</th>
										<th>updatedate</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${list}" var="vo">
										<tr>
											<td><a href='${vo.mno}' class='view'><c:out
														value="${vo.mno}" /></td>
											<td><c:out value="${vo.uid}" /></td>
											<td><c:out value="${vo.pw }" /></td>
											<td><c:out value="${vo.username}" /></td>
											<td><c:out value="${vo.mobile}" /></td>
											<td></td>
											<td><fmt:formatDate value="${vo.regDate}"
													pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value="${vo.updateDate}"
													pattern="yyyy-MM-dd" /></td>

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
	</main>

	<form id="actionForm" action="/member/list" method="get">
		<input type="hidden" name="page" value="${cri.page}"> 
		<input type="hidden" name="amount" value="${cri.amount}"> 
		<input type="hidden" name="type" value="${cri.type}"> 
		<input type="hidden" name="keyword" value="${cri.keyword}">

	</form>
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
		
		$(".view").on("click",function(e) {e.preventDefault();
		var targetMno = $(this).attr("href");
		actionForm.attr("action", "/member/read").append("<input type ='hidden' name='mno' value="+targetMno+">")
					.submit();
					}//end function		
					);
		
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
		
		//Btns
		/* $(".listBtn").on("click", function(e){
			e.preventDefault();
			
			actionForm.attr("action", "/member/list")
			.submit();
			
		}); */
		$(".registerBtn").on("click", function(e){
			e.preventDefault();
			
			actionForm.attr("action", "/member/register")
			.submit();
			
		});
	</script>
	<%@include file="../includes/footer.jsp"%>
	</body>
	</html>