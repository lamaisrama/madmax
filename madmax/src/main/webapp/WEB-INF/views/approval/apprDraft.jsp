<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="today" value="<%=new java.util.Date() %>" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S'tool | ${draftName }</title>
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
</head>
<style>
.header{
	text-align:right; font-size:12px; margin-top:10px;		
}

.btnPrimary{
	background-color:#25558F;
	font-weight:bolder; font-size:13px; color: white;
	width: 6em; height:3em;
	border-radius: 5px; margin-right:3px;
}

.btnLight{
	border: 1px solid rgb(246, 231, 203);
	font-weight:bolder; font-size:13px; color: grey;	
	width: 6em; height:3em;
	border-radius: 5px; margin-right:3px;
}

table, tr, td, th {
	border: 1px solid grey;
}

table.lineTbl{
	margin-left:auto; margin-bottom:5px; 
	text-align:center; font-size:12px;
}

.lineTbl td{
	width:6em;
}

th.line{
	background-color: lightgrey; height: 1em;
}

.content-container{
	margin: 30px 5px;
}
table.content{
	margin: 5px auto;
	font-size:13px;
	width:100%;
	
}
table.content tr{
	height:2em;
}
.basicContent th{
	width:10%;
	background-color: #f9f9f9;
	text-align:center;
}
.basicContent td{ 
	width:40%;
	text-align:left;
	padding-left:15px;
}
.basicContent input[type="text"]{
	height:30%;
}
</style>
<body>
	<div class="header">
		<button type="button" class="btn btnPrimary" onclick="openLine();">결재선</button>
		<button type="button" class="btn btnPrimary" onclick="">결재요청</button>
		<button type="button" class="btn btnLight" style="width:7em" onclick="">기결재첨부</button>
		<button type="button" class="btn btnLight" onclick="">임시저장</button>
		<button type="button" class="btn btnLight" onclick="closePage();">취소</button>
	</div>
	<h3 style="text-align:center; margin:30px auto;">${draftName }</h3>
	<div class="container-fluid">
		<table class="lineTbl">
			<tr>
				<th class="line" rowspan="2" style="padding:0 5px;">결<br><br>재</th>
				<th class="line">department</th>
			</tr>
			<tr>
				<td height="60">userName <br> jobtitle</td>
			</tr>
		</table>
		<table class="lineTbl">
			<tr>
				<th class="line" rowspan="2" style="padding:0 5px;">합<br><br>의</th>
				<th class="line"></th>
			</tr>
			<tr>
				<td height="60"></td>
			</tr>
		</table> 				
	</div>
	<div class="content-container">
		<table class="content">
			<tr class="basicContent">
				<th>문서번호</th>
				<td>자동채번</td>
				<th>기안일자</th>
				<td>
					<fmt:formatDate value="${today }" dateStyle="long" type="date"/> 
				</td>
			</tr>
			<tr class="basicContent">
				<th>기안자</th>
				<td>
					박나정 
				</td>
				<th>기안 부서</th>
				<td>개발팀</td>
			</tr>
			<tr class="basicContent">
				<th>참조자</th>
				<td>
					<div class="input-group my-1">
					  <input type="text" class="form-control">
					  <div class="input-group-append">
					    <button class="btn" type="submit"><i class="fas fa-user-plus"></i></button>					    							
					  </div>
					</div>
				</td>
				<th>기결재첨부</th>
				<td>결재문서제목 <button type="button" class="btn btn-sm"><i class="fas fa-times"></i></button></td>
			</tr>
			<tr class="basicContent">
				<th>기안 제목</th>
				<td colspan="3">
					<div class="form-group my-1 mr-3">
						<input type="text" class="form-control">
					</div>
				</td>
			</tr>
			<tr>
			<td colspan="4">
				<!-- TextEditor api  -->
				<div class="container-fluid" style="min-height:500px;">
					<div class="col-sm-12" style="border:1px solid lightgrey; margin:0 auto; min-height:500px;">
						<br> <br>
						<p> &nbsp;&nbsp;TextEditor API  출력</p>
					</div>
				</div>
			</td>
			</tr>
		</table>
	</div>

	
	<script>
		function openLine(){
			const url ="${path}/appr/line.do";
			const name="S'toll | 결재선 ";
			const option="width = 1000, height = 700, top=120 left=400 location=no";
			window.open(url,name,option);
		}
		
		function closePage(){
			if(confirm('정말 닫겠습니까? 작성하신 내용은 저장되지 않습니다.')){window.close();};
			
		}
	</script>
</body>
</html>