<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

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
<link rel="stylesheet" href="${path }/resources/css/apprDoc.css">
</head>
<body>
	<form action="#" method="post" onsubmit="return beforeSubmit();">
	<div class="header">
		<button type="button" class="btn btnPrimary" onclick="openLine();">결재선</button>
		<button type="submit" class="btn btnPrimary">결재요청</button>
		<button type="button" class="btn btnLight" style="width:7em" onclick="">기결재첨부</button>
		<button type="button" class="btn btnLight" onclick="">임시저장</button>
		<button type="button" class="btn btnLight" onclick="closePage();">취소</button>
	</div>
	<h3 style="text-align:center; margin:30px auto;">${draftName }</h3>
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
					<th>수신처</th>
					<td id="receivingInfo"></td>
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
			<!-- 문서양식 별 태그 넣는 곳 -->
			<c:out value='${docType.typeContent }'/>
			<!--<table class="table table-hover" id="doc-form-table">
				<tr>
					<td>
						<div id="editor"></div>
					</td>
				</tr>
			</table> -->		    
		</div>
	</form>
		
		
	<script>
		function openLine(){
			const url ="${path}/appr/line.do";
			const name="S'toll | 결재선 ";
			const option="width = 1000, height = 700, top=120 left=400 location=no";
			console.log($("#apprTbl-user").children());
			if($("#apprTbl-user").children().length>1){
				if(confirm('결재선과 수신처 정보가 모두 사라집니다. 다시 입력하시겠습니까?')){
					window.open(url,name,option);	
				}
			}else{
				window.open(url,name,option);
			}
		}
		
        const Editor = toastui.Editor;
        const editor = new Editor({
				            el: document.querySelector('#editor'),
				            height: '300px',
				            initialEditType: 'wysiwyg',
				            previewStyle: 'vertical',
				            hideModeSwitch: 'true'
    					});
	     /* console.log(document.querySelector('#editor'));
	     editor.getHtml();
	     editor.on('change',function(){
	       console.log(editor.getHtml());
		}); */
		
		
		function beforeSubmit(){
			console.log("결재요청");
			if(document.querySelector("#doc-form-table")){
				const content=document.querySelector("#doc-form-table").innerHTML;
				const inputContent=$("<input>").attr("type","hidden").attr("id","docContent").attr("name","content").attr("value", content);
				$(".content-container").append(inputContent);
			}
			if(document.querySelector("#editor")){
				const inputText=$("<input>").attr("type","hidden").attr("name","docText").attr("value",editor.getHtml());
				$(".content-container").append(inputText);
			}
			return false;
		}
	
	</script>
</body>
</html>