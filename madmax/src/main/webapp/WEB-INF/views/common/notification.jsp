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
                            <input type="text" class="form-control" placeholder="알림 검색" id="findNoti">
                        </div>
                    <ul class="unread">
                    <c:if test="${unread!=null }">
                    	<c:forEach items="${unread }" var="r">
                        <li class="noti-li">
                            <div class="noti-info">
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
											글 '<b>${r.writingTitle }</b>' 의 댓글에서 회원님을 언급했습니다.</c:if>
											<c:if test="${r.notType eq 'task'}">
												업무 '<b>${r.taskTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'taskcomment'}">
												업무 업무 '<b>${r.taskTitle }</b>'의 댓글
											</c:if>
											<c:if test="${r.notType eq 'schedule'}">
												일정 '<b>${r.scheduleTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'schedulecomment'}">
												일정 '<b>${r.scheduleTitle }</b>'의 댓글 에서 회원님을 언급했습니다.
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
                    <c:if test="${read!=null }">
                    	<c:forEach items="${read }" var="r">
                        <li class="noti-li">
                            <div class="noti-info">
                                <div class="noti-profile">
                                    <p><img src="${path }/resources/upload/profile/${r.profile }"></p>
                                </div>
                                <div class="noti-text">
                                    <ul>
                                    	<li>${r.notType }</li>
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
											글 '<b>${r.writingTitle }</b>' 의 댓글에서 회원님을 언급했습니다.</c:if>
											<c:if test="${r.notType eq 'task'}">
												업무 '<b>${r.taskTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'taskcomment'}">
												업무 업무 '<b>${r.taskTitle }</b>'의 댓글
											</c:if>
											<c:if test="${r.notType eq 'schedule'}">
												일정 '<b>${r.scheduleTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'schedulecomment'}">
												일정 '<b>${r.scheduleTitle }</b>'의 댓글 에서 회원님을 언급했습니다.
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
	})
    $("#btnUnread").on("click", openUnread);
    $("#btnRead").on("click",openRead);
    $("#findNoti").keydown(function(key) {
        if (key.keyCode == 13) {
        	$("")
            $(".read").hide();
            $(".unread").hide();
            $(".find").show();
        }
    });
    
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
    
/*     function readAllNoti(){
    	$.ajax({
    		url:"${path}/noti/readAllNoti",
    		
    	})
    } */

    function findNoti(){
    	$.ajax({
    		
    	});
    }

</script>