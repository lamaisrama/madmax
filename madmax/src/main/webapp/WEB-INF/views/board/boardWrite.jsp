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
	<div class="col-sm-7 item mx-auto align-self-center">
	<h1 class="display-4 text-center mt-5">공지사항 작성</h1>
	<br><br>
	<form action="${path}/board/boardWriteEnd.do" name="boardWriteFrm" method="post" enctype="multipart/form-data" >
		<table class="brdFrame">
			<%-- <tr class="mb-1">
				<th class="brdTh">글번호</th>
				<td class="brdviewtd"><input class="brdview" type="text" name="boardNo" id="no" value="${board.boardNo }" readonly/></td>
			</tr> --%>
	        <tr>
	        	<th class="brdTh">제목</th>
	        	<td class="brdviewtd"><input class="brdview" type="text" placeholder="" name="boardTitle" id="boardTitle" value="${board.boardTitle }" required></td>
	       	</tr>
	       	<tr>
	        	<th class="brdTh">작성자</th>
	        	<td class="brdviewtd"><input class="brdview" type="text" name="boardWriter" value="ADMIN" readonly></td>
			</tr>  
			<tr>
				<th class="brdTh">첨부파일</th>
				<td class="brdviewtd">      	
				 <div class="custom-file">
	                    <input type="file" class="custom-file-input" name="upFile" id="upFile1">
	                    <label class="custom-file-label" for="upFile1">파일을 선택하세요</label>
	             </div>
		        </td>
	        <tr>
	        <tr>
	        	<th class="brdTh">내용</th>
	        	<td class="brdviewtd">
	        		<textarea name="boardContent" placeholder="" required>${board.boardContent }</textarea>
	        	<td>
	        </tr>
	        <tr>
	        	<td class="brdviewtd text-center" colspan="2">
	        		<br><br><br>
		    		<button type="submit" class="boardBtn">작성완료</button>&nbsp;
		    		<button class="boardBtn" onclick="location.replace('${path}/board/boardList.do');">작성취소</button>
	    			<br><br><br><br>
	    		</td>
	    	</tr>	
	    </table>
    </form>
	
	<script>
	$(function(){
		$('[name=upFile]').on("change",function(){
			const fileName=this.files[0].name;
			$(this).next(".custom-file-label").html(fileName);
		});
	});
	</script>
</div>	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
