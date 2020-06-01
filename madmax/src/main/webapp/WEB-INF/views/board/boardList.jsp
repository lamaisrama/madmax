<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<link href='${path}/resources/css/board.css' rel='stylesheet'/>

<div class="brdcontainer col-sm-10">
	
<div class="col-sm-10 item mx-auto align-self-center text-center">
	<h1 class="display-4 mt-5">공지사항</h1>
	<br>
	<br>
	<table class="table table-hover text-center">
	  <thead class="thead-bg">
	    <tr>
	      <th scope="col">번호</th>
	      <th scope="col" width="40%">제목</th>
	      <th scope="col">작성자</th>
	      <th scope="col">작성일</th>
	      <th scope="col">첨부파일</th>
	      <th scope="col">조회수</th>
	    </tr>
	  </thead>
	  <tbody>
	    <c:forEach items="${list }" var="b"> 
		    <tr class="table-light">
		      <th scope="row" class="brdbb"><c:out value="${b.boardNo }"/></th>
		      <td class="brdbb">
		      	<a href="${path }/board/boardView.do?no=${b.boardNo}">
	    	        <c:out value="${b.boardTitle }"/>
		     	</a>
	         </td>
		      <td class="brdbb"><c:out value="${b.boardWriter }"/></td>
		      <td class="brdbb"><fmt:formatDate type="date" pattern="yy/MM/dd hh:mm" value="${b.boardDate }"/></td>
		      <td align="center" class="brdbb">
				<c:if test="${b.boardOriginalFilename!=null}">
					<img src="${path}/resources/images/file.png" width="20px"/>
				</c:if>
	          </td>
	          <td class="brdbb"><c:out value="${b.boardReadCount }"/></td>
		    </tr>
	    </c:forEach>
	  </tbody>
	</table>	
	<br>
	<c:if test="${loginUser.userId=='admin'}">
		<button class="boardBtn" style="float:right;" onclick="location.replace('${path}/board/boardWrite');">글쓰기</button>
	</c:if>
	<br>
	<div id="page-container">
		${pageBar}
	</div> 	
</div>	
</div>	



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>