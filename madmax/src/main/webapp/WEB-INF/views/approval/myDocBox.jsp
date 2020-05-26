<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<style>	
	.list-container{
		margin-left:10px;
		font-size:12px;
	}
	.searchBox{background-color:#F1F0F5 }
	.searchBox *{
		margin : 0px auto;
	}
	.searchBox form {margin-top:10px;}
	.searchBox th{
		text-align:right;
	}
	
	.searchBox td{
		text-align:left;
	}
</style>
<div class="col col-sm-9 list-container">
	<br><br>
	<h4 style="font-weight:bolder">&nbsp;<i class="fas fa-clipboard-list"></i> &nbsp;내 문서함</h4>
	<br>	
	<!-- <p><i class="fas fa-search"></i> &nbsp;검색</p> -->
	<div class="row searchBox" style="font-size:12px;">	
		<form style="width:80%" action="${path}/appr/searchMyDocBox.do">
			<table class="table table-borderless">
				<tr>
					<th>문서제목</th>
					<td><input type="text" name="draftName">
					<th>완료일</th>
					<td>
						<input type="date" name="startDate"> ~
						<input type="date"  name="endDate">
						<input type="hidden" name="url" value="approval/myDocBox">
						
					</td>
					<td>
						<button type="submit" class="btn btn-sm btn-secondary">search</button>
					</td>
				</tr>
			</table>
		</form> 
	</div>
	<br>
	<div class="row opt-container" style="margin-left:10px;">
		<p>전체 <span style="color:red"> ${totalData } </span></p>
	</div>
	<div class="row draft-container">
		<div class="col">
			<table class="table table-hover">
				<tr style="background-color:#F1F0F5;">
					<th>번호</th>
					<th>문서양식</th>
					<th>문서제목</th>
					<th>기안일</th>
					<th>상태</th>
				</tr>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var ="l">
						<tr>
							<td>${l.apprNo}</td>
							<td>${l.typeTitle }</td>
							<td><a href="javascript:void(0)" 
									onclick="window.open('${path}/appr/openApprDoc?apprNo=${l.apprNo }',
									'_blank','width = 1000, height = 600, top = 120px, left = 400px')">
									${l.apprTitle }
								</a></td>
							<td><fmt:formatDate value="${l.writeDate }" type="both" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							<td>
								<c:if test="${l.apprStatus==3 }"><span class="badge badge-success badge-pill">승인</span></c:if>
								<c:if test="${l.apprStatus==4 }"><span class="badge badge-danger badge-pill">반려</span></c:if>
							</td>	
						</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
	<div id="pagebar-container">
		<br>
		${pageBar }
		<br>
	</div>
</div>
		



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>