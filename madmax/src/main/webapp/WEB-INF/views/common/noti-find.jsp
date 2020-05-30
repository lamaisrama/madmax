<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>

                    <c:if test="${empty find }">
                    <li class="noti" style="text-align:center;">
                    	<br>
                    	<span style="text-align:center; color:blue"><b>검색 결과가 없습니다.</b></span>
                    </li>
                    </c:if>
                    <c:if test="${find!=null }">
                    	<c:forEach items="${find }" var="r">
                        <li class="noti-li">
                            <div class="noti-info" id="${r.notNo}/${r.projectNo}/${r.boardNo}" onclick="readNoti(this);">
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
												글 '<b>${r.writingTitle }</b>' 에 댓글을 달았습니다. 
											</c:if>
											<c:if test="${r.notType eq 'task'}">
												업무 '<b>${r.taskTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'taskcomment'}">
												업무 '<b>${r.taskTitle }</b>' 에 댓글을 달았습니다. 
											</c:if>
											<c:if test="${r.notType eq 'schedule'}">
												일정 '<b>${r.scheduleTitle }</b>' 에서 회원님을 언급했습니다.
											</c:if>
											<c:if test="${r.notType eq 'schedulecomment'}">
												일정 '<b>${r.scheduleTitle }</b>' 에 댓글을 달았습니다. 
											</c:if>
											</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </li>
                        </c:forEach>
                    </c:if>