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
		<c:if test="${appr.userId == loginUser.userId && appr.apprStatus==1 }">
			<button type="button" class="btn btnPrimary" onclick="moveToTempBox('${appr.apprNo }');">회수</button>
		</c:if>
		<c:if test="${appr.userId==loginUser.userId && appr.apprStatus==0 }">
			<button type="button" class="btn btnPrimary" onclick="location.replace('${path }/appr/reuseTemp?apprNo=${appr.apprNo }')"> 재기안 </button>
			<button type="button" class="btn btnPrimary" onclick="deleteDraft('${appr.apprNo }');">삭제</button>
		</c:if>
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
						<img src="${path }/resources/upload/sign/${appr.userId}.png" width="50" alt="sign"/> <br>
						<span style="font-size:8px;"><fmt:formatDate value="${appr.writeDate}" pattern="yyyy-MM-dd"/></span>
					</td>
					</td>
					<c:forEach items="${appr.apprLine }" var="l">
						<c:if test="${l.apprType.equals('approval') }">
							<td height="60" class="writerInfo">${l.userName } ${l.jobName }
								<c:if test="${l.apprTime!=null and l.apprTime!=''}">
										<img src="${path }/resources/upload/sign/${l.apprUser}.png" width="50" alt="sign"/> <br>
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
										<img src="${path }/resources/upload/sign/${l.apprUser}.png" width="50" alt="sign"/> <br>
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
				<c:if test='${appr.apprText != null}'>
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
		<div id="opinion"></div>

		
	</form>
	<script>
		$(function(){
			$("input").attr("readOnly","true");
		})
		
				function moveToTempBox(apprNo){
			$.ajax({
				url:"${pageContext.request.contextPath}/appr/updateTemporary",
				data:{"apprNo":apprNo},
				type:"get",
				success:(data)=>{
					alert('해당 문서가 임시 저장함에 저장되었습니다.');
					self.close();
				}
			})
		}
		
		function deleteDraft(apprNo){
			if(confirm("정말로 삭제하시겠습니까? 문서는 복구되지 않습니다.")){
				$.ajax({
					url:"${pageContext.request.contextPath}/appr/deleteDoc",
					data:{"apprNo":apprNo},
					type:"get",
					success:(data)=>{
						console.log(data);
						if(data){							
							alert('삭제되었습니다.');
						}else{
							alert('삭제 실패');
						}
						self.close();
					}
				})
			}
		}
		
		function fileDownload(ori, rename){
			ori=encodeURIComponent(ori);
			location.href="${path}/appr/fileDownload?ori="+ori+"&rename="+rename;
		}
		
		$(function(){
			
			$.ajax({
				type:"GET",
				url:'${path}/appr/apprOpinion?apprNo=${appr.apprNo }',
				dataType:"html",
				success:function(data){
					$("#opinion").html(data);
				},
				error:function(data){
					alert("실패");
				}
				
			});
		});
		
	</script>
</body>
</html>