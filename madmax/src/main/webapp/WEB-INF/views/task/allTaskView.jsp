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
.task-side-container{
	background-color: #233C61;
	color:white;
	font-weight:border;
}

.task-side-container li{
	font-size:14px;
	font-weight:normal;
}
</style>
	
<div class="col col-sm-2 task-side-container pl-4">
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
                    <li><label><input type="radio" value="일주일이내" name="startDate" onclick="taskFilter()"/> 일주일이내</li>
                    <li><label><input type="radio" value="한달이내" name="startDate" onclick="taskFilter()"/> 한달이내</li>
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
                    <li><label><input type="radio" value="일주일이내" name="endDate" onclick="taskFilter()"/> 일주일이내</label></li>
                    <li><label><input type="radio" value="한달이내" name="endDate" onclick="taskFilter()"/> 한달이내</label></li>
                </ul>
            </div>    
    </div>
    <!-- 전체업무 센터 -->
    <div class="taskCenter col col-sm-9 mx-auto"   >
    	<div>
    		<br><br>
        	<span class="d-flex justify-content-between mb-3 " >
        	<h4 style="font-weight:bolder"><i class="icon far fa-calendar-check"></i>&nbsp;전체업무</h4>
       		<!-- 닫기 버튼 누르면 메인 페이지로 이동 -->
        	<button class="btn btn-sm btn-dark mt-4 mb-2 " onclick="location.href='${path}/project/favList.do'">닫기&times;</button>
        	</span>
        </div>
         <div class="container box w-100 h-20 " >   
         	<div id="tab">
				  <ul class="nav nav-tabs" id="projects">
				  	<c:forEach items="${projects}" var="p" >
				    	<li class="nav-item"><a class="nav-link" data-toggle="tab"  href="${p['projectNo'] }" onclick="selectTask(${p['projectNo'] });">${p['projectTitle'] }</a></li>
				    </c:forEach>
				  </ul>
			</div>
		</div>		  
        <div  class="mt-5" style="height:100%">
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
  				<div id="tab-content">
 				<!-- 업무테이블 출력공간*****----------------------------------------------------------------------------- -->
 				<c:if test="${empty tasks}">
 				<h4 class="text-center pt-5">검색된 업무가 없습니다</h4>
 				
 				</c:if>
 				 <c:if test="${tasks!=null}">
 	           <c:forEach items="${tasks }" var="t">
 	           
	          		 <table class="tasks" style="width:100%;height:100%; "  >
		               <tr class="text-sm-center">
		                   <td id="boardNo" style="width:10%">${t['taskNo'] }</td>
							<c:choose>
		                  <c:when test="${t.taskState eq '요청' }">
		                   <td id="taskState" style="width:10%"><div style="background-color:#0275d8; color:white">${t['taskState']}</div></td>
		                   </c:when>
		             		<c:when test="${t.taskState eq '진행' }">
		                   <td id="taskState" style="width:10%"><div style="background-color:#5cb85c; color:white">${t['taskState']}</div></td>
		                   </c:when>
		                     <c:when test="${t.taskState  eq '피드백' }">
		                   <td id="taskState" style="width:10%"><div style="background-color:#d9534f; color:white">${t['taskState']}</div></td>
		                   </c:when>
		                     <c:when test="${t.taskState  eq '완료' }">
		                   <td id="taskState" style="width:10%"><div style="background-color:#5bc0de; color:white">${t['taskState']}</div></td>
		                   </c:when>
		                     <c:when test="${t.taskState eq '보류' }">
		                   <td id="taskState" style="width:10%"><div style="background-color:grey; color:white">${t['taskState']}</div></td>
		                   </c:when>
		            		</c:choose>
		                   <td id="taskProiority" style="width:10%">${t['taskProiority'] }</td>
		                   <!-- 제목 a태그를 클릭시 div창으로 내용이 뜨게 설정한다. no값을넘겨서 창에 뿌려줄것. -->
		                   <td id="taskTitle" style="width:40%"><a href="#" onclick="taskView(${t['boardNo']});" style="color:black; text-decoration:none">${t['taskTitle'] }</a></td>
		                   <td id="taskId" style="width:10%">${t['taskId'] }</td>
		                  	<td id="taskStartDate" style="width:20%">
		                    <c:set var="string" value="${t['taskStartDate'] }"/>
								${fn:substring(string,0,10)}
							</td>
		               </tr>
	               </table>
	               <br/>
	           </c:forEach> 
	           </c:if>
 				
 				
				</div>
	          <!--요기까지 포문-->
	       </div>
       </div>
       <!-- 제목 클릭했을때 나오는 div-********-------------------------------------------- -->
       <div id="showTask" style="overflow:hidden; display:none; border:1px solid grey; border-style:rounded; background-color:white;  position:absolute ; top:11.5%; right:1%; width:60%; height:75%">
       		<button type="button" class="close ml-2" >&times;</button>
     		 <!-- <div class="w-100 bg-white border overflow-hidden mb-3">-->
        <div class="pjViewBox w-100 p-3">                              
            <div class="viewBundle w-100 bg-white rounded p-3">

                <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
                <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
                    <div class=" w-100 d-flex align-items-center">
                        <div class="d-flex " id='profileImgDiv'>
                            <!-- 업무 글쓴이 -->
                        </div>
                        <div class="d-flex flex-column ml-2">
                            <strong id="taskUsername">
                            <!-- 업무 글쓴이 -->
                            </strong>
                            <p class="m-0" style="font-size: small;" id="taskTime">
                                <!-- 업무쓴 날짜 -->
                                
                            </p>
                        </div>                        
                    </div>
                </div>  
                <!--★ 상단공통  끝 -------------------------------------------------------------------------------------------------------------------->

                <!-- if문으로 분기처리 : bordType이 업무인경우 -->
                <!-- 2) 업무 시작  --------------------------------------------------------------------------------------------------------------------->
                <div class="pjViewBody w-100 d-flex flex-column pl-3 pr-3">
                    <h5 class="m-0 font-weight-bolder mb-4" id="taskTitleView"></h5> <!-- 업무제목 -->
                    <div class="d-flex align-items-center">
                        <strong class="mr-2">진행상태</strong> <!-- 업무 진행상태 -->
                        <div id="taskStateView" class="btn-group border border-grey rounded overflow-hidden">
                            <button type="button" class="btn border-right btn-primary btnRequest" >요청</button>
                            <button type="button" class="btn border-right btnProgress" >진행</button>
                            <button type="button" class="btn border-right btnFeedback" >피드백</button>
                            <button type="button" class="btn border-right btnEnd" >완료</button>
                            <button type="button" class="btn btnHold" ">보류</button>
                        </div>
                    </div>                        
                    <hr class="w-100 mt-1 mb-2">
                    <div class="d-flex align-items-center">
                        <strong class="mr-2">담당자</strong>
                        <!-- 담당자 프로필 for문 시작 -->
                        <div class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2'>
                            <div class='d-flex selectedWorker_imgDiv mr-2' id="selectedWorker"><!-- 이미지넣기 -->
                                <!-- <img src='img/profile_img.png'/> -->
                            </div>
                        </div>                                    
                        <!-- 담당자 프로필 for문 끝 -->
                    </div>
                    <hr class="w-100 mt-1 mb-2">
                    <div class="d-flex align-items-center">
                        <strong class="mr-2">시작일</strong>
                        <p id="taskStartDateView" class="m-0">2020/05/10</p> <!-- 시작일 -->
                    </div>   
                    <hr class="w-100 mt-1 mb-2">
                    <div class="d-flex align-items-center">
                        <strong class="mr-2">마감일</strong>
                        <p id="taskEndDateView" class="m-0">2020/05/12</p> <!-- 종료일 -->
                    </div>  
                    <hr class="w-100 mt-1 mb-2">
                    <div class="d-flex align-items-center">
                        <strong  class="mr-2">우선순위</strong>
                        <strong id="taskProiorityView" class="text-danger">긴급</strong> <!-- 우선순위 -->
                    </div>                         
                    <hr class="w-100 mt-1 mb-2">
                    <div id="taskContentView" class="w-100"> <!-- 업무 글 내용 -->
              
                    </div>
                    <br/>
                    <div>
                    <button class="btn btn-outline-primary" id="taskDetailView"><a>이곳을 클릭하여 해당 글로 이동할 수 있습니다.<a></button>
                    </div>
                </div>       
                <!-- 2) 업무 끝 ------------------------------------------------------------------------------------------------------------------------>



            </div><!-- viewBundle 닫기 -->


        </div><!-- viewBox 닫는 태그 -->
  	</div>
  </div><!-- taskCenter -->
 <div class="col col-sm-1">
 </div>     
 
   
<!-- onload시 보여줄 modal 창 -->
<!-- <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal" id="modalBtn">
  Open modal
</button> -->
 <div class="modal" id="myModal" style="display:hidden">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">알림</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div> 

      <!-- Modal body -->
      <div class="modal-body text-center">
      <img src="${path }/resources/images/task_modal.png"/>
      <br/>
      <br/>
      <hr/>
      	<h5>프로젝트 제목을 선택하여<br>
      	프로젝트별 업무를 확인하세요</h5>
      </div>

      

    </div>
  </div>
</div> 
<script>

 $(document).ready(function(){
	
	 function getParameterByName(name) {
		    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
		    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
		        results = regex.exec(location.search);
		    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
		}

	 var projectNo = getParameterByName("no");
	 console.log(projectNo);
	 if(projectNo==""){
		$("#myModal").modal("show");
	 }
});
 


function selectTask(pNo){
	
	//$("#pNo").show();
	
	location.href="${path}/task/selectTaskEach.do?no="+pNo;
	
}
//url의 쿼리스트링 값 가져오는 함수
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}


//사이드바 필터링 함수
function taskFilter(){
	 // 전체 Url을 가져온다.
    var str = location.href;
    // QueryString의 값을 가져오기 위해서, ? 이후 첫번째 index값을 가져온다.
    var projectNo = getParameterByName("no");
    //var projectNo=pNo;
	console.log(projectNo);
	var task=$(":input:radio[name=task]:checked").val();
	var status=$(":input:radio[name=status]:checked").val();
	var priority=$(":input:radio[name=priority]:checked").val();
	var startDate=$(":input:radio[name=startDate]:checked").val();
	var endDate=$(":input:radio[name=endDate]:checked").val();
	console.log(status);
	if(task==undefined){
		task=null;
	}
	if(status==undefined){
		status=null;
	}
	if(priority==undefined || priority==" "){
		priority=null;
	}
	if(startDate==undefined|| startDate==" "){
		startDate=null;
	}
	if(endDate==undefined|| endDate==" "){
		endDate=null;
	}
	if(projectNo==undefined){
		projectNo=null;
	}
	//ajax로 보낼객체들
	var params={
			projectNo:projectNo,
			task:task,
			status:status,
			priority:priority,
			startDate:startDate,
			endDate:endDate
	};
	console.log(params);
	//ajax로 값 보내기. 비동기 통신
	$.ajax({
		url:"${path}/task/selectTaskFilter.do",
		type:"post",
		dataType:"json",
		data:params,
		success:function(data){
			$("#tab-content").empty();
			var table="";
			console.log(data.tasks);//배열로 들어옴
			var tasks=data.tasks;
			console.log(tasks.length);
			if(tasks.length>0){
				for(var i=0;i<tasks.length;i++){
			
						table+="<table style='width:100%;height:100%;' >";
						table+="<tr class='text-sm-center'>";
						table+="<td style='width:10%'>"+tasks[i].taskNo+"</td>";
							if(tasks[i].taskState=="요청"){
								table+="<td style='width:10%'><div style='background-color:#0275d8; color:white'>"+tasks[i].taskState+"</div></td>";
							}else if(tasks[i].taskState=="진행"){
								table+="<td style='width:10%'><div style='background-color:#5cb85c; color:white'>"+tasks[i].taskState+"</div></td>";
							}else if(tasks[i].taskState=="피드백"){
								table+="<td style='width:10%'><div style='background-color:#d9534f; color:white'>"+tasks[i].taskState+"</div></td>";
							}else if(tasks[i].taskState=="완료"){
								table+="<td style='width:10%'><div style='background-color:#5bc0de; color:white'>"+tasks[i].taskState+"</div></td>";
							}else if(tasks[i].taskState=="보류"){
								table+="<td style='width:10%'><div style='background-color:grey; color:white'>"+tasks[i].taskState+"</div></td>";
							}
						table+="<td  style='width:10%'>"+tasks[i].taskProiority+"</td>";
						table+="<td id='taskTitle' style='width:40%''><a href='#' onclick='taskView("+tasks[i].boardNo+");' style='color:black; text-decoration:none'>"+tasks[i].taskTitle+"</a></td>";
						table+="<td style='width:10%'>"+tasks[i].taskId+"</td>";
						table+="<td style='width:20%'>"+tasks[i].taskStartDate+"</td>";
						table+="</tr>";
						table+="</td>"
						table+="<br/>";
				}
				
			}else{
				table+="<table style='width:100%;height:100%;' >";
				table+="<tr>";
				table+="<td  class='text-sm-center' colspan='6'>조회된 업무가 없습니다 </td>";
				table+="</tr>";
				table+="<table>";
			}
			
			$("#tab-content").append(table);
			
			
			
		}
		
	});

	
	
	
 
			
}

 //제목 클릭시 업무내용을 작은창으로 보여줌
 function taskView(boardNo){
	 
	 $.ajax({
			url:"${path}/task/selectTaskView.do",
			type:"post",
			dataType:"json",
			data:{boardNo:boardNo},
			success:function(data){
				//TASK 따로,NOTIMEMBER따로 받음 !
				
				var task=data.task;
				var notiMember=data.notiMember;
				var tmMembers='';
				console.log(data);
				var profile="<img src='${path}/resources/upload/profile/"+task.profile+"' width='50px' height='50px'/>";
				//업무작성자 프로필
				$("#profileImgDiv").html(profile);
				$("#taskTitleView").html(task.taskTitle);//업무제목
				$("#taskUsername").html(task.userName);//업무작성자
				$("#taskTime").html(task.taskTime);//업무작성일
				$("#notiMember").html(notiMember.tmName);//담당자
				$("#taskStartDateView").html(task.taskStartDate);//업무시작일
				$("#taskEndDateView").html(task.taskEndDate);//업무마감일
				$("#taskProiorityView").html(task.taskProiority);//업무 우선순위
				$("#taskContentView").html(task.taskContent);//업무내용
				$("#taskDetailView").html("<a href='${path}/selectedProject/selectedProject.do?pjNo="+task.projectNo+"&loginId=${loginUser.userId}&boardNo="+task.boardNo+"'>이곳을 클릭하여 해당 글로 이동할 수 있습니다.</a>")
				//담당자는 따로 !
				for(var i=0;i<notiMember.length;i++){
					tmMembers+="<div><img src='${path}/resources/upload/profile/"+notiMember[i].tmProfile+"' width='30px' height='30px'/></div>";
					tmMembers+="<div><p>"+notiMember[i].tmName+"</p></div>&nbsp;";
					
				}
				$("#selectedWorker").html(tmMembers);
				
				
				$("#showTask").show();
				console.log(task.taskState);
				switch(task.taskState){
				case "요청":$("#taskStateView").html("<button type='button' class='btn border-right btn-primary' >요청</button>");break;
				case "진행":$("#taskStateView").html("<button type='button' class='btn border-right btn-success' >진행</button>");break;
				case "피드백":$("#taskStateView").html("<button type='button' class='btn border-right btn-danger' >피드백</button>");break;
				case "완료":$("#taskStateView").html("<button type='button' class='btn border-right btn-info' >완료</button>");break;
				case "보류":$("#taskStateView").html("<button type='button' class='btn border-right btn-secondary' >보류</button>");break;
				}
			}
			
			});
	 
	 
	 
 }
 //close버튼 누르면 작은 창 닫힘
 $(".close").click(()=>{
	 
	 $(".close").parent().hide();
	 
 })




</script>
<style>

.taskCenter ul{list-style:none;}

.box{width:100%; height:10%; margin:0 auto;}

#projects{
     white-space:nowrap; text-align:center}

/* #tab ul li{display:inline-block;} */

</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>