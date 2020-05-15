<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<c:set var="today" value="<%=new java.util.Date() %>" />

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

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
<script src="${path }/resources/js/apprdraft.js"></script>
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
.here span{
	border-radius:15px;
	background-color:lightgreen;
	font-size:10px;
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
	<form action="#" type="post">
	<div class="container-fluid line-container">
		<table class="lineTbl"> 
			<tr id="apprTbl-dept">
				<th class="line title" rowspan="2" style="padding:0 5px;">결<br><br>재</th>
				<th class="line writerInfo">department</th>
			</tr>
			<tr id="apprTbl-user">
				<td height="60" class="writerInfo">userName <br> jobtitle</td>
			</tr>
		</table>
		<table class="lineTbl ">
			<tr id="agreeTbl-dept">
				<th class="line title" rowspan="2" style="padding:0 5px;">합<br><br>의</th>
				<!-- <th class="line"></th> -->
			</tr>
			<tr id="agreeTbl-user">
				<!-- <td height="60"></td> -->
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
					  <input type="text" id="referrerInput" class="form-control">
					  <div class="input-group-append">
					    <button class="btn" type="submit"><i class="fas fa-user-plus"></i></button>					    							
					  </div>
					</div>
					<div class="here">
						<span></span>
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
		</table>
	</div>
		<p>📄 출장정산신청</p><button type="button" class="btn btnLight " name="btnAdd">추가</button>
		<br>
		<br>
	<table class="table table-hover text-center" id="doc-form-table">
		<tr name="tr">
			<td>사용처</td>
			<td>금액</td>
			<td>사유</td>
			<td></td>
		</tr>
		<tr name="tr">
			<td><input type="text"></td>
			<td><input type="text"></td>
			<td><input type="text"></td>
			<td style="width:146px;"></td>
		</tr>
	</table>
	<div class="row justify-content-end">
		<button class="btn btnPrimary" type="submit">제출</button>
	</div>
	<br>
	</form>
	<script>
	 $(document).on("click","button[name=btnAdd]",function(){
	        
	        var tdAdd =     '<tr name="tr">'+
	            			'<td><input type="text"></td>'+
	            			'<td><input type="text"></td>'+
	            			'<td><input type="text"></td>'+
	            			'<td><button type="button" class="btn btnLight" name="btnDel">삭제</button></td>'+
	           				 '</td>'+
	            			'</tr>';
	            
	        var tr = $( "tr[name=tr]:last" ); //last를 사용하여 trStaff라는 명을 가진 마지막 태그 호출
	        
	        tr.after(tdAdd); //마지막 trStaff명 뒤에 붙인다.
	        
	    });
	
	    $(document).on("click","button[name=btnDel]",function(){
	        
	        var trDel = $(this).parent().parent();
	        
	        trDel.remove(); //tr 테그 삭제
	        
	    });
	
		$(function(){
			$("#referrerInput").on("change",function(){
				$.ajax({
					url:"${path}/appr/checkUserName",
					data:{userName:$("#reffererInput").val()},
					success:(data)=>{
						console.log(data);
					}
				});
			});
		});
		
		function openLine(){
			const url ="${path}/appr/line.do";
			const name="S'toll | 결재선 ";
			const option="width = 1000, height = 700, top=120 left=400 location=no";
			window.open(url,name,option);
		}
		
		
	</script>
</body>
</html>