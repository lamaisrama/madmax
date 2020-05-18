<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
</head>

<body>
<style>
	.joinBtn {
		margin-left: 10px; 
		width:270px;
		font-size : 17px;
		font-weight : 600;
		color : #233C61; 
		border: 3px solid #233C61; 
		border-radius:50px;
	}
	.checkEmailBtn {
		color : #233C61; 
		border: 3px solid #233C61; 	
	}
    
   /*중복아이디체크*/
   div#userId-container{
   		position:relative; 
   		padding:0px;
 	}
   div#userId-container span.guide{
   		display:none;
   		font-size: 12px;
   		position:absolute;  
   		top:12px; right:10px;
	}
   div#userId-container span.ok {
   		color:green;
 	}
   div#userId-container span.error{
   		color:red;
   } 
   
</style>
    <div class="container" id="container">

        <div class="row-vh d-flex flex-row">

            <div class="item mx-auto align-self-center">
                <br>
                <h5 class="text-center">회원가입</h5>

                <form action="${path}/user/userEnrollEnd.do" enctype="multipart/form-data" name="userEnrollFrm" method="post" onsubmit="return fn_validate();">
                    <img src="${path}/resources/images/userImg.png" width="280px" height="280px">
                    
                    <div class="input-group">
					  <div class="custom-file">
					    <input type="file" class="custom-file-input" name="upFile" id="upFile" aria-describedby="inputGroupFileAddon04">
					    <label class="custom-file-label" for="upFile">사진등록</label>
					  </div>
					</div>
					<br>
                    <h5 class="colum">
                    	<span class="material-icons">person</span>&nbsp;아이디
                    </h5>
                      <div class="mb-3" id="userId-container">       
                        <input type="text" class="form-control" placeholder="아이디를 4글자 이상 입력하세요"  name="userId" id="userId_" required>
                        <!-- <button type="button" class="checkIdBtn" onclick="fn_checkId();" value="">중복확인</button> -->
                        <span class="guide ok">이 아이디는 사용이 가능합니다.</span>
						<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
                      </div>
                        <script>
                        $(function(){
                			$("#userId_").keyup(function(){
                				const id=$(this).val();
                				if(id.trim().length>4){
                					$.ajax({
                						url:"${path}/user/checkId.do",
                						data:{userId:id},
                						success:function(data){
                							console.log(data);
                							if(!data.flag){
                								$(".guide.ok").hide();
                								$(".guide.error").show();
                							}else{
                								$(".guide.ok").show();
                								$(".guide.error").hide();
                							}
                						}
                					});
                				}else{
                					$(".guide").hide();
                					return;
                				}
                			})
                		})
/* 						function fn_checkId(){
							var userId = $("#userId_").val();
							if(userId.trim().length<4){
								alert("아이디를 4글자이상 입력하세요!");
								return;
							}
							var url = "${path}/user/checkId.do?userId=" + userId;
							var status = "height=200px, width=300px";
							open(url, "_blank", status); 
 						} 
                		*/                        
					</script>

                      <h5 class="colum"><span class="material-icons">lock</span>&nbsp;비밀번호</h5>
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="영문자나 숫자(4~12자) 입력" size="30" name="password" id="password_" required>
                      </div>
                      
                      <!-- <h5 class="colum">&nbsp;비밀번호확인</h5> -->
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="비밀번호 확인" size="30" id="password2" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;이름</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="이름 입력" size="30" name="userName" id="userName" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;이메일</h5>
                      <div class="input-group mb-3">
                      <!-- <form action="/user/auth.do" method="post"> -->
                        <input type="text" class="form-control" placeholder="stool@madmax.com" size="30" name="email" id="email" required>
                    <!-- 	<button type="submit" class="checkEmailBtn" onclick="" value="">이메일인증</button>
                      </form> -->		
                      </div>

                      <h5 class="colum">&nbsp;전화번호</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="-제외 숫자만 입력" size="30" name="phone" id="phone" maxlength="11" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;생년월일</h5>
                      <div class="input-group mb-3">
                        <input type="date" class="form-control" placeholder="클릭하여 날짜 선택" size="30" name="birthday" id="birthday" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;부서</h5>
                      <div class="input-group mb-3">
                        <!-- <input type="text" class="form-control" list="dept" placeholder="클릭하여 부서 선택" size="30"> -->
                        <select class="form-control text-dark" name="deptCode" required>
							<option value="" disabled selected>부서선택</option>
							<option value="인사팀" >인사팀</option>    
                            <option value="개발팀" >개발팀</option>    
                            <option value="마케팅팀" >마케팅팀</option>    
                            <option value="회계팀" >회계팀</option>    
                            <option value="영업팀" >영업팀</option>    
                            <option value="관리팀" >관리팀</option>  
						</select>
                      </div>
                      
                      <div class="row justify-content-center p-1">
                        <button type="submit" class="btn joinBtn mb-4" style="">회원가입</button>&nbsp;&nbsp;&nbsp;
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
            
            function fn_validate(){
    			//현재 text에 입력되어 있는 값
    			var userId = $("#userId_").val();
    			var pw = $("#password_").val();
    			var pwck = $("#password_2").val();
    			var reg = /^[a-zA-Z0-9]{4,13}$/; 
    			if(!reg.test(userId.trim())){
    				alert("영문자(대소)나 숫자로 이루어진 4글자이상 13글자 이하로 작성하세요!");
    				return false;	
    			}
    			//아이디가 4글자이상 입력이 됐는지
    			if(userId.trim().length<4){
    				alert("아이디를 4글자이상 입력하세요!");
    				$("#userId").focus();
    				return false;
    			}else if(pw.trim()!=pwck.trim()){	
    				alert("패스워드가 일치하지 않습니다!");
    				$("#password_").focus();
    				return false;
    			}
    			return true;
    		}	
            </script>
        </div>
    </div>
</body>
</html>