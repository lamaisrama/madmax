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
	<h1 class="display-4 text-center mt-5">공지사항</h1>
	<br>
	<table class="brdFrame">
		<tr class="mb-1">
			<th class="brdTh">글번호</th>
			<td class="brdviewtd"><input class="brdview" type="text" name="no" id="no" value="${board.boardNo }" readonly/></td>
		</tr>
        <tr>
        	<th class="brdTh">제목</th>
        	<td class="brdviewtd"><input class="brdview" type="text" placeholder="제목" name="boardTitle" id="boardTitle" value="${board.boardTitle }" readonly></td>
       	</tr>
       	<tr>
        	<th class="brdTh">작성자</th>
        	<td class="brdviewtd"><input class="brdview" type="text" name="boardWriter" value="${board.boardWriter }" readonly></td>
		</tr>  
		<tr>
			<th class="brdTh">첨부파일</th>
			<td class="brdviewtd">      	
	        <c:if test="${board.boardOriginalFilename!=null}">
		        <button type="button" class="boardDownBtn" id="btn_board_file"
		                onclick="fileDownload('${board.boardOriginalFilename}','${board.boardRenamedFilename }')">
		           	첨부파일 다운로드 ${board.boardOriginalFilename }
		        </button>
	        </c:if>
	        </td>
        <tr>
        <tr>
        	<th class="brdTh">내용</th>
        	<td class="brdviewtd">
        		<textarea name="boardContent" placeholder="내용" readonly>${board.boardContent }</textarea>
        	<td>
        </tr>
        <tr>
        	<td class="brdviewtd text-center" colspan="2">
        	<br><br><br>
	    		<button class="boardBtn" onclick="location.replace('${path}/board/boardList.do');">목록</button>&nbsp;
	    	<%-- <c:if test="${loginUser.userId=='admin'}"> --%>
	    		<button class="boardBtn" onclick="location.replace('${path}/board/boardModify?no=${board.boardNo }');">수정</button>&nbsp;
	    		<button class="boardBtn" id="btn_board_delete">삭제</button>
	    	<%-- </c:if> --%>
    		<br><br><br><br>
    		</td>
    	</tr>	
    </table>
	<script>
	function fileDownload(ori,rename){
		ori=encodeURIComponent(ori);
		location.href="${path}/board/fileDownload?ori="+ori+"&rename="+rename;
	}
		
	$("#btn_board_delete").click(function(){
		var chk = confirm("정말 삭제하시겠습니까?");
		if (chk) {
			location.href="${path}/board/boardDelete.do?no=${board.boardNo}"
			}
 		});
	</script>
</div>	
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
