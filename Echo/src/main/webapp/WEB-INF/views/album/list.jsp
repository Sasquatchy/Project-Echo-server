<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>

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
<div class="template-demo">

                  <table class="table">
                     <thead>
               <tr>
                 <th>mno</th>
                 <th>uid</th>
                 <th>pw</th>
                 <th>username</th>
                 <th>mobile</th>
                 <th>regdate</th>
                 <th>updatedate</th>
               </tr>
             </thead>
                     <tbody>
               <c:forEach items="${list}" var="vo">
                <tr>
                    <td><a href='${vo.mno}' class='view'><c:out value="${vo.mno}" /></td>
                    <td><c:out value="${vo.uid}" /></td>
                    <td><c:out value="${vo.pw }"/></td>
                    <td><c:out value="${vo.username}" /></td>
                    <td><c:out value="${vo.mobile}" /></td>
                    <td><fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd"/></td>
                    <td><fmt:formatDate value="${vo.updateDate}" pattern="yyyy-MM-dd"/></td>
                    
                </tr>
                </c:forEach>



             </tbody>
                  </table>
                </div>
							</div>
						</div>
					</div>
				</div>
      </main>




<%@include file="../includes/footer.jsp"%>
</body>
</html>