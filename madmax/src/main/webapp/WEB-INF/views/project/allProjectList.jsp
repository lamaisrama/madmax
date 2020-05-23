<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

	<!-- Latest compiled and minified CSS -->
 <!--    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    jQuery library
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    Popper JS
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    Latest compiled JavaScript
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>  -->

    <!--dataTable-->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/dataTables.bootstrap4.min.css">



<style>
	th.title{
        text-align: center;    
    }
    
    td.startDate{
        text-align: center;
    }
</style>

<script>
/*검색에 대한 스크립트*/
	$(document).ready(function(){
		$("#searchPjName").on("keyup", function() {
			var value = $(this).val().toLowerCase();
				$("#allPjList tr").filter(function() {
					console.log($(this).children().eq(1).text());
					$(this).toggle($(this).children().eq(1).text().toLowerCase().indexOf(value) > -1)
				});
		});
	});
	
	$(document).ready(function() {
        $('#projectList').DataTable({
        		info: false,
        		// 페이징 기능 숨기기
        		paging: false
        });
    } );


</script>

<div class="col-sm-9 mt-5">
			<div id="myBoardTitle">
		               <h4><b>전체 프로젝트</b></h4>
		               <!-- 지울게 -->
		               <a href="${path}/selectedProject/selectedProject.do?pjNo=1&loginId=${loginUser.userId}">지울게</a>
		               <!-- 지울게 -->
		    </div>
				<table id="projectList" class="table">
					<thead>
						<tr class="table">
							<th>부서</th>
							<th data-orderable="false">프로젝트명</th>
							<th class="title">상태</th>
							<th class="title">시작일</th>
							<th data-orderable="false">참여자</th>
						</tr>
					</thead>
					<tbody id="allPjList">
					<!-- FOR문 시작 -->
						<c:forEach items="${list }" var="l">
						<tr>
							<td>${l.deptName }</td>
							<td class="pjName">
								<a href="${path}/selectedProject/selectedProjectView.do?pjNo=${l.projectNo}&loginId=${loginUser.userId}">${l.projectTitle }</a> 
							</td>
							<c:choose>
							<c:when test="${l.projectState eq 'P' }">
							<td>진행중</td>
							</c:when>
							<c:when test="${l.projectState eq 'E' }">
							<td>완료</td>
							</c:when>
							</c:choose>
							<td>
							<fmt:formatDate var="dateFmt" pattern="yyyy-MM-dd" value="${l.creationDate}"/>
							<c:out value="${dateFmt }"/>
							</td>
							<td>${l.members}</td>
						</tr>
						</c:forEach>
					</tbody>
					
				</table>
			<div class="mt-5">
			${pageBar }
			</div>

</div>
<!--col-sm-9 끝-->
<div class="sm-1">
</div>
<!-- 오른쪽 여백 설정-->





<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
