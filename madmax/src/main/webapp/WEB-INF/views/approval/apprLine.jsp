<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b5f4d53f14.js" crossorigin="anonymous"></script>
<link href="//fonts.googleapis.com/earlyaccess/nanumgothic.css" rel="stylesheet" type="text/css">
<script src="${pageContext.request.contextPath}/resources/js/apprline.js"></script>
<style>
div{ min-height:500px; }
hr{ margin:2px 0 } 
ul {list-style: none;}
th{ background-color:lightgrey; }
ul.info{display: none;}
ul.dept li{color:darkslategrey; font-weight:bolder;}
ul.info li{color:slategray; font-weight:bolder;}
</style>
</head>
<body>
	<div class="container" style="font-size:12px;">
		<br> 
		<div class="row" style="min-height:40px; background-color:darkslategrey; color:white;">
			<h5 style="margin:7px 0"> &nbsp; <i class="far fa-calendar-alt"></i>&nbsp;결재선 지정</h5>
		</div>
		<div class="row">
			<div class="col-sm-3 user-container" style="border:1px solid black; font-size:13px;">
                <hr>
                <span style="color:darkslategrey; font-size:14px; font-weight:bolder;">MADMAX COMPANY</span>
                <ul class="dept">
                    <li>인사관리
                        <ul class="info">
                            <li class="un">박나정</li>
                            <li class="un">최민형</li>
                        </ul>
                    </li>
                    <li>기술개발
                        <ul class="info">
                            <li class="un">최가영</li>
                            <li class="un">정세현</li>
                        </ul>
                    </li>
                    <li>마케팅
                        <ul class="info">
                            <li>김미연</li>
                            <li>이시은</li>
                        </ul>
                    </li>
                    <li>회계관리</li>
                    <li>경영지원</li>
                    <li>총무</li>
                </ul>
			</div>
			<div class="col-sm-1" style="padding: 10px auto; text-align:center; font-size:12px;">
				<br><br><br><br><br><br><br><br><br>
				
				<span style="font-weight:bolder; ">Type</span><br>
				<hr>
				<input type="radio" name="appr-method" value="approval" id="apprOpt">
				<label for="apprOpt">결재</label>
				<br>
				<input type="radio" name="appr-method" value="agree" id="agreeOpt">
				<label for="agreeOpt">합의</label>
				<hr>
				<button type="button" class="btn btn-sm btn-light" onclick="userAdd();"> <i class="fas fa-arrow-right"></i> </button>
				<br>
				<button type="button" class="btn btn-sm btn-light" onclick="userRemove();"> <i class="fas fa-arrow-left"></i> </button>
				<br>
				<button type="button" class="btn btn-sm btn-light" onclick="userReset();"> <i class="fas fa-undo"></i> </button>
				<br>
			</div>
			<div class="col-sm-8" id="apprLine-container" style="border:1px solid black;">
				<div class="row">
					<div class="col-sm-12">
					<form id="lineForm" action="${pageContext.request.contextPath }/appr/test.do" >
						<table class="table table-hover" id="apprLine-table" style="text-align:center;">
							<tr id="lineInfo">
								<th>방법</th>
								<th>결재자 정보</th>
								<th></th>
							</tr>
							<tr id="writerInfo">
								<td>
									<select disabled="disabled">
										<option>결재</option>
										<option>합의</option>
									</select>
								</td>
								<td><input type="text" value="userName" disabled></td>
								<td>
									<button type="button" class="btn btn-light btn-sm" disabled="disabled">▲</button>
									<button type="button" class="btn btn-light btn-sm" disabled="disabled">▼</button>
								</td>
							</tr>
							
						</table>
					</form>
					</div>
				</div>
			</div>
		</div> <!-- div row 끝 -->
		<div class="row" >
			<div class="col" style="text-align:right;">
				<br>
				<button type="button" class="btn btn-light" style="margin:2px 4px">닫기</button>
				<button type="button" class="btn btn-primary" style="margin:2px 4px;" onclick="sendLine();">적용</button>			
			</div>
		</div> <!-- End of div row  -->
	</div> <!-- End of div container -->

</body>
</html>