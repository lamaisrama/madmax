<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원가입</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b5f4d53f14.js" crossorigin="anonymous"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
</head>

<body>
<style>
	body{
	  	background: #233C61;
	  	color: #F1F0F5;
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
		color :white; 
		border: 2px solid #FFE3E3; 
		border-radius:50px;
	}
    
    .joinBtn:hover{
    	background-color: #FFE3E3;
    	color : #233C61;
    }
    
    .deptSelect{
    	-webkit-appearance: none;
    	-moz-appearance: none;
	    border-radius: 0;
	}
    
    h6 {
    	margin-top: 15px;
    }
    
    input {
    	border:none;
	  	border-bottom: solid 1px #FFE3E3;
    }
    
   /*중복아이디체크*/
   div#userId-container{
   		position:relative; 
   		padding:0px;
 	}
   div#userId-container span.guide{
   		display:none;
   		font-size: 14px;
   		position:absolute;  
   		top:12px; right:10px;
	}
   div#userId-container span.ok {
   		color:green;
 	}
   div#userId-container span.error{
   		color: #FFE3E3;
   } 
   
</style>
    <div class="container" id="container">

        <div class="row-vh d-flex flex-row">

            <div class="item mx-auto align-self-center">
                <br>
                <h1 class="display-4 text-center pt-4">사원가입</h1>

                <form action="${path}/user/userEnrollEnd.do" enctype="multipart/form-data" name="userEnrollFrm" method="post" onsubmit="return fn_validate();">
                    <%-- <img src="${path}/resources/images/userImg.png" width="280px" height="280px"> --%>
                    
					<br>
                    <h6>
                    	<i class="icon fas fa-user"></i>&nbsp;아이디
                    </h6>
                      <div class="mb-3" id="userId-container">       
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;" 
                        		type="text" class="form-control" placeholder="아이디를 4글자 이상 입력하세요"  name="userId" id="userId_" required>
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
                							console.log(data.flag);
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
					
					<br>
                      <h6><i class="icon fas fa-unlock-alt"></i>&nbsp;비밀번호</h6>
                      <div class="input-group mb-3">
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;" 
                        		type="password" class="form-control" placeholder="영문자나 숫자(4~12자) 입력" size="30" name="password" id="password_" required>
                      </div>
                      <div class="input-group mb-3">
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;" 
                        		type="password" class="form-control" placeholder="비밀번호 확인" size="30" id="password2" required>
                      </div>
                      <br>
                      <h6><i class="icon far fa-grin"></i>&nbsp;이름</h6>
                      <div class="input-group mb-3">
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;"  
                        		type="text" class="form-control" placeholder="이름 입력" size="30" name="userName" id="userName" required>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-envelope"></i>&nbsp;이메일</h6>
                      <div class="input-group">
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;" 
                        	 	type="text" class="form-control" placeholder="stool@madmax.com" size="30" name="email" id="email" required>
                      </div>
					  <br>
                      <h6><i class="icon fas fa-mobile-alt"></i>&nbsp;전화번호</h6>
                      <div class="input-group mb-3">
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;" 
                         		type="text" class="form-control" placeholder="-제외 숫자만 입력" size="30" name="phone" id="phone" maxlength="11" required>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-birthday-cake"></i>&nbsp;생년월일</h6>
                      <div class="input-group mb-3">
                        <input style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;"  
                        		type="date" class="form-control" placeholder="클릭하여 날짜 선택" size="30" name="birthday" id="birthday" required>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-briefcase"></i>&nbsp;부서</h6>
                      <div class="input-group mb-3">
                        <select style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;" 
                         		class="deptSelect form-control" name="deptCode" required>
							<option style="color: #F1F0F5;" value="" disabled selected>부서선택</option>
							<option value="HR" >인사팀</option>    
                            <option value="RND" >개발팀</option>    
                            <option value="MT" >마케팅팀</option>    
                            <option value="AD" >회계팀</option>    
                            <option value="ST" >영업팀</option>    
                            <option value="MS" >관리팀</option>  
						</select>
                      </div>
                      <br>
                      <h6><i class="icon fas fa-camera"></i>&nbsp;사진등록</h6>
                      <div class="input-group">
						  <div class="custom-file">
						    <input type="file" class="custom-file-input" name="upFile" id="upFile" aria-describedby="inputGroupFileAddon04">
						    <label style="border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #233C61;"
						    		class="custom-file-label" for="upFile">프로필 이미지</label>
						  </div>
					  </div>
                      
                      
                      <div class="row justify-content-center p-1">
                        <button type="submit" class="btn joinBtn mb-4" style="">승인 요청</button>&nbsp;&nbsp;&nbsp;
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