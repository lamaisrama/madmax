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
	.favoriteBox{
		/* background-color: #F1F0F5; */
		border-left: 5px solid #233C61;
		box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
  		transition: all 0.3s cubic-bezier(.25,.8,.25,1);
		width : 200px;
		height : 150px;
		text-align : center;
		color: #233C61;
		padding-top : 55px;
		margin : 0 40px 40px 0;
	}
	.favoriteBox a:link{
		color: #233C61;
		text-decoration: none;
	}
	.favoriteBox a:visited{
		color: #233C61; 
		text-decoration: none;
	}
	.favoriteBox:hover {
  		box-shadow: 0 14px 28px rgba(0,0,0,0.25), 0 10px 10px rgba(0,0,0,0.22);
  		text-decoration : none;
		font-weight: 700;
	}
</style>
<div class="col-sm-9 mx-auto">
	<br><br>
	<h4 style="font-weight:bolder"><i class="fas fa-star" style="color: #ffd700;"></i>&nbsp;즐겨찾기 프로젝트</h4>
	<hr>                    
	<div class="ml-4">총 ${total }건의 즐겨찾는 프로젝트가 있습니다.</div>
	<br><br>
    <div class="d-flex flex-wrap">
		<c:forEach items="${list }" var="f">
	     	<div class="favoriteBox">
		       	<a href="${path }/selectedProject/selectedProject.do?pjNo=${f.projectNo}&loginId=${loginUser.userId}">
		       		<c:out value="${f.projectTitle}"/>
		       	</a>
	     	</div>
	    </c:forEach>
	</div>
</div>	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>