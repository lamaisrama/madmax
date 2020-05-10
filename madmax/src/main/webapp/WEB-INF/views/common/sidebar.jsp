<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<style>
	ul{
	   list-style:none;
	   padding-left:5px;
	   }
	li{
		padding-left:9px; padding-bottom:3px;
		cursor:pointer;
	}
	.userBtn{
		border:1px solid lightgrey;
		border-radius: 50%;
		width: 70px;
		height: 70px;
	}
	
</style>

<div class="col col-sm-2">
	<br>	
	<nav>
		<ul>
			<li>
				<div class="user-container">
					<button type="button" class="userBtn btn btn-light">
						<i class="far fa-user" style="font-size:40px;"></i>
						<span><i style="font-size:8px;">증명사진</i></span>
					</button>
					<span><img src="${path }/resources/images/online.png" width="10px"/> <strong>UserName</strong>님</span>				
				</div>
			</li>
			<hr>
			<li>전체 프로젝트</li>
			<li>즐겨찾기</li>
			<hr>
			<li>전체 업무</li>
			<li>전체 일정</li>
			<li>담아둔 글</li>
			<li>나를 지정</li>
			<li>내 게시물</li>
			<hr>
			<li>숨긴 프로젝트</li>
			<hr>	
		</ul>
	</nav>

</div>
