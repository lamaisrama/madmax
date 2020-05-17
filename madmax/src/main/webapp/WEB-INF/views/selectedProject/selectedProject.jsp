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
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5d1bdbfd0b440522feea5327aec9def1&libraries=services,clusterer,drawing"></script>

    <!-- 스타일 -->
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/selectedProject-Write.css"/>
    <link rel="stylesheet" type="text/css" href="${path}/resources/css/selectedProject-View.css"/>    

    <!-- JS -->
    <script type="text/javascript" src="${path}/resources/js/selectedProject-Write.js"></script>
    <script type="text/javascript" src="${path}/resources/js/selectedProject-View.js"></script>
    
    
            <div class="col-sm-7">
                <!-- 프로젝트정보 -->
                <div class="rounded mb-3 justify-content-center align-items-center" id="pjInfoContainer" style="background-color: #25558F;">
                    <div id="pjInfoBox" class="row w-100 d-flex align-items-center m-0">
                        <input type="hidden" name="pjBookmark" id="pjBookmark"/>
                        <button type="button" class="btn col-1 justify-content-center align-items-center pl-2" onclick="fn_bookmark();">
                            <i class="far fa-star text-white" id="bookmarkIcon"></i>
                        </button>

                        <h4 class="col-9 h-50 w-100 flex-wrap text-white m-0" style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis;">
                           	시스템 유지운영 프로젝트
                        </h4>
                        
                        <div class="dropdown col-1" id="selectColorBox">
                            <input type="hidden" id="pjInfoBoxColor" name="pjInfoBoxColor"/>
                            <button type="button" class="btn dropdown-toggle justify-content-center align-items-center" data-toggle="dropdown">
                            	<i class="fas fa-paint-roller text-white"></i>
                            </button>
                            <div class="dropdown-menu">
                                <div class="w-100 h-100 d-flex justify-content-center align-items-center flex-wrap" id="colorBox">                                    
                                    <div id="selectColor-lightGray" onclick="fn_selectColor(this)" style="background-color: rgb(200, 200, 200);" class="m-1"></div>
                                    <div id="selectColor-gray" onclick="fn_selectColor(this)" style="background-color: rgb(80, 80, 80);" class="m-1"></div>
                                    <div id="selectColor-yellow" onclick="fn_selectColor(this)" style="background-color: rgb(255, 227, 70);" class="m-1"></div>
                                    <div id="selectColor-orange" onclick="fn_selectColor(this)" style="background-color: rgb(255, 147, 24);" class="m-1"></div>
                                    <div id="selectColor-red" onclick="fn_selectColor(this)" style="background-color: rgb(255, 59, 41);" class="m-1"></div>
                                    <div id="selectColor-pink" onclick="fn_selectColor(this)" style="background-color: rgb(255, 147, 156);" class="m-1"></div>
                                    <div id="selectColor-purple" onclick="fn_selectColor(this)" style="background-color: rgb(161, 61, 156);" class="m-1"></div>
                                    <div id="selectColor-blue" onclick="fn_selectColor(this)" style="background-color: #25558F;" class="m-1"></div>
                                    <div id="selectColor-lightBlue" onclick="fn_selectColor(this)" style="background-color: rgb(172, 194, 255);" class="m-1"></div>
                                    <div id="selectColor-lightMint" onclick="fn_selectColor(this)" style="background-color: rgb(129, 221, 198);" class="m-1"></div>
                                    <div id="selectColor-mint" onclick="fn_selectColor(this)" style="background-color: #17a2b8;" class="m-1"></div>
                                    <div id="selectColor-green" onclick="fn_selectColor(this)" style="background-color: rgb(113, 211, 100);" class="m-1"></div>
                                </div>
                            </div>
                        </div>
                        <div class="dropdown col-1">
                            <button type="button" class="btn dropdown-toggle justify-content-center align-items-center" data-toggle="dropdown">
                                <i class="fas fa-bars text-white"></i>
                            </button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" onclick="fn_pjHide()">프로젝트 숨기기</a>
                                <a class="dropdown-item" onclick="fn_pjGoOut()">프로젝트 나가기</a>
                                <a class="dropdown-item" onclick="fn_pjUpdate()">프로젝트 수정</a>
                                <a class="dropdown-item" onclick="fn_pjDelete()">프로젝트 삭제</a>
                                <div class="dropdown-divider"></div>
                                <div class="dropdown-item d-flex flex-column">
                                    <strong>프로젝트 번호</strong>
                                    <p class="p-0 m-0">12345</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 태그 -->
                <div id="tagBox" class="w-100 bg-white border border-grey d-flex align-items mb-3">
                    <div class="w-100 d-flex flex-wrap align-items-center m-0">
                            <i class="fas fa-hashtag stoolGrey mr-3 ml-3" style="font-size: 30px;"></i>
                            
                            <!-- 태그목록 -->
                            <a href="" class="m-2">#태그가</a>
                            <a href="" class="m-2">#들어가는</a>
                            <a href="" class="m-2">#자리</a>
                    </div>
                </div>


                <!-- 업무리포트 -->
                <div id="reportBox" class="w-100 bg-white border border-grey d-flex flex-column align-items-center mb-3">
                        <button type="button" class="btn w-100 d-flex align-items-center justify-content-between" data-toggle="collapse" data-target="#demo" id="reportBoxBtn">
                            <strong class="m-0">
                                	업무리포트
                            </strong>
                            <img src="${path}/resources/images/expand-arrow.png" alt="더보기" style="width: 25px;" id="rb_slide_icon">
                        </button>
                        <div id="demo" class="collapse p-2 w-100">
                            <div class="border w-100" style="height: 200px;">
                                
                            </div>
                        </div>
                </div>


                <!-- 게시물 작성 -->
                <form action="" method="post" enctype="multipart/form-data" onsubmit="return false" id="pjMainForm">
                <!-- from 공통 hidden input모음 -->
                    <!-- 1) 파일-->                
                    <input type="file" name="files" id="files" multiple style="display: none;"/>
                    <!-- 2) 이미지파일 -->
                    <input type="file" name="imgFiles" id="imgFiles" multiple style="display: none;" accept="image/*"/>
                    <!-- 3) 태그 -->
                    <input type="hidden" name="tagListStr" id="tagListStr"/>
                    <!-- 4) 언급 -->
                    <input type="hidden" name="mentionListStr" id="mentionListStr"/>
                <!-- from 공통 hidden input모음 끝 -->

                    <div id="pjWriteBox" class="w-100 mb-3 bg-white border border-grey rounded">
                        <div id="writeCategoryBtns" class="row w-100 border-bottom border-light m-0">
                            <button type="button" id="cBtn-board" class="btn col-4 cBtnSelect" onclick="fn_writeCategory(this,'board');">
                                	글 작성
                            </button>
                            <button type="button" id="cBtn-task" class="btn col-4" onclick="fn_writeCategory(this,'task');">
                               	업무 작성
                            </button>
                            <button type="button" id="cBtn-schedule" class="btn col-4" onclick="fn_writeCategory(this, 'schedule');">
                                	일정 작성
                            </button>                                                                     
                        </div>

                        <!-- 작성 카테고리별 div -->
                            <!-- 1) 글 작성 -->
                            <div id="writeCategory-board" class="row w-100 m-0">
                                <div id="boardContainer" class="w-100 p-3">
                                    <div id="boardTitleBox" class="col-12 d-flex justify-content-center mb-2">
                                        <input name="boardTitle" id="boardTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                            placeholder="제목 입력 (선택)" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;">
                                    </div>
                                    <div id="boardContentBox" class="col-12 d-flex flex-column justify-content-center">
                                        <div id="boardContentAreaDiv" class="w-100">
                                            <textarea id="boardContentArea" name="boardContentArea" class="w-100 border-0 contentArea" style="resize: none; visibility: visible;" placeholder="글을 입력하세요."></textarea>
                                        </div>
                                    </div>                                                                 
                                </div>
                        </div>     
                    
                        <!-- 2) 업무 작성 -->
                        <div id="writeCategory-task" class="row w-100 m-0">
                            <div id="taskBox" class="w-100 p-3">
                                <div id="taskTitleBox" class="col-12 d-flex justify-content-center mb-3">
                                    <input name="taskTitle" id="taskTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        placeholder="업무명 입력" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;">
                                </div>
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
                                        <button type="button" id="addWorker" class="btn stoolDarkBlue-outline m-1" onclick="fn_addWorkerModal();">담당자 추가</button>                       
                                    </div>
                                </div>
                                <div id="taskStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date"" id="taskStartDate" name="taskStartDate" class="stoolDateInput" />
                                </div>   
                                <div id="taskEndDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date"" id="taskEndDate" name="taskEndDate" class="stoolDateInput" />
                                </div>  
                                <div id="priorityBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">우선순위</strong>
                                    <input type="hidden" id="taskPriority" name="taskPriority"/>
                                    <div class="dropdown">
                                        <button type="button" id="prioritySelectBtn" class="btn dropdown-toggle" data-toggle="dropdown" style="width: 150px;">
                                            	우선순위 선택
                                        </button>
                                        <div class="dropdown-menu text-center" id="taskPriority-dropItem">
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="lv1" onclick="fn_priority(this, 'lv4');"><i class="fas fa-arrow-down text-success mr-3" style="font-size:17px;"></i>낮음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="lv2" onclick="fn_priority(this, 'lv3');"><i class="fas fa-circle text-secondary mr-3" style="font-size:10px;"></i>보통</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="lv3" onclick="fn_priority(this, 'lv2');"><i class="fas fa-arrow-up text-warning mr-3" style="font-size:17px;"></i>높음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="lv4" onclick="fn_priority(this, 'lv1');"><i class="fas fa-arrow-up text-danger mr-3" style="font-size:17px;"></i>긴급</p>
                                        </div>
                                    </div>                   
                                </div>                                  
                                <div id="taskContentBox" class="col-12 d-flex justify-content-center">
                                    <textarea name="taskContentArea" id="taskContentArea" class="w-100 border-0 contentArea" style="resize: none;" placeholder="글을 입력하세요."></textarea>
                                </div>
                            </div>
                        </div>

                        
                        <!-- 3) 일정 작성 -->
                        <div id="writeCategory-schedule" class="row w-100 m-0">
                            <div id="scheduleBox" class="w-100 p-3">
                                <div id="scheduleTitleBox" class="col-12 d-flex justify-content-center mb-3">
                                    <input name="scheduleTitle" id="scheduleTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        placeholder="일정 제목 입력" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;">
                                </div>
                                <div id="scheduleStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date"" id="scheduleStartDate" name="scheduleStartDate" class="stoolDateInput" />
                                </div>   
                                <div id="scheduleEndDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date"" id="scheduleEndDate" name="scheduleEndDate" class="stoolDateInput" />
                                </div>    
                                <div id="schedulePlaceBox" class="col-12 w-100 d-flex align-items-center mb-3">
                                    <strong class="mr-2">장소</strong>
                                    <div class="d-flex align-items-end">
                                    	<button type="button" class="btn stoolDarkBlue-outline mr-2" onclick="sample5_execDaumPostcode();">주소 검색</button>
                                    	<input type="text" id="schedulePlace" name="schedulePlace" style="width:280px;" class="stoolDateInput" placeholder=""/>
                                    </div>
                                </div>      
                                <div id="schedulePlaceMapBox" class="col-12 d-flex w-100 align-items-center mb-3" >
									 <div id="mapBox" style="height:300px; display: none;" class="border w-100">
									 	<div id="map" style="height:300px;" class="w-100"></div>
									 </div>
                                </div>                                                                                        
                                <div id="scheduleContentBox" class="col-12 d-flex justify-content-center">
                                    <i class="far fa-sticky-note mr-2 stoolGrey" style="font-size: 24px;"></i>
                                    <textarea id="scheduleContentArea" class="w-100 border-0 contentArea" style="resize: none;" placeholder="메모를 입력하세요."></textarea>
                                </div>
                            </div>
                        </div>

                        <!-- 공통 하단 -->                        
                        <div class="w-100 p-3">
                            <!-- 공통) 태그 & 언급 -->
                            <!-- 태그 입력 -->
                            <div class="col-12 addTagListBox d-none mb-2">
                                <div class="w-100 d-flex flex-column">
                                    <strong class="mb-2">태그</strong>
                                    <div class="w-100 d-flex flex-wrap align-items-center addTagList">
                                        <div class="d-flex addTagInputDiv pl-2 pr-2">
                                            # <input type="text" onkeyup="fn_addTag(this)" placeholder="태그 입력"/>
                                        </div>
                                    </div>
                                </div>
                                <hr class="w-100">
                            </div>  <!-- 태그 입력 끝 -->     
                            
                            <!-- 언급 입력 -->
                            <div class="col-12 addMentionListBox d-none mb-2">                             
                                <div class="w-100 d-flex flex-column">
                                    <strong class="mb-1">언급할 참여자 추가</strong>
                                    <div id="mentionListBox" class="w-100 d-flex flex-wrap align-items-center addMentionList">
                                        <button type="button" id="mentionModalBtn" class="btn stoolDarkBlue-outline m-1 mt-0" onclick="fn_addMentionModal();">언급 추가</button>                       
                                    </div>
                                </div>
                                <hr class="w-100">
                            </div>  <!-- 언급 입력 끝 -->    

                            <!-- 공통) 파일 미리보기 -->
                            <div id="uploadFilesPreview" class="d-none col-12 mb-2">
                                <strong class="mb-2">업로드 파일</strong>
                                <div class="col-12 d-flex flex-column mb-2">
                                    <p  id="imgFilesPreviewTitle" class="d-none align-items-center m-0 pl-1">
                                        <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
                                        	첨부이미지
                                    </p>
                                    <div class="w-100 d-flex justify-content-center">
                                        <div id="imgFileBox" class="w-100 row">

                                        </div>
                                    </div>
                                </div>
                                <div class="col-12 d-flex flex-column d-none">
                                    <p id="filesPreviewTitle" class="d-none align-items-center m-0 pl-1">
                                        <i class="fas fa-file-upload stoolGrey" style="font-size: 20px;"></i>
                                       	 첨부파일
                                    </p>
                                    <div class="w-100 d-flex justify-content-center">
                                        <div id="fileBox" class="w-100 row">

                                        </div>
                                    </div>
                                </div>                                
                            </div>
                        </div>


                        <!-- 공통) 하단 버튼 -->
                        <div id="writeCategory-bordBtns" class="row w-100 border-top border-light m-0 justify-content-between align-items-center">
                            <div class="col-5 w-100 d-flex align-items-center"> 
                                <div id="fileUploadBtns" class="">
                                    <div class="d-flex align-items-center">
                                        <!-- 파일 업로드 -->                                      
                                        <button type="button" class="btn mr-2 ml-2" id="filesBtn">
                                            <i class="fas fa-file-upload stoolGrey" style="font-size: 25px;"></i>
                                        </button>
                                        <!-- 이미지파일 업로드 -->                                    
                                        <button type="button" class="btn" id="imgFilesBtn">
                                            <i class="fas fa-images stoolGrey" style="font-size: 25px;"></i>
                                        </button>
                                        <span style="width: 2px; height: 25px; border-left: 1px solid rgb(235, 235, 235);" class=" mr-3 ml-3"></span>
                                    </div>
                                </div>
                                <!-- 태그입력창 toggleBtn -->
                                <button type="button" class="btn mr-2 ml-2" data-toggle="tooltip" title="태그를 추가하시고 싶으시다면 클릭해주세요."
                                        onclick="fn_tagBtn()">
                            		<i class="fas fa-hashtag stoolGrey" style="font-size: 25px;"></i>
                                </button>
                                <!-- 언급할 참여자 입력 toggleBtn -->
                                <button type="button" class="btn mr-2 ml-2 tooltipBtn" data-toggle="tooltip" title="클릭하시면 회원 멘션기능을 사용하실 수 있습니다."
                                        onclick="fn_atBtn()">
                                    <i class="fas fa-at stoolGrey" style="font-size: 25px;"></i>
                                </button>                                                                            
                            </div>      
                            <div class="col-4 w-100 d-flex align-items-center justify-content-end">                           
                                <button type="submit" class="btn m-2 stoolDarkBlue">
                                    	올리기
                                </button>    
                            </div>                                                              
                        </div>
					</div>
                        
                </form>
                
            <!-- ☆★☆ 게시글List include -->
            <div class="mb-3"> <!-- 고정글 -->
				<jsp:include page="/WEB-INF/views/selectedProject/selectedProject-pinPost.jsp" />
            </div>
            <div class="mb-3"> <!-- 게시글 리스트 -->
				<jsp:include page="/WEB-INF/views/selectedProject/selectedProject-postView.jsp" />
            </div>

            </div>

                
            <div class="col-sm-3">
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
        <div class="modal-dialog modal-sm">
            <div class="modal-content pjSetModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">프로젝트 나가기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <strong class="">[프로젝트이름]</strong>
                    <p>프로젝트에서 나가시겠습니까?</p>
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
    <!-- 프로젝트 설정 [ 나가기 ] 끝 -->    
    <!-- 프로젝트 설정 [ 삭제 ] -->
    <div class="modal fade" id="pjDeleteModal">
        <div class="modal-dialog modal-sm">
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
        <div class="modal-dialog modal-lg">
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
                        <input type="text" name="addWorker_search" placeholder="담당자 이름 검색" class="w-100 addWorker_search"/>
                    </div>
                    <div class="d-flex flex-column pl-2 pr-2 w-100">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0">정집집</p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addWorker(this);">
                                	선택
                            </button>
                        </div>
                        <!--지워-->
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0">정코코</p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addWorker(this);">
                                	선택
                            </button>
                        </div>      
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0">김월욜</p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addWorker(this);">
                                	선택
                            </button>
                        </div>                                          
                        <!--지워 끝-->
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
        <div class="modal-dialog modal-lg">
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
                        <input type="text" name="addWorker_search" placeholder="담당자 이름 검색" class="w-100 addWorker_search"/>
                    </div>
                    <div class="d-flex flex-column pl-2 pr-2 w-100">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0">정집집</p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addMention(this);">
                                	선택
                            </button>
                        </div>
                        <!--지워-->
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0">정코코</p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addMention(this);">
                                	선택
                            </button>
                        </div>      
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0">김월욜</p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addMention(this);">
                                	선택
                            </button>
                        </div>                                          
                        <!--지워 끝-->
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ]  끝 --> 
<!----------------------------------------------------------------------------------------------------------------------- 모달모음 끝 ------->    
 

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>