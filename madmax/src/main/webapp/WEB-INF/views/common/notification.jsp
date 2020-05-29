<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<link rel="stylesheet" href="${path }/resources/css/notification.css" >
        <div class="modal-dialog modal-dialog-scrollable modal-reposition">
            <div class="modal-content">
                <!-- Modal body -->
                <div class="modal-body notification-container">
                        <ul class="nav nav-pills">
                            <li class="nav-item m-2" id="btnUnread"><a class="nav-link active" href="#">미확인알림</a></li>
                            <li class="nav-item m-2"id="btnRead"><a class="nav-link" href="#">전체알림</a></li>
                        </ul>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="유저명, 프로젝트명으로 알림 검색 (enter)" id="findNoti">
                        </div>
                    <ul class="unread">
                    <c:if test="${empty unread }">
                    <li class="noti" style="text-align:center;">
                   		 <br>
                   	 	<span style="text-align:center; color:blue"><b>새로운 알림이 없습니다.</b></span>
                    </li>
                    </c:if>
                    <c:if test="${unread!=null }">
                    	<c:forEach items="${unread }" var="r">
                        <li class="noti-li">
                            <div class="noti-info" id="${r.notNo}/${r.projectNo}/${r.boardNo}" onclick="readNewNoti(this);">
                                <div class="noti-profile">
                                    <p><img src="${path }/resources/upload/profile/${r.profile }"></p>
                                </div>
                                <div class="noti-text">
                                    <ul>
                                        <li class="projectName">${r.projectTitle } </li>
                                        <li class="notiDate">
											<fmt:formatDate value="${r.notTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
										</li>
                                        <li class="senderName">${r.userName }님이 
                                        	<span class="sendMessage">
                                        	<c:if test="${r.notType eq 'writing' }">
												글 '<b>${r.writingTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'writingcomment' }">
											글 '<b>${r.writingTitle }</b>' 에 댓글을 달았습니다. 
											</c:if>
											<c:if test="${r.notType eq 'task'}">
												업무 '<b>${r.taskTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'taskcomment'}">
												업무 '<b>${r.taskTitle }</b>'에 댓글을 달았습니다. 
											</c:if>
											<c:if test="${r.notType eq 'schedule'}">
												일정 '<b>${r.scheduleTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'schedulecomment'}">
												일정 '<b>${r.scheduleTitle }</b>'에 댓글을 달았습니다. 
											</c:if>
											</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </c:if>
                    </ul>
                    <ul class="read">
                    <c:if test="${empty read }">
                    <li class="noti" style="text-align:center;">
                   		<br>
                    	<span style="text-align:center; color:blue"><b>새로운 알림이 없습니다.</b></span>
                    </li>
                    </c:if>
                    <c:if test="${read!=null }">
                    	<c:forEach items="${read }" var="r">
                        <li class="noti-li">
                            <div class="noti-info" id="${r.notNo}/${r.projectNo}/${r.boardNo}" onclick="readNoti(this);">
                                <div class="noti-profile">
                                    <p><img src="${path }/resources/upload/profile/${r.profile }"></p>
                                </div>
                                <div class="noti-text">
                                    <ul>
                                        <li class="projectName">${r.projectTitle } </li>
                                        <li class="notiDate">
											<fmt:formatDate value="${r.notTime }" type="both" pattern="yyyy-MM-dd HH:mm:ss"/>
										</li>
                                        <li class="senderName">${r.userName }님이 
                                        	<span class="sendMessage">
                                        	<c:if test="${r.notType eq 'writing' }">
												글 '<b>${r.writingTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq'writingcomment' }">
											글 '<b>${r.writingTitle }</b>'에 댓글을 달았습니다. </c:if>
											<c:if test="${r.notType eq 'task'}">
												업무 '<b>${r.taskTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'taskcomment'}">
												업무 '<b>${r.taskTitle }</b>'에 댓글을 달았습니다. 
											</c:if>
											<c:if test="${r.notType eq 'schedule'}">
												일정 '<b>${r.scheduleTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'schedulecomment'}">
												일정 '<b>${r.scheduleTitle }</b>'에 댓글을 달았습니다. 
											</c:if>
											</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </c:if>
                    </ul>
                    <ul class="find">
 
                    </ul>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-primary" style="position:relative; right:53%"
                    onclick="readAllNoti();">모두읽음</button>
                    <button type="button" class="btn btn-outline-primary" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    
<script>
	$(function(){
		$(".read").hide();
		$(".find").hide();
	});
	
    $("#btnUnread").on("click", openUnread);
    $("#btnRead").on("click",openRead);
    $("#findNoti").on("keyup",findNoti);
    
    function openUnread(){
        if($("#btnUnread").children().hasClass("active")){
            return;
        }else{
            $("#btnRead").children().removeClass("active");
            $("#btnUnread").children().addClass("active");
            $(".read").hide();
            $(".find").hide();
            $(".unread").show();
        }

    }

    function openRead(){
        if($("#btnRead").children().hasClass("active")){
            return;
        }else{
            $("#btnUnread").children().removeClass("active");
            $("#btnRead").children().addClass("active");
            $(".unread").hide();
            $(".find").hide();
            $(".read").show();
        }

    }
    
     function readAllNoti(){
    	$.ajax({
    		url:"${path}/noti/readAllNoti",
    		data:{userId:"${loginUser.userId}"},
    		success:(data)=>{
    			alert(data.msg);
    			location.reload();
    		}
    	})
    } 

    function findNoti(){
    	 if (window.event.keyCode == 13) {
	    	var keythis = $("#findNoti").val();
	    	$.ajax({
	    		url:"${path}/noti/findNoti?userId=${loginUser.userId}",
	    		data:{keyword:keythis},
	    		dataType:"html",
	    		success:(data)=>{
	                $("#btnUnread").children().removeClass("active");
	                $("#btnRead").children().removeClass("active");
	    			$(".find").html(data);
	                $(".read").hide();
	                $(".unread").hide();
	                $(".find").show();
	    		}
	    	});
    	 }
    }
    
    function readNewNoti(e){
    	//console.log(e.id);    // notNo/projectNo/boardNo 순으로 들어옴
    	var nNo=e.id.split('/')[0];
    	var pNo=e.id.split('/')[1];
    	var bNo=e.id.split('/')[2];
      	$.ajax({
    		url:"${path}/noti/updateUnreadNotification?notNo="+nNo,
    		success:(data)=>{
    			location.assign('${path}/selectedProject/selectedProject.do?pjNo='+pNo+'&loginId=${loginUser.userId}&boardNo='+bNo);
    		}
    	})  
    }
    
    function readNoti(e){
    	var nNo=e.id.split('/')[0];
    	var pNo=e.id.split('/')[1];
    	var bNo=e.id.split('/')[2];
    	location.assign('${path}/selectedProject/selectedProject.do?pjNo='+pNo+'&loginId=${loginUser.userId}&boardNo='+bNo);
    }

</script>