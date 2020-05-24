<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S'tool | 기안 확인</title>
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
<link rel="stylesheet" href="${path }/resources/css/apprDoc.css">
<script src="${pageContext.request.contextPath }/resources/js/apprdraft.js"></script>
</head>
<body>
	<form action="${path }/appr/draftFormEnd" method="post" onsubmit="return beforeSubmit();">
	<input type="hidden" name="apprDocTypeNo" value="${appr.typeTitle }">
	<div class="header">
		<button type="button" class="btn btnPrimary"  data-toggle="modal" data-target="#apprModal">결재</button>
		<button type="button" class="btn btnLight" onclick="self.close();">닫기</button>
	</div>
	
	<h3 style="text-align:center; margin:30px auto;">${draftName }</h3>
		<div class="container-fluid line-container">
			<table class="lineTbl"> 
				<tr id="apprTbl-dept">
					<th class="line title" rowspan="2" style="padding:0 5px;">결<br><br>재</th>
					<th class="line writerInfo">${appr.deptName }</th>
					<c:forEach items="${appr.apprLine}" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<th class="line writerInfo">${l.deptName }</th>
						</c:if>	
					</c:forEach>
				</tr>
				<tr id="apprTbl-user">
					<td height="60" class="writerInfo">${appr.userName } ${appr.jobName }
						<img src="${path }/resources/upload/sign/${appr.userId}.PNG" width="50" alt="sign"/> <br>
						<span style="font-size:8px;"><fmt:formatDate value="${appr.writeDate}" pattern="yyyy-MM-dd"/></span>
					</td>
					<c:forEach items="${appr.apprLine }" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<td height="60" class="writerInfo">${l.userName } ${l.jobName }
								<c:if test="${l.apprTime!=null and l.apprTime!=''}">
									<img src="${path }/resources/upload/sign/${l.apprUser}.PNG" width="50" alt="sign"/> <br>
									<span style="font-size:8px;"><fmt:formatDate value="${l.apprTime }" pattern="yyyy-MM-dd"/></span>
								</c:if>
							</td>
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
							<td height="60" class="writerInfo">${l.userName } ${l.jobName }						
								<c:if test="${l.apprTime!=null and l.apprTime!=''}">
									<img src="${path }/resources/upload/sign/${l.apprUser}.PNG" width="50" alt="sign"/> <br>
									<span style="font-size:8px;"><fmt:formatDate value="${l.apprTime }" pattern="yyyy-MM-dd"/></span>
								</c:if>
							</td>
							
						</c:if>
					</c:forEach>
				</tr>
			</table> 				
		</div>
		<div class="content-container">
			<table class="content">
				<tr class="basicContent">
					<th>문서번호</th>
					<td>${appr.apprNo }</td>
					<th>기안일자</th>
					<td>
						<fmt:formatDate value="${appr.writeDate }" dateStyle="long" type="date"/> 
					</td>
				</tr>
				<tr class="basicContent">
					<th>기안자</th>
					<td>
						${appr.userName }
					</td>
					<th>기안 부서</th>
					<td>${appr.deptName }</td>
				</tr>
				<tr class="basicContent">
					<th>수신처</th>
					<td id="receivingInfo"><span class="badge-dark">${appr.receiverName }</span></td>
					<th>기결재첨부</th>
					<td>
						<c:forEach items="${appr.appredDoc }"  var="appred">
							<span style="color:#233C61;">
								<a href="javascript:void(0)" 
									onclick="window.open('${path}/appr/openApprDoc?apprNo=${appred.appredNo }',
									'_blank','width = 1000, height = 600')">
									${appred.apprTitle }
								</a>
							</span>
							<br>
						</c:forEach>					
					</td>
				</tr>
				<tr class="basicContent">
					<th>기안 제목</th>
					<td colspan="3">
						<div class="form-group my-1 mr-3">
							<input type="text" class="form-control" name="apprTitle" value="${appr.apprTitle }" readOnly>
						</div>
					</td>
				</tr>
				<c:if test='${appr.apprText!=null && appr.apprText!="" }'>
				<tr class="basicContent">
					<th>기안 내용</th>
					<th colspan="3"></th>
				</tr>
				<tr >
					<td colspan="4">
						<div style="margin:10px 20px;">
							<c:out value="${appr.apprText }" escapeXml="false"/>						
						</div>
					</td>
				</tr>
				</c:if>
			</table>
			<!-- 문서양식 별 태그 넣는 곳 -->
			<table class="table table-hover" id="doc-form-table">
					<c:out value="${appr.apprContent }" escapeXml="false"/>
			</table>
			<!-- 파일 첨부 -->
			<div class="fileUpload-container m-2">
				<h6>
					<i class="fas fa-paperclip"> &nbsp;첨부파일 </i>
				</h6>
				<c:forEach items="${appr.apprAttachment }" var="attachment" varStatus="vs">
            		<button type="button" class="btn btn-outline-dark"
                    	onclick="fileDownload('${attachment.docOriFileName}', '${attachment.docRenamedFile }');"> 
                    	첨부파일 ${vs.count } - ${attachment.docOriFileName}
            		</button>
				</c:forEach> 
			</div>
		</div>
		<br>
	</form>
	
		<!-- The Modal -->
	<div class="modal" id="apprModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">결재/합의하기</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	      <!-- Modal body -->
	      <form id="apprDo">
		      <input type="hidden" name="apprNo" value="${appr.apprNo }">
		      <input type="hidden" name="apprStep" value="${appr.currApprStep+1 }">
		      <input type="hidden" name="apprUser" value="${loginUser.userId }">
		      <input type="hidden" name="apprType" value="${appr.apprType }">
		      
		      <div class="modal-body">
			      <span style="font-weight:bolder; color:red; margin-bottom:20px;">결재 의견 </span><br>
			      <c:if test="${appr.apprType=='approval' }">
		      		<input type="radio" name="apprResult" value="1" id="apprApproval">
		      		<label for="apprApproval" >결재 &nbsp;&nbsp;</label>
			      </c:if>
			      <c:if test="${appr.apprType =='agree' }">
			      	<input type="radio" name="apprResult" value="1" id="apprAgree">
			      	<label for="apprAgree">합의&nbsp;&nbsp;</label>
			      </c:if>
			        <input type="radio" name="apprResult" value="2" id="apprReject">
			        <label for="apprReject">반려</label>
			        <br>
			         <input class="form-control" type="text" name="apprMessage" placeholder="결재 의견을 남겨주세요">
		      </div>
		  </form>
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
	        <button type="button" class="btn btn-primary" style="width:120px;" onclick="doAppr();">결재</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<script>
		function doAppr(){
			$.ajax({
				url:'${path}/appr/executeApproval',
				type:"post",
				data:$("#apprDo").serialize(),
		        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
				success:(data) => {
					console.log(data);
					alert('결재 정보가 저장되었습니다.');
					self.close();
				}
			}); 
		}
		
		function fileDownload(ori, rename){
			ori=encodeURIComponent(ori);
			location.href="${path}/appr/fileDownload?ori="+ori+"&rename="+rename;
		}
		
	</script>
</body>
</html>