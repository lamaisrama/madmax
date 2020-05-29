<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>


<jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp" />





<div class="col col-sm-9">	
		<h4><i class="far fa-address-card"></i>&nbsp;근태현황</h4>	
		<hr>
	 	<br>
	 	<!-- Search -->
        기간검색&nbsp;
        <input type="date" class="dateInput" />&nbsp;~&nbsp;<input type="date" class="dateInput" />
        <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="button" aria-pressed="false">
        검색
        </button>
        <br><br>
        <!-- AttendanceList -->
        <table class="table text-center">
            <thead style="background-color: #233C61; color:#F1F0F5;">
            <tr>
                <th scope="col">#</th>
                <th scope="col">이름</th>
                <th scope="col">현재상태</th>
                <th scope="col">요청사유</th>
                <th scope="col">요청상태</th>
                <th scope="col">요청일</th>
                <th scope="col">처리결과</th>
                <th scope="col">수정</th>
            </tr>
            </thead>
            <tbody>
			
			<c:if test="${not empty list}">
            <c:forEach items="${list}" var="a" varStatus="vs">
            <tr>
                <th scope="row" style="vertical-align: middle;">${vs.index+1}</th>
                <!-- <th scope="row">5</th> -->
                <td style="vertical-align: middle;">${a['userName']}</td>
                <td style="vertical-align: middle;">${a['employeeState']}</td>
                <td style="vertical-align: middle;">${a['requestReason']}</td>
                <td style="vertical-align: middle;">${a['requestCategory']}</td>
                <td style="vertical-align: middle;"><fmt:formatDate value="${a['requestDate']}" type="both" pattern="yyyy-MM-dd" /></td>
                <td style="vertical-align: middle;">${a['requestResult']}</td>
                
                <td>
                <input type="hidden"  id="managementNo"  value="${a['managementNo']}"/>
                <input type="hidden"  id="requestNo"  value="${a['requestNo']}"/>
                <input type="hidden"  id="workStateNo"  value="${a['workStateNo']}"/>
                    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModalCenter" onclick="arrayValue(this);">
                       	 수정
                    </button>
                </td>
            </tr>
            </c:forEach>
            </c:if>
 
            </tbody>
        </table>	
        
        <div id="page-container">
        	${pageBar}
        </div>  
        <!-- Modal -->
                    <div class="modal fade " id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                       	<form id="modifyFormAdmin">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">상태수정</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            </div>
                            <div class="modal-body">
                  			
                            	수정할 상태 : 
                                <div class="btn-group btn-group-toggle pr-3" data-toggle="buttons">
                                    <label class="btn btn-secondary active">
                                    <input type="radio" name="requestCategory" id="option1" value="출근" checked> 출근
                                    </label>
                                    <label class="btn btn-secondary">
                                    <input type="radio" name="requestCategory" id="option2" value="휴가 "> 휴가
                                    </label>
                                    <label class="btn btn-secondary">
                                    <input type="radio" name="requestCategory" id="option3" value="결근"> 결근
                                    </label>
                                </div>
                            <br><br>    
                            <input type="hidden" id="mNo" name="managementNo"/>
                            <input type="hidden" id="rNo" name="requestNo"/>
                            <input type="hidden" id="wsNo" name="workStateNo"/>

                            </div>
                            <div class="modal-footer">
	                            <button type="button"  class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                            <button  type="button" class="btn btn-primary" style="background-color: #233C61; border-color: #233C61;" onclick="modifyEnd();">수정완료</button>
                            </div>
                         
                        </div>
                        </div>
                        </form>
                    </div>
</div>	


<script>

	/* $('#exampleModalCenter').on('show.bs.modal',function(e){
		
		//var mNo=$('#managementNo').val();
		//$('#mNo').val();
		console.log($('#managementNo').val());
		//var rNo=$('#requestNo').val();
		//$('#rNo').val(rNo);
		
		//var wsNo=$('#workStateNo').val();
		//$('#wsNo').val(wsNo);
		
		
	}); */
	
	
	function arrayValue(e){
		//console.log($(e).prev().val());
		//console.log($(e).prev().prev().val());
		//console.log($(e).prev().prev().prev().val());
		
		$("#wsNo").val($(e).prev().val());
		$("#rNo").val($(e).prev().prev().val());
		$("#mNo").val($(e).prev().prev().prev().val());
	}

	

	function modifyEnd(e){
		
		var otn = document.getElementsByName("requestCategory");

		for(var i = 0; i<otn.length; i++){

			if(otn[i].checked==true){
				$('#exampleModalCenter').modal("hide");
				//console.log(otn[i].value)
				$("#modifyFormAdmin").attr("action","${path}/admin/adminModifyRequest.do");
				$("#modifyFormAdmin").submit();	
				alert("수정 완료됐습니다.");
				return false;
				
			}
		}
		
	}

	
</script>
