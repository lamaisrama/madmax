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
	.container{
		background : #EBDACE;
	}
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
		margin: 80px 0 100px 10px; 
		width:270px;
		font-size : 17px;
		font-weight : 600;
		border: 2px solid #233C61; 
		border-radius:50px;
		color : #233C61;
	}
   .joinBtn:hover{
   	background-color: #233C61;
   	color : #EBDACE;
   }
</style>


<div class="col col-sm-10" style="background : #EBDACE;">
<div class="container">

        <div class="d-flex">

            <div class="mx-auto">
                <br>
                <h1 class="display-4 text-center pt-4 mb-4">사원정보수정</h1>

                <form action="${path}/user/userUpdate.do" enctype="multipart/form-data" name="userUpdateFrm" method="post">
					<br>
                    <h6>
                    	<i class="icon fas fa-user"></i>&nbsp;아이디
                    </h6>
                      <div class="mb-3">       
                        <input type="text" class="modify" value="${loginUser.userId}" readonly>
                      </div>
					
					<br>
                      <h6><i class="icon fas fa-unlock-alt"></i>&nbsp;비밀번호</h6>
                      <div class="input-group mb-3">
                        <input type="password" class="modify" placeholder="영문자나 숫자(4~12자) 입력" size="30" name="password" id="password_" required>
                      </div>
                      <div class="input-group mb-3">
                        <input type="password" class="modify" placeholder="비밀번호 확인" size="30" id="password2" required>
                      </div>
                      <div class="alert alert-success" id="alert-success2">비밀번호가 일치합니다.</div>
                      <div class="alert alert-danger" id="alert-danger2">비밀번호가 일치하지 않습니다.</div>
                      <br>
                      <h6><i class="icon far fa-grin"></i>&nbsp;이름</h6>
                      <div class="input-group mb-3">
                        <input type="text" class="modify" value="${loginUser.userName }" readonly>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-envelope"></i>&nbsp;이메일</h6>
                      <div class="input-group">
                        <input type="text" class="modify" placeholder="stool@madmax.com" size="30" name="email" id="email" required>
                      </div>
					  <br>
                      <h6><i class="icon fas fa-mobile-alt"></i>&nbsp;전화번호</h6>
                      <div class="input-group mb-3">
                        <input type="text" class="modify" placeholder="-제외 숫자만 입력" size="30" name="phone" id="phone" maxlength="11" required>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-birthday-cake"></i>&nbsp;생년월일</h6>
                      <div class="input-group mb-3 modify">
                        <fmt:formatDate pattern="yyyy-MM-dd" value="${loginUser.birthday }"/>
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
                      <h6><i class="icon fas fa-camera"></i>&nbsp;사진변경</h6>
                      <div class="input-group">
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" name="upFile" id="upFile" aria-describedby="inputGroupFileAddon04">
						    <label class="modify custom-file-label" for="upFile">프로필 이미지</label>
						  </div>
					  </div>
                      
                      
                      <div class="row justify-content-center p-1">
                        <button type="submit" class="btn joinBtn mb-4" style="">수정 완료</button>&nbsp;&nbsp;&nbsp;
                    </div>
                </form>
            </div>
            <script>
            $(function(){
        		$('[name=upFile]').on("change",function(){
        			const fileName=this.files[0].name;
        			$(this).next(".custom-file-label").html(fileName);
        		});
        	});
            
            $(function(){
                $("#alert-success2").hide();
                $("#alert-danger2").hide();
                $("input").keyup(function(){
                   var pwd1 = $("#password_").val();
                   var pwd2 = $("#password2").val();
                   if(pwd1 != "" || pwd2 != ""){
                      if(pwd1 == pwd2){
                         $("#alert-success2").show();
                         $("#alert-danger2").hide();
                         $("#check").removeAttr("disabled");
                      } else {
                         $("#alert-success2").hide();
                         $("#alert-danger2").show();
                         $("#check").attr("disabled","disabled");
                      }
                   }
                });
            }); 
            </script>
        </div>
    </div>
</div>	


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>