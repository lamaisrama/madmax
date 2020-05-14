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
</head>
<body>

    <div class="container" id="container">

        <div class="row-vh d-flex flex-row">

            <div class="item mx-auto align-self-center">
                <br>
                <h5 class="text-center">회원가입</h5>

                <form>
                    <img src="${pageContext.request.contextPath}/resources/images/userImg.png" width="280px" height="280px">
                    <h5 class="text-center">클릭하여 사진을 등록하세요</h5>
                    <h5 class="colum"><span class="material-icons">person</span>&nbsp;아이디</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="아이디" size="30">
                      </div>

                      <h5 class="colum"><span class="material-icons">lock</span>&nbsp;비밀번호</h5>
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="비밀번호" size="30">
                      </div>
                      <h5 class="colum">&nbsp;비밀번호확인</h5>
                      <div class="input-group mb-3">
                        <input type="password" class="form-control" placeholder="비밀번호" size="30">
                      </div>
                      <h5 class="colum">&nbsp;이름</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="이름 입력" size="30">
                      </div>
                      <h5 class="colum">&nbsp;생년월일</h5>
                      <div class="input-group mb-3">
                        <input type="date" class="form-control" placeholder="클릭하여 날짜 선택" size="30">
                      </div>
                      <h5 class="colum">&nbsp;부서</h5>
                      <div class="input-group mb-3">
                        <input type="text" class="form-control" list="dept" placeholder="클릭해 부서 선택" size="30">
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
                        <button type="button" class="btn btn-outline-secondary" style="margin-left: 10px; width:270px">회원가입</button>&nbsp;&nbsp;&nbsp;
                    </div>
                </form>
            </div>
        </div>

    </div>
</body>
</html>