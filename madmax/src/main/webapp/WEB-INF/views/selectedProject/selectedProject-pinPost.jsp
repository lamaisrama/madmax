<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<c:set var="path" value="${pageContext.request.contextPath }" />           
<!-- 상단 고정글 -->
                <div class="w-100 d-flex flex-column border p-3 mb-3 mt-3">
                	<!-- 반복문 시작 -->
                    <div class="d-flex align-items-center mb-3">
                        <i class="fas fa-thumbtack stoolDarkBlue-text selectPinIcon" style="font-size: 25px;"></i>
                        <p class="m-0 ml-2 mr-1">상단고정글</p>
                        <span>1</span> <!-- 상단고정글 갯수 넣기 -->
                    </div>
                    
                    <!-- 상단고정글 -->
                    <div class="w-100 d-flex flex-column align-items-center">
                        <!-- 고정글 1 제목 -->
                        <button type="button" class="btn btn-pinPost w-100 d-flex align-items-center" data-toggle="collapse" data-target="#pinPost-1" id="reportBoxBtn">
                            <strong>[업무]</strong>
                            <p class="m-0 ml-2">화면구현하기</p>
                        </button>      
                                      
                        <!-- 게시물 타입 [업무] -->
                        <div id="pinPost-1" class="collapse p-2 w-100">      

                            <div class="pjViewBox w-100 p-3">                              
                                <div class="viewBundle w-100 bg-white rounded p-3">
        
                                    <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
                                    <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
                                        <div class=" w-100 d-flex align-items-center">
                                            <div class="profileImgDiv">
                                                <img src="${path}/resources/images/defaultProfile.png" alt="프로필사진"/>
                                            </div>
                                            <div class="d-flex flex-column ml-2">
                                                <strong>정집집</strong>
                                                <p class="m-0" style="font-size: small;">
                                                    2020-05-09
                                                    <span>00:53</span>
                                                </p>
                                            </div>                        
                                        </div>
                                        <div class="d-flex align-items-center">
                                            <input type="hidden" name="selectPin" class="selectPin"/>
                                            <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_selectPin(this);">
                                                <i class="fas fa-thumbtack stoolGrey selectPinIcon" style="font-size: 25px;"></i>
                                            </button>                                        
                                            <div class="dropdown">
                                                <button type="button" class="btn dropdown-toggle justify-content-center align-items-center p-0" data-toggle="dropdown">
                                                    <i class="fas fa-bars stoolDarkBlue-text" style="font-size: 25px;" aria-hidden="true"></i>
                                                </button>
                                                <div class="dropdown-menu" style="min-width: 120px;">
                                                    <a class="dropdown-item text-center" onclick="fn_viewPostUpdate()" style="cursor: pointer;">수정</a>
                                                    <a class="dropdown-item text-center" onclick="fn_viewPostDelete()" style="cursor: pointer;">삭제</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>  
                                    <!--★ 상단공통  끝 -------------------------------------------------------------------------------------------------------------------->
        
                                    <!-- if문으로 분기처리 : bordType이 글인경우 -->
                                    <!-- 1) 글 시작  ----------------------------------------------------------------------------------------------------------------------->
                                    <div class="pjViewBody w-100 d-none flex-column pl-3 pr-3">
                                        <h5 class="m-0 font-weight-bolder mb-4">[공지] 진행상태관련 안내</h5> <!-- 글 제목 -->
                                        <div class="w-100 pjView-content"> <!-- 게시글 내용 -->
                                            업무 진행상태 잊지말고 실시간 업데이트 부탁드려요.<br>
                                            불금 힘냅시다! 화이팅 ㅎㅎ!
                                        </div>
                                    </div> 
                                    <!-- 1) 글 끝  ------------------------------------------------------------------------------------------------------------------------>
        
        
                                    <!-- if문으로 분기처리 : bordType이 업무인경우 -->
                                    <!-- 2) 업무 시작  --------------------------------------------------------------------------------------------------------------------->
                                    <div class="pjViewBody w-100 d-flex flex-column pl-3 pr-3">
                                        <h5 class="m-0 font-weight-bolder mb-4">화면구현하기</h5> <!-- 업무제목 -->
                                        <div class="d-flex align-items-center">
                                            <strong class="mr-2">진행상태</strong> <!-- 업무 진행상태 -->
                                            <div class="btn-group border border-grey rounded overflow-hidden">
                                                <button type="button" class="btn border-right btn-primary btnRequest" onclick="fn_viewPost_progressState(this, 'request');">요청</button>
                                                <button type="button" class="btn border-right btnProgress" onclick="fn_viewPost_progressState(this, 'progress');">진행</button>
                                                <button type="button" class="btn border-right btnFeedback" onclick="fn_viewPost_progressState(this, 'feedback');">피드백</button>
                                                <button type="button" class="btn border-right btnEnd" onclick="fn_viewPost_progressState(this, 'end');">완료</button>
                                                <button type="button" class="btn btnHold" onclick="fn_viewPost_progressState(this, 'hold');">보류</button>
                                            </div>
                                        </div>                        
                                        <hr class="w-100 mt-1 mb-2">
                                        <div class="d-flex align-items-center">
                                            <strong class="mr-2">담당자</strong>
                                            <!-- 담당자 프로필 for문 시작 -->
                                            <div class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2'>
                                                <div class='selectedWorker_imgDiv mr-2'>
                                                    <img src="${path}/resources/images/defaultProfile.png"/>
                                                </div>
                                                <span>김OO</span>
                                            </div>                                    
                                            <!-- 담당자 프로필 for문 끝 -->
                                        </div>
                                        <hr class="w-100 mt-1 mb-2">
                                        <div class="d-flex align-items-center">
                                            <strong class="mr-2">시작일</strong>
                                            <p class="m-0">2020/05/10</p> <!-- 시작일 -->
                                        </div>   
                                        <hr class="w-100 mt-1 mb-2">
                                        <div class="d-flex align-items-center">
                                            <strong class="mr-2">마감일</strong>
                                            <p class="m-0">2020/05/12</p> <!-- 종료일 -->
                                        </div>  
                                        <hr class="w-100 mt-1 mb-2">
                                        <div class="d-flex align-items-center">
                                            <strong class="mr-2">우선순위</strong>
                                            <strong class="text-danger">긴급</strong> <!-- 우선순위 -->
                                        </div>                         
                                        <hr class="w-100 mt-1 mb-2">
                                        <div class="w-100"> <!-- 업무 글 내용 -->
                                            여기에 내용을 넣습니다!<br>
                                            여기에 내용을 넣습니다!<br>
                                            여기에 내용을 넣습니다!<br>
                                            여기에 내용을 넣습니다!<br>
                                            여기에 내용을 넣습니다!<br>
                                        </div>
                                    </div>       
                                    <!-- 2) 업무 끝 ------------------------------------------------------------------------------------------------------------------------>
        
        
                                    <!-- if문으로 분기처리 : bordType이 일정인경우 -->
                                    <!-- 3) 일정 끝 ------------------------------------------------------------------------------------------------------------------------>
                                    <div class="pjViewBody w-100 d-none flex-column pl-3 pr-3">
                                        <div class="pjViewBody-schedule w-100 d-flex flex-column p-3">
                                            <div class="w-100 row d-flex">
                                                <div class="col-2 d-flex flex-column justify-content-center align-items-center">
                                                    <p class="m-0 text-danger font-weight-bold">
                                                        5월
                                                    </p>
                                                    <p class="m-0 font-weight-bolder" style="font-size: 40px;">
                                                    11  
                                                    </p>
                                                </div>
                                                <div class="col-10 d-flex flex-column">
                                                    <strong class="">카페 작업실에서 만나욥</strong> <!-- 일정제목 -->
                                                    <hr class="w-100">
                                                    <strong class="">2020년 5월 12일(월)</strong> <!-- 일정 작성일 -->
                                                </div>
                                            </div>
                                            <hr class="w-100">
                                            
                                            <div class="w-100 d-flex flex-column align-items-center">
                                                <div class="d-flex mb-3" style="width: 90%;">
                                                    <img src="img/marker_icon.png" alt="장소아이콘" style="width: 25px; height: 25px;"/>
                                                    <p class="m-0">대한민국 서울특별시 강남구 테헤란로 126 B1 크리에이터클럽</p>  <!-- 일정주소 -->
                                                </div>
                                                <div class="border" style="width: 90%; height: 300px;"> <!-- 지도가 들어가는 곳 -->
                                                </div>
                                            </div>
                                            <hr class="w-100">
        
                                            <div class="w-100 d-flex">
                                                <img src="img/note_icon.png" alt="메모아이콘" style="width: 25px; height: 25px;"/>
                                                <div class="ml-2">1시 반에 만나요!!</div> <!-- 글이 들어가는 곳 -->
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 3) 일정 끝 ------------------------------------------------------------------------------------------------------------------------>      
        
        
                                    <!--★ 하단공통  ----------------------------------------------------------------------------------------------------------------------->       
                                    <div class="w-100 mt-4">      
                                        <div class="col-12 mb-3">
                                            <button class="btn stoolDarkBlue-btn-outline mr-2" type="button" data-toggle="collapse" data-target="#collapseExample1" aria-expanded="false" aria-controls="collapseExample"
                                                    onclick="addBtniconChange(this);">
                                                	추가항목보기 <i class="fas fa-plus stoolDarkBlue-text ml-2" style="font-size:20px;"></i>
                                            </button> 
                                            <span class="stoolGrey">태그 / 언급 / 첨부파일을 보시려면 클릭하세요</span>
                                        </div>
        
                                        <div class="collapse" id="collapseExample1"> 
                                            <!-- 공통) 태그 & 언급 -->
                                            <div class="col-12 addTagListBox mb-2">
                                                <div class="w-100 d-flex flex-column">
                                                    <strong class="mb-2">태그</strong>
                                                    <div class="w-100 d-flex flex-wrap align-items-center addTagList">
                                                        <div class="d-flex ml-2 mr-2">
                                                            <span style='color:#25558F; font-weight: bold;'>#</span>
                                                            <span class="">태그넣기</span>
                                                        </div>
                                                        <div class="d-flex ml-2 mr-2">
                                                            <span style='color:#25558F; font-weight: bold;'>#</span>
                                                            <span class="">태그넣기</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="w-100">
                                            </div>  <!-- 태그 입력 끝 -->     
                                            
                                            <!-- 언급 입력 -->
                                            <div class="col-12 addMentionListBox mb-2">                           
                                                <div class="d-flex flex-column justify-content-center">
                                                    <strong class="mr-2 mb-1">언급된 참여자</strong>                                        
                                                    <div class="d-flex align-items-center">
                                                        <div id="mentionListBox" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                            <div class='selectedWorker_imgDiv mr-2'>
                                                                <img src="${path}/resources/images/defaultProfile.png"/>
                                                            </div>
                                                            <span>김OO</span>
                                                        </div>
                                                        <div id="mentionListBox" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                            <div class='selectedWorker_imgDiv mr-2'>
                                                                <img src="${path}/resources/images/defaultProfile.png"/>
                                                            </div>
                                                            <span>김OO</span>
                                                        </div>
                                                    </div>
                                                </div>
                                                <hr class="w-100">
                                            </div>  <!-- 언급 입력 끝 -->    
        
                                            <!-- 공통) 파일 미리보기 (※일정은 첨부파일이 없으니 분기처리) -->
                                            <div id="uploadFilesPreview" class="col-12 mb-2">
                                                <strong class="mb-2">업로드 파일</strong>
                                                <div class="col-12 d-flex flex-column mb-2">
                                                    <p  class="align-items-center m-0 pl-1">
                                                        <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
                                                            첨부이미지
                                                    </p>
                                                    <div class="w-100 d-flex justify-content-center">
                                                        <div class="w-100 row">
                                                            <div class='col-2 p-1' style='height: 150px;'>
                                                                <div class='imgPreview h-100'>
                                                                    <img src='img/earth_icon.png'/>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12 d-flex flex-column">
                                                    <p class="align-items-center m-0 pl-1">
                                                        <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
                                                        첨부파일
                                                    </p>                                        
                                                    <div class="w-100 d-flex justify-content-center">
                                                        <div class="fileDownBox w-100 row">
        
                                                            <div class='col-4 p-1 w-100' style='height: 46px;'>
                                                                <div class='fileDownPreview w-100 h-100 pl-3 pr-3 d-flex justify-content-between align-items-center' onclick="fileDownload(this)">
                                                                    <div class='d-flex align-items-center'>
                                                                        <i class='fas fa-file text-info mr-2' style='font-size: 25px; color: #D0D0D4;'></i>
                                                                        <span>파일명넣기</span>
                                                                    </div>
                                                                    <i class="fas fa-download" style="font-size: 20px; color: lightslategray;"></i>
                                                                </div>
                                                            </div>
        
                                                        </div>
                                                    </div>
                                                </div>                                
                                            </div>  <!-- 공통) 파일 미리보기 끝 -->
                                        </div>
        
                                    </div>
                                    <!--★ 하단공통 끝  --------------------------------------------------------------------------------------------------------------------->
            
        
                                </div><!-- viewBundle 닫기 -->
        
        
        
                                <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                                <!-- for문을 돌릴때 변수를 만들어서 ( ex: pjUpadateBox + i ) 아래 div와 form의 id를 계속 바꿔준다 -->
                                <div id="pjUpdateBox" class="w-100 bg-white d-none">
                                    <form action="" method="post" enctype="multipart/form-data" onsubmit="return false" id="pjUpdateForm">
                                        <!-- from 공통 hidden input모음 -->
                                            <!-- 1) 파일-->                
                                            <input type="file" name="updateFiles" id="updateFiles" multiple style="display: none;"/>
                                            <!-- 2) 이미지파일 -->
                                            <input type="file" name="updateImgFiles" id="updateImgFiles" multiple style="display: none;" accept="image/*"/>
                                            <!-- 3) 태그 -->
                                            <input type="hidden" name="deleteTagListStr" id="deleteTagListStr"/>
                                            <input type="hidden" name="addTagListStr" id="addTagListStr"/>
                                            <!-- 4) 언급 -->
                                            <input type="hidden" name="deleteMentionListStr" id="deleteMentionListStr"/>                        
                                            <input type="hidden" name="addMentionListStr" id="addMentionListStr"/>
                                        <!-- from 공통 hidden input모음 끝 -->
                        
                                            <!-- 작성 카테고리별 div -->
                                            <!-- 1) 글 작성 -->
                                            <div id="updateCategory-board" class="row w-100 m-0">
                                                <div id="boardContainer" class="w-100 p-3">
                                                    <div id="boardTitleBox" class="col-12 d-flex justify-content-center mb-2">
                                                        <input name="boardTitle" id="boardTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                                                type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;">
                                                    </div>
                                                    <div id="boardContentBox" class="col-12 d-flex flex-column justify-content-center">
                                                        <div id="boardContentAreaDiv" class="w-100">
                                                            <textarea id="boardContentArea" name="boardContentArea" class="w-100 border-0 contentArea" style="resize: none; visibility: visible;" placeholder="글을 입력하세요."></textarea>
                                                        </div>
                                                    </div>                                                                 
                                                </div>
                                            </div>     
                                        
                                            <!-- 2) 업무 작성 -->
                                            <div id="updateCategory-task" class="row w-100 m-0">
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
                                                            <button type="button" id="addWorker" class="btn stoolDarkBlue-btn-outline m-1" onclick="fn_addWorkerModal();">담당자 추가</button>                       
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
                                            <div id="updateCategory-schedule" class="row w-100 m-0">
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
                                                            <button type="button" class="btn stoolDarkBlue-btn-outline mr-2" onclick="sample5_execDaumPostcode();">주소 검색</button>
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
                                                            <button type="button" id="mentionModalBtn" class="btn stoolDarkBlue-btn-outline m-1 mt-0" onclick="fn_addMentionModal();">언급 추가</button>                       
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
                                                    <button type="submit" class="btn m-2 stoolDarkBlue-btn">
                                                            올리기
                                                    </button>    
                                                </div>                                                              
                                            </div>
                                                
                                    </form>
        
        
                                </div>  
                                <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------->
        
        
        
                            </div><!-- viewBox 닫는 태그 -->
                            
                            <!--★☆★ 댓글 ------------------------------------------------------------------------------------------------------------------------->
                            <!-- 댓글 출력창 .댓글이 2개이상일경우 더보기로 보이도록 출력할것. -->
                            
                            <div class="w-100 p-3" style="background-color:#f6f7f8" id="comment">
                                <div class="mt-1">
                                    <p onclick="fn_displayHiddenComment(this);" class="m-0 font-weight-bolder stoolDarkBlue-text" style="cursor: pointer;">
                                        이전 댓글 더보기
                                    </p>
                                </div>
                                <table class="borderSpacing">                            
                                    <!-- ▼ 지우기 -->
                                    <tr class="hiddenComment d-none">
                                        <td class="d-flex align-items-start">
                                            <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                                <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <span style="font-size: 12px;">
                                                        <strong class="mr-2">정집집</strong>
                                                        <span style="color: lightgrey">2020-05-01 21:20</span>
                                                    </span>
                                                    <p class="m-0">
                                                        숨겨진 댓글1내용입니다.
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>                                                     
                                    <tr class="hiddenComment d-none">
                                        <td class="d-flex align-items-start">
                                            <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                                <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <span style="font-size: 12px;">
                                                        <strong class="mr-2">정집집</strong>
                                                        <span style="color: lightgrey">2020-05-01 21:20</span>
                                                    </span>
                                                    <p class="m-0">
                                                        숨겨진 댓글2내용입니다.
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <!-- ▲ 지우기 -->
                                    <tr>
                                        <td class="d-flex align-items-start">
                                            <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                                <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                            </div>
                                            <div class="d-flex flex-column justify-content-center">
                                                <div class="d-flex flex-column justify-content-center">
                                                    <span style="font-size: 12px;">
                                                        <strong class="mr-2">정집집</strong>
                                                        <span style="color: lightgrey">2020-05-01 21:20</span>
                                                    </span>
                                                    <p class="m-0">
                                                        댓글내용입니다.
                                                    </p>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                
                                </table>
                                <!-- 댓글 입력창 -->
                                <div class="d-flex mt-1">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="pt-1 pb-1 d-flex" style="width: 95%;">
                                        <input type="text" class="form-control" placeholder="댓글을 입력하세요" size="100px"/>
                                        <button type="button" class="ml-2" style="border: none; background: none;"
                                                onclick="insertComment(e);">
                                            <i class='fas fa-edit' style='font-size:28px'></i>
                                        </button>
                                    </div>   
                                </div>   
                            </div>
                            <!--★☆★ 댓글 끝 ----------------------------------------------------------------------------------------------------------------------->
                            <!-- 게시물 타입 [업무] 끝 -->
                    </div>
                    <!-- 상단고정글 > 게시물[업무] 끝 -->

                </div>
                
                <hr class="w-100 mt-2 mb-2"/> <!-- if문으로 마지막 글은 반복하지 않기 --> 
                <!-- 반복문 끝 -->
            </div> <!-- 상단고정글 박스 끝 -->