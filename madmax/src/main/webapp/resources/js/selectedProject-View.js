//업무 작성 관련 스크립트 ----------------------------------------
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


//추가항목보기 버튼 클릭 이벤트 -----------------------------------------------------------
function addBtniconChange(e){
    if($(e).children("i").hasClass("fa-plus")){
        $(e).children("i").removeClass("fa-plus");
        $(e).children("i").addClass("fa-minus");
    }else{
        $(e).children("i").removeClass("fa-minus");
        $(e).children("i").addClass("fa-plus");
    }
}
//추가항목보기 버튼 클릭 이벤트 -----------------------------------------------------------

//pinPost Ajax ---------------------------------------------------------------------------
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
//pinPost Ajax ---------------------------------------------------------------------------

//댓글 더보기 ----------------------------------------------------------------------------
function fn_displayHiddenComment(e){
    if($(e).parent("div").siblings("table").find(".hiddenComment").hasClass("d-none")){
        $(e).text("댓글 숨기기");
    }else{
        $(e).text("이전 댓글 더보기");
    }
    $(e).parent("div").siblings("table").find(".hiddenComment").toggleClass("d-none");
}
//댓글 더보기 ----------------------------------------------------------------------------

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

//글 체크 border효과 js
$(document).ready(function(){
	   var url=window.location.href;
	   //console.log(typeof url);
	   //console.log(loction.search.substr(location.search.lastIndex))
	   var page_id=url.substring(url.lastIndexOf('=')+1);
	    //alert(page_id);
	   var p='p';
	   page_id=p.concat(page_id);
	   //alert(page_id);
	   var boardNo=[];
	   boardNo=document.getElementsByClassName('pjViewBox');
	   console.log(boardNo);
	   var result=[];
	   for(var i=0;i<boardNo.length;i++){
	      var val=(boardNo[i].getAttribute('value'));
	      result[i]=val;
	   }
	   console.log(result);
	   for(var i=0;i<boardNo.length;i++){
	      if(page_id==result[i]){      
	            //var sharp="#";
	            //page_id=sharp.concat(page_id);
	            //console.log(page_id);
	            var offset=$("div[value="+page_id+"]").offset();
	            console.log("좌표값:"+offset.top);
	            $('html,body').animate({scrollTop:(offset.top-1000)},200);
	            console.log("실행됨");
	            $("div[value="+page_id+"]").css("border","5px solid navy");
	            
	         }
	   }
	   	   
});


//**************************************
//********** 게시글 수정 ******************
//**************************************
function fn_viewPostUpdate(bNo){
	$("#viewBoxDiv"+bNo).addClass("d-none");
	$("#postUpdateFormDiv"+bNo).removeClass("d-none");
	
	let inputOriTags = "input[name='oriTags" + bNo + "']";	
	let oriTagsLength = $(inputOriTags).length;
	let oriTags = new Array(oriTagsLength);
	for(let i=0; i<oriTagsLength; i++){                          
		oriTags[i] = $(inputOriTags)[i].value;
	}
	let oriTagList = oriTags.join(",");
	
	$("#checkTagStr"+bNo).val(oriTagList);
	
	let inputOriMentions = "input[name='oriMentions" + bNo + "']";	
	let oriMentionsLength = $(inputOriMentions).length;
	let oriMentions = new Array(oriMentionsLength);
	for(let i=0; i<oriMentionsLength; i++){                          
		oriMentions[i] = $(inputOriMentions)[i].value;
	}
	let oriMentionList = oriMentions.join(",");
	
	$("#checkMentionStr"+bNo).val(oriMentionList);
}

function fn_updateFormCancel(bNo){
	$("#viewBoxDiv"+bNo).removeClass("d-none");
	$("#postUpdateFormDiv"+bNo).addClass("d-none");
	$("#postUpdateForm"+bNo)[0].reset();
}

//1.수정 공통 - 태그
//1) 태그입력시 화면에 출력 + hidden input에 값 넣기(ex: 태그1,태그2)
let newTagListStr = $("#newTagListStr").val();
let deleteTagListStr = $("#deleteTagListStr").val();

function fn_addTag_update(e, bNo){
    let keycode = event.keyCode;
    if((keycode) == 13){

    	let checkTagStr = $("#checkTagStr"+bNo).val();
    	
        let addStr = $(e).val();
        if(checkTagStr!=undefined  && checkTagStr!=""){
            //이미 있는 태그인지 확인
            let tsSplit = $("#checkTagStr"+bNo).val().split(",");
            if($.inArray(addStr, tsSplit) != -1){
                alert("이미 입력하신 태그입니다.");
                $(e).val("");
                return;
            }else{               
            	checkTagStr = checkTagStr+","+addStr;
                $("#checkTagStr"+bNo).val(checkTagStr);
                
                if(newTagListStr!=undefined  && newTagListStr!=""){
                	newTagListStr = newTagListStr+","+addStr;  
                	$("#newTagListStr").val(newTagListStr);
                }else{
                	newTagListStr = addStr;
                    $("#newTagListStr").val(newTagListStr);
                }                	
            }
        }else{     
        	checkTagStr = addStr;
        	$("#checkTagStr"+bNo).val(checkTagStr);
        	
            if(newTagListStr!=undefined  && newTagListStr!=""){
            	newTagListStr = newTagListStr+","+addStr;  
            	$("#newTagListStr").val(newTagListStr);
            }else{
            	newTagListStr = addStr;
                $("#newTagListStr").val(newTagListStr);
            }        	
        }
        
        
        console.log(newTagListStr);
        $(".addTagList_update").prepend("<p class='selectedTag m-0 pl-2 pr-2 font-weight-bolder d-flex align-items-center'>"
                                +"<span style='color:#25558F;'>#</span>"
                                +"<span class='tagText'>"+$(e).val()+"</span>"
                                +"<i class='fas fa-minus-circle stoolGrey ml-2' onclick='fn_deleteNewTag(this," + bNo + ")'></i></p>");
        $(e).val("");
    }
}

//2) 추가했던 태그 삭제(작성창)
function fn_deleteNewTag(e,bNo){    
    let removeTag = $(e).siblings(".tagText").text();
    
    if($("#checkTagStr"+bNo).val() != undefined){
        let tsSplit = $("#checkTagStr"+bNo).val().split(",");
        if($.inArray(removeTag, tsSplit) != -1){
            tsSplit.splice(tsSplit.indexOf(removeTag),1);      
            let newVal = tsSplit.join(",");         
            $("#checkTagStr"+bNo).val(newVal);
        }
    }   
    
    if($("#newTagListStr").val() != undefined){
        let tsSplit = $("#newTagListStr").val().split(",");
        if($.inArray(removeTag, tsSplit) != -1){
            tsSplit.splice(tsSplit.indexOf(removeTag),1);      
            let newVal = tsSplit.join(",");         
            $("#newTagListStr").val(newVal);
        }
    }
    
    $(e).parents(".selectedTag").remove();
}

//3) 원글에 있던 태그 삭제
function fn_deleteTag_update(e, bNo, tagNo){    
	let removeTag = $(e).siblings(".tagText").text();
	
	if($("#checkTagStr"+bNo).val() != undefined){
		let tsSplit = $("#checkTagStr"+bNo).val().split(",");
		if($.inArray(removeTag, tsSplit) != -1){
			tsSplit.splice(tsSplit.indexOf(removeTag),1);      
			let newVal = tsSplit.join(",");         
			$("#checkTagStr"+bNo).val(newVal);
		}
	}   
	
	var deleteTagList = $("#deleteTagListStr").val();
    
    if(deleteTagList!=undefined  && deleteTagList!=""){               
    	deleteTagList = deleteTagList+","+tagNo;  
        $("#deleteTagListStr").val(deleteTagList);
    }else{      
    	deleteTagList = tagNo;
        $("#deleteTagListStr").val(deleteTagList);
    }
	
	$(e).parents(".selectedTag").remove();
}



//2. 수정공통 - 언급
//1) 언급 추가
let newMentionListStr = $("#newMentionListStr").val();
let deleteMentionListStr = $("#deleteMentionListStr").val();

function fn_addMention_update(e, bNo, mentionId, mName){
	
    let checkMentionStr = $("#checkMentionStr"+bNo).val();
    //이미 선택되어 있는지 확인
    if($("#checkMentionStr"+bNo).val() != undefined && $("#checkMentionStr"+bNo).val()!=""){
        let slSplit = $("#checkMentionStr"+bNo).val().split(",");
        if($.inArray(mentionId, slSplit) != -1){
            alert("이미 선택되어 있습니다.");
            return;            
        }else{        
            let val = $("#checkMentionStr"+bNo).val();
            let newVal = val+","+mentionId; 
            
            $("#checkMentionStr"+bNo).val(newVal);    
            
            if(newMentionListStr!=undefined  && newMentionListStr!=""){
            	newMentionListStr = newMentionListStr+","+mentionId;  
            	$("#newMentionListStr").val(newMentionListStr);
            }else{
            	newMentionListStr = mentionId;
            	$("#newMentionListStr").val(newMentionListStr);
            }  
            
        }        
    }else{      
        $("#checkMentionStr"+bNo).val(mentionId);

        if(newMentionListStr!=undefined  && newMentionListStr!=""){
        	newMentionListStr = newMentionListStr+","+mentionId;  
        	$("#newMentionListStr").val(newMentionListStr);
        }else{
        	newMentionListStr = mentionId;
        	$("#newMentionListStr").val(newMentionListStr);
        }          
        
    }
    
    let strMentionId = '"' + mentionId + '"';
    
    $(".addMentionList_update").prepend("<div class='d-flex justify-content-between align-items-center m-1 selectedWorker pl-2 pr-2'>"
                            +"<div class='selectedWorker_imgDiv mr-2'><img src='http://localhost:9090/stool/resources/images/defaultProfile.png'/></div>"
                            +"<span>"+mName+"</span>"
                            +"<button type='button' onclick='fn_deleteNewMention(this,"+ bNo +","+ strMentionId +");' class='p-0 ml-2'>"
                            +"<i class='fas fa-minus-circle stoolPink'></i></button></div>");
    $("#addMentionModal_update"+bNo).modal("hide");
    
    console.log($("#checkMentionStr"+bNo).val());
}

//2) 추가했던 언급 삭제(작성창)
function fn_deleteNewMention(e, bNo, mentionId){    
    
    if($("#checkMentionStr"+bNo).val() != undefined){
        let tsSplit = $("#checkMentionStr"+bNo).val().split(",");
        if($.inArray(mentionId, tsSplit) != -1){
            tsSplit.splice(tsSplit.indexOf(mentionId),1);      
            let newVal = tsSplit.join(",");         
            $("#checkMentionStr"+bNo).val(newVal);
        }
    }   
    
    if($("#newMentionListStr").val() != undefined){
        let tsSplit = $("#newMentionListStr").val().split(",");
        if($.inArray(mentionId, tsSplit) != -1){
            tsSplit.splice(tsSplit.indexOf(mentionId),1);      
            let newVal = tsSplit.join(",");         
            $("#newMentionListStr").val(newVal);
        }
    }
    
    $(e).parents(".selectedWorker").remove();
}

//3) 원글 언급 참여자 삭제 - (작성창)
function fn_deleteMentionListStr(e, bNo,removeId){

    if($("#checkMentionStr"+bNo).val() != undefined){
        let slSplit = $("#checkMentionStr"+bNo).val().split(",");
        if($.inArray(removeId, slSplit) != -1){
            slSplit.splice(slSplit.indexOf(removeId),1);      
            let newVal = slSplit.join(",");    
            $("#checkMentionStr"+bNo).val(newVal);
        }
    }    
    
    let deleteMentionListStr = $("#deleteMentionListStr").val();
    
    if(deleteMentionListStr!=undefined  && deleteMentionListStr!=""){               
    	deleteMentionListStr = deleteMentionListStr+","+removeId;  
        $("#deleteMentionListStr").val(deleteMentionListStr);
    }else{      
    	deleteMentionListStr = removeId;
        $("#deleteMentionListStr").val(deleteMentionListStr);
    }    
    
    $(e) .parents(".selectedWorker").remove();
    console.log($("#checkMentionStr"+bNo).val());
}


//3. 파일
//파일 업로드
let sel_imgFiles_update = [];
$(document).ready(function(){
//  $("#newImgFiles").on("change", fn_handleImgsFilesSelect_update);

  
  $("#newFiles").on("change", fn_handleFilesSelect_update);
  $("#newFiles").on("change", function(){
      $("#filesPreview_update").removeClass("d-none");      
      $("#oriFilesPreview_update").addClass("d-none");      
  });    
});

function fn_newImgFilesChange(bNo){
	  alert("dfjaskdfjlksadjfklj");
	  $("#imgFilesPreview_update"+bNo).addClass("d-flex"); 
    $("#imgFilesPreview_update"+bNo).removeClass("d-none");      
    $("#oriImgFilesPreview_update"+bNo).removeClass("d-flex");      
    $("#oriImgFilesPreview_update"+bNo).addClass("d-none"); 
} 

function fn_handleImgsFilesSelect_update(e,bNo){
    let imgFiles = e.target.files;
    let imgFilesArr = Array.prototype.slice.call(imgFiles);

    
    imgFilesArr.forEach(function(f){
        if(!f.type.match("image.*")){
            alert("이미지파일만 가능합니다.");
            return;
        }
        sel_imgFiles_update.push(f);
        let reader = new FileReader();
        reader.onload = function(e){
            let img_html = "<div class='col-2 p-1' style='height: 150px;'><div class='imgPreview h-100'><img src=\'"+e.target.result+"\'/></div></div>";
            $("#imgFileBox_update"+bNo).append(img_html);
        }
        reader.readAsDataURL(f);
    });
}
function fn_handleFilesSelect_update(){
  var files=$('#newFiles')[0].files;

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
      $("#fileBox_update").append(fileDiv_html);
  }
}
