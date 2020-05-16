<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>

<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<style>
 .bWhite{
 	background-color:white;
 }
 .taskCenter th,td{
 	background-color:white;
 }

</style>
	
        <div class=" col col-sm-2 ml-3" >
        <!-- 전체업무 사이드바 -->
        <div class="mt-3 ">
            <label>업무구분</label>
            <ul style="list-style: none;">
                <li><label><input type="radio" value="내업무" name="task" onclick="taskFilter();"> 내 업무</label></li>
                <li><label><input type="radio" value="요청한업무" name="task" onclick="taskFilter();"> 요청한 업무</label></li>
                <li><label><input type="radio" value="전체업무" name="task" onclick="taskFilter();"> 전체 업무</label></li>
          	</ul>
        </div>
        <hr/>

        <div class="d-flex justify-content-between mb-1">
            	상태 <div  data-toggle="collapse" data-target="#status"><img src="${path }/resources/images/expand-arrow.png" style="width:17px;"></div>
        </div>
            <div id="status" class="collapse show">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="요청" name="status" onclick="taskFilter()"/> 요청</label></li>
                    <li><label><input type="radio" value="진행" name="status" onclick="taskFilter()"/> 진행</label></li>
                    <li><label><input type="radio" value="피드백" name="status" onclick="taskFilter()"/> 피드백</label></li>
                    <li><label><input type="radio" value="완료" name="status" onclick="taskFilter()"/> 완료</label></li>
                    <li><label><input type="radio" value="보류" name="status" onclick="taskFilter()"/> 보류</label></li>
                </ul>
            </div>
        <hr/>
        <div class="d-flex justify-content-between mb-1">
           	 우선순위 <div data-toggle="collapse" data-target="#priority"><img src="${path }/resources/images/expand-arrow.png"style="width:17px;"></div>
        </div>
            <div id="priority" class="collapse show">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="긴급" name="priority" onclick="taskFilter()"/> 긴급</label></li>
                    <li><label><input type="radio" value="높음" name="priority" onclick="taskFilter()"/> 높음</label></li>
                    <li><label><input type="radio" value="보통" name="priority" onclick="taskFilter()"/> 보통</label></li>
                    <li><label><input type="radio" value="낮음" name="priority" onclick="taskFilter()"/> 낮음</label></li>
                    <li><label><input type="radio" value="없음" name="priority" onclick="taskFilter()"/> 없음</label></li>
                </ul>
            </div>
        <hr/>
        <div class="d-flex justify-content-between mb-1">
           	 시작일 <div data-toggle="collapse" data-target="#startDate"><img src="${path }/resources/images/expand-arrow.png" style="width:17px;"></div>
        </div>
            <div id="startDate" class="collapse">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="전체" name="startDate" onclick="taskFilter()"/> 전체</label></li>
                    <li><label><input type="radio" value="오늘" name="startDate" onclick="taskFilter()"/> 오늘</li>
                    <li><label><input type="radio" value="이번주" name="startDate" onclick="taskFilter()"/> 이번주</li>
                    <li><label><input type="radio" value="이번달" name="startDate" onclick="taskFilter()"/> 이번달</li>
                    <li><label><input type="radio" value="날짜미정" name="startDate" onclick="taskFilter()"/> 날짜미정</li>
                </ul>
            </div>
        <hr/>
        <div class="d-flex justify-content-between mb-1">
           	 마감일 <div  data-toggle="collapse" data-target="#endDate"><img src="${path }/resources/images/expand-arrow.png" style="width:17px;"/></div>
        </div>
            <div id="endDate" class="collapse">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="전체" name="endDate" onclick="taskFilter()"/> 전체</label></li>
                    <li><label><input type="radio" value="지연" name="endDate" onclick="taskFilter()"/> 지연</label></li>
                    <li><label><input type="radio" value="오늘까지" name="endDate" onclick="taskFilter()"/> 오늘까지</label></li>
                    <li><label><input type="radio" value="이번주까지" name="endDate" onclick="taskFilter()"/> 이번주까지</label></li>
                    <li><label><input type="radio" value="이번달까지" name="endDate" onclick="taskFilter()"/> 이번달까지</label></li>
                    <li><label><input type="radio" value="날짜미정" name="endDate" onclick="taskFilter()"/> 날짜미정</label></li>
                </ul>
            </div>
        
    </div>
    <!-- 전체업무 센터 -->
    <div class="taskCenter col col-sm-7"  >
    	<div>
        	<span class="d-flex justify-content-between mb-3" ><p class="mt-4" style="font-size:20px">전체업무(전체업무count수)</p> 
       		<!-- 닫기 버튼 누르면 메인 페이지로 이동 -->
        	<button class="btn btn-sm btn-dark mt-4 mb-2 " onclick="location.href='${path}/task/backhome.do'">닫기&times;</button></span>
        </div>
         <div class="container" >
	           
				  <ul class="nav nav-tabs">
				  	<c:forEach items="${projects}" var="p"  begin="0" end="4">
				    	<li class="nav-item"><a class="nav-link" data-toggle="tab"  href="${p['projectNo'] }" onclick="selectTask(${p['projectNo'] });">${p['projectTitle'] }</a></li>
				    </c:forEach>
				     <c:if test="${fn:length(projects)>4}">
				    	<li class="nav-item"><a class="nav-link">+더보기</a></li>
				    </c:if>
				  </ul>
        <div  style="height:100%">
	       <div class="pl-2 pr-2 pt-2 " style="position:relative"  >
	           <table  class="bWhite" style="width:100%;height:100%; border-bottom:1px solid black" >
	               <tr class="text-sm-center container-fluid">
	                   <th style="width:10%">번호</th>
	                   <th style="width:10%">상태</th>
	                   <th style="width:10%">우선순위</th>
	                   <th style="widows: 40%">제목</th>
	                   <th style="width:10%">담당자</th>
	                   <th style="width:20%">수정일</th>
	               </tr>
	           </table>
	           <br/>
	           <!-- 프로젝트별 업무내용 출력 -->
  				<div class="tab-content">
  				<c:if test="${tasks!=null }">
  				 	<c:forEach items="${tasks }" var="t"> 
				    <div id="${t['projectNo'] }" class="tab-pane container active">
				     <table class="tasks" style="width:100%;height:100%;"  >
	               		<tr class="text-sm-center">
			                   <td id="boardNo" style="width:10%">${t['taskNo'] }</td>
								<c:choose>
				                  <c:when test="${t.taskState eq '요청' }">
				                   		<td id="taskState" style="width:10%"><div style="background-color:blue; color:white">${t['taskState']}</div></td>
				                   </c:when>
				             		<c:when test="${t.taskState eq '진행' }">
				                   		<td id="taskState" style="width:10%"><div style="background-color:green; color:white">${t['taskState']}</div></td>
				                   </c:when>
				                   <c:when test="${t.taskState  eq '피드백' }">
				                   		<td id="taskState" style="width:10%"><div style="background-color:orange; color:white">${t['taskState']}</div></td>
				                   </c:when>
				                     <c:when test="${t.taskState  eq '완료' }">
				                   		<td id="taskState" style="width:10%"><div style="background-color:purple; color:white">${t['taskState']}</div></td>
				                   </c:when>
				                   <c:when test="${t.taskState eq '보류' }">
				                   		<td id="taskState" style="width:10%"><div style="background-color:grey; color:white">${t['taskState']}</div></td>
				                   </c:when>
			            		</c:choose>
			                   <td id="taskProiority" style="width:10%">${t['taskProiority'] }</td>
			                   <!-- 제목 a태그를 클릭시 div창으로 내용이 뜨게 설정한다. no값을넘겨서 창에 뿌려줄것. -->
			                   <td id="taskTitle" style="width:40%"><a href="#" onclick="taskView(${t['boardNo']});" style="color:black; text-decoration:none">${t['taskTitle'] }</a></td>
			                   <td id="taskId" style="width:10%">${t['taskId'] }</td>
			                   <td id="taskStartDate" style="width:20%">${t['taskStartDate'] }</td>
	               		</tr>
	               </table> 
				      
				      
				    </div>
				    </c:forEach>
				</c:if>    
				  
				</div>
	          <!--요기까지 포문-->
	       </div>
       </div>
       <!-- 제목 클릭했을때 나오는 div -->
       <div id="showTask" style="display:none; border-left:1px solid grey; background-color:white;  position:absolute ; top:11.5%; right:1%; width:60%; height:100%">
       	<button type="button" class="close ml-2" >&times;</button>
       	<div id="writeCategory-task" class="row w-100 m-0">
                            <div id="taskBox" class="w-100 p-3">
                                <div id="taskTitleBox" class="col-12 d-flex justify-content-center mb-3">
                                    <input name="taskTitle" id="taskTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        placeholder="업무명 입력" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;">
                                </div>
                                <div class="mt-1 mb-2 border border-purple rounded">이곳을 클릭하면 해당글로 이동할 수 있습니다&nbsp;&nbsp; &gt;</div>
                                <div id="taskTabBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">진행상태</strong>
                                    <div id="taskTabBtns" class="btn-group border border-grey rounded overflow-hidden">
                                        <input type="hidden" id="progressState" name="progressState" value="request"/>
                                        <button type="button" class="btn border-right btn-primary" id="request" onclick="fn_progressState(this, 'request');">요청</button>
                                        <button type="button" class="btn border-right" id="progress" onclick="fn_progressState(this, 'progress');">진행</button>
                                        <button type="button" class="btn border-right" id="feedback" onclick="fn_progressState(this, 'feedback');">피드백</button>
                                        <button type="button" class="btn border-right" id="end" onclick="fn_progressState(this, 'end');">완료</button>
                                        <button type="button" class="btn" id="hold" onclick="fn_progressState(this, 'hold');">보류</button>
                                    </div>
                                </div>
                                <div id="taskListBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">담당자</strong>
                                    <input type="text" id="workerListStr" name="workerListStr" style="display: none;"/>
                                    <div id="workerList" class="d-flex flex-wrap">            
                                        <button type="button" id="addWorker" class="btn btn-info m-1" onclick="fn_addWorkerModal();">담당자 추가</button>                       
                                    </div>
                                </div>
                                <div id="taskStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date"" id="taskStartDate" name="taskStartDate"/>
                                </div>   
                                <div id="taskEndDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date"" id="taskEndDate" name="taskEndDate"/>
                                </div>  
                                <div id="priorityBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">우선순위</strong>
                                    <input type="hidden" id="taskPriority" name="taskPriority"/>
                                    <div class="dropdown">
                                        <button type="button" id="prioritySelectBtn" class="btn dropdown-toggle" data-toggle="dropdown" style="width: 150px;">
                                            	우선순위 선택
                                        </button>
                                        <div class="dropdown-menu text-center">
                                            <p class="dropdown-item m-0" id="lv1" onclick="fn_priority(this, 'lv4');">낮음</p>
                                            <p class="dropdown-item m-0" id="lv2" onclick="fn_priority(this, 'lv3');">보통</p>
                                            <p class="dropdown-item m-0" id="lv3" onclick="fn_priority(this, 'lv2');">높음</p>
                                            <p class="dropdown-item m-0" id="lv4" onclick="fn_priority(this, 'lv1');">긴급</p>
                                        </div>
                                    </div>                   
                                </div>                                  
                                <div id="taskContentBox" class="col-12 d-flex justify-content-center">
                                    <textarea name="taskContentArea" id="taskContentArea" class="w-100 border-0 contentArea" style="resize: none;" placeholder="글을 입력하세요."></textarea>
                                </div>
                            </div>
                        </div>
       </div>
    </div>	
<div class="col col-sm-3">

</div>

<script>
function selectTask(pNo){
	
	$("#pNo").show();
	
	location.href="${path}/task/selectTaskEach.do?no="+pNo;
	
}
//사이드바 필터링 함수
function taskFilter(){
	var task=$(":input:radio[name=task]:checked").val();
	var status=$(":input:radio[name=status]:checked").val();
	var priority=$(":input:radio[name=priority]:checked").val();
	var startDate=$(":input:radio[name=startDate]:checked").val();
	var endDate=$(":input:radio[name=endDate]:checked").val();
	if(task==undefined){
		task=null;
	}
	if(status==undefined){
		status=null;
	}
	if(priority==undefined){
		priority=null;
	}
	if(startDate==undefined){
		startDate=null;
	}
	if(endDate==undefined){
		endDate=null;
	}
  location.href="${path}/task/selectTaskFilter.do?task="+task+"&status="+status+"&priority="+priority+"&startDate="+startDate+"&endDate="+endDate;
			
}

 //제목 클릭시 업무내용을 작은창으로 보여줌
 function taskView(){
	 $("#showTask").show();
	 
 }
 //close버튼 누르면 작은 창 닫힘
 $(".close").click(()=>{
	 
	 $(".close").parent().hide();
	 
 })




</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>