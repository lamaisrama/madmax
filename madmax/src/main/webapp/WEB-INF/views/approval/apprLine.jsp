<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
div{ min-height:200px; }
hr{ margin:2px 0 } 
ul {list-style: none; padding-left:10px;}
th{ font-weight:bolder; font-size:14px; }
ul.info{display: none;}
ul.dept li{color:darkslategrey; font-weight:bolder; }
ul.info li{color:slategray; font-weight:bolder; }
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
                	<c:forEach items="${list }" var="l">
	                    <li>${l.deptName }
	                     	<c:forEach items="${l.users}" var="u">
		                        <ul class="info">
		                        	<li class="un">
		                        		${u.userName } ${u.jobName }
		                        		<input type="hidden" name="userInfo"  
		                        			value="${u.userName},${u.userId },${u.jobName},${u.deptName}" >
		                        	</li>
		                        </ul>
	                        </c:forEach>
	                    </li>
                	</c:forEach>
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
				<br>
				<br>
				<input type="radio" name="appr-method" value="receiving" id="receiveOpt">
				<label for="receiveOpt">수신</label>
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
					</div>
				</div>

				<br><br>
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-hover" id="receiving-table" style="text-align:center;">
							<tr>
								<th>수신처</th>
								<th>수신인</th>
							</tr>
						</table>
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