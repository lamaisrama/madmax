<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
 	ul{
	   list-style:none;
	   padding-left:5px;
	   }
	   
	li{
		padding-left:9px;
	} 
	.userBtn{
		border:1px solid lightgrey;
		border-radius: 50%;
		width: 70px;
		height: 70px;
	}
	a{
		color:black;
		text-decoration: none;
	}
</style>
<div class="col col-sm-2">
<br>
	<nav>
		<ul> 
			<li>
				<button type="button" class="userBtn btn btn-light">
					<i class="far fa-user" style="font-size:40px;"></i>
				</button>
				<span><img src="${path }/resources/images/online.png" width="10px"/> <strong>박나정</strong> 님</span>
			</li>
			<hr>
			<span><strong>기안</strong></span>
			<li><a href="${path }/appr/approval.do">기안문 작성</a></li>
			<li><a href="${path }/appr/apprReqBox.do">결재 요청함</a></li>
			<li><a href="${path }/appr/apprTempBox.do">임시 문서함</a></li>
			<hr>
			<span><strong>결재</strong></span>
			<li><a href="${path }/appr/apprWaitBox.do">결재 대기함</a></li>
			<li><a href="${path }/appr/apprProgBox.do">결재 진행함</a></li>	
			<li><a href="${path }/appr/apprDoneBox.do">완료 문서함</a></li>
			<hr>
			<span><strong>문서함</strong></span>
			<li><a href="${path }/appr/myDocBox">내 문서함</a></li>
			<li><a href="${path }/appr/deptDocBox">부서 문서함</a></li>
			<li><a href="${path }/appr/myStorageBox">개인 보관함</a></li>
		</ul>
	</nav>

</div>
