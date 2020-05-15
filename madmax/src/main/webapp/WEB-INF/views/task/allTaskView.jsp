<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                <li><label><input type="radio" value="내업무" name="task"> 내 업무</label></li>
                <li><label><input type="radio" value="요청한업무" name="task"> 요청한 업무</label></li>
                <li><label><input type="radio" value="전체업무" name="task"> 전체 업무</label></li>
          	</ul>
        </div>
        <hr/>

        <div class="d-flex justify-content-between mb-1">
            	상태 <div  data-toggle="collapse" data-target="#status"><img src="${path }/resources/images/expand-arrow.png" style="width:17px;"></div>
        </div>
            <div id="status" class="collapse show">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="요청" name="status"/> 요청</label></li>
                    <li><label><input type="radio" value="진행" name="status"/> 진행</label></li>
                    <li><label><input type="radio" value="피드백" name="status"/> 피드백</label></li>
                    <li><label><input type="radio" value="완료" name="status"/> 완료</label></li>
                    <li><label><input type="radio" value="보류" name="status"/> 보류</label></li>
                </ul>
            </div>
        <hr/>
        <div class="d-flex justify-content-between mb-1">
           	 우선순위 <div data-toggle="collapse" data-target="#priority"><img src="${path }/resources/images/expand-arrow.png"style="width:17px;"></div>
        </div>
            <div id="priority" class="collapse show">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="긴급" name="priority"/> 긴급</label></li>
                    <li><label><input type="radio" value="높음" name="priority"/> 높음</label></li>
                    <li><label><input type="radio" value="보통" name="priority"/> 보통</label></li>
                    <li><label><input type="radio" value="낮음" name="priority"/> 낮음</label></li>
                    <li><label><input type="radio" value="없음" name="priority"/> 없음</label></li>
                </ul>
            </div>
        <hr/>
        <div class="d-flex justify-content-between mb-1">
           	 시작일 <div data-toggle="collapse" data-target="#startDate"><img src="${path }/resources/images/expand-arrow.png" style="width:17px;"></div>
        </div>
            <div id="startDate" class="collapse">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="전체" name="startDate"/> 전체</label></li>
                    <li><label><input type="radio" value="오늘" name="startDate"/> 오늘</li>
                    <li><label><input type="radio" value="이번주" name="startDate"/> 이번주</li>
                    <li><label><input type="radio" value="이번달" name="startDate"/> 이번달</li>
                    <li><label><input type="radio" value="날짜미정" name="startDate"/> 날짜미정</li>
                </ul>
            </div>
        <hr/>
        <div class="d-flex justify-content-between mb-1">
           	 마감일 <div  data-toggle="collapse" data-target="#endDate"><img src="${path }/resources/images/expand-arrow.png" style="width:17px;"/></div>
        </div>
            <div id="endDate" class="collapse">
                <!--숨기는 영역-->
                <ul style="list-style: none;">
                    <li><label><input type="radio" value="전체" name="endDate"/> 전체</label></li>
                    <li><label><input type="radio" value="지연" name="endDate"/> 지연</label></li>
                    <li><label><input type="radio" value="오늘까지" name="endDate"/> 오늘까지</label></li>
                    <li><label><input type="radio" value="이번주까지" name="endDate"/> 이번주까지</label></li>
                    <li><label><input type="radio" value="이번달까지" name="endDate"/> 이번달까지</label></li>
                    <li><label><input type="radio" value="날짜미정" name="endDate"/> 날짜미정</label></li>
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
        <div class="bWhite" style="height:100%">
	       <div class="bWhite pl-2 pr-2 pt-2" style="position:relative" >
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
	           <!--프로젝트가 여러개 일수 있으니 포문돌려-->
	           <!--data-target이랑 class명을 no값으로해도될듯??-->
	           <!--스크립트로 this.next hide하기-->
	           <c:forEach items="${projects}" var="p">
	           <div class="projectName">
	           		<input type="hidden" value="${p['projectNo'] }" class="pNo"/>
	               <b class="bWhite ml-3" style="color:#25558F ">${p['projectTitle'] }</b>
	               <img class="bWhite" src="${path }/resources/images/expand-arrow.png" style="width:17px;"/>
	           </div>
	           </c:forEach>
	            <c:if test="${tasks!=null}">
 	           <c:forEach items="${tasks }" var="t">
	           <table class="tasks" style="width:100%;height:100%;" >
	               <tr class="text-sm-center">
	                   <td id="boardNo" style="width:10%">${t['boardNo'] }</td>
	                   <td id="taskState" style="width:10%"><div style="background-color:blue; color:white">${t['taskState']}</div></td>
	                   <td id="taskProiority" style="width:10%">${t['taskProiority'] }</td>
	                   <!-- 제목 a태그를 클릭시 div창으로 내용이 뜨게 설정한다. no값을넘겨서 창에 뿌려줄것. -->
	                   <td id="taskTitle" style="width:40%"><a href="#" onclick="taskView();" style="color:black; text-decoration:none">${t['taskTitle'] }</a></td>
	                   <td id="taskId" style="width:10%">${t['taskId'] }</td>
	                   <td id="taskStartDate" style="width:20%">${t['taskStartDate'] }</td>
	               </tr>
	               </table>
	           <br/>
	           </c:forEach> 
	           </c:if>
	          
	          
	          <!--요기까지 포문-->
	       </div>
       </div>
       <!-- 제목 클릭했을때 나오는 div -->
       <div id="showTask" style="display:none; border-left:1px solid grey; background-color:pink;  position:absolute ; top:11.5%; right:1%; width:60%; height:100%">
       	메인에 있는 view쏴줄곳<button type="button" class="close ml-2" >&times;</button>
       	<div>이곳을 클릭하면 해당글로 이동할 수 있습니다.</div>
       </div>
    </div>	
<div class="col col-sm-3">

</div>

<script>
$(".projectName").click(()=>{
	
	console.log($(this).find('.pNo').val());
	
   /*  location.href="${path}/task/selectTaskEach.do?no="+pNo;
    $(".projects").toggle(); */
});


  function showP(no){
	$.ajax({
		url:"${path}/task/selectTaskEach.do",
		dataType:"json",
		type:"post",
		data:{"no":no},
		success:function(data){
			
			console.log(data.length);
			console.log(data[0]['taskTitle']);
			let table=$("<table>").css({"width":"100%","height":"100%"});
			for(let i=0;i<data.length;i++){
			
			let tr=$("<tr>").append($("<td>").html(data[i]['boardNo']))
			.append($("<td>").html(data[i]['taskState']))
			.append($("<td>").html(data[i]['taskProiority']))
			.append($("<td>").html(data[i]['taskTitle']))
			.append($("<td>").html(data[i]['taskId']))
			.append($("<td>").html(data[i]['taskStartDate']));
			table.append(tr);
			
			}
			console.log($("container").html(table));
			$("#container").html(table);
		}
	})
  }
	/*  $(".showP").click(()=>{
		 console.log(this);
		 console.log($(this));
	 
		 console.log($(this).next());
	 
			if($(this).next().css("display")=="none"){
			 $(this).next().css("display","block");
			 }else{
				 $(this).next().css("display","none"); 
			 }
		 });
	  */
	

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