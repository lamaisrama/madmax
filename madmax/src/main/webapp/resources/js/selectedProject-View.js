//업무 작성 관련 스크립트 ---------------------------------------->
//진행상태 버튼
function fn_viewPost_progressState(e, id){
    if(id=="request"){
        $(e).removeClass("btn-primary");
        $(e).siblings(".btnProgress").removeClass("btn-success");
        $(e).siblings(".btnFeedback").removeClass("btn-danger");
        $(e).siblings(".btnEnd").removeClass("btn-info");
        $(e).siblings(".btnHold").removeClass("btn-secondary");

        $(e).siblings(".viewPostProgressState").val(id);
        $(e).addClass("btn-primary");
    }
    if(id=="progress"){
        $(e).siblings(".btnRequest").removeClass("btn-primary");
        $(e).removeClass("btn-success");
        $(e).siblings(".btnFeedback").removeClass("btn-danger");
        $(e).siblings(".btnEnd").removeClass("btn-info");
        $(e).siblings(".btnHold").removeClass("btn-secondary");

        $(e).siblings(".viewPostProgressState").val(id);
        $(e).addClass("btn-success");
    }
    if(id=="feedback"){
        $(e).siblings(".btnRequest").removeClass("btn-primary");
        $(e).siblings(".btnProgress").removeClass("btn-success");
        $(e).removeClass("btn-danger");
        $(e).siblings(".btnEnd").removeClass("btn-info");
        $(e).siblings(".btnHold").removeClass("btn-secondary");

        $(e).siblings(".viewPostProgressState").val(id);
        $(e).addClass("btn-danger");
    }
    if(id=="end"){
        $(e).siblings(".btnRequest").removeClass("btn-primary");
        $(e).siblings(".btnProgress").removeClass("btn-success");
        $(e).siblings(".btnFeedback").removeClass("btn-danger");
        $(e).removeClass("btn-info");
        $(e).siblings(".btnHold").removeClass("btn-secondary");

        $(e).siblings(".viewPostProgressState").val(id);
        $(e).addClass("btn-info");
    }
    if(id=="hold"){
        $(e).siblings(".btnRequest").removeClass("btn-primary");
        $(e).siblings(".btnProgress").removeClass("btn-success");
        $(e).siblings(".btnFeedback").removeClass("btn-danger");
        $(e).siblings(".btnEnd").removeClass("btn-info");
        $(e).removeClass("btn-secondary");

        $(e).siblings(".viewPostProgressState").val(id);
        $(e).addClass("btn-secondary");
    }
    console.log($(e).siblings(".viewPostProgressState").val());
}


//추가항목보기 버튼 클릭 이벤트 ----------------------------------------------------------->
function addBtniconChange(e){
    if($(e).children("i").hasClass("fa-plus")){
        $(e).children("i").removeClass("fa-plus");
        $(e).children("i").addClass("fa-minus");
    }else{
        $(e).children("i").removeClass("fa-minus");
        $(e).children("i").addClass("fa-plus");
    }
}
//추가항목보기 버튼 클릭 이벤트 -----------------------------------------------------------<

//pinPost Ajax --------------------------------------------------------------------------->
function fn_selectPin(e){
    if($(e).children(".selectPinIcon").hasClass("stoolGrey")){
        $(e).children(".selectPinIcon").removeClass("stoolGrey");
        $(e).children(".selectPinIcon").addClass("stoolDarkBlue-text");
        $(e).siblings(".selectPin").val("Y");
    }else{
        $(e).children(".selectPinIcon").removeClass("stoolDarkBlue-text");
        $(e).children(".selectPinIcon").addClass("stoolGrey");
        $(e).siblings(".selectPin").val("N");
    }
    console.log($(e).siblings(".selectPin").val());

    //여기에 Ajax코드넣기
}
//pinPost Ajax ---------------------------------------------------------------------------<

//댓글 더보기 ---------------------------------------------------------------------------->
function fn_displayHiddenComment(e){
    if($(e).parent("div").siblings("table").find(".hiddenComment").hasClass("d-none")){
        $(e).text("댓글 숨기기");
    }else{
        $(e).text("이전 댓글 더보기");
    }
    $(e).parent("div").siblings("table").find(".hiddenComment").toggleClass("d-none");
}
//댓글 더보기 ----------------------------------------------------------------------------<

//댓글 수정 input 띄우기
function fn_updateCommentInput(type, postNo){
	let hiddenDiv = "#commentDiv"+type+postNo;
	let visibleInput = "#updateCommentInput"+type+postNo;
	
	$(hiddenDiv).addClass("d-none");
	$(visibleInput).removeClass("d-none");
}

//댓글 수정 input 닫기
function fn_formClose(type, postNo){
	let hiddenDiv = "#commentDiv"+type+postNo;
	let visibleInput = "#updateCommentInput"+type+postNo;
	let comment = "#commentInput"+type+postNo;
	let commentDiv = "#commentDiv"+type+postNo;
	
	$(visibleInput).addClass("d-none");
	$(hiddenDiv).removeClass("d-none");
	$(comment).val($.trim($(commentDiv).text()));
}
