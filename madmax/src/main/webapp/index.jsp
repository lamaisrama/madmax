<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      
<!-- <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet"> -->
<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">
</head>
<body>
<style>
@import url(https://fonts.googleapis.com/css?family=Raleway);

html, body{
  height: 100%;
  font-family: 'Noto Sans KR', sans-serif;
  /* font-weight: 800; */
}

body{
  background: #030321;
  margin-bottom : 150px;
}

svg {
	font-family: 'Raleway';
    display: block;
    font: 10.5em 'Raleway';
    width: 60%;
    height: 60%;
    margin: 0 auto;
}
/* 
input .occ { 
	border: none; 
	border-bottom: solid 1px #FFE3E3; 
	border-radius:0; 
	background: #030321; 
}
 */
.text-copy {
    fill: none;
    stroke: white;
    stroke-dasharray: 6% 29%;
    stroke-width: 5px;
    stroke-dashoffset: 0%;
    animation: stroke-offset 5.5s infinite linear;
}

.text-copy:nth-child(1){
	stroke: #FFE3E3;
	animation-delay: -1;
}

.text-copy:nth-child(2){
	stroke: #233C61;
	animation-delay: -2s;
}

.text-copy:nth-child(3){
	stroke: #FFE3E3;
	animation-delay: -3s;
}

.text-copy:nth-child(4){
	stroke: #D0D0D4;
	animation-delay: -4s;
}

.text-copy:nth-child(5){
	stroke: #FFE3E3;
	animation-delay: -5s;
}

a:link{
		text-decoration: none;
}
a:visited{
	color: #7b7b7b; 
	text-decoration: none;
}
a:hover{
	color: #FFE3E3;
	font-weight: 700;
}

@keyframes stroke-offset{
	100% {stroke-dashoffset: -35%;}
}
</style>

<svg viewBox="0 0 960 300">
	<symbol id="s-text">
		<text text-anchor="middle" x="50%" y="80%">MADMAX</text>
	</symbol>

	<g class = "g-ants">
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
		<use xlink:href="#s-text" class="text-copy"></use>
	</g>
</svg>
 <div class="container" id="container">

        <div class="row-vh d-flex flex-row text-white">

            <div class="item mx-auto align-self-center">
               
                <form action="${pageContext.request.contextPath }/user/userLogin.do" method="post">

                      <div class="input-group mb-3">
                        <input style="color: white;  border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #030321;" 
                        	type="text" class="form-control" name="userId" placeholder="아이디" size="30" required>
                      </div>

                      <div class="input-group mb-3">
                        <input  style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #030321;"
                        	type="password" class="form-control" name="password" placeholder="비밀번호" size="30" required>
                      </div>
                      <!-- 
                      <div class="row justify-content-center" style="color: #7b7b7b;">
                      	<lable><input type="checkbox" value="자동로그인">&nbsp;자동로그인</lable>
                      </div>
                       -->
                       <br>
                      <div class="justify-content-center p-1 ml-3">
                      	<button type="submit" class="btn btn-outline-secondary mb-2" style="width:270px; border-radius:0; ">로그인</button>&nbsp;&nbsp;&nbsp;
                      	<br>
                      	<button type="button" class="btn btn-outline-secondary" style="width:270px; border-radius:0; " onclick="location.replace('${pageContext.request.contextPath}/user/joinUser.do');">회원가입</button>
                      </div>
                      <br>
                      <p class="text-center">
                      	<a class="p2" href="${pageContext.request.contextPath }/user/findIdPw">아이디/비밀번호 찾기</a>
                   	  </p>
                </form>

                
            </div>

        </div>


    </div>


    
    
</body>
</html>