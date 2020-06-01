<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var="path" value="${pageContext.request.contextPath }" />           
<!-- 상단 고정글 -->
<div class="w-100 d-flex flex-column border p-3 mb-3 mt-3">
	
    <div class="d-flex align-items-center mb-3">
        <i class="fas fa-thumbtack stoolDarkBlue-text selectPinIcon" style="font-size: 25px;"></i>
        <p class="m-0 ml-2 mr-1">상단고정글</p>
        <span>1</span> <!-- 상단고정글 갯수 넣기 -->
    </div>
    
    <!-- 상단고정글 -->
    <div class="w-100 d-flex flex-column align-items-center">
        <!-- 고정글 1 제목 -->
        <button type="button" class="btn btn-pinPost w-100 d-flex align-items-center" data-toggle="collapse" data-target="#pinPost-1" id="reportBoxBtn">
		<!-- 분기처리.. 만약 글 타입이 W이면 일반,S이면 일정,T이면 업무 -->

            <strong>[업무]</strong>
            <p class="m-0 ml-2">화면구현하기</p><!-- 글의 제목, 일정의 제목, 업무의 제목 셋중하나..ㅠㅠ -->
        </button>      
        
        <div id="pinPost-1" class="collapse p-2 w-100">  
        </div>    

    </div>
    <!-- 상단고정글 > 게시물[업무] 끝 -->

</div>

<hr class="w-100 mt-2 mb-2"/> <!-- if문으로 마지막 글은 반복하지 않기 --> 
    
</div> <!-- 상단고정글 박스 끝 -->