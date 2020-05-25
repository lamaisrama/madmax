<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>

<jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp" />

<div class="col col-sm-9 list-container">
	<br><br>
	<h4 style="font-weight:bolder">&nbsp;<i class="fas fa-user-check"></i> &nbsp;회원 가입 승인</h4>
	<br>
	
	
	<div class="row draftList" style="clear:both;">
		<div class="col">
			<table class="table table-hover" style="text-align:center;">
				<tr class="bg-light">
					<th>#</th>
					<th>회원 이름</th>
					<th>전화 번호</th>
					<th>부서 </th>
					<th>입사일</th>
					<th width="20%"></th>
				</tr>
				
				<c:if test="${not empty list}">
					<form id="form">
						<c:forEach items="${list }" var="l" varStatus="vs">
							<tr>
								<td>${vs.index+1}</td>
								<td>${l.userName}</td>
								<td>${l.phone}</td>
								<td>${l.deptName}</td>
								<td><fmt:formatDate value="${l.hireDate}" type="both" pattern="yyyy-MM-dd" /></td>
								<td><button type="button" class="btn btn-outline-primary" onclick="btn();">가입 승인</button>
									<input type="hidden" id="userId" name="userId" value="${l.userId}" /></td>
							</tr>
						</c:forEach>
					</form>
				</c:if>
			</table>
		</div>
	</div>
</div>


<script>
	function btn(){
		console.log($("#userId").val());
		var userId=$("#userId").val();
	if (
		confirm(" 승인하시겠습니까 ?") == true){    //확인
		$("#form").attr("action","${path}/admin/updateUserState.do");
		$("#form").submit();
		
		}else{   //취소
		    return;
		}
	}



</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>