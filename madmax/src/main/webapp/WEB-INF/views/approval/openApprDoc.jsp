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
<link rel="stylesheet" href="${path }/resources/css/apprDoc.css">
<script src="${pageContext.request.contextPath }/resources/js/apprdraft.js"></script>
</head>
<body>
	<form action="${path }/appr/draftFormEnd" method="post" onsubmit="return beforeSubmit();">
	<input type="hidden" name="apprDocTypeNo" value="${appr.typeTitle }">
	<div class="header">
		<c:if test="${appr.apprStatus==1 }">
			<button type="button" class="btn btnPrimary" onclick="moveToTempBox('${appr.apprNo }');">회수</button>
		</c:if>
		<c:if test="${appr.apprStatus==0 }">
			<button type="button" class="btn btnPrimary" onclick="deleteDraft('${appr.apprNo }');">삭제</button>
		</c:if>
		<button type="button" class="btn btnLight" onclick="closePage();">닫기</button>
	</div>
	<h3 style="text-align:center; margin:30px auto;">${draftName }</h3>
		<div class="container-fluid line-container">
			<table class="lineTbl"> 
				<tr id="apprTbl-dept">
					<th class="line title" rowspan="2" style="padding:0 5px;">결<br><br>재</th>
					<th class="line writerInfo">department</th>
					<c:forEach items="${appr.apprLine}" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<th class="line writerInfo">${l.deptName }</th>
						</c:if>		
					</c:forEach>
				</tr>
				<tr id="apprTbl-user">
					<td height="60" class="writerInfo">userName <br> jobtitle</td>
					<c:forEach items="${appr.apprLine }" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<td height="60" class="writerInfo">${l.userName } <br> ${l.jobName }</td>
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<table class="lineTbl ">
				<tr id="agreeTbl-dept">
					<th class="line title" rowspan="2" style="padding:0 5px;">합<br><br>의</th>
					<c:forEach items="${appr.apprLine }" var="l">
						<c:if test="${l.apprType.equals('agree') }">
							<th class="line">${l.deptName }</th>
						</c:if>
					</c:forEach>
				</tr>
				<tr id="agreeTbl-user">
					<c:forEach items="${appr.apprLine}" var="l">
						<c:if test="${l.apprType.equals('agree') }">
							<td height="60" class="writerInfo">${l.userName } <br> ${l.jobName }</td>
						</c:if>
					</c:forEach>
				</tr>
			</table> 				
		</div>
		<div class="content-container">
			<table class="content">
				<tr class="basicContent">
					<th>문서번호</th>
					<td>${appr.apprNo }</td>
					<th>기안일자</th>
					<td>
						<fmt:formatDate value="${appr.writeDate }" dateStyle="long" type="date"/> 
					</td>
				</tr>
				<tr class="basicContent">
					<th>기안자</th>
					<td>
						${appr.userName }
					</td>
					<th>기안 부서</th>
					<td>${appr.deptName }</td>
				</tr>
				<tr class="basicContent">
					<th>수신처</th>
					<td id="receivingInfo"><i><b style="color:red">이 부분 처리 해야됨</b></i></td>
					<th>기결재첨부</th>
					<td>><i><b style="color:red">이 부분 처리 해야됨</b></i></td>
				</tr>
				<tr class="basicContent">
					<th>기안 제목</th>
					<td colspan="3">
						<div class="form-group my-1 mr-3">
							<input type="text" class="form-control" name="apprTitle" value="${appr.apprTitle }" readOnly>
						</div>
					</td>
				</tr>
				<c:if test='${appr.apprText!=null && appr.apprText!="" }'>
				<tr class="basicContent">
					<th>기안 내용</th>
					<th colspan="3"></th>
				</tr>
				<tr >
					<td colspan="4">
						<div style="margin:10px 20px;">
							<c:out value="${appr.apprText }" escapeXml="false"/>						
						</div>
					</td>
				</tr>
				</c:if>
			</table>
			<!-- 문서양식 별 태그 넣는 곳 -->
			<table class="table table-hover" id="doc-form-table">
					<c:out value="${appr.apprContent }" escapeXml="false"/>
			</table>
		</div>
		<br>
	</form>
	<script>
		$(function(){
			$("input").attr("readOnly","true");
		})
		
				function moveToTempBox(apprNo){
			$.ajax({
				url:"${pageContext.request.contextPath}/appr/updateTemporary",
				data:{"apprNo":apprNo},
				type:"get",
				success:(data)=>{
					alert('해당 문서가 임시 저장함에 저장되었습니다.');
					self.close();
				}
			})
		}
		
		function deleteDraft(apprNo){
			if(confirm("정말로 삭제하시겠습니까? 문서는 복구되지 않습니다.")){
				$.ajax({
					url:"${pageContext.request.contextPath}/appr/deleteDoc",
					data:{"apprNo":apprNo},
					type:"get",
					success:(data)=>{
						alert('삭제되었습니다..');
						self.close();
					}
				})
			}
		}
		
	</script>
</body>
</html>