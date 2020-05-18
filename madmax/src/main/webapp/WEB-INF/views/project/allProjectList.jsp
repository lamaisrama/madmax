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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

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
        $('#projectList').DataTable();
    } );

</script>


<div class="col-sm-9">
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
			<tr>
				<td>마케팅팀</td>
				<td class="pjName">
					<a href=""${path/selectedProject/selectedProject.do?pjNo=1">project01</a> 
				</td>
				<td>완료</td>
				<td>2019.11.24</td>
				<td>김경인, 김규열, 김서율 등 9명 참여중</td>
			</tr>
			<tr>
				<td>총무팀</td>
				<td class="pjName">임직원 총무 업무지원</td>
				<td>진행중</td>
				<td>2019.05.13</td>
				<td>강수진, 강주영, 고윤진 등 95명 참여중</td>
			</tr>
			<tr>
				<td>디자인팀</td>
				<td class="pjName">마케팅 켐페인 배너 디자인 프로젝트</td>
				<td>완료</td>
				<td>2019.03.02</td>
				<td>강인규, 강철규, 강현준 등 50명 참여중</td>
			</tr>
			<tr>
				<td>인사팀</td>
				<td class="pjName">인사팀 업무지원</td>
				<td>진행중</td>
				<td>2019.08.30</td>
				<td>성연미, 손병욱, 신호석 등 50명 참여중</td>
			</tr>
			<tr>
				<td>IT팀</td>
				<td class="pjName">시스템 유지운영 프로젝트</td>
				<td>진행중</td>
				<td>2019.02.07</td>
				<td>김연지, 남기웅, 박서희 등 40명 참여중</td>
			</tr>
			<tr>
				<td>IT팀</td>
				<td class="pjName">앱 2.0 업데이트 프로젝트</td>
				<td>진행중</td>
				<td>2020.01.05</td>
				<td>김우현, 김재형, 문재영 등 28명 참여중</td>
			</tr>
		</tbody>
	</table>
</div>
<!--col-sm-9 끝-->

<!-- 오른쪽 여백 설정-->
<div class="col-sm-1"></div>




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
