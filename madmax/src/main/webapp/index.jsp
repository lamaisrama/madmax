<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>    
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MADMAX</title>
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
               
                <form name="fform" action="${pageContext.request.contextPath }/user/userLogin.do" method="post">

                      <div class="input-group mb-3">
                        <input style="color: white;  border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #030321;" 
                        	type="text" class="form-control" name="userId" placeholder="아이디" size="30" required>
                      </div>

                      <div class="input-group mb-3">
                        <input  style="color: white; border: none; border-bottom: solid 1px #FFE3E3; border-radius:0; background: #030321;"
                        	type="password" class="form-control" name="password" placeholder="비밀번호" size="30" required>
                      </div>
                      
                      <div class="row justify-content-center" style="color: #7b7b7b;">
						<!-- <input type="checkbox" name="remember-me" id="remember-me">&nbsp;자동로그인 -->
                      	<input type="checkbox" id="idSaveCheck">&nbsp;rememberId
                      </div>
                      
                       <br>
                      <div class="justify-content-center p-1 ml-3">
                      	<button type="submit" id="loginbtn" class="btn btn-outline-secondary mb-2" style="width:270px; border-radius:0; ">로그인</button>&nbsp;&nbsp;&nbsp;
                      	<br>
                      	<button type="button" class="btn btn-outline-secondary" style="width:270px; border-radius:0;" onclick="location.replace('${path}/user/joinUser.do');">회원가입</button>
                      </div>
                      <br>
                      <p class="text-center">
                      	<a class="p2" href="${path }/user/findIdPw">아이디/비밀번호 찾기</a>
                   	  </p>
                </form>
            </div>
        </div>
    </div>

<script>
	$(document).ready(function(){
	    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
	    var userInputId = getCookie("userInputId");
	    $("input[name='userId']").val(userInputId); 
	    
	    if($("input[name='userId']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
	        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
	    }

	    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
	            var userInputId = $("input[name='userId']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }else{ // ID 저장하기 체크 해제 시,
	            deleteCookie("userInputId");
	        }
	    });
	     
	    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
	    $("input[name='userId']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
	        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
	            var userInputId = $("input[name='userId']").val();
	            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	    
	});
	 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
</script>

    
    
</body>
</html>