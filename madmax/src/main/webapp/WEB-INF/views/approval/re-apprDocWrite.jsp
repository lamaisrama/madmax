<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />	
<c:set var="now" value="<%=new java.util.Date()%>" />
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>S'tool | ${type.typeTitle }</title>
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
	<form action="${path }/appr/reDraftFormEnd" method="post"  enctype="multipart/form-data" onsubmit="return beforeSubmit();">
		<input type="hidden" name="apprDocTypeNo" value="${appr.apprDocTypeNo }">
		<input type="hidden" name="apprNo" value="${appr.apprNo }">
		<input type="hidden" name="userId" value="${loginUser.userId }">
		<div class="header">
			<button type="button" class="btn btnPrimary" onclick="openLine();">결재선</button>
			<button type="submit" class="btn btnPrimary">결재요청</button>
			<button type="button" class="btn btnLight" style="width:7em" onclick="attachAppredDoc();">기결재첨부</button>
			<button type="button" class="btn btnLight" onclick="">임시저장</button>
			<button type="button" class="btn btnLight" onclick="closePag
			e();">취소</button>
		</div>
		<h3 style="text-align:center; margin:30px auto;">${appr.typeTitle }</h3>
		<div class="container-fluid line-container">
			<table class="lineTbl"> 
				<tr id="apprTbl-dept">
					<th class="line title" rowspan="2" style="padding:0 5px;">결<br><br>재</th>
					<th class="line writerInfo">${appr.deptName }</th>
					<c:forEach items="${appr.apprLine}" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<th class="line">${l.deptName }</th>
						</c:if>		
					</c:forEach>
				</tr>
				<tr id="apprTbl-user">
					<td height="60" class="writerInfo">${appr.userName } <br> ${appr.jobName }</td>
					<c:forEach items="${appr.apprLine }" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<td height="60">${l.userName } ${l.jobName }</td>
							<input type="hidden" name="apprLine" id="apprLine" value="${l.apprUser}/${l.apprType}">
						</c:if>
					</c:forEach>
				</tr>
			</table>
			<table class="lineTbl ">
				<tr id="agreeTbl-dept">
					<th class="line title" rowspan="2" style="padding:0 5px;">합<br><br>의</th>
					<c:forEach items="${appr.apprLine }" var="l">
						<c:if test="${l.apprType.equals('agree') }">
							<th class="line">${l.deptName }</th>
						</c:if>
					</c:forEach>
				</tr>
				<tr id="agreeTbl-user">
					<c:forEach items="${appr.apprLine}" var="l">
						<c:if test="${l.apprType.equals('agree') }">
							<td height="60" class="writerInfo">${l.userName } ${l.jobName }</td>
							<input type="hidden" name="apprLine" id="apprLine" value="${l.apprUser}/${l.apprType}">
						</c:if>
					</c:forEach>
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
					<td id="receivingInfo">
						<span class="badge badge-dark"> ${appr.receiverName }</span>
						<input type="hidden" name="receiver" value="${appr.receiver }">
					</td>
					<th>기결재첨부</th>
					<td id="appredDoc">
						<c:forEach items="${appr.appredDoc }" var="appred">
							<span class="badge mr-2">
								<b>${appred.apprTitle }</b>
								<input type="hidden" name="appredNo" value="9">
								<button type="button" class="btn btn-light btn-sm badge" onclick="removeAppredDoc();">x</button>
							</span>
						</c:forEach>
					</td>
				</tr>
				<tr class="basicContent">
					<th>기안 제목</th>
					<td colspan="3">
						<div class="form-group my-1 mr-3">
							<input type="text" class="form-control" name="apprTitle"
							value="${appr.apprTitle }">
						</div>
					</td>
				</tr>
				<c:if test="${appr.apprText!=null }">
					<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/><link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
			    	<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
					<tr>
						<td colspan="4">
							<div id="editor"></div>
						</td>
					</tr>
				</c:if>
			</table>
			<!-- 문서양식 별 태그 넣는 곳 -->
			<c:if test="${appr.apprContent!=null }">
				<table class="table table-hover" id="doc-form-table">
					<c:out value="${appr.apprContent }" escapeXml="false"/>
				</table>
			</c:if>
		</div>		
		
		<!-- 기결재 모달창 정보 넣는 곳 -->
		<div class="modal" id="add-approved-doc"></div>
		
		
		<!-- 파일 첨부 -->
		<div class="fileUpload-container m-2">
			<h6>
				<i class="fas fa-paperclip"> &nbsp;파일 업로드</i>
				<button type="button" class="btn btn-primary badge" onclick="addUpfile();">+</button>
			</h6>
		</div>
		<div class="container-fluid m-2">
			<span style="font-size:12px;"><b>기첨부 파일</b></span>
			<c:forEach items="${appr.apprAttachment }" var="attachment" varStatus="vs">
	          		<button type="button" class="btn btn-sm btn-outline-dark"
	                 		onclick="fileDownload('${attachment.docOriFileName}', '${attachment.docRenamedFile }');"> 
	                 		첨부파일 ${vs.count } - ${attachment.docOriFileName}
	       			</button>
	       			<button type="button" class="btn badge badge-dark" onclick="removeAttachment('${attachment.docRenamedFile}/${attahcment.docFileNo}');">
	       			x</button>
			</c:forEach> 
		</div>
		<div class="row-vh d-flex flex-row justify-content-end">
			<button type="submit" class="btn btnPrimary">결재요청</button>
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
				editor.setHtml('${appr.apprText}');
			}
		});

		function openLine() {
			const url = "${path}/appr/line.do";
			const name = "S'toll | 결재선 ";
			const option = "width = 1000, height = 700, top=120 left=400 location=no";
			if ($("#apprTbl-user").children().length > 1 || $("#agreeTbl-user").children().length>1) {
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
		
		function addAppredDoc(e1, e2){
			console.log(e1, e2);
			var appred_content ="<span class='badge mr-2'><b>"+e2+"</b>";
					appred_content +="<input type='hidden' name='appredNo' value='" +e1 +"'/>";
					appred_content +="<button type='button' class='btn btn-light btn-sm badge' onclick='removeAppredDoc();'> x </button>";
					appred_content +="</span>";
			console.log(appred_content);
			console.log($("#add-approved-doc"));
			$("#appredDoc").append($(appred_content));
			$("#add-approved-doc").modal('hide');
		}
		
		function removeAppredDoc(){
			console.log($(event.target).parent());
			$(event.target).parent().remove();
		}
		
		function removeAttachment(attachmentNo){
			console.log($(event.target));
			console.log();
			if(confirm('첨부된 파일을 지우시겠습니까?')){
				var input_delFile = '<input type="hidden" name="delFile" value="';
					input_delFile+= attachmentNo+'"/>'
				$(".fileUpload-container").append($(input_delFile));
				$(event.target).prev().remove();
				$(event.target).remove();
				
			}
		}
		
		
		
	</script>
</body>

</html>