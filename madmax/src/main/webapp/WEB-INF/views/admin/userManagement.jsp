<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>

<jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp" />

<div class="col col-sm-8 list-container">
	<br><br>
	<h4 style="font-weight:bolder">&nbsp;<i class="fas fa-id-card"></i> &nbsp;회원 관리</h4>
	<br>
	
	
	<div class="row draftList" style="clear:both;">
		<div class="col">
			<table class="table table-hover "  style="text-align:center; width:100%;">
				<thead class="bg-light">
					<tr>
						<th>#</th>
						<th>회원 이름</th>
						<th>전화 번호</th>
						<th>입사일</th>
						<th>부서 </th>
						<th>직급</th>
						<th></th>
					</tr>
				</thead>
				
				<c:if test="${not empty list}">
					<form id="form">
						<c:forEach items="${list }" var="l" varStatus="vs">
							<tbody>
								<tr>
									<td>${vs.index+1}</td>
									<td>${l.userName}</td>
									<td>${l.phone}</td>
									<td><fmt:formatDate value="${l.hireDate}" type="both" pattern="yyyy-MM-dd" /></td>
									<td>${l.deptName}</td>
									<td>${l.jobName}</td>
									<td>
										<input type="hidden" id="userId1" name="userId" value="${l.userId}" />
										<button type="button" class="btn btn-outline-primary" onclick="modalBtn(this);"  data-toggle="modal" data-target="#myModal">직급 권한</button>
									</td>
								</tr>
							</tbody>
						</c:forEach>
					</form>
				</c:if>
			</table>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myModal" >
		<form id="modifyForm">
		  <div class="modal-dialog">
		    <div class="modal-content">
		
		      <!-- Modal Header -->
		      <div class="modal-header">
		        <h4 class="modal-title"><i class="fas fa-id-card"></i>&nbsp;직급 권한</h4>
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		
		      <!-- Modal body -->
		      <div class="modal-body">
		      
		      	<label class="btn btn-secondary">
		          <input type="radio" class="btn checkBtn changeBtn" name="jobCode" value="J3" >팀장
		        </label>
		        <label class="btn btn-secondary">
		          <input type="radio" class="btn checkBtn changeBtn" name="jobCode" value="J4">부장
		        </label>
		        <label class="btn btn-secondary">
		          <input type="radio" class="btn checkBtn changeBtn" name="jobCode" value="J5">차장
		        </label>
		        <label class="btn btn-secondary">
		          <input type="radio" class="btn checkBtn changeBtn" name="jobCode" value="J6">과장
		        </label>
		        <label class="btn btn-secondary">
		          <input type="radio" class="btn checkBtn changeBtn" name="jobCode" value="J7">대리
		        </label>
		        <label class="btn btn-secondary">
		          <input type="radio" class="btn checkBtn changeBtn" name="jobCode" value="J8">사원
		        </label>
		        	<input type="hidden" id="id" name="userId"/>
		        </div>
				
		      <!-- Modal footer -->
		      <div class="modal-footer">
		        <button type="submit" class="btn btn-outline-dark" data-dismiss="modal" onclick="modify();">수정</button>
		      </div>
		
		    </div>
		  </div>
		</form>
	</div>
	
	
	 <div id="page-container">
        	${pageBar}
     </div> 
</div>

<script>
	function modalBtn(e){
		//console.log(e);
		console.log($(e).prev().val());
		$('#id').val($(e).prev().val());
	}

	$('#myModadl').on('show.bs.modal',function(e){
		
		
		//console.log(e.target);
		
		//console.log($('#userId').val());
		var userId=$('#userId1').val();
		$('#id').val(userId);
		//console.log($('#id').val());
		
	});


	function modify(){
		var otn=document.getElementsByName("jobCode");
		
		for(var i = 0; i<otn.length; i++){
			if(otn[i].checked==true){
				console.log(otn[i].value);
				console.log($("#userId").val())
				$('#myModal').modal("hide");
				$("#modifyForm").attr("action","${path}/admin/modifyJobLevel.do");
				$("#modifyForm").submit();
				console.log($("#id").val())
			}
		}
	}
	
	$(document).ready(function() {
	    $('#example').DataTable();
	} );
	
</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>