<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />


    <!-- 데이트피커 -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/bootstrap-datepicker.css">
    <script src="${path}/resources/js/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="${path}/resources/js/bootstrap-datepicker/bootstrap-datepicker.kr.min.js"></script>

    <!-- kakao map -->
	<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d1bdbfd0b440522feea5327aec9def1&libraries=services,clusterer,drawing"></script> -->

    <!-- 스타일 -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/selectedProject-Write.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/selectedProject-View.css"/>    

    <!-- JS -->
    <script type="text/javascript" src="${path}/resources/js/selectedProject-Write.js"></script>
    <script type="text/javascript" src="${path}/resources/js/selectedProject-View.js"></script>
    <jsp:include page="/resources/js/selectedProject-Ajax.jsp" />
    
            <div class="col-sm-7">
                <!-- 프로젝트정보 -->
                <div class="rounded mb-3 justify-content-center align-items-center" id="pjInfoContainer" style="background-color: ${projectInfo.PROJECTCOLOR};">
                    <div id="pjInfoBox" class="row w-100 d-flex align-items-center m-0">
						<c:if test="${favorite > 0}">
	                        <button type="button" class="btn col-1 justify-content-center align-items-center pl-2" onclick="fn_favorite(${favorite},${projectInfo.PROJECTNO},'${loginUser.userId}');">
	                            <i class="fas fa-star text-white" id="favoriteIcon"></i>
	                        </button>
                        </c:if>
                     	<c:if test="${favorite == 0}">
	                        <button type="button" class="btn col-1 justify-content-center align-items-center pl-2" onclick="fn_favorite(${favorite},${projectInfo.PROJECTNO},'${loginUser.userId}');">
	                            <i class="far fa-star text-white" id="favoriteIcon"></i>
	                        </button>
						</c:if>
						
                        <h4 class="col-9 h-50 w-100 flex-wrap text-white m-0" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                           	<c:out value="${projectInfo.PROJECTTITLE}"/>
                        </h4>
                        
						<c:if test="${projectInfo.USERID == loginUser.userId}">
                        <div class="dropdown col-1" id="selectColorBox">
                        </c:if>
                        <c:if test="${projectInfo.USERID != loginUser.userId}">
                        <div class="dropdown col-1 invisible" id="selectColorBox">
                        </c:if>
                            <button type="button" class="btn dropdown-toggle justify-content-center align-items-center" data-toggle="dropdown">
                            	<i class="fas fa-paint-roller text-white"></i>
                            </button>
                            <div class="dropdown-menu">
                                <div class="w-100 h-100 d-flex justify-content-center align-items-center flex-wrap" id="colorBox">                                    
                                    <div id="selectColor-lightGray" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#c8c8c8')" style="background-color: #c8c8c8;" class="m-1"></div>
                                    <div id="selectColor-gray" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#505050')" style="background-color: #505050;" class="m-1"></div>
                                    <div id="selectColor-yellow" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ffe346')" style="background-color: #ffe346;" class="m-1"></div>
                                    <div id="selectColor-orange" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ff9318')" style="background-color: #ff9318;" class="m-1"></div>
                                    <div id="selectColor-red" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ff3b29')" style="background-color: #ff3b29;" class="m-1"></div>
                                    <div id="selectColor-pink" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#ff939c')" style="background-color: #ff939c;" class="m-1"></div>
                                    <div id="selectColor-purple" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#a13d9c')" style="background-color: #a13d9c;" class="m-1"></div>
                                    <div id="selectColor-blue" onclick="fn_selectColor(this,${projectInfo.PROJECTNO}, '#25558F')" style="background-color: #25558F;" class="m-1"></div>
                                    <div id="selectColor-lightBlue" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#acc2ff')" style="background-color: #acc2ff;" class="m-1"></div>
                                    <div id="selectColor-lightMint" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#81ddc6')" style="background-color: #81ddc6;" class="m-1"></div>
                                    <div id="selectColor-mint" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#17a2b8')" style="background-color: #17a2b8;" class="m-1"></div>
                                    <div id="selectColor-green" onclick="fn_selectColor(this,${projectInfo.PROJECTNO},'#71d364')" style="background-color: #71d364;" class="m-1"></div>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown col-1">
                            <button type="button" class="btn dropdown-toggle justify-content-center align-items-center" data-toggle="dropdown">
                                <i class="fas fa-bars text-white"></i>
                            </button>
                            <div class="dropdown-menu">
                                <c:if test="${projectInfo.USERID != loginUser.userId}">
                                <a class="dropdown-item" onclick="fn_pjGoOut()">프로젝트 나가기</a>
                                </c:if>
                                <c:if test="${projectInfo.USERID == loginUser.userId}">
                                	<a class="dropdown-item" onclick="$('#pjGoOutManagerModal').modal('show');">프로젝트 나가기</a>
	                                <a class="dropdown-item" onclick="$('#updateProjectModal').modal('show')">프로젝트 수정</a>
	                            </c:if>
                                <div class="dropdown-divider"></div>
                                <div class="dropdown-item d-flex flex-column">
                                    <strong>프로젝트 번호</strong>
                                    <p class="p-0 m-0"><c:out value="${projectInfo.PROJECTNO}"/></p>
                                    <p class="p-0 m-0">
                                    	<c:out value="${PROJECTNO }"/>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 태그 -->
                <div id="" class="w-100 bg-white border border-grey d-flex align-items-center mb-3 p-2">
                	<i class="fas fa-hashtag stoolGrey mr-3 ml-3" style="font-size: 25px;"></i>                            
					<p class="m-0" style="font-size: 17px;">
						선택한 태그 : <strong class="ml-2">${selectTag}</strong>
					</p>	
					<button type="button" onclick="history.back();" id="tagBackBtn">
						<i class="fas fa-window-close ml-5" style="font-size: 25px;"></i>
					</button>
                </div>


				
            <!-- ☆★☆ 게시글List include -->
            <div class="mb-3"> <!-- 고정글 -->
				<%-- <jsp:include page="/WEB-INF/views/selectedProject/selectedProject-pinPost.jsp" /> --%>
            </div>
            <div class="mb-3"> <!-- 게시글 리스트 -->
				<jsp:include page="/WEB-INF/views/selectedProject/selectedProject-postView.jsp" />
            </div>

            </div> <!-- col-sm-7닫는 div -->

                
            <div class="col-sm-3">

				<jsp:include page="/WEB-INF/views/selectedProject/asidebar.jsp" />

				<%-- <jsp:include page="/WEB-INF/views/selectedProject/asidebar.jsp" /> --%>

			<div class="col col-sm-3">

</div>


<!-- 모달모음 ------------------------------------------------------------------------------------------------------------------------------->   
    <!-- 프로젝트 설정 [ 숨김 ] -->
    <div class="modal fade" id="pjHideModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content pjSetModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">프로젝트 숨김</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">해당 프로젝트를 숨기시겠습니까?</strong>
                    <p>숨김처리된 프로젝트는 전체 프로젝트에서 노출되지 않습니다.</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" onclick="">
                            	숨기기
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 숨김 ] 끝 -->
    <!-- 프로젝트 설정 [ 나가기 ] -->
    <div class="modal fade" id="pjGoOutModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pjSetModal modal-center">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title" id="exampleModalLabel">프로젝트 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[${projectInfo.PROJECTTITLE}]</strong>
                    <p>프로젝트에서 나가시겠습니까?</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" onclick="fn_pjGoOutAjax(${projectInfo.PROJECTNO},'${loginUser.userId}')">
                            	나가기
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 나가기 ] 끝 -->
        
    <!-- 프로젝트 설정 [ 나가기 *관리자 ] -->
    <div class="modal fade" id="pjGoOutManagerModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pjSetModal modal-center">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title" id="exampleModalLabel">프로젝트 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[${projectInfo.PROJECTTITLE}]</strong>
                    	<p>
                    		<strong>${loginUser.userName}님</strong>은 해당 프로젝트의 관리자입니다.<br>
                    		프로젝트에서 나가시려면 관리자를 위임해 주세요.
                    	</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" data-dismiss="modal" onclick="$('#changePjManagerModal').modal('show')">
                            	관리자 위임
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 나가기 *관리자  ] 끝 --> 
           
    <!-- 프로젝트 설정 [ 삭제 ] -->
    <div class="modal fade" id="pjDeleteModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content pjSetModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">프로젝트 삭제</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[프로젝트이름]</strong>
                    <p>프로젝트를 삭제하시겠습니까?</p>
                    <div class="w-100 row flex m-0 justify-content-around">
                        <button type="button" class="btn btn-outline-dark col-5" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-info col-5" onclick="">
                            	나가기
                        </button>
                    </div>
                </div>            
            </div>
        </div>
    </div> 
    <!-- 프로젝트 설정 [ 삭제 ] 끝 -->         

    <!-- 게시글 작성 [ 업무 - 담당자 추가 ] -->
    <div class="modal fade" id="addWorkerModal">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">담당자 추가하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" id="" name="" placeholder="담당자 이름 검색" class="searchProjectMember w-100 addWorker_search"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName"><c:out value="${pm.userName}"/></p>
                                <span class="d-none"><c:out value="${pm.userId}"/></span>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addWorker(this,'${pm.userId}');">
                                	선택
                            </button>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 업무 - 담당자 추가 ]  끝 -->       
    
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ] -->
    <div class="modal fade" id="addMentionModal">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">언급할 참여자 추가하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" name="addWorker_search" placeholder="담당자 이름 검색" class="w-100 searchProjectMember"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100 overflow-auto" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName">
                                	<c:out value="${pm.userName}"/>
                                </p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addMention(this,'${pm.userId}');">
                                	선택
                            </button>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ]  끝 -->     
    
    <!-- 관리자 나가기 [ 위임할 관리자 선택 ] -->
    <div class="modal fade" id="changePjManagerModal">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">위임할 참여자 선택하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" name="addWorker_search" placeholder="참여자 이름 검색" class="w-100 searchProjectMember"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <c:if test="${pm.userId ne loginUser.userId}">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName">
                                	<c:out value="${pm.userName}"/>
                                </p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_changePjManager(${pm.projectNo},'${loginUser.userId}','${pm.userId}');">
                                	선택
                            </button>
                        </div>
                        </c:if>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 관리자 나가기 [ 위임할 관리자 선택 ]  끝 -->   

    <!-- 프로젝트 수정 ----------------------->       
	<div class="modal" id="updateProjectModal">
        <div class="modal-dialog modal-dialog-centered ">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header" style="background-color: #F1F0F5">
                    <h6 class="modal-title">프로젝트 수정</h6>
                    <button type="button"  class="close" data-dismiss="modal">&times;</button>
                </div>
                <!--Modal Body-->
                <div class="modal-body d-block">
                    <ul class="list-unstyled">
                    	<form method="post" id="updateProjectForm">
                    	<input type="hidden" name="pjNo" value="${projectInfo.PROJECTNO}"/>
                        <li class="mb-2">
                            <input type="text" class="form-control" name="projectTitle" value="${projectInfo.PROJECTTITLE}"
                            style="font-size: 25px; font-weight: bolder;">
                        </li>
                        <hr>
                        <li>
                            <b>프로젝트 상태 변경</b>
                        </li>
                        <li class="d-flex mb-3 mt-3 algin-items-center">
                           	<i class="fas fa-check-circle mr-3" style='font-size:24px'></i>
                           	<label class="mr-1" for="projectState" style="cursor: pointer;">
                           		프로젝트 완료
                         	</label>
                            <div class="ml-2 custom-control custom-switch">
                            <c:if test="${projectInfo.PROJECTSTATE eq 'E' }">
                                <input type="checkbox" class="custom-control-input"  name="projectState" id="projectState" checked>
                            </c:if>
                            <c:if test="${projectInfo.PROJECTSTATE eq 'P'}">
                                <input type="checkbox" class="custom-control-input"  name="projectState" id="projectState">
                            </c:if>
                                <label class="custom-control-label" for="projectState"></label>
                            </div>                            
                        </li>
                        <div id="pjStateCk">
                        </div>
                    </ul>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer d-flex justify-content-center">
                	<button type="submit" onclick="fn_updateProjectSubmit();" class="btn m-2 stoolDarkBlue">
                    	프로젝트 수정
                   	</button>
                </div>
                </form>
            </div>
        </div>
    </div>  
    <!-- 프로젝트 수정  끝 -------------------->  
    
<!----------------------------------------------------------------------------------------------------------------------- 모달모음 끝 ------->    
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>