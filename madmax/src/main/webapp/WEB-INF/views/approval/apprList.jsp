<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header-test.jsp">
	<jsp:param name="title" value="Stool | 기안문 작성" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
<style>
	.list-container{ margin-left:10px; font-size:12px; }
	div.currList{ font-size:12px; background-color:#F1F0F5; height:50px; margin:10px auto;}
	div.currList ul { padding-top:17px; }
	div.currList ul li{ list-style-type: none; float:left; padding-right:15px; }
	div.currList .docForm { font-size:12px; padding-top:10px; float:right;}
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; font-weight:bolder; text-decoration: underline;}
	div.draftList{font-size:13px;}
	
	
</style>
<div class="col col-sm-9 list-container">
	<br><br>
	<h4 style="font-weight:bolder">&nbsp;<i class="fas fa-clipboard-list"></i> &nbsp;기안문 작성</h4>
	<br>
	<c:if test="${loginUser.sign==null }">
	<p style="color:red; font-weight:bolder;"> &nbsp; 기안을 작성하기 전에 F5를 눌러 전자서명을 등록해주세요.</p>
	</c:if>
	
	<div class="row draftList" style="clear:both;">
		<div class="col">
			<table class="table table-hover" style="text-align:center;">
				<tr class="bg-light">
					<th width="15%">문서번호</th>
					<th>양식명</th>
					<th width="10%">북마크</th>
				</tr>
				<c:forEach items="${list }" var="l">
					<tr>
						<td>${l.apprDocTypeNo }</td>
						<td>
							<a href="javascript:void(0)" 
							onclick="window.open('${path}/appr/draftForm.do?dNo=${l.apprDocTypeNo }','_blank','width = 1000, height = 600, top = 120px, left = 400px')">
								${l.typeTitle}
						</a></td>
						<td><i class="fa fa-star-o"></i></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<div id="pagebar-container">
		${pageBar }
	</div>

	<!-- The Modal -->
	<form action="${path }/appr/uploadSign" method="post" enctype="multipart/form-data" onsubmit="return validate();">
		<div class="modal" id="add-sign">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h5 class="modal-title" style="color:#233c61; font-weight:bolder">전자결재 서명 등록</h5>
		      </div>
		      <!-- Modal body -->
		      <div class="modal-body">
				<h6>전자결재에 사용할 서명파일을 등록해주십시오.</h6>
					<span>.png 파일만 가능합니다.</span><br>
					<span>전자 서명이 등록되지 않으면 전자결재 기능을 원활히 사용할 수 없습니다.</span>
				</ul>
	   			<div class="fileUpload-container m-2">
					<input type="file" class="form-control-file border" name="sign" id="sign">
					<input type="hidden" name="userId" value="${loginUser.userId }">
				</div>	
		      </div>
		
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-primary" >제출</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
	
	
</div>
		
	<c:if test="${loginUser.sign==null }">
		<script>
			$(function(){
				$("#add-sign").modal();
			});
		</script>
	</c:if>

<script>
	
	function openPopup(e){
		console.log(e.id);
		const no = e.id;
		const url= "${path}/appr/draftForm.do";
		const name = "S'tool | 기안문 양식";
		var option="width = 1000, height = 600, top = 120px, left = 400px, location=no";
		window.open(url, name, option);
		/* $.ajax({
			url:"${path}/selectDraftFormat?",
			data:{dNo:no},
			type="GET",
			dataType:"html"
			success:function(data){
				const url= "${path}/basicDraft";
				const name = "S'tool | 기안문 양식";
				var option="width = 1000, height = 600, top = 120px, left = 400px, location=no";
				window.open(data????, name, option);		
			}
		}); */
		
	}
	
	function validate(){
		var fileCheck = document.getElementById("sign").value;
		if(!fileCheck){
			alert('파일을 첨부해주세요');
			return false;
		}
		fileExt=fileCheck.slice(fileCheck.indexOf(".")+1).toLowerCase();

		if(fileExt!='png'){
			alert('확장자가 png인 파일만 등록 가능합니다.');
			return false;
		}
	
			
	}
	

</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>