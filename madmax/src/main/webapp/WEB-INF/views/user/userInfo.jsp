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
	.modify{
		width : 100%; 
		padding: 0 0 5px 10px; 
		border: none; 
		border-bottom: solid 1px #233C61; 
		border-radius:0; 
		background: transparent;
	}
	h6 {
	    margin: 15px 0;
	}
	.icon {
	    	text-align:center;
	    	width:30px; 
	    }
	.joinBtn {
		margin: 20px 0 100px 10px; 
		width:270px;
		font-size : 17px;
		font-weight : 600;
		border: 2px solid #233C61; 
		border-radius:50px;
		color : #233C61;
	}
   .joinBtn:hover{
	   	background-color: #FFE3E3;
	   	color : #233C61;
   }
   .profile{
		border: 3px solid #233C61; 
		margin-left : 15%;
        width:200px; height:200px;
        overflow:hidden;
        margin: 0 0 20% 15%;
        position: relative;
    }
    .profile img {
		width: 100%; height:auto;
		vertical-align: middle;
	}  
</style>


<div class="col col-sm-10">
	<div class="container" id="container">

        <div class="d-flex">

            <div class="mx-auto">
                <br>
                <h1 class="display-4 text-center pt-4 mb-4">사원정보</h1>
				<div class="profile">
				<img src="${path}/resources/upload/profile/${loginUser.profile }">
                </div>
                    <h6>
                    	<i class="icon fas fa-user"></i>&nbsp;아이디
                    </h6>
                      <div class="mb-3">       
                        <input type="text" class="modify" value="${loginUser.userId}" readonly>
                      </div>
					
					<br>
                      <h6><i class="icon far fa-grin"></i>&nbsp;이름</h6>
                      <div class="input-group mb-3">
                        <input type="text" class="modify" value="${loginUser.userName }" readonly>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-envelope"></i>&nbsp;이메일</h6>
                      <div class="input-group">
                        <input type="text" class="modify" value="${loginUser.email}" readonly>
                      </div>
					  <br>
                      <h6><i class="icon fas fa-mobile-alt"></i>&nbsp;전화번호</h6>
                      <div class="input-group mb-3">
                        <input type="text" class="modify" value="${loginUser.phone }" readonly>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-birthday-cake"></i>&nbsp;생년월일</h6>
                      <div class="input-group mb-3 modify">
                        <fmt:formatDate pattern="yyyy년 MM월 dd일" value="${loginUser.birthday }"/>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-briefcase"></i>&nbsp;부서</h6>
                      <div class="input-group mb-3">
                        <input type="text" class="modify" value="${loginUser.deptName }" readonly>
                      </div>
                      <br>
                      <h6><i class="icon far fa-address-card"></i>&nbsp;직급</h6>
                      <div class="input-group mb-3">
                        <input type="text" class="modify" value="${loginUser.jobName }" readonly>
                      </div>
                      <br>
                      <div class="row justify-content-center p-1">
                        <button type="button" class="btn joinBtn mb-4" onclick="location.replace('${path}/user/userUpdate');">정보 수정</button>&nbsp;&nbsp;&nbsp;
                    </div>
                
            </div>
            
        </div>
    </div>
</div>	



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>