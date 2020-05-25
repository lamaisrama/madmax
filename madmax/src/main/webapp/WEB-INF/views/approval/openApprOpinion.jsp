<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S'tool | 기안 확인</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b5f4d53f14.js" crossorigin="anonymous"></script>
<link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="${path }/resources/css/apprDoc.css">
<script src="${pageContext.request.contextPath }/resources/js/apprdraft.js"></script>
</head>
<body>
		<div class="content-container">
			<h5>결재의견</h5>
			<table class="content">
				<tr class="basicContent">
					<th>결재</th>
					<th>기안일자</th>
					<th>결재자</th>
					<th>부서</th>
					<th>결재일시</th>
					<th>의견</th>
				</tr>
				
				<c:forEach items="${appr}" var="appr">
					<tr class="basicContent">
						<td style="width:10px;">
							<c:if test="${appr.apprType=='approval' }">결재</c:if>
							<c:if test="${appr.apprType=='agree' }">승인</c:if>
						</td>
						<td style="width:120px;"><fmt:formatDate value="${appr.writeDate }" dateStyle="long" type="date"/> </td>
						<td style="width:10px;">appruser</td>
						<td  style="width:10px;">${appr.deptName}</td>
						<td  style="width:120px;">결재일시</td>
						<td>apprMessage</td>
					</tr>
				</c:forEach>
			</table>
		</div>
		
		

</body>
</html>