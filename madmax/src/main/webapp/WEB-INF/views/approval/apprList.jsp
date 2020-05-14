<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar-appr.jsp" />
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
	<div class="row currList" >
		<div class="col-sm-8">
			<ul>
				<li><strong><i class="fas fa-history"></i> &nbsp; &nbsp;최근 사용 기안</strong></li>
				<li><a href="">휴가신청서</a></li>
				<li><a href="">출장신청서</a></li>
				<li><a href="">품의문</a></li>
				<li><a href="">기안문</a></li>
				<li><a href="">어쩌구</a></li>
			</ul>		
		</div>
		<div class="col-sm-4 docForm">
			<form action="#">
				<div class="input-group mb-3 input-group-sm">
					<div class="input-group-prepend">
						<span class="input-group-text">양식명</span>
					</div>
					<input type="text" class="form-control" name="docForm">
					<div class="input-group-append">
					<button class="btn btn-secondary" type="submit">search</button>
					</div>
				</div>
			</form>
		</div>
	</div>	 
	
	<div class="row draftList" style="clear:both;">
		<div class="col">
			<table class="table table-hover">
				<tr class="bg-light">
					<th width="10%">번호</th>
					<th width="20%">시스템 </th>
					<th>양식명</th>
					<th width="10%">북마크</th>
				</tr>
				<tr>
					<td>1</td>
					<td>문서결재</td>
					<!-- <td><a href="javascript:void(0)" onclick="openPopup(this)">품의문</a></td> -->
					<td><a href="javascript:void(0)" 
					onclick="window.open('${path}/appr/draftForm.do','_blank','width = 1000, height = 600, top = 120px, left = 400px')">
					품의문</a></td>
					<td><i class="fa fa-star"></i></td>
				</tr>
				<tr>
					<td>2</td>
					<td>문서결재</td>
					<td><a href="javascript:void(0)" 
					onclick="window.open('${path}/appr/purchaseForm.do','_blank','width = 1000, height = 600, top = 120px, left = 400px')">구매신청서</a></td>
					<td><i class="fa fa-star-o"></i></td>
				</tr>
				<tr>
					<td>3</td>
					<td>인사</td>
					<td><a href="javascript:void(0)" 
					onclick="window.open('${path}/appr/businesTrip.do','_blank','width = 1000, height = 600, top = 120px, left = 400px')">출장신청서</a></td>
					<td><i class="fa fa-star-o"></i></td>
				</tr>
				<tr>
					<td>4</td>
					<td>인사</td>
					<td><a href="javascript:void(0)" 
					onclick="window.open('${path}/appr/businesTripSettlement.do','_blank','width = 1000, height = 600, top = 120px, left = 400px')">출장정산신청서</a></td>
					<td><i class="fa fa-star-o"></i></td>
				</tr>
				<tr>
					<td>5</td>
					<td>인사</td>
					<td><a href="javascript:void(0)" 
					onclick="window.open('${path}/appr/dayOff.do','_blank','width = 1000, height = 600, top = 120px, left = 400px')">휴가신청서</a></td>
					<td><i class="fa fa-star-o"></i></td>
				</tr>
			</table>
		</div>
	</div>
</div>
		

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
	
</script>



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>