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
      
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">

</head>
<body>
 <div class="container" id="container">

        <div class="row-vh d-flex flex-row">

            <div class="item mx-auto align-self-center">
               
                <form action="${pageContext.request.contextPath }/user/userLogin.do" method="post" style="padding-top: 220px;">

					  <h5 class="colum"><span class="material-icons">person</span>&nbsp;아이디</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" name="userId" placeholder="아이디" size="30" required>
                      </div>

                      <h5 class="colum"><span class="material-icons">lock</span>&nbsp;비밀번호</h5>
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" name="password" placeholder="비밀번호" size="30" required>
                      </div>
                      <div class="row justify-content-end">
                      	<lable><input type="checkbox" value="자동로그인">자동로그인</lable>
                      </div>
                      
                      <div class="row justify-content-center p-1">
                      	<button type="submit" class="btn btn-outline-secondary" style="margin-left: 10px; width:270px">로그인</button>&nbsp;&nbsp;&nbsp;
					  </div>
					  
					  <div class="row justify-content-center p-1">
                      	<button type="button" class="btn btn-outline-secondary" style="width:270px" onclick="location.replace('${pageContext.request.contextPath}/user/joinUser.do');">회원가입</button>
                      </div>
                      
                      <p class="text-center">
                      	<a class="p2" href="${pageContext.request.contextPath }/user/findIdPw">아이디/비밀번호 찾기</a>
                   	  </p>
                   	  
                      	<a class="p2" href="${path }/user/findIdPw.do">아이디/비밀번호 찾기</a>
                   	  </p>
                </form>

                
            </div>

        </div>


    </div>


    <style>
		.btn{
			border-radius:10px;
		}
	
        ddiv{
            border: 1px solid black;
        }
        #container{
            height: 768px;
            width: 1366px;
        }
        *{
        	font-family: 'Noto Sans KR', sans-serif;
        }
    </style>
    
</body>
</html>