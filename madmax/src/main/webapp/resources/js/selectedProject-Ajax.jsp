<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />

<script>
	/* $(document).ready(function() { alert("로딩 완료"); }); */
//글 작성
function fn_writeSubmit(){
    // Get form
    var form = $('#pjMainForm')[0];

    // Create an FormData object 
    var data = new FormData(form);


    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "${path}/selectedProject/insertSelectedProject.do",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {        	
        	if(data>0){
        		alert("게시글이 등록되었습니다.");
        		if($("#mentionListStr").val()!=""){
        			var mentionListStr = $("#mentionListStr").val().split(',');
        			$.each(mentionListStr, function(i, e){
        				var receiver = e;
        				var boardType=$("#boardType").val();
        				var title; var type;
        				switch(boardType){
        				case "writing" : {
        						type='글';
        						title=$("#writingTitle").val(); break;
        					}
        				case "task" : {
        						type = '업무';
        						title=$("#taskTitle").val(); break;
        					}
        				case "schedule" : {
        						type='일정'; 
        						title=$("#scheduleTitle").val(); break;
        					}
        				}
        				var msg = '[${projectInfo.PROJECTTITLE}] ${loginUser.userName}님이 <br>'
        				msg += type+'<b> \"'+title+'\"</b>에서 <br>'
        				msg += '회원님을 언급했습니다.';
        				sendNotiMessage(receiver, msg);
        			})
        		}
        		location.reload(true);
        	}else{
        		alert("게시글이 정상적으로 등록되지않았습니다. 다시 시도해주세요.");
        	}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("fail");
        }
    });
}
	
//즐찾기능	
function fn_favorite(flag,pjNo,loginId){    
	//flag가 1인 경우엔 즐찾이 되어있으니 즐찾을 해제하는 것    
	if(flag > 0){
		$.ajax({
			url:"${path}/selectedProject/deleteFavorite.do",
			data:{flag:flag,
				  pjNo:pjNo,
				  loginId:loginId},
			success:function(data){
				if(data > 0){
					alert("즐겨찾기 해제되었습니다.");
	        		location.reload(true);
				}else{
					alert("즐겨찾기 해제에 실패하였습니다. 다시 시도해주세요");
				}
			}
		});
	}else if(flag == 0){
		$.ajax({
			url:"${path}/selectedProject/insertFavorite.do",
			data:{flag:flag,
				  pjNo:pjNo,
				  loginId:loginId},
			success:function(data){
				console.log(data);
				if(data > 0){
					alert("즐겨찾기로 등록되었습니다.");
	        		location.reload(true);
				}else{
					alert("즐겨찾기 등록에 실패하였습니다. 다시 시도해주세요");
				}
			}
		});
	}

}	

//프로젝트 색상변경
function fn_selectColor(e,pjNo,color){
    let id = $(e).attr("id");
    switch(id){
        case "selectColor-lightGray" : 
            $("#pjInfoContainer").attr("style", "background-color: #c8c8c8;"); 
            break;
        case "selectColor-gray": 
            $("#pjInfoContainer").attr("style", "background-color: #505050;"); 
            $("#pjInfoBoxColor").val("gray");
            break;
        case "selectColor-yellow": 
            $("#pjInfoContainer").attr("style", "background-color: #ffe346;"); 
            break;
        case "selectColor-orange": 
            $("#pjInfoContainer").attr("style", "background-color: #ff9318;"); 
            break;
        case "selectColor-red": 
            $("#pjInfoContainer").attr("style", "background-color: #ff3b29;");
            break;
        case "selectColor-pink": 
            $("#pjInfoContainer").attr("style", "background-color: #ff939c;"); 
            break;
        case "selectColor-purple": 
            $("#pjInfoContainer").attr("style", "background-color: rgb(161, 61, 156);"); 
            break;
        case "selectColor-blue": 
            $("#pjInfoContainer").attr("style", "background-color: #25558F;"); 
            break;
        case "selectColor-lightBlue": 
            $("#pjInfoContainer").attr("style", "background-color: #acc2ff;"); 
            break;
        case "selectColor-lightMint": 
            $("#pjInfoContainer").attr("style", "background-color: #81ddc6;"); 
            break;
        case "selectColor-mint": 
            $("#pjInfoContainer").attr("style", "background-color: #17a2b8;"); 
            break;
        case "selectColor-green": 
            $("#pjInfoContainer").attr("style", "background-color: #71d364;"); 
            break;
    }
    
	$.ajax({
		url:"${path}/selectedProject/updateProjectColor.do",
		data:{pjNo:pjNo,
			  color:color}
	});
}
    
    
//프로젝트 나가기
function fn_pjGoOutAjax(pjNo, loginId){
	$.ajax({
		url:"${path}/selectedProject/deleteProjectMember.do",
		data:{pjNo:pjNo,
			  loginId:loginId},
		success:function(data){
			if(data > 0){
				alert("프로젝트에서 나가기 되었습니다.");
        		location.replace("${path }/project/projectList.do");
			}else{
				alert("나가기에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});
}

//프로젝트 나가기 - 관리자
function fn_changePjManager(pjNo, loginId, newManagerId){
	$.ajax({
		url:"${path}/selectedProject/updateProjectManager.do",
		data:{pjNo:pjNo,
			  loginId:loginId,
			  newManagerId:newManagerId},
		success:function(data){
			if(data > 0){
				alert(newManagerId+"님으로 관리자 변경 후 프로젝트에서 나가기 되었습니다.");
        		location.replace("${path }/project/projectList.do");
			}else{
				alert("나가기에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});
}

//프로젝트 수정
function fn_updateProjectSubmit(){
    // Get form
    var form = $('#updateProjectForm')[0];

    // Create an FormData object 
    var data = new FormData(form);

    $.ajax({
        type: "POST",
        url: "${path}/selectedProject/updateSelectedProject.do",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {        	
        	if(data>0){
        		alert("프로젝트가 수정되었습니다.");
        		location.reload(true);
        	}else{
        		alert("프로젝트가 정상적으로 수정되지않았습니다. 다시 시도해주세요.");
        	}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("프로젝트가 정상적으로 수정되지않았습니다. 다시 시도해주세요.");
        }
    });	
}

//북마크 설정
function fn_insertBookmark(e,bNo,loginId){
	$.ajax({
		url:"${path}/selectedProject/insertBookmark.do",
		data:{bNo:bNo,
			  loginId:loginId},
		success:function(data){
			if(data > 0){
        		location.reload(true);
			}else{
				alert("북마크설정에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});
}

//북마크 해제
function fn_deleteBookmark(e,bNo,loginId){
	$.ajax({
		url:"${path}/selectedProject/deleteBookmark.do",
		data:{bNo:bNo,
			  loginId:loginId},
		success:function(data){
			if(data > 0){
        		location.reload(true);
			}else{
				alert("북마크해제에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});
}

//고정글 설정
function fn_updatePin(check,pjNo,bNo){
	$.ajax({
		url:"${path}/selectedProject/updatePinPost.do",
		data:{check:check,
			  pjNo:pjNo,
			  bNo:bNo},
		success:function(data){
			if(data > 0){
        		location.reload(true);
			}else{
				alert("고정글 설정에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});
}

//댓글 쓰기 fn_insertCommentSubmit()
function fn_insertCommentSubmit(bNo){
    // Get form
    var form = $('#insertCommentForm'+bNo)[0];

    // Create an FormData object 
    var data = new FormData(form);

    $.ajax({
        type: "POST",
        url: "${path}/selectedProject/insertComment.do",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {        	
        	if(data>0){
        		var receiver = $(form[name="receiveId"]).val();
        		var msg = '[${projectInfo.PROJECTTITLE}] ${loginUser.userName}님이 댓글을 남겼습니다.<br>';
        		msg += "\""+$(form[name="comment"]).val()+"\"";
        		sendNotiMessage(receiver, msg);
        		location.reload(true);
        		
        		
        	}else{
        		alert("댓글이 정상적으로 등록되지않았습니다. 다시 시도해주세요.");
        	}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("fail");
        }
    });
}

//댓글 수정 fn_updateCommentSubmit()
function fn_updateCommentSubmit(type, cNo){
    // Get form
    var form = $('#updateCommentForm'+type+cNo)[0];

    // Create an FormData object 
    var data = new FormData(form);

    $.ajax({
        type: "POST",
        url: "${path}/selectedProject/updateComment.do",
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (data) {        	
        	if(data>0){
        		location.reload(true);
        	}else{
        		alert("댓글이 정상적으로 수정되지않았습니다. 다시 시도해주세요.");
        	}
        },
        error: function (e) {
            console.log("ERROR : ", e);
            alert("fail");
        }
    });
}

//댓글 삭제
function fn_deleteComment(type, bNo, cNo){
	$.ajax({
		url:"${path}/selectedProject/deleteComment.do",
		data:{type:type,
			  bNo:bNo,
			  cNo:cNo},
		success:function(data){
			if(data > 0){
        		location.reload(true);
			}else{
				alert("댓글 삭제에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});	
}


//파일 다운로드
function fn_fileDownload(pjNo,ori,rename){
	ori=encodeURIComponent(ori);
	location.href="${path}/selectedProject/fileDownload.do?pjNo="+pjNo+"&ori="+ori+"&rename="+rename;
}

//게시글 삭제
function fn_viewPostDelete(pjNo, bNo){
	$.ajax({
		url:"${path}/selectedProject/updateProjectBoardStatus.do",
		data:{pjNo:pjNo,
			  bNo:bNo},
		success:function(data){
			if(data > 0){
        		location.reload(true);
			}else{
				alert("게시글 삭제에 실패하였습니다. 다시 시도해주세요");
			}
		}
	});	
}



//파일 수정



</script>
