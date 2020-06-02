
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<div class="col col-sm-9 mx-auto">
<!-- 내가 쓴 게시물 출력 화면 글,업무,일정-->
<!-- projectboard테이블에서 projectType으로 분기하여 출력해준다 -->
<!-- 페이징 처리할것 -->
		<br><br>
 			<div id="myBoardTitle">
               <h4 style="font-weight:bolder"><i class="icon far fa-smile"></i>내 게시물 보기</h4>
               <br>
            </div>
            <c:if test="${empty List }">
       			<div class="w-100 h-25 mt-5 text-center bg-light ">
            		<h6 class="pt-5 pl-5">작성한 글이 없습니다.</h6>
            	</div>
            </c:if> 
            <c:forEach items="${List }" var="l">
               <div class="w-100  bg-white border border-grey rounded overflow-hidden  mb-3">
                <div class="projectTitle w-100 h-25  border-bottom border-grey d-flex justify-content-around overflow-hidden">
            	<span>${l.projectTitle }</span>	<a href="${path}/selectedProject/selectedProject.do?pjNo=${l.projectNo}&loginId=${loginUser.userId}&boardNo=${l.boardNo}">글 바로보기 &gt;&gt;</a> 
           		 </div>
                    <div class="pjViewBox w-100 p-3">                              
                        <div class="viewBundle w-100 bg-white rounded p-3">
						<%-- <c:forEach items="${List }" var="l"> --%>
                            <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
                            <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
                                <div class=" w-100 d-flex align-items-center">
                                    <div class="profileImgDiv">
                                    	<c:choose>
                                    	<c:when test="${l.boardType eq 'W' }">
	                                        <img src="${path}/resources/upload/profile/${l.WProfile}" width="50px" height="50px" alt="프로필사진"/>
	                                    	</c:when>
	                                    	<c:when test="${l.boardType eq 'T' }">
	                                        <img src="${path}/resources/upload/profile/${l.TProfile}" width="50px" height="50px" alt="프로필사진"/>
	                                    	</c:when>
	                                    	<c:when test="${l.boardType eq 'S' }">
	                                        <img src="${path}/resources/upload/profile/${l.SProfile}" width="50px" height="50px" alt="프로필사진"/>
	                                    	</c:when>
                                    	</c:choose>
                                    </div>
                                    <div class="d-flex flex-column ml-2">
                                        <c:choose>
	                                        <c:when test="${l.boardType eq 'W' }">
	                                        <strong>${l.WName }</strong>
	                                        </c:when>
	                                         <c:when test="${l.boardType eq 'T' }">
	                                        <strong>${l.TName }</strong>
	                                        </c:when>
	                                         <c:when test="${l.boardType eq 'S' }">
	                                        <strong>${l.SName }</strong>
	                                        </c:when>
                                        </c:choose>
                                        <p class="m-0" style="font-size: small;">
                                             <c:choose>
		                                        <c:when test="${l.boardType eq 'W' }">
		                                        <strong>${l.writingTime }</strong>
		                                        </c:when>
		                                         <c:when test="${l.boardType eq 'T' }">
		                                        <strong>${l.taskTime }</strong>
		                                        </c:when>
		                                         <c:when test="${l.boardType eq 'S' }">
		                                        <strong>${l.scheduleTime }</strong>
		                                        </c:when>
                                        	</c:choose>
                                      
                                        </p>
                                    </div>                        
                                </div>
                            </div>  
                            <!--★ 상단공통  끝 -------------------------------------------------------------------------------------------------------------------->
							<c:if test="${l.boardType eq 'W' }"> 
	                            <!-- if문으로 분기처리 : bordType이 글인경우 -->
	                            <!-- 1) 글 시작  ----------------------------------------------------------------------------------------------------------------------->
	                            <div class="pjViewBody w-100  flex-column pl-3 pr-3">
	                                <h5 class="m-0 font-weight-bolder mb-4">${l.writingTitle }</h5> <!-- 글 제목 -->
	                                <div class="w-100 pjView-content"> <!-- 게시글 내용 -->
					                  ${l.writingContent }
	                                </div>
	                            </div> 
                            </c:if>
                            <!-- 1) 글 끝  ------------------------------------------------------------------------------------------------------------------------>


                            <!-- if문으로 분기처리 : bordType이 업무인경우 -->
                            <!-- 2) 업무 시작  --------------------------------------------------------------------------------------------------------------------->
                            <c:if test="${l.boardType eq 'T' }"> 
	                            <div class="pjViewBody w-100 d-flex flex-column pl-3 pr-3">
	                                <h5 class="m-0 font-weight-bolder mb-4">${l.taskTitle }</h5> <!-- 업무제목 -->
	                                <div class="d-flex align-items-center">
	                                    <strong class="mr-2">진행상태</strong> <!-- 업무 진행상태 -->
	                                    	<c:choose>
								                  <c:when test="${l.taskState eq '요청' }">
								                   <td id="taskState" style="width:10%"><div style="background-color:#0275d8; color:white">${t['taskState']}</div></td>
								                   </c:when>
								             		<c:when test="${l.taskState eq '진행' }">
								                   <td id="taskState" style="width:10%"><div style="background-color:#5cb85c; color:white">${t['taskState']}</div></td>
								                   </c:when>
								                     <c:when test="${l.taskState  eq '피드백' }">
								                   <td id="taskState" style="width:10%"><div style="background-color:#d9534f; color:white">${t['taskState']}</div></td>
								                   </c:when>
								                     <c:when test="${l.taskState  eq '완료' }">
								                   <td id="taskState" style="width:10%"><div style="background-color:#5bc0de; color:white">${t['taskState']}</div></td>
								                   </c:when>
								                     <c:when test="${l.taskState eq '보류' }">
								                   <td id="taskState" style="width:10%"><div style="background-color:grey; color:white">${t['taskState']}</div></td>
								                   </c:when>
							            	</c:choose>
	                                </div>                        
	                                <hr class="w-100 mt-1 mb-2">
	                                <div class="d-flex align-items-center">
	                                    <strong class="mr-2">담당자</strong>
	                                    <!-- 담당자 프로필 for문 시작 -->
	                                    <div class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2'>
	                                        <div class='selectedWorker_imgDiv mr-2'>
	                                            <img src="${path}/resources/upload/profile/${l.tmProfile}" width="50px" height="50px">
	                                        </div>
	                                        <span>${l.tmName }</span>
	                                    </div>                                    
	                                    <!-- 담당자 프로필 for문 끝 -->
	                                </div>
	                                <hr class="w-100 mt-1 mb-2">
	                                <div class="d-flex align-items-center">
	                                    <strong class="mr-2">시작일</strong>
	                                    <p class="m-0">${l.taskStartDate }</p> <!-- 시작일 -->
	                                </div>   
	                                <hr class="w-100 mt-1 mb-2">
	                                <div class="d-flex align-items-center">
	                                    <strong class="mr-2">마감일</strong>
	                                    <p class="m-0">${l.taskEndDate }</p> <!-- 종료일 -->
	                                </div>  
	                                <hr class="w-100 mt-1 mb-2">
	                                <div class="d-flex align-items-center">
	                                    <strong class="mr-2">우선순위</strong>
	                                    <strong class="text-danger">${l.taskProiority }</strong> <!-- 우선순위 -->
	                                </div>                         
	                                <hr class="w-100 mt-1 mb-2">
	                                <div class="w-100"> <!-- 업무 글 내용 -->
						                            ${l.taskContent }
	                                </div>
	                            </div>  
                            </c:if>     
                            <!-- 2) 업무 끝 ------------------------------------------------------------------------------------------------------------------------>


                            <!-- if문으로 분기처리 : bordType이 일정인경우 -->
                            <!-- 3) 일정 끝 ------------------------------------------------------------------------------------------------------------------------>
                            <c:if test="${l.boardType eq 'S' }"> 
	                            <div class="pjViewBody w-100  flex-column pl-3 pr-3">
	                                <div class="pjViewBody-schedule w-100 d-flex flex-column p-3">
	                                    <div class="w-100 row d-flex">
	                                        <div class="col-2 d-flex flex-column justify-content-center align-items-center">
	                                         <p class="m-0 text-danger font-weight-bold"> <!-- 일정 실행일 : 월만 표기 -->
	                                                <fmt:formatDate var="dateFmt" pattern="MM" value="${l.scheduleTime}"/>
													<c:out value="${dateFmt }"/>월
	                                            </p>
	                                            <p class="m-0 font-weight-bolder" style="font-size: 40px;"> <!-- 일정 실행일 : 일만 표기 -->
	                                            	<fmt:formatDate var="dateFmt1" pattern="dd" value="${l.scheduleTime}"/>
													<c:out value="${dateFmt1 }"/>
	                                            </p>
	                                        </div>
	                                        <div class="col-10 d-flex flex-column">
	                                            <strong class="">${l.scheduleTitle }</strong> <!-- 일정제목 -->
	                                            <hr class="w-100">
	                                            <strong class=""><fmt:formatDate value="${l.scheduleTime}" dateStyle="long"/></strong> <!-- 일정 실행일 -->
	                                        </div>
	                                    </div>
	                                    <hr class="w-100">
	                                    
	                                    <div class="w-100 d-flex flex-column align-items-center">
	                                        <div class="d-flex mb-3" style="width: 90%;">
	                                            <i class="fas fa-map-marker-alt mr-2 stoolGrey" style="font-size: 25px;"></i>
	                                            <p class="m-0 mAddress">${l.schedulePlace }</p>  <!-- 일정주소 -->
	                                        </div>
	                                        <div class="border map" style="width: 90%; height: 300px;"> <!-- 지도가 들어가는 곳 -->
	                                        
	                                        </div>
	                                    </div>
	                                    <hr class="w-100">
	
	                                    <div class="w-100 d-flex">
	                                  		<i class="far fa-sticky-note mr-2 stoolGrey" style="font-size: 25px;"></i>
	                                        <div class="ml-2">${l.scheduleMemo }</div> <!-- 글이 들어가는 곳 -->
	                                    </div>
	                                </div>
	                            </div>
                            </c:if>
                            <!-- 3) 일정 끝 ------------------------------------------------------------------------------------------------------------------------>      


                            <!--★ 하단공통  ----------------------------------------------------------------------------------------------------------------------->       
                            
                            <!--★ 하단공통 끝  --------------------------------------------------------------------------------------------------------------------->
    					

                        </div><!-- viewBundle 닫기 -->



                        <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                        <!-- 수정할 때 추가 -->
                        <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->



                    </div><!-- viewBox 닫는 태그 -->
                    
                    <!--★☆★ 댓글지움 ------------------------------------------------------------------------------------------------------------------------->
                   
                </div>
				</c:forEach>
				<c:if test="${not empty List }">
					<c:if test="${ empty msg }">
					<div class="text-center"><a href="javascript:moreList();" class="btn btn-primary">더보기</a></div>
					</c:if>
					<c:if test="${not empty msg }">
					<div class="text-center">${msg }</div>
					</c:if>
				</c:if>

	
</div>	
<div class="col col-sm-3">

</div>
<script>
function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
    console.log(results);
}

	function moreList(){
		var pageNo=getParameterByName("pageNo");
	
		console.log("페이지번호:"+pageNo);
		if(pageNo==undefined || pageNo=="" ||pageNo==null){
			pageNo=2;
			location.href="${path}/project/myBoard.do?pageNo="+pageNo;
		}else{
			
			pageNo=Number(pageNo)+Number(1);
			console.log("마지막:"+pageNo);
			location.href="${path}/project/myBoard.do?pageNo="+pageNo;
		}
		
		
	}
	//일단. 지도를 출력해줄 위치가 여러곳.
	//장소도 각각 다르다.
	
			var mapContainers = document.getElementsByClassName('map');// 지도를 표시할 div 
			
			mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  
			
			//지도를 객체 배열로 생성하기
			var maps=[];
			for(var i=0;i<mapContainers.length;i++){
				maps.push(new kakao.maps.Map(mapContainers[i], mapOption)); 
			}
			console.log(maps[0]);
			
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
			
			//검색할 주소를 가져옴
			var addArr=[];
			var addr=document.getElementsByClassName('mAddress').innerHTML;
			for(var i=0;i<$(".mAddress").length;i++){
				addArr.push($(".mAddress").eq(i).html()); 
			}
			console.log(addArr);
			
	
				$.each(maps,function(i,map){
					console.log(map);
					var coords;
					var marker;
					geocoder.addressSearch(addArr[i],  function(result,status){
						
					    // 정상적으로 검색이 완료됐으면 
					     if (status === kakao.maps.services.Status.OK) {
					
					        coords= new kakao.maps.LatLng(result[0].y, result[0].x);//좌표값
					        marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					        });
						}
						console.log(coords);
						map.setCenter(coords);
					});
				});		
		
	
	
	
	
</script>
<style>
.pjViewBody-schedule{
    background-color: #f6f7f8;
    border: 1px solid #E8E8EB;
}
.projectTitle {
	background-color:#25558F;
	color:white;
}
a{
	color:white;
}
a:hover{
	color:white;
	font-weight:bolder;
}
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>