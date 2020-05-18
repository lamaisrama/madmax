/**
 * 
 */
function captureReturnKey(e) { 
    if(e.keyCode==13 && e.srcElement.type != 'textarea') 
    return false; 
}

//카테고리버튼 선택
function fn_writeCategory(e, id){
    
    let board = $("#writeCategory-board");
    let task = $("#writeCategory-task");
    let schedule = $("#writeCategory-schedule");

    //초기화
    $('#pjMainForm')[0].reset();
    $('#imgFileBox').html("");
    $('#fileBox').html("");
    if($("#files").val() == "" || $("#imgFiles").val() == ""){
        $("#uploadFilesPreview").addClass("d-none");
    }
    if($("#imgFiles").val() == ""){
        $("#imgFilesPreviewTitle").addClass("d-none");
    }
    if($("#files").val() == ""){
        $("#filesPreviewTitle").addClass("d-none");
    }


    if(id=="board"){
        board.hide();
        task.hide();
        schedule.hide();
        $("#fileUploadBtns").show();
        $("#cBtn-board").removeClass("cBtnSelect");
        $("#cBtn-task").removeClass("cBtnSelect");
        $("#cBtn-schedule").removeClass("cBtnSelect");
        $(e).addClass("cBtnSelect");
        board.show();
        $("#boardType").val("writing");
    }
    if(id=="task"){
        board.hide();
        task.hide();
        schedule.hide();
        $("#fileUploadBtns").show();
        $("#cBtn-board").removeClass("cBtnSelect");
        $("#cBtn-task").removeClass("cBtnSelect");
        $("#cBtn-schedule").removeClass("cBtnSelect");
        $(e).addClass("cBtnSelect");
        task.show();
        $("#boardType").val("task");
    }
    if(id=="schedule"){
        board.hide();
        task.hide();
        schedule.hide();
        $("#fileUploadBtns").hide();
        $("#cBtn-board").removeClass("cBtnSelect");
        $("#cBtn-task").removeClass("cBtnSelect");
        $("#cBtn-schedule").removeClass("cBtnSelect");
        $(e).addClass("cBtnSelect");
        schedule.show();
        $("#boardType").val("schedule");
    }       
}


//업무 작성 관련 스크립트 ---------------------------------------->
//진행상태 버튼
function fn_progressState(e, id){
    if(id=="request"){
        $("#request").removeClass("btn-primary");
        $("#progress").removeClass("btn-success");
        $("#feedback").removeClass("btn-danger");
        $("#end").removeClass("btn-info");
        $("#hold").removeClass("btn-secondary");

        $("#progressState").val(id);
        $(e).addClass("btn-primary");
    }
    if(id=="progress"){
        $("#request").removeClass("btn-primary");
        $("#progress").removeClass("btn-success");
        $("#feedback").removeClass("btn-danger");
        $("#end").removeClass("btn-info");
        $("#hold").removeClass("btn-secondary");

        $("#progressState").val(id);
        $(e).addClass("btn-success");
    }
    if(id=="feedback"){
        $("#request").removeClass("btn-primary");
        $("#progress").removeClass("btn-success");
        $("#feedback").removeClass("btn-danger");
        $("#end").removeClass("btn-info");
        $("#hold").removeClass("btn-secondary");

        $("#progressState").val(id);
        $(e).addClass("btn-danger");
    }
    if(id=="end"){
        $("#request").removeClass("btn-primary");
        $("#progress").removeClass("btn-success");
        $("#feedback").removeClass("btn-danger");
        $("#end").removeClass("btn-info");
        $("#hold").removeClass("btn-secondary");

        $("#progressState").val(id);
        $(e).addClass("btn-info");
    }
    if(id=="hold"){
        $("#request").removeClass("btn-primary");
        $("#progress").removeClass("btn-success");
        $("#feedback").removeClass("btn-danger");
        $("#end").removeClass("btn-info");
        $("#hold").removeClass("btn-secondary");

        $("#progressState").val(id);
        $(e).addClass("btn-secondary");
    }
    console.log($("#progressState").val());
}

//우선순위 input에 담기
function fn_priority(e, id){
    let val = $(e).text();
    $("#priority").val(id);
    $("#prioritySelectBtn").text(val);
    console.log($("#priority").val());
}

//담당자 추가
function fn_addWorkerModal(){
    $("#addWorkerModal").modal("show");
}

function fn_addWorker(e){
    let selectName = $(e).siblings("div").children("p").text();
 
    //이미 선택되어 있는지 확인
    if($("#workerListStr").val() != undefined && $("#workerListStr").val()!=""){
        let slSplit = $("#workerListStr").val().split(",");
        if($.inArray(selectName, slSplit) != -1){
            alert("이미 선택되어 있습니다.");
            return;            
        }else{          
            let val = $("#workerListStr").val();  
            let newVal = val+","+selectName;    
            $("#workerListStr").val(newVal);                     
        }
    }else{      
        $("#workerListStr").val(selectName);
    }    
    $("#workerList").prepend("<div class='d-flex justify-content-between align-items-center m-1 selectedWorker pl-2 pr-2'>"
                            +"<div class='selectedWorker_imgDiv mr-2'><img src='http://localhost:9090/stool/resources/images/defaultProfile.png'/></div>"
                            +"<span>"+selectName+"</span>"
                            +"<button type='button' onclick='fn_deleteWorker(this);' class='p-0 ml-2'>"
                            +"<i class='fas fa-minus-circle stoolPink'></i></button></div>");
    $("#addWorkerModal").modal("hide");

    console.log($("#workerListStr").val());
}
//담당자삭제 - (작성창)
function fn_deleteWorker(e){
    let removeName = $(e).siblings("span").text();
    if($("#workerListStr").val() != undefined){
        let slSplit = $("#workerListStr").val().split(",");
        if($.inArray(removeName, slSplit) != -1){
            slSplit.splice(slSplit.indexOf(removeName),1);      
            let newVal = slSplit.join(",");    
            $("#workerListStr").val(newVal);
        }
    }    
    $(e) .parents(".selectedWorker").remove();
    console.log($("#workerListStr").val());
}

//업무 작성 관련 스트립트 끝 -------------------------------------<

window.onload = function(){

    //작성 공통 스크립트 ---------------------------------------------->
    // 1) 태그+언급 툴팁
    $('[data-toggle="tooltip"]').tooltip({
        trigger : 'hover'
    });

    // 2) 시작+마감 datePicker  
    // $("#taskStartDate").datepicker();
    let setDatepicker = {
        format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
        startDate: '0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
        endDate: false,	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
        autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
        calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
        clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
        datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
        daysOfWeekDisabled : false,	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
        daysOfWeekHighlighted : false, //강조 되어야 하는 요일 설정
        disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
        immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
        multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
        multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
        templates : {
            leftArrow: '&laquo;',
            rightArrow: '&raquo;'
        }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
        showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
        title: "",	//캘린더 상단에 보여주는 타이틀
        todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
        toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
        weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
        language : "kr"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
        
    };
    $("#taskStartDate").datepicker(setDatepicker);
    $("#taskEndDate").datepicker(setDatepicker);
    $("#scheduleStartDate").datepicker(setDatepicker);
    $("#scheduleEndDate").datepicker(setDatepicker);


    //작성 공통 스크립트 끝 -------------------------------------------<

    $("#writeCategory-task").hide();
    $("#writeCategory-schedule").hide();

    //글 작성 관련 스크립트 ------------------------------------------>
    //textarea 크기 늘리기
    //1)글 작성
    let boardTextEle = $('#boardContentArea');
    function adjustHeight_board() {
        boardTextEle[0].style.height = '120px';
        var textEleHeight = boardTextEle.prop('scrollHeight');
        boardTextEle.css('height', textEleHeight);
    };
    boardTextEle.on('keyup', function() {
        adjustHeight_board();
    });


    //2)업무 작성
    let taskTextEle = $('#taskContentArea');
    function adjustHeight_task() {
        taskTextEle[0].style.height = '120px';
        var textEleHeight = taskTextEle.prop('scrollHeight');
        taskTextEle.css('height', textEleHeight);
    };
    taskTextEle.on('keyup', function() {
        adjustHeight_task();
    });    
    //2)일정 작성
    let scheduleTextEle = $('#scheduleContentArea');
    function adjustHeight_schedule() {
        scheduleTextEle[0].style.height = '60px';
        var textEleHeight = scheduleTextEle.prop('scrollHeight');
        scheduleTextEle.css('height', textEleHeight);
    };
    scheduleTextEle.on('keyup', function() {
        adjustHeight_schedule();
    }); 
    
    //글 작성 관련 스크립트 끝 ---------------------------------------<  

    //업무리포트 슬라이드아이콘
    let angle = 0;
    $('#reportBoxBtn').click(function() { 
        angle += 180;
        $("#rb_slide_icon").attr("style","transform: rotate( "+angle+"deg );width: 25px;");
    });

    $("#filesBtn").click(function(){
        $("#files").click();
    });
    $("#imgFilesBtn").click(function(){
        $("#imgFiles").click();
    });    

    
    

  //일정 - 지도
  ////////////////////
  // 카카오 지도 API S 
  /////////////////// 
  var mapContainer; // 지도를 표시할 div
  var mapOption;

  //지도를 미리 생성
  var map;
  //주소-좌표 변환 객체를 생성
  var geocoder;
  //마커를 미리 생성
  var marker;
    
}



function sample5_execDaumPostcode() {
	mapContainer = document.getElementById('map');
	mapOption = {
		      center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
		      level: 5 // 지도의 확대 레벨
		  };
	map = new daum.maps.Map(mapContainer, mapOption);
	geocoder = new daum.maps.services.Geocoder();
	marker = new daum.maps.Marker({
		  position: new daum.maps.LatLng(37.537187, 127.005476),
		  map: map
		  });
new daum.Postcode({
    oncomplete: function(data) {
        var addr = data.address; // 최종 주소 변수

        // 주소 정보를 해당 필드에 넣는다.
        document.getElementById("schedulePlace").value = addr;
        // 주소로 상세 정보를 검색
        geocoder.addressSearch(data.address, function(results, status) {
            // 정상적으로 검색이 완료됐으면
            if (status === daum.maps.services.Status.OK) {

                var result = results[0]; //첫번째 결과의 값을 활용

                // 해당 주소에 대한 좌표를 받아서
                var coords = new daum.maps.LatLng(result.y, result.x);
                console.log(result.y, result.x);
                // 지도를 보여준다.
//                mapContainer.style.display = "block";
                $("#mapBox").attr("style", "display:block; height:300px;");
                map.relayout();
                // 지도 중심을 변경한다.
                map.setCenter(coords);
                // 마커를 결과값으로 받은 위치로 옮긴다.
                marker.setPosition(coords)
            }
        });
    }
}).open();
}
//$("#cBtn-schedule").click( function() { 
////실행될 코드 
//relayout();
//map.setCenter(new daum.maps.LatLng(33.450701, 126.570667));
//});

//////////////////// 
// 카카오 지도 API E 
/////////////////// 




//프로젝트 > 프로젝트 정보 ------------------------------------------>
//1)즐겨찾기 기능
function fn_bookmark(){
    if($("#bookmarkIcon").hasClass("far")){
        $("#bookmarkIcon").removeClass("far");
        $("#bookmarkIcon").addClass("fas");
        $("#pjBookmark").val("Y");
    }else{
        $("#bookmarkIcon").removeClass("fas");
        $("#bookmarkIcon").addClass("far");
        $("#pjBookmark").val("N");
    }
    console.log($("#pjBookmark").val());
}

//2) 프로젝트 정보박스 컬러변경
function fn_selectColor(e){
    let id = $(e).attr("id");
    switch(id){
        case "selectColor-lightGray" : 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(200, 200, 200);"); 
            $("#pjInfoBoxColor").val("lightGray");
            break;
        case "selectColor-gray": 
            $("#pjInfoContainer").removeClass("bg-info");
            $("#pjInfoContainer").attr("style", "background-color: rgb(80, 80, 80);"); 
            $("#pjInfoBoxColor").val("gray");
            break;
        case "selectColor-yellow": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(255, 227, 70);"); 
            $("#pjInfoBoxColor").val("yellow");
            break;
        case "selectColor-orange": 
            $("#pjInfoContainer").removeClass("bg-info");
            $("#pjInfoContainer").attr("style", "background-color: rgb(255, 147, 24);"); 
            $("#pjInfoBoxColor").val("orange");
            break;
        case "selectColor-red": 
            $("#pjInfoContainer").removeClass("bg-info");
            $("#pjInfoContainer").attr("style", "background-color: rgb(255, 59, 41);");
            $("#pjInfoBoxColor").val("red");
            break;
        case "selectColor-pink": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(255, 147, 156);"); 
            $("#pjInfoBoxColor").val("pink");
            break;
        case "selectColor-purple": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(161, 61, 156);"); 
            $("#pjInfoBoxColor").val("purple");
            break;
        case "selectColor-blue": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: #25558F;"); 
            $("#pjInfoBoxColor").val("blue");
            break;
        case "selectColor-lightBlue": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(172, 194, 255);"); 
            $("#pjInfoBoxColor").val("lightBlue");
            break;
        case "selectColor-lightMint": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(129, 221, 198);"); 
            $("#pjInfoBoxColor").val("lightMint");
            break;
        case "selectColor-mint": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: #17a2b8;"); 
            $("#pjInfoBoxColor").val("mint");
            break;
        case "selectColor-green": 
            $("#pjInfoContainer").removeClass("bg-info"); 
            $("#pjInfoContainer").attr("style", "background-color: rgb(113, 211, 100);"); 
            $("#pjInfoBoxColor").val("green");
            break;
    }
    
    console.log($("#pjInfoBoxColor").val());
}
    
// 3) 프로젝트 숨김 / 나가기 / 수정 / 삭제
// a. 숨김
function fn_pjHide(){
    $("#pjHideModal").modal("show");
}
// b. 나가기
function fn_pjGoOut(){
    $("#pjGoOutModal").modal("show");
}
// c. 수정
function fn_pjUpdate(){
    $("#pjUpdateModal").modal("show");
}
// d. 삭제
function fn_pjDelete(){
    $("#pjDeleteModal").modal("show");
}


//파일 업로드
let sel_imgFiles = [];
$(document).ready(function(){
    $("#imgFiles").on("change", fn_handleImgsFilesSelect);
    $("#imgFiles").on("change", function(){
        if($("#files").val() != "" || $("#imgFiles").val() != ""){
            $("#uploadFilesPreview").removeClass("d-none");
            if($("#imgFiles").val() != ""){
                $("#imgFilesPreviewTitle").removeClass("d-none");
            }
        }
    });
    $("#files").on("change", fn_handleFilesSelect);
    $("#files").on("change", function(){
        if($("#files").val() != "" || $("#imgFiles").val() != ""){
            $("#uploadFilesPreview").removeClass("d-none");
            if($("#files").val() != ""){
                $("#filesPreviewTitle").removeClass("d-none");
            } 
        }
    });    
});

function fn_handleImgsFilesSelect(e){
    let imgFiles = e.target.files;
    let imgFilesArr = Array.prototype.slice.call(imgFiles);

    imgFilesArr.forEach(function(f){
        if(!f.type.match("image.*")){
            alert("이미지파일만 가능합니다.");
            return;
        }
        sel_imgFiles.push(f);
        let reader = new FileReader();
        reader.onload = function(e){
            let img_html = "<div class='col-2 p-1' style='height: 150px;'><div class='imgPreview h-100'><img src=\'"+e.target.result+"\'/></div></div>";
            $("#imgFileBox").append(img_html);
        }
        reader.readAsDataURL(f);
    });
}
function fn_handleFilesSelect(){
    var files=$('#files')[0].files;

    for(var i= 0; i<files.length; i++){
        //확장자 별 이미지주기
        let name = files[i].name;
        let ext = name.substr(name.indexOf(".")+1, name.length);
        let iconStr = "";

        switch(ext){
            case "jpg" : iconStr = "fas fa-file-image text-success"; 
            case "png" : iconStr = "fas fa-file-image text-success";
            case "jpeg" : iconStr = "fas fa-file-image text-success"; break;
            case "jsp": iconStr = "fas fa-file-code text-muted";
            case "java" : iconStr = "fas fa-file-code text-muted";
            case "css" : iconStr = "fas fa-file-code text-muted";
            case "html" : iconStr = "fas fa-file-code text-muted"; break;
            case "hwp" : iconStr = "fas fa-file-word text-primary";
            case "txt" : iconStr = "fas fa-file-word text-primary";
            case "ppt" : iconStr = "fas fa-file-word text-primary";
            case "dox" : iconStr = "fas fa-file-word text-primary";
            case "xls" : iconStr = "fas fa-file-word text-primary"; break;
            case "mp3" : iconStr = "fas fa-file-audio text-info";
            case "aac" : iconStr = "fas fa-file-audio text-info"; break;
            case "wav" : iconStr = "fas fa-file-audio text-info"; break;
            case "pdf" : iconStr = "fas fa-file-pdf text-danger"; break;
            case "mp4" : iconStr = "fas fa-file-video text-info";
            case "avi" : iconStr = "fas fa-file-video text-info";
            case "flv" : iconStr = "fas fa-file-video text-info";
            case "mov" : iconStr = "fas fa-file-video text-info";
            case "avi" : iconStr = "fas fa-file-video text-info"; break;
            case "zip" || "apk" || "rar" || "tar" : iconStr = "fas fa-file-archive text-primary";
            case "apk" : iconStr = "fas fa-file-archive text-primary";
            case "rar" : iconStr = "fas fa-file-archive text-primary";
            case "tar" : iconStr = "fas fa-file-archive text-primary"; break;
            default : iconStr = "fas fa-file text-info";
        }

        let fileDiv_html = "<div class='col-4 p-1 w-100' style='height: 46px;'><div class='filePreview h-100 pl-3 pr-3'>"
        					+"<i class='"+iconStr+" mr-2' style='font-size: 25px; color: #D0D0D4;'></i><span>"
                            +files[i].name+"</span></div></div>";
        $("#fileBox").append(fileDiv_html);
    }
}


//작성 공통 스크립트2 ---------------------------------------------->
//태그 
// 1)하단 #버튼 클릭 시 태그입력창 출력 
function fn_tagBtn(){
    $(".addTagListBox").toggleClass("d-none");
}
// 2) 태그입력시 화면에 출력 + hidden input에 값 넣기(ex: 태그1,태그2)
let tagListStr = $("#tagListStr").val();
function fn_addTag(e){
    let keycode = event.keyCode;
    if((keycode) == 13){
        let addStr = $(e).val();
        if(tagListStr!=undefined  && tagListStr!=""){
            //이미 있는 태그인지 확인
            let tsSplit = $("#tagListStr").val().split(",");
            if($.inArray(addStr, tsSplit) != -1){
                alert("이미 입력하신 태그입니다.");
                $(e).val("");
                return;
            }else{               
                tagListStr = tagListStr+","+addStr;
                $("#tagListStr").val(tagListStr);
            }
        }else{      
            tagListStr = addStr;
            $("#tagListStr").val(tagListStr);
        }
        console.log(tagListStr);
        $(".addTagList").prepend("<p class='selectedTag m-0 pl-2 pr-2 font-weight-bolder d-flex align-items-center'>"
                                +"<span style='color:#25558F;'>#</span>"
                                +"<span class='tagText'>"+$(e).val()+"</span>"
                                +"<i class='fas fa-minus-circle stoolGrey ml-2' onclick='fn_deleteTag(this)'></i></p>");
        $(e).val("");
    }
}
// 3) 추가했던 태그 삭제(작성창)
function fn_deleteTag(e){    
    let removeTag = $(e).siblings(".tagText").text();
    if($("#tagListStr").val() != undefined){
        let tsSplit = $("#tagListStr").val().split(",");
        if($.inArray(removeTag, tsSplit) != -1){
            tsSplit.splice(tsSplit.indexOf(removeTag),1);      
            let newVal = tsSplit.join(",");         
            $("#tagListStr").val(newVal);
        }
    }    
    $(e).parents(".selectedTag").remove();
}

//언급 
// 1)하단 @버튼 클릭 시 언급 입력창 출력 
function fn_atBtn(){
    $(".addMentionListBox").toggleClass("d-none");
}
function fn_addMentionModal(){
    $("#addMentionModal").modal("show");
}

function fn_addMention(e){
    let selectName = $(e).siblings("div").children("p").text();
    //이미 선택되어 있는지 확인
    if($("#mentionListStr").val() != undefined && $("#mentionListStr").val()!=""){
        let slSplit = $("#mentionListStr").val().split(",");
        if($.inArray(selectName, slSplit) != -1){
            alert("이미 선택되어 있습니다.");
            return;            
        }else{        
            let val = $("#mentionListStr").val();
            let newVal = val+","+selectName;    
            $("#mentionListStr").val(newVal);                
        }        
    }else{      
        $("#mentionListStr").val(selectName);
    }
    $("#mentionListBox").prepend("<div class='d-flex justify-content-between align-items-center m-1 selectedWorker pl-2 pr-2'>"
                            +"<div class='selectedWorker_imgDiv mr-2'><img src='http://localhost:9090/stool/resources/images/defaultProfile.png'/></div>"
                            +"<span>"+selectName+"</span>"
                            +"<button type='button' onclick='fn_deleteMention(this);' class='p-0 ml-2'>"
                            +"<i class='fas fa-minus-circle stoolPink'></i></button></div>");
    $("#addMentionModal").modal("hide");
    
    console.log($("#mentionListStr").val());
}
//언급 참여자 삭제 - (작성창)
function fn_deleteMention(e){
    let removeName = $(e).siblings("span").text();
    if($("#mentionListStr").val() != undefined){
        let slSplit = $("#mentionListStr").val().split(",");
        if($.inArray(removeName, slSplit) != -1){
            slSplit.splice(slSplit.indexOf(removeName),1);      
            let newVal = slSplit.join(",");    
            $("#mentionListStr").val(newVal);
        }
    }    
    $(e) .parents(".selectedWorker").remove();
    console.log($("#mentionListStr").val());
}
//작성 공통 스크립트 끝 -------------------------------------------<