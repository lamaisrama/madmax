<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
    /*중복아이디체크*/
   div#userId-container{position:relative; padding:0px;}
   div#userId-container span.guide{display:none;font-size: 12px;position:absolute; top:12px; right:10px;}
   div#userId-container span.ok{color:green;}
   div#userId-container span.error{color:red;}
</style>
    <div class="container" id="container">

        <div class="row-vh d-flex flex-row">

            <div class="item mx-auto align-self-center">
                <br>
                <h5 class="text-center">회원가입</h5>

                <form action="${pageContext.request.contextPath}/user/userEnrollEnd.do" name="userEnrollFrm" method="post" onsubmit="return validate();">
                    <img src="${pageContext.request.contextPath}/resources/images/userImg.png" width="280px" height="280px">
                    <h5 class="text-center">클릭하여 사진을 등록하세요</h5>
                    <h5 class="colum">
                    	<span class="material-icons">person</span>&nbsp;아이디
                    </h5>
                      <div class="input-group mb-3" id="userId-container">                    
                        <input type="text" class="form-control" placeholder="아이디 (네글자 이상)" size="30" name="userId" id="userId_" required>
                        <span class="guide ok">이 아이디는 사용이 가능합니다.</span>
						<span class="guide error">이 아이디는 사용할 수 없습니다.</span>
                      </div>

                      <h5 class="colum"><span class="material-icons">lock</span>&nbsp;비밀번호</h5>
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="비밀번호" size="30" name="password" id="password_" required>
                      </div>
                      
                      <!-- <h5 class="colum">&nbsp;비밀번호확인</h5> -->
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="비밀번호 확인" size="30" id="password2" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;이름</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="이름 입력" size="30" name="userName" id="userName" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;전화번호</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="-제외 숫자만 입력" size="30" name="phone" id="phone" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;생년월일</h5>
                      <div class="input-group mb-3">
                        <input type="date" class="form-control" placeholder="클릭하여 날짜 선택" size="30" name="birthDay" id="birthDay" required>
                      </div>
                      
                      <h5 class="colum">&nbsp;부서</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" list="dept" placeholder="클릭하여 부서 선택" size="30">
                        <datalist id="dept">
                            <option value="인사팀" ></option>    
                            <option value="개발팀" ></option>    
                            <option value="마케팅팀" ></option>    
                            <option value="회계팀" ></option>    
                            <option value="영업팀" ></option>    
                            <option value="관리팀" ></option>    
                        </datalist>
                      </div>
                      <div class="row justify-content-center p-1">
                        <button type="submit" class="btn joinBtn" style="">회원가입</button>&nbsp;&nbsp;&nbsp;
                    </div>
                </form>
            </div>
            <script>
            	$(function(){
            		$('#userId_').keyup(function(){
            			const id = $(this).val();
            			if(id.trim().length>4){
            				$.ajax({
            					url : '${path}/user/checkId',
            					data : {userId:id},
            					success : function(data){
            						if(!data){
            							$('.guide.ok').hide();
            							$('.guide.error').show();
            						}else{
            							$(".guide.ok").show();
            							$(".guide.error").hide();
            						}
            					}
            				});
            			}else{
            				$('.guide').hide();
            				return;
            			}
            		})
            	});
            </script>
        </div>
    </div>
</body>
</html>