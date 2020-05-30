<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<c:set var="now" value="<%=new java.util.Date()%>" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>S'tool | ${appr.typeTitle }</title>
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
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
	<script src="${path }/resources/js/apprdraft.js"></script>
	<link rel="stylesheet" href="${path }/resources/css/apprDoc.css">
</head>

<body>
	<form action="${path }/appr/draftFormEnd" method="post"  enctype="multipart/form-data" id="submitDoc" onsubmit="return beforeSubmit();">
		<input type="hidden" name="apprDocTypeNo" value="${apprDocTypeNo }">
		<input type="hidden" name="temp" id="isTemp" value="normal">
		<div class="header">
			<button type="button" class="btn btnSecondary" style="width:8em" onclick="attachAppredDoc();">기결재첨부</button>
			<button type="button" class="btn btnSecondary" onclick="saveAsTemp();">임시저장</button>
			<button type="button" class="btn btnPrimary" onclick="openLine();">결재선</button>
			<button type="submit" class="btn btnPrimary ">결재요청</button>
			<button type="button" class="btn btnLight" onclick="closePage();">취소</button>
		</div>
		<h3 style="text-align:center; margin:30px auto;">${draftName }</h3>
		<div class="container-fluid line-container">
			<table class="lineTbl">
				<tr id="apprTbl-dept">
					<th class="line title" rowspan="2" style="padding:0 5px;">결<br><br>재</th>
					<th class="line writerInfo">${loginUser.deptName}</th>
				</tr>
				<tr id="apprTbl-user">
					<td height="60" class="writerInfo">
						${loginUser.userName } ${loginUser.jobName }
						<img src="${path }/resources/upload/sign/${loginUser.userId}.png" width="50" alt="sign"/> <br>
						<span style="font-size:8px;"><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></span>
					</td>
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
						<fmt:formatDate value="${now }" dateStyle="long" type="date" />
					</td>
				</tr>
				<tr class="basicContent">
					<th>기안자</th>
					<td>
						${loginUser.userName }
					</td>
					<th>기안 부서</th>
					<td>${loginUser.deptName }</td>
				</tr>
				<tr class="basicContent">
					<th>수신처</th>
					<td id="receivingInfo"></td>
					<th>기결재첨부</th>
					<td id="appredDoc"></td>
				</tr>
				<tr class="basicContent">
					<th>기안 제목</th>
					<td colspan="3">
						<div class="form-group my-1 mr-3">
							<input type="text" class="form-control" name="apprTitle" id="apprTitle">
						</div>
					</td>
				</tr>
			</table>
			<!-- 문서양식 별 태그 넣는 곳 -->
			<c:out value="${type.typeContent }" escapeXml="false" />
		</div>		
		
		<!-- 기결재 모달창 정보 넣는 곳 -->
		<div class="modal" id="add-approved-doc"></div>
		
		
		<!-- 파일 첨부 -->
		<div class="fileUpload-container m-2">
			<h6>
				<i class="fas fa-paperclip"> &nbsp;파일 업로드</i>
				<button type="button" class="btn btn-primary badge" onclick="addUpfile();">+</button>
			</h6>
			<div class="input-group mb-3 upfile-content">
				<input type="file" name="upFile" class="form-control form-control-file border">
				<div class="input-group-append">
					<button type="button" class="btn btn-dark badge" onclick="delUpfile();">&nbsp;&nbsp;-&nbsp;&nbsp; </button>
				</div>
			</div>
		</div>
		<br>
		<div class="row-vh d-flex flex-row justify-content-end m-3">
			<button type="submit" class="btn btnPrimary " >결재요청</button>
		</div>
		<br>
	</form>

	

	<script>
		var Editor; var editor
		$(function () {
			if (document.querySelector("#editor")) {
				Editor = toastui.Editor;
				editor = new Editor({
					el: document.querySelector('#editor'),
					height: '300px',
					initialEditType: 'wysiwyg',
					previewStyle: 'vertical',
					hideModeSwitch: 'true',
					toolbarItems: ['heading', 'bold', 'italic', 'strike', 'divider',
						'hr', 'quote', 'divider', 'ul', 'ol', 'task', 'indent',
						'outdent', 'divider', 'table', 'divider',]
				});
			}

		});

		function openLine() {
			const url = "${path}/appr/line.do";
			const name = "S'toll | 결재선 ";
			const option = "width = 1000, height = 700, top=120 left=400 location=no";
			console.log($("#apprTbl-user").children());
			if ($("#apprTbl-user").children().length > 1 || $("#agreeTbl-user").children().length > 1) {
				if (confirm('결재선과 수신처 정보가 모두 사라집니다. 다시 입력하시겠습니까?')) {
					window.open(url, name, option);
				}
			} else {
				window.open(url, name, option);
			}
		}

		$(document).on("change", "input", function () {
			$(this).attr("value", $(this).val());
		});
		
		function attachAppredDoc(){
			$.ajax({
				url:"${path}/appr/attachAppredDoc.do",
				type:"get",
				data:{"deptCode":"${loginUser.deptCode}"},
				dataType:"html",
				success:function(data){
					$("#add-approved-doc").html(data);
					$("#add-approved-doc").modal();
				}
			});
		}

		
		function beforeSubmit() {
			if (document.querySelector("#apprLine") == null) {
				alert('최소 한 사람 이상의 결재선을 등록해주세요');
				return false;
			}
			if(document.querySelector("#apprTitle").value=="" || document.querySelector("#apprTitle").value==null){
				alert('제목을 입력해주세요');
				return false;
			}
			if (document.querySelector("#doc-form-table") != null) {
				const content = document.querySelector("#doc-form-table").innerHTML;
				const apprContent = $("<input>").attr("type", "hidden").attr("id", "apprContent").attr("name", "apprContent").attr("value", content);
				$(".content-container").append(apprContent);
			}
			if (document.querySelector("#editor") != null) {
				const apprText = $("<input>").attr("type", "hidden").attr("name", "apprText").attr("value", editor.getHtml());
				$(".content-container").append(apprText);
			}
			return true;
		}
		
		function addUpfile(){
			var inp_upfile = '<div class="input-group mb-3 upfile-content">';
				inp_upfile += '<input type="file" name="upFile" class="form-control form-control-file border">'
				inp_upfile += '<div class="input-group-append">';
				inp_upfile += '<button type="button" class="btn btn-dark badge" onclick="delUpfile();">';
				inp_upfile += '&nbsp;&nbsp;-&nbsp;&nbsp; </button>';
				inp_upfile += '</div>';
				inp_upfile += '</div>';
				console.log(inp_upfile);
			 $(".fileUpload-container").append($(inp_upfile));
		}
		
		function delUpfile(){
			console.log($(event.target));
			console.log($(event.target).parent());
			console.log($(event.target).parent().prev());
			$(event.target).parent().prev().remove();
			$(event.target).parent().remove();
			$(event.target).remove();
		}
		
 		function saveAsTemp(){
			$("#isTemp").val("temp");
			console.log($("#isTemp").val());
			$("#submitDoc").submit();
		}


	</script>
</body>

</html>