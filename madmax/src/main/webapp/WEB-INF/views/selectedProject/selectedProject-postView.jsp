<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
					
			<c:forEach items="${projectBoardList}" var="pb">

			<c:set var="bookmark" value="N" />
			<c:forEach var="b" items="${bookmarkList}">
			  <c:if test="${pb.BOARDNO eq b.BOARDNO}">
			    <c:set var="bookmark" value="Y" />
			  </c:if>
			</c:forEach>
			
			
                <div class="w-100 bg-white border border-grey rounded overflow-hidden mb-3">                

					<!-- 1. 글 -->
					<c:if test="${pb.BOARDTYPE eq 'W'}">
                    <c:forEach items="${writingList }" var="w">
                    <c:if test='${pb.BOARDNO==w.BOARDNO}'>
                    <div class="pjViewBox w-100 p-3">                              
                        <div class="viewBundle w-100 bg-white rounded p-3">

                            <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
                            <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
                                <div class=" w-100 d-flex align-items-center">
                                    <div class="profileImgDiv">
                                        <img src="${path}/resources/images/defaultProfile.png" alt="프로필사진"/>
                                    </div>
                                    <div class="d-flex flex-column ml-2">
                                        <strong>
                                        	<c:forEach items="${projectMember}" var="pm">
                                        	<c:if test="${w.WRITINGID==pm.userId}">
                                        		<c:out value="${pm.userName}"/>
                                        	</c:if>
                                        	</c:forEach>
                                       	</strong>
                                        <p class="m-0" style="font-size: small;">
                                        	<fmt:formatDate value="${w.WRITINGTIME}" pattern="yyyy-MM-dd KK:mm:ss"/>
                                        </p>
                                    </div>                        
                                </div>
                                <div class="d-flex align-items-center">
                                	<c:if test="${bookmark eq 'N'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_insertBookmark(this,${pb.BOARDNO},'${loginUser.userId}');">
                                        <i class="fas fa-bookmark stoolGrey" style="font-size: 25px;"></i>
                                    </button>    
                                    </c:if>      
                             	
                                	<c:if test="${bookmark eq 'Y'}">                         
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_deleteBookmark(this,${pb.BOARDNO},'${loginUser.userId}');">
                                        <i class="fas fa-bookmark stoolDarkBlue-text" style="font-size: 25px;"></i>
                                    </button>                  
                                    </c:if> 
                                    
                                	<!-- 관리자만 보임 -->
                                	<c:if test="${projectInfo.USERID==loginUser.userId}">
                                	<c:if test="${pb.PINPOST eq 'Y'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_updatePin('N',${pb.PROJECTNO},${pb.BOARDNO});">
                                        <i class="fas fa-thumbtack stoolDarkBlue-text" style="font-size: 25px;"></i>
                                    </button>  
                                    </c:if>   
                                	<c:if test="${pb.PINPOST eq 'N'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_updatePin('Y',${pb.PROJECTNO},${pb.BOARDNO});">
                                        <i class="fas fa-thumbtack stoolGrey" style="font-size: 25px;"></i>
                                    </button>  
                                    </c:if>   
                                    </c:if>    
                                    <!-- 글 작성자만 보임 -->
                                    <c:if test="${w.WRITINGID==loginUser.userId}">                                   
                                    <div class="dropdown">
                                        <button type="button" class="btn dropdown-toggle justify-content-center align-items-center p-0" data-toggle="dropdown">
                                            <i class="fas fa-bars stoolDarkBlue-text" style="font-size: 25px;" aria-hidden="true"></i>
                                        </button>
                                        <div class="dropdown-menu dropR" style="min-width: 120px;">
                                            <a class="dropdown-item text-center" onclick="fn_viewPostUpdate()" style="cursor: pointer;">수정</a>
                                            <a class="dropdown-item text-center" onclick="fn_viewPostDelete()" style="cursor: pointer;">삭제</a>
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                            </div>  
                            <!--★ 상단공통  끝 -------------------------------------------------------------------------------------------------------------------->


                            <!-- 1) 글 시작  ----------------------------------------------------------------------------------------------------------------------->
                            <div class="pjViewBody w-100 flex-column pl-3 pr-3">
                                <h5 class="m-0 font-weight-bolder mb-4">
                                	<c:out value="${w.WRITINGTITLE}"/>
                                </h5> <!-- 글 제목 -->
                                <div class="w-100 pjView-content"> <!-- 게시글 내용 -->
				                	<c:out value="${w.WRITINGCONTENT}"/>                    
                                </div>
                            </div> 
                            <!-- 1) 글 끝  ------------------------------------------------------------------------------------------------------------------------>
                            

                            <!--★ 하단공통  ----------------------------------------------------------------------------------------------------------------------->       
                            <div class="w-100 mt-4">      
                                <div class="col-12 mb-3">
                                	<!-- ※※※ collapse div의 변수를 반드시 다르게 주어야합니다!! -->
                                    <button class="btn stoolDarkBlue-btn-outline mr-2" type="button" data-toggle="collapse" data-target="#collapseW${pb.BOARDNO}" aria-expanded="false" aria-controls="collapseExample"
                                            onclick="addBtniconChange(this);">
                                       	 추가항목보기 <i class="fas fa-plus stoolDarkBlue-text ml-2" style="font-size:20px;"></i>
                                    </button> 
                                    <span class="stoolGrey">태그 / 언급 / 첨부파일을 보시려면 클릭하세요</span>
                                </div>

                                <div class="collapse" id="collapseW${pb.BOARDNO}"> 
                                    <!-- 공통) 태그 & 언급 -->
									<c:set var="hashTagCk" value="N"/>
                                    <div class="col-12 addTagListBox mb-2">
                                        <div class="w-100 d-flex flex-column">
                                            <strong class="mb-2">태그</strong>
                                            <div class="w-100 d-flex flex-wrap align-items-center addTagList">
                                            <c:forEach items="${hashTag}" var="ht">
											<c:if test="${w.BOARDNO==ht.BOARDNO}">
											<c:set var="hashTagCk" value="Y" />
                                                <div class="d-flex ml-2 mr-2">
                                                    <span style='color:#25558F; font-weight: bold;'>#</span>
                                                    <span class="">${ht.HASHTAGTEXT}</span>
                                                </div>
		                                    </c:if>
		                                    </c:forEach>
		                                    <c:if test="${hashTagCk eq 'N'}">
		                                        <div class="d-flex ml-2 mr-2 stoolGrey">
													태그가 없습니다.
                                                </div>
		                                    </c:if>
                                            </div>
                                        </div>
                                        <hr class="w-100">
                                    </div>  <!-- 태그 입력 끝 --> 
                                    <!-- 언급 입력 -->
									<c:set var="notificationCk" value="N" />

                                    <div class="col-12 addMentionListBox mb-2">                           
                                        <div class="d-flex flex-column justify-content-center">
                                            <strong class="mr-2 mb-1">언급된 참여자</strong>                                        
                                            <div class="d-flex align-items-center">
                                            <c:forEach items="${notification}" var="n">
											<c:if test="${ (w.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'writing')}">
											<c:set var="notificationCk" value="Y" />
                                                <div id="mentionListBox" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
                                                    </div>
                                                    <c:forEach items="${projectMember}" var="pm">
                        							<c:if test="${pm.userId eq n.RECEIVEID}">
                                                    <span><c:out value="${pm.userName}"/></span>
                                                    </c:if>
                                                    </c:forEach>
                                                </div>
											</c:if>
											</c:forEach>
											<c:if test="${notificationCk eq 'N'}">
		                                        <div class="d-flex ml-2 mr-2 stoolGrey">
													언급된 참여자가 없습니다.
                                                </div>								
											</c:if>
                                            </div>
                                        </div>
                                        <hr class="w-100">
                                    </div>  <!-- 언급 입력 끝 -->    
                                    <!-- 공통) 파일 미리보기 (※일정은 첨부파일이 없으니 분기처리) -->
									<c:set var="attachmentCk" value="N" />

                                    <div id="uploadFilesPreview" class="col-12 mb-2">
                                        <strong class="mb-2">업로드 파일</strong>
                                      
                                        <div class="col-12 d-flex flex-column mb-2">
                                            <!-- <p  class="align-items-center m-0 pl-1">
                                                <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
                                               	첨부이미지
                                            </p> -->
                                            <div class="w-100 d-flex justify-content-center">
                                                <div class="w-100 row">
                                                    <c:forEach var="wai" items="${writingAttachment}">
                                        			<c:if test="${wai.WRITINGNO==w.WRITINGNO}">
                                        			<c:set var="attachmentCk" value="Y" />
                                        			<c:set var = "splitText" value = "${fn:split(wai.WRITINGRENAME,'_')}"/>
                                        			<c:if test="${splitText[0] eq 'img'}">
                                                    <div class='col-2 p-1' style='height: 150px;'>
                                                        <div class='imgPreview h-100' onclick="fn_fileDownload(${projectInfo.PROJECTNO},'${wai.WRITINGORINAME}','${wai.WRITINGRENAME}');">
                                                            <img src='${path}/resources/upload/selectedProject${pb.PROJECTNO}/${wai.WRITINGRENAME}'/> 
                                                        </div> 
                                                    </div>                            
                                                    </c:if>                                
                                                    </c:if>                                
                                        			</c:forEach>                                                    
                                                </div>
                                            </div>
                                        </div>
                        			
                                        <div class="col-12 d-flex flex-column">
                                            <!-- <p class="align-items-center m-0 pl-1">
                                                <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
                                               	첨부파일
                                            </p>  -->                                       
                                            <div class="w-100 d-flex justify-content-center">
                                                <div class="fileDownBox w-100 row">
                                                    <c:forEach var="waf" items="${writingAttachment}">
                                        			<c:if test="${waf.WRITINGNO==w.WRITINGNO}">
                                        			<c:set var="attachmentCk" value="Y" />
                                        			<c:set var = "splitText" value = "${fn:split(waf.WRITINGRENAME,'_')}"/>
                                        			<c:if test="${splitText[0] eq 'file'}">
                                                    <div class='col-4 p-1 w-100' style='height: 46px;'>
                                                        <div class='fileDownPreview w-100 h-100 pl-3 pr-3 d-flex justify-content-between align-items-center' 
                                                        	onclick="fn_fileDownload(${projectInfo.PROJECTNO},'${waf.WRITINGORINAME}','${waf.WRITINGRENAME}');">
                                                            <div class='d-flex align-items-center'>
                                                                <i class='fas fa-file text-info mr-2' style='font-size: 25px; color: #D0D0D4;'></i>
                                                                <span>
                                                                	<c:out value="${waf.WRITINGORINAME}"/>
                                                                </span>
                                                            </div>
                                                            <i class="fas fa-download" style="font-size: 20px; color: lightslategray;"></i>
                                                        </div>
                                                    </div>
													</c:if>                                
                                                    </c:if>                                
                                        			</c:forEach>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${attachmentCk eq 'N'}">
	                                        <div class="d-flex ml-2 mr-2 stoolGrey">
												첨부된 파일이 없습니다.
                                            </div>								
										</c:if>
                                        <div>
                                        </div>
                                    </div>  <!-- 공통) 파일 미리보기 끝 -->

                                </div> <!-- collapse 닫기 -->

                            </div>
                            <!--★ 하단공통 끝  --------------------------------------------------------------------------------------------------------------------->
    

                        </div><!-- viewBundle 닫기 -->



                        <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                        <!-- 수정할 때 추가 -->
                        <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->



                    </div><!-- viewBox 닫는 태그 -->
                    
                    <!--★☆★ 댓글 ------------------------------------------------------------------------------------------------------------------------->
                    <!-- 댓글 출력창 .댓글이 2개이상일경우 더보기로 보이도록 출력할것. -->
                    
                    <div class="w-100 p-3" style="background-color:#f6f7f8" id="comment">
                        <c:set var="count" value="0" />
                       	<c:forEach items="${writingComment}" var="wc">
                   	    	<c:if test="${w.WRITINGNO eq wc.WRITINGNO}">
                   	    		<c:set var="count" value="${count + 1}" />
                   	    	</c:if>
                       	</c:forEach>
                       	<c:if test="${count >= 2 }">
	                        <div class="mt-1">
	                            <p onclick="fn_displayHiddenComment(this);" class="m-0 font-weight-bolder stoolDarkBlue-text" style="cursor: pointer;">
	                                	이전 댓글 더보기
	                            </p>
	                        </div>
                        </c:if>
                        
                        <table class="borderSpacing">                         	
                        	<c:set var="inCount" value="0" />                        	                           
                            <c:forEach items="${writingComment}" var="wc" varStatus="status">                            
                            <c:if test="${w.WRITINGNO eq wc.WRITINGNO}">
                            	<c:set var="inCount" value="${inCount + 1}" />

                            <c:if test="${count != inCount}">
                            <tr class="hiddenComment d-none">
                            <c:forEach items="${projectMember}" var="pm">
                        	<c:if test="${pm.userId eq wc.WRITINGCOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${wc.WRITINGCOMMENTTIME}"/></span>
                                            </span>
                                            
                                            <div id="commentDiv${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
                                            	<c:out value="${wc.WRITINGCOMMENT}"/>
                                            	<c:if test="${wc.WRITINGCOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
		                                            		onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${wc.WRITINGCOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" name="comment" class="form-control" value="${wc.WRITINGCOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
						                                    <i class="fas fa-undo-alt" style="font-size:20px;"></i>
						                                </button>
						                            </div>   
						                        </form>  
											</div> 
                                        </div>
                                    </div>
                                </td>
                            </c:if>
                            </c:forEach>
                            </tr>  
                            </c:if>  
                                                                             
                            <c:if test="${count == inCount}">
                            <tr>
                            <c:forEach items="${projectMember}" var="pm">
                        	<c:if test="${pm.userId eq wc.WRITINGCOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${wc.WRITINGCOMMENTTIME}"/></span>
                                            </span>
                                            <div id="commentDiv${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
                                            	<c:out value="${wc.WRITINGCOMMENT}"/>
                                            	<c:if test="${wc.WRITINGCOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
															onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${wc.WRITINGCOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" name="comment" class="form-control" value="${wc.WRITINGCOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
						                                    <i class="fas fa-undo-alt" style="font-size:20px;"></i>
						                                </button>
						                            </div>   
						                        </form>  
											</div> 
                                        </div>
                                    </div>
                                </td>
                            </c:if>
                            </c:forEach>
                            </tr>  
                            </c:if>
                                 
                            </c:if>     
                                          
                        	</c:forEach>
                        </table>
                        <!-- 댓글 입력창 -->                        
                        <form method="post" id="insertCommentForm${pb.BOARDNO}">
                        	<!-- 총괄번호 -->
                        	<input type="hidden" name="boardNo" value="${pb.BOARDNO}"/>
                        	
                        	<!-- 게시글 작성자 아이디 -->
                        	<input type="hidden" name="receiveId" value="${w.WRITINGID}"/>
                        	
                        	<!-- 글 타입 -->
                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>
                        	
                        	<!-- 글 번호 -->
                        	<input type="hidden" name="postNo" value="${w.WRITINGNO}"/>
                        	
                        	<!-- 댓글작성자 아이디 -->
                        	<input type="hidden" name="senderId" value="${loginUser.userId}"/>
                        	
	                        <div class="d-flex mt-1">
	                            <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
	                                <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
	                            </div>
	                            <div class="pt-1 pb-1 d-flex" style="width: 95%;">
	                                <input type="text" name="comment" class="form-control" placeholder="댓글을 입력하세요" size="100px"/>
	                                <button type="submit" onclick="fn_insertCommentSubmit(${pb.BOARDNO});" class="ml-2" style="border: none; background: none;">
	                                    <i class='fas fa-edit' style='font-size:28px'></i>
	                                </button>
	                            </div>   
	                        </div> 
                        </form>  
                    </div>
                    <!--★☆★ 댓글 끝 ----------------------------------------------------------------------------------------------------------------------->
                    
                    
                	</c:if>
                	</c:forEach>   <!-- 타입별로 forEach 닫기 -->                	                	
                	</c:if>   <!-- 타입별로 forEach 닫기 -->    
                	
 <!-- ----------------------------------------------------------------------------------------------------- -->               	

					<!-- 2. 업무 -->
					<c:if test="${pb.BOARDTYPE eq 'T'}">
					<c:forEach items="${taskList}" var="t">
					<c:if test="${pb.BOARDNO==t.BOARDNO }">
                    <div class="pjViewBox w-100 p-3">                              
                        <div class="viewBundle w-100 bg-white rounded p-3">

                            <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
                            <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
                                <div class=" w-100 d-flex align-items-center">
                                    <div class="profileImgDiv">
                                        <img src="${path}/resources/images/defaultProfile.png" alt="프로필사진"/>
                                    </div>
                                    <div class="d-flex flex-column ml-2">
                                        <strong>
	                                      	<c:forEach items="${projectMember}" var="pm">
	                                        	<c:if test="${t.TASKID==pm.userId}">
	                                        		<c:out value="${pm.userName}"/>
	                                        	</c:if>
	                                        </c:forEach>
                                        </strong>
                                        <p class="m-0" style="font-size: small;">
                                            <fmt:formatDate value="${t.TASKTIME}" pattern="yyyy-MM-dd KK:mm:ss"/>
                                        </p>
                                    </div>                        
                                </div>
                                <div class="d-flex align-items-center">
                                	<c:if test="${bookmark eq 'N'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_insertBookmark(this,${pb.BOARDNO},'${loginUser.userId}');">
                                        <i class="fas fa-bookmark stoolGrey" style="font-size: 25px;"></i>
                                    </button>    
                                    </c:if>      
                             	
                                	<c:if test="${bookmark eq 'Y'}">                         
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_deleteBookmark(this,${pb.BOARDNO},'${loginUser.userId}');">
                                        <i class="fas fa-bookmark stoolDarkBlue-text" style="font-size: 25px;"></i>
                                    </button>                  
                                    </c:if> 
                                    
                                	<!-- 관리자만 보임 -->                                
                                	<c:if test="${projectInfo.USERID==loginUser.userId}">
                                	<c:if test="${pb.PINPOST eq 'Y'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_updatePin('N',${pb.PROJECTNO},${pb.BOARDNO});">
                                        <i class="fas fa-thumbtack stoolDarkBlue-text" style="font-size: 25px;"></i>
                                    </button>  
                                    </c:if>   
                                	<c:if test="${pb.PINPOST eq 'N'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_updatePin('Y',${pb.PROJECTNO},${pb.BOARDNO});">
                                        <i class="fas fa-thumbtack stoolGrey" style="font-size: 25px;"></i>
                                    </button>  
                                    </c:if>   
                                    </c:if>   
                                    <!-- 업무 작성자만 보임 --> 
                                    <c:if test="${t.TASKID==loginUser.userId}">                                   
                                    <div class="dropdown">
                                        <button type="button" class="btn dropdown-toggle justify-content-center align-items-center p-0" data-toggle="dropdown">
                                            <i class="fas fa-bars stoolDarkBlue-text" style="font-size: 25px;" aria-hidden="true"></i>
                                        </button>
                                        <div class="dropdown-menu dropR" style="min-width: 120px;">
                                            <a class="dropdown-item text-center" onclick="fn_viewPostUpdate()" style="cursor: pointer;">수정</a>
                                            <a class="dropdown-item text-center" onclick="fn_viewPostDelete()" style="cursor: pointer;">삭제</a>
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                            </div>  
                            <!--★ 상단공통  끝 -------------------------------------------------------------------------------------------------------------------->


                            <!-- 2) 업무 시작  --------------------------------------------------------------------------------------------------------------------->
                            <div class="pjViewBody w-100 d-flex flex-column pl-3 pr-3">
                                <h5 class="m-0 font-weight-bolder mb-4">
									<c:out value="${t.TASKTITLE}"/>
								</h5> <!-- 업무제목 -->
                                <div class="d-flex align-items-center">
                                    <strong class="mr-2">진행상태</strong> <!-- 업무 진행상태 -->
                                    <div class="btn-group border border-grey rounded overflow-hidden">
                                        <c:if test="${t.TASKSTATE eq '요청'}">
                                        	<button type="button" class="btn border-right btn-primary" disabled>
                                        </c:if>
                                        <c:if test="${t.TASKSTATE ne '요청'}">
                                        	<button type="button" class="btn border-right" id="request" onclick="fn_progressState(this, '요청');">
                                        </c:if>                                        
                                        	요청
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '진행'}">
                                        	<button type="button" class="btn border-right btn-success" disabled>
                                        </c:if>
                                     	<c:if test="${t.TASKSTATE ne '진행'}">
                                        	<button type="button" class="btn border-right" id="progress" onclick="fn_progressState(this, '진행');">
                                        </c:if>                                        
                                        	진행
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '피드백'}">
                                        	<button type="button" class="btn border-right btn-danger" disabled>
                                        </c:if>  
                                     	<c:if test="${t.TASKSTATE ne '피드백'}">
                                        	<button type="button" class="btn border-right" id="feedback" onclick="fn_progressState(this, '피드백');">
                                        </c:if>                                                                             	 
                                        	피드백
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '완료'}">
                                        	<button type="button" class="btn border-right btn-info" disabled>
                                        </c:if>                                        	
                                     	<c:if test="${t.TASKSTATE ne '완료'}">
                                        	<button type="button" class="btn border-right" id="end" onclick="fn_progressState(this, '완료');">
                                        </c:if>
                                        	완료
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '보류'}">
                                        	<button type="button" class="btn btn-secondary" disabled>
                                        </c:if>                                        	
                                     	<c:if test="${t.TASKSTATE ne '보류'}">
                                        	<button type="button" class="btn" id="hold" onclick="fn_progressState(this, '보류');">
                                        </c:if>                                           
                                        	보류
                                       	</button>
                                    </div>
                                </div>                        
                                <hr class="w-100 mt-1 mb-2">
                                <div class="d-flex align-items-center">
                                    <strong class="mr-2">담당자</strong>
                                    <!-- 담당자 프로필 for문 시작 -->
                                    <c:forEach var="tm" items="${taskManager}">                                    
                                    <c:if test="${t.TASKNO==tm.TASKNO }">
                                    <c:forEach items="${projectMember}" var="pm">
                                   	<c:if test="${tm.TASKMANAGERID==pm.userId}">
                                    <div class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2'>
                                        <div class='selectedWorker_imgDiv mr-2'>
                                            <img src="${path}/resources/images/defaultProfile.png"><!-- 여기서 해당 프로필 파일 어떻게 가져오는지? -->
                                        </div>
                                      	<sapn>
                                    		<c:out value="${pm.userName}"/>
                                     	</sapn>
                                    </div>
                                    </c:if>
                                    </c:forEach>
                                    </c:if>                  
                                    </c:forEach>                  
                                    <!-- 담당자 프로필 for문 끝 -->
                                </div>
                                <hr class="w-100 mt-1 mb-2">
                                <div class="d-flex align-items-center">
                                    <strong class="mr-2">시작일</strong>
                                    <p class="m-0">
                                    	<fmt:formatDate value="${t.TASKSTARTDATE}" pattern="yyyy-MM-dd"/>
                                    </p> <!-- 시작일 -->
                                </div>   
                                <hr class="w-100 mt-1 mb-2">
                                <div class="d-flex align-items-center">
                                    <strong class="mr-2">마감일</strong>
                                    <p class="m-0">
                                    	<fmt:formatDate value="${t.TASKENDDATE}" pattern="yyyy-MM-dd"/>
                                    </p> <!-- 종료일 -->
                                </div>  
                                <hr class="w-100 mt-1 mb-2">
                                <div class="d-flex align-items-center">
                                    <strong class="mr-2">우선순위</strong>
                                    <strong class="text-danger">
                                    	<c:out value="${t.TASKPRIORITY }"/>
                                    </strong> <!-- 우선순위 -->
                                </div>                         
                                <hr class="w-100 mt-1 mb-2">
                                <div class="w-100"> <!-- 업무 글 내용 -->
					            	<c:out value="${t.TASKCONTENT }"/>
                                </div>
                            </div>       
                            <!-- 2) 업무 끝 ------------------------------------------------------------------------------------------------------------------------>


                            <!--★ 하단공통  ----------------------------------------------------------------------------------------------------------------------->       
                            <div class="w-100 mt-4">      
                                <div class="col-12 mb-3">
                                	<!-- ※※※ collapse div의 변수를 반드시 다르게 주어야합니다!! -->
                                    <button class="btn stoolDarkBlue-btn-outline mr-2" type="button" data-toggle="collapse" data-target="#collapseW${pb.BOARDNO}" aria-expanded="false" aria-controls="collapseExample"
                                            onclick="addBtniconChange(this);">
                                       	 추가항목보기 <i class="fas fa-plus stoolDarkBlue-text ml-2" style="font-size:20px;"></i>
                                    </button> 
                                    <span class="stoolGrey">태그 / 언급 / 첨부파일을 보시려면 클릭하세요</span>
                                </div>

                                <div class="collapse" id="collapseW${pb.BOARDNO}"> 
                                    <!-- 공통) 태그 & 언급 -->
									<c:set var="hashTagCk" value="N"/>
                                    <div class="col-12 addTagListBox mb-2">
                                        <div class="w-100 d-flex flex-column">
                                            <strong class="mb-2">태그</strong>
                                            <div class="w-100 d-flex flex-wrap align-items-center addTagList">
                                            <c:forEach items="${hashTag}" var="ht">
											<c:if test="${t.BOARDNO==ht.BOARDNO}">
											<c:set var="hashTagCk" value="Y" />
                                                <div class="d-flex ml-2 mr-2">
                                                    <span style='color:#25558F; font-weight: bold;'>#</span>
                                                    <span class="">${ht.HASHTAGTEXT}</span>
                                                </div>
		                                    </c:if>
		                                    </c:forEach>
		                                    <c:if test="${hashTagCk eq 'N'}">
		                                        <div class="d-flex ml-2 mr-2 stoolGrey">
													태그가 없습니다.
                                                </div>
		                                    </c:if>
                                            </div>
                                        </div>
                                        <hr class="w-100">
                                    </div>  <!-- 태그 입력 끝 --> 
                                    <!-- 언급 입력 -->
									<c:set var="notificationCk" value="N" />

                                    <div class="col-12 addMentionListBox mb-2">                           
                                        <div class="d-flex flex-column justify-content-center">
                                            <strong class="mr-2 mb-1">언급된 참여자</strong>                                        
                                            <div class="d-flex align-items-center">
                                            <c:forEach items="${notification}" var="n">
											<c:if test="${ (w.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'task')}">
											<c:set var="notificationCk" value="Y" />
                                                <div id="mentionListBox" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
                                                    </div>
                                                    <c:forEach items="${projectMember}" var="pm">
                        							<c:if test="${pm.userId eq n.RECEIVEID}">
                                                    <span><c:out value="${pm.userName}"/></span>
                                                    </c:if>
                                                    </c:forEach>
                                                </div>
											</c:if>
											</c:forEach>
											<c:if test="${notificationCk eq 'N'}">
		                                        <div class="d-flex ml-2 mr-2 stoolGrey">
													언급된 참여자가 없습니다.
                                                </div>								
											</c:if>
                                            </div>
                                        </div>
                                        <hr class="w-100">
                                    </div>  <!-- 언급 입력 끝 -->    
                                    <!-- 공통) 파일 미리보기 (※일정은 첨부파일이 없으니 분기처리) -->
									<c:set var="attachmentCk" value="N" />

                                    <div id="uploadFilesPreview" class="col-12 mb-2">
                                        <strong class="mb-2">업로드 파일</strong>
                                      
                                        <div class="col-12 d-flex flex-column mb-2">
                                            <div class="w-100 d-flex justify-content-center">
                                                <div class="w-100 row">
                                                    <c:forEach var="tai" items="${taskAttachment}">
                                        			<c:if test="${tai.TASKNO==t.TASKNO}">
                                        			<c:set var="attachmentCk" value="Y" />
                                        			<c:set var = "splitText" value = "${fn:split(tai.TASKRENAME,'_')}"/>
                                        			<c:if test="${splitText[0] eq 'img'}">
                                                    <div class='col-2 p-1' style='height: 150px;'>
                                                        <div class='imgPreview h-100' onclick="fn_fileDownload(${projectInfo.PROJECTNO},'${tai.TASKORINAME}','${tai.TASKRENAME}');">
                                                            <img src='${path}/resources/upload/selectedProject${pb.PROJECTNO}/${tai.TASKRENAME}'/> 
                                                        </div> 
                                                    </div>                            
                                                    </c:if>                                
                                                    </c:if>                                
                                        			</c:forEach>                                                    
                                                </div>
                                            </div>
                                        </div>
                        			
                                        <div class="col-12 d-flex flex-column">                                     
                                            <div class="w-100 d-flex justify-content-center">
                                                <div class="fileDownBox w-100 row">
                                                    <c:forEach var="taf" items="${taskAttachment}">
                                        			<c:if test="${taf.TASKNO==t.TASKNO}">
                                        			<c:set var="attachmentCk" value="Y" />
                                        			<c:set var = "splitText" value = "${fn:split(taf.TASKRENAME,'_')}"/>
                                        			<c:if test="${splitText[0] eq 'file'}">
                                                    <div class='col-4 p-1 w-100' style='height: 46px;'>
                                                        <div class='fileDownPreview w-100 h-100 pl-3 pr-3 d-flex justify-content-between align-items-center' 
                                                        	onclick="fn_fileDownload(${projectInfo.PROJECTNO},'${taf.TASKORINAME}','${taf.TASKRENAME}');">
                                                            <div class='d-flex align-items-center'>
                                                                <i class='fas fa-file text-info mr-2' style='font-size: 25px; color: #D0D0D4;'></i>
                                                                <span>
                                                                	<c:out value="${taf.TASKRENAME}"/>
                                                                </span>
                                                            </div>
                                                            <i class="fas fa-download" style="font-size: 20px; color: lightslategray;"></i>
                                                        </div>
                                                    </div>
													</c:if>                                
                                                    </c:if>                                
                                        			</c:forEach>
                                                </div>
                                            </div>
                                        </div>

                                        <c:if test="${attachmentCk eq 'N'}">
	                                        <div class="d-flex ml-2 mr-2 stoolGrey">
												첨부된 파일이 없습니다.
                                            </div>								
										</c:if>
                                        <div>
                                        </div>
                                    </div>  <!-- 공통) 파일 미리보기 끝 -->

                                </div> <!-- collapse 닫기 -->

                            </div>
                            <!--★ 하단공통 끝  --------------------------------------------------------------------------------------------------------------------->
    

                        </div><!-- viewBundle 닫기 -->



                        <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                        <!-- 수정할 때 추가 -->
                        <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->



                    </div><!-- viewBox 닫는 태그 -->
                    
                    <!--★☆★ 댓글 ------------------------------------------------------------------------------------------------------------------------->
                    <!-- 댓글 출력창 .댓글이 2개이상일경우 더보기로 보이도록 출력할것. -->
                    
                    <div class="w-100 p-3" style="background-color:#f6f7f8" id="comment">
                        <c:set var="count" value="0" />
                       	<c:forEach items="${writingComment}" var="wc">
                   	    	<c:if test="${w.WRITINGNO eq wc.WRITINGNO}">
                   	    		<c:set var="count" value="${count + 1}" />
                   	    	</c:if>
                       	</c:forEach>
                       	<c:if test="${count >= 2 }">
	                        <div class="mt-1">
	                            <p onclick="fn_displayHiddenComment(this);" class="m-0 font-weight-bolder stoolDarkBlue-text" style="cursor: pointer;">
	                                	이전 댓글 더보기
	                            </p>
	                        </div>
                        </c:if>
                        
                        <table class="borderSpacing">                         	
                        	<c:set var="inCount" value="0" />                        	                           
                            <c:forEach items="${writingComment}" var="wc" varStatus="status">                            
                            <c:if test="${w.WRITINGNO eq wc.WRITINGNO}">
                            	<c:set var="inCount" value="${inCount + 1}" />

                            <c:if test="${count != inCount}">
                            <tr class="hiddenComment d-none">
                            <c:forEach items="${projectMember}" var="pm">
                        	<c:if test="${pm.userId eq wc.WRITINGCOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${wc.WRITINGCOMMENTTIME}"/></span>
                                            </span>
                                            
                                            <div id="commentDiv${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
                                            	<c:out value="${wc.WRITINGCOMMENT}"/>
                                            	<c:if test="${wc.WRITINGCOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
		                                            		onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${wc.WRITINGCOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" name="comment" class="form-control" value="${wc.WRITINGCOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
						                                    <i class="fas fa-undo-alt" style="font-size:20px;"></i>
						                                </button>
						                            </div>   
						                        </form>  
											</div> 
                                        </div>
                                    </div>
                                </td>
                            </c:if>
                            </c:forEach>
                            </tr>  
                            </c:if>  
                                                                             
                            <c:if test="${count == inCount}">
                            <tr>
                            <c:forEach items="${projectMember}" var="pm">
                        	<c:if test="${pm.userId eq wc.WRITINGCOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${wc.WRITINGCOMMENTTIME}"/></span>
                                            </span>
                                            <div id="commentDiv${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
                                            	<c:out value="${wc.WRITINGCOMMENT}"/>
                                            	<c:if test="${wc.WRITINGCOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
															onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${wc.WRITINGCOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${wc.WRITINGCOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${wc.WRITINGCOMMENTNO}" name="comment" class="form-control" value="${wc.WRITINGCOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${wc.WRITINGCOMMENTNO})">
						                                    <i class="fas fa-undo-alt" style="font-size:20px;"></i>
						                                </button>
						                            </div>   
						                        </form>  
											</div> 
                                        </div>
                                    </div>
                                </td>
                            </c:if>
                            </c:forEach>
                            </tr>  
                            </c:if>
                                 
                            </c:if>     
                                          
                        	</c:forEach>
                        </table>
                        <!-- 댓글 입력창 -->                        
                        <form method="post" id="insertCommentForm${pb.BOARDNO}">
                        	<!-- 총괄번호 -->
                        	<input type="hidden" name="boardNo" value="${pb.BOARDNO}"/>
                        	
                        	<!-- 게시글 작성자 아이디 -->
                        	<input type="hidden" name="receiveId" value="${w.WRITINGID}"/>
                        	
                        	<!-- 글 타입 -->
                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>
                        	
                        	<!-- 글 번호 -->
                        	<input type="hidden" name="postNo" value="${w.WRITINGNO}"/>
                        	
                        	<!-- 댓글작성자 아이디 -->
                        	<input type="hidden" name="senderId" value="${loginUser.userId}"/>
                        	
	                        <div class="d-flex mt-1">
	                            <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
	                                <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
	                            </div>
	                            <div class="pt-1 pb-1 d-flex" style="width: 95%;">
	                                <input type="text" name="comment" class="form-control" placeholder="댓글을 입력하세요" size="100px"/>
	                                <button type="submit" onclick="fn_insertCommentSubmit(${pb.BOARDNO});" class="ml-2" style="border: none; background: none;">
	                                    <i class='fas fa-edit' style='font-size:28px'></i>
	                                </button>
	                            </div>   
	                        </div> 
                        </form>  
                    </div>
                    <!--★☆★ 댓글 끝 ----------------------------------------------------------------------------------------------------------------------->
                    
                    
                	</c:if>
                	</c:forEach>   <!-- 타입별로 forEach 닫기 -->                	                	
                	</c:if>   <!-- 타입별로 forEach 닫기 -->       
                	
                	

					<!-- 3. 일정 -->
					<c:if test="${pb.BOARDTYPE eq 'S'}">
					<c:forEach items="${scheduleList }" var="s">
					<c:if test="${pb.BOARDNO == s.BOARDNO}">
                    <div class="pjViewBox w-100 p-3">                              
                        <div class="viewBundle w-100 bg-white rounded p-3">

                            <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
                            <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
                                <div class=" w-100 d-flex align-items-center">
                                    <div class="profileImgDiv">
                                        <img src="${path}/resources/images/defaultProfile.png" alt="프로필사진"/>
                                    </div>
                                    <div class="d-flex flex-column ml-2">
                                        <strong>
                                        	<c:forEach items="${projectMember}" var="pm">
	                                        	<c:if test="${s.SCHEDULEID==pm.userId}">
	                                        		<c:out value="${pm.userName}"/>
	                                        	</c:if>
                                        	</c:forEach>
                                        </strong>
                                        <p class="m-0" style="font-size: small;">
                                            <fmt:formatDate value="${s.SCHEDULETIME}" pattern="yyyy-MM-dd KK:mm:ss"/>
                                        </p>

                                    </div>                        
                                </div>
                                <div class="d-flex align-items-center">
                                	<c:if test="${bookmark eq 'N'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_insertBookmark(this,${pb.BOARDNO},'${loginUser.userId}');">
                                        <i class="fas fa-bookmark stoolGrey" style="font-size: 25px;"></i>
                                    </button>    
                                    </c:if>      
                             	
                                	<c:if test="${bookmark eq 'Y'}">                         
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_deleteBookmark(this,${pb.BOARDNO},'${loginUser.userId}');">
                                        <i class="fas fa-bookmark stoolDarkBlue-text" style="font-size: 25px;"></i>
                                    </button>                  
                                    </c:if> 
                                    
                                	<!-- 관리자만 보임 -->                                
                                	<c:if test="${projectInfo.USERID==loginUser.userId}">
                                	<c:if test="${pb.PINPOST eq 'Y'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_updatePin('N',${pb.PROJECTNO},${pb.BOARDNO});">
                                        <i class="fas fa-thumbtack stoolDarkBlue-text" style="font-size: 25px;"></i>
                                    </button>  
                                    </c:if>   
                                	<c:if test="${pb.PINPOST eq 'N'}">
                                    <button type="button" class="btn justify-content-center align-items-center pl-2 mr-3" onclick="fn_updatePin('Y',${pb.PROJECTNO},${pb.BOARDNO});">
                                        <i class="fas fa-thumbtack stoolGrey" style="font-size: 25px;"></i>
                                    </button>  
                                    </c:if>   
                                    </c:if>   
                                    <!-- 일정 작성자만 보임 -->  
                                    <c:if test="${s.SCHEDULEID==loginUser.userId}">                                   
                                    <div class="dropdown">
                                        <button type="button" class="btn dropdown-toggle justify-content-center align-items-center p-0" data-toggle="dropdown">
                                            <i class="fas fa-bars stoolDarkBlue-text" style="font-size: 25px;" aria-hidden="true"></i>
                                        </button>
                                        <div class="dropdown-menu dropR" style="min-width: 120px;">
                                            <a class="dropdown-item text-center" onclick="fn_viewPostUpdate()" style="cursor: pointer;">수정</a>
                                            <a class="dropdown-item text-center" onclick="fn_viewPostDelete()" style="cursor: pointer;">삭제</a>
                                        </div>
                                    </div>
                                    </c:if>
                                </div>
                            </div>  
                            <!--★ 상단공통  끝 -------------------------------------------------------------------------------------------------------------------->


                            <!-- 3) 일정 시작 ------------------------------------------------------------------------------------------------------------------------>
                            <div class="pjViewBody w-100 flex-column pl-3 pr-3">
                                <div class="pjViewBody-schedule w-100 d-flex flex-column p-3">
                                    <div class="w-100 row d-flex align-items-center">
                                        <div class="col-2 d-flex flex-column justify-content-center align-items-center">
                                            <p class="m-0 text-danger" style="font-size: 25px;"> <!-- 일정 실행일 : 월만 표기 -->
                                                <fmt:formatDate value="${s.SCHEDULETIME}" pattern="MM월"/>
                                            </p>
                                            <p class="m-0 font-weight-bolder" style="font-size: 40px;"> <!-- 일정 실행일 : 일만 표기 -->
                                            	<fmt:formatDate value="${s.SCHEDULETIME}" pattern="dd"/>  
                                            </p>
                                        </div>
                                        <div class="col-10 d-flex flex-column">
                                            <strong class="" style="font-size: 25px;">
                                            	<c:out value="${s.SCHEDULETITLE }"/>
                                            </strong> <!-- 일정제목 -->
                                            <hr class="w-100">
                                            <strong class="">
                                            	<fmt:formatDate value="${s.SCHEDULETIME}" dateStyle="long"/>
                                            </strong> <!-- 일정 실행일 -->
                                        </div>
                                    </div>
                                    <hr class="w-100">
                                    
                                    <div class="w-100 d-flex flex-column align-items-center">
                                        <div class="d-flex mb-3" style="width: 90%;">
                                            <i class="fas fa-map-marker-alt mr-2 stoolGrey" style="font-size: 25px;"></i>
                                            <p class="m-0">
                                            	<c:out value="${s.SCHEDULEPLACE }"/>
                                            </p>  <!-- 일정주소 -->
                                        </div>
                                        <div id="map${s.SCHEDULENO}" class="border" style="width: 90%; height: 300px;"> <!-- 지도가 들어가는 곳 -->
                                        </div>
                                    </div>
                                    <hr class="w-100">

                                    <div class="w-100 d-flex">
                                  		<i class="far fa-sticky-note mr-2 stoolGrey" style="font-size: 25px;"></i>
                                        <div class="ml-2">
                                        	<c:out value="${s.SCHEDULEMEMO }"/>
                                        </div> <!-- 글이 들어가는 곳 -->
                                    </div>
                                </div>
                            </div>
                            
                            	<!-- 지도 script ---->
								<script>
								var mapContainer${s.SCHEDULENO} = document.getElementById('map${s.SCHEDULENO}'), // 지도를 표시할 div 
								    mapOption${s.SCHEDULENO} = {
								        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
								        level: 3 // 지도의 확대 레벨
								    };  

								// 지도를 생성합니다    
								var map${s.SCHEDULENO} = new kakao.maps.Map(mapContainer${s.SCHEDULENO}, mapOption${s.SCHEDULENO}); 

								// 주소-좌표 변환 객체를 생성합니다
								var geocoder${s.SCHEDULENO} = new kakao.maps.services.Geocoder();

								// 주소로 좌표를 검색합니다
								geocoder${s.SCHEDULENO}.addressSearch('${s.SCHEDULEPLACE}', function(result, status) {

								    // 정상적으로 검색이 완료됐으면 
								     if (status === kakao.maps.services.Status.OK) {

								        var coords${s.SCHEDULENO} = new kakao.maps.LatLng(result[0].y, result[0].x);

								        // 결과값으로 받은 위치를 마커로 표시합니다
								        var marker${s.SCHEDULENO} = new kakao.maps.Marker({
								            map: map${s.SCHEDULENO},
								            position: coords${s.SCHEDULENO}
								        });

								        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
								        map${s.SCHEDULENO}.setCenter(coords${s.SCHEDULENO});
								    } 
								});   
								</script>                            	
                            	<!-- 지도 script 끝 -->
                            <!-- 3) 일정 끝 ------------------------------------------------------------------------------------------------------------------------>      


                            <!--★ 하단공통  ----------------------------------------------------------------------------------------------------------------------->       
                            <div class="w-100 mt-4">      
                                <div class="col-12 mb-3">
                                	<!-- ※※※ collapse div의 변수를 반드시 다르게 주어야합니다!! -->
                                    <button class="btn stoolDarkBlue-btn-outline mr-2" type="button" data-toggle="collapse" data-target="#collapseS${pb.BOARDNO}" aria-expanded="false" aria-controls="collapseExample"
                                            onclick="addBtniconChange(this)">
                                       	 추가항목보기 <i class="fas fa-plus stoolDarkBlue-text ml-2" style="font-size:20px;"></i>
                                    </button> 
                                    <span class="stoolGrey">태그 / 언급 / 첨부파일을 보시려면 클릭하세요</span>
                                </div>

                                <div class="collapse" id="collapseS${pb.BOARDNO}"> 
                                    <!-- 공통) 태그 & 언급 -->
                                    <c:forEach items="${hashTag }" var="i">
									<c:if test="${s.BOARDNO==i.BOARDNO}">
                                    <div class="col-12 addTagListBox mb-2">
                                        <div class="w-100 d-flex flex-column">
                                            <strong class="mb-2">태그</strong>
                                            <div class="w-100 d-flex flex-wrap align-items-center addTagList">
                                                <div class="d-flex ml-2 mr-2">
                                                    <span style='color:#25558F; font-weight: bold;'>#</span>
                                                    <span class="">${i.HASHTAGTEXT}</span>
                                                </div>
                                                <!-- <div class="d-flex ml-2 mr-2">
                                                    <span style='color:#25558F; font-weight: bold;'>#</span>
                                                    <span class="">태그넣기</span>
                                                </div> -->
                                            </div>
                                        </div>
                                        <hr class="w-100">
                                    </div>  <!-- 태그 입력 끝 -->     
                                    </c:if>
                                    </c:forEach>
                                    <!-- 언급 입력 -->
                                    <div class="col-12 addMentionListBox mb-2">                           
                                        <div class="d-flex flex-column justify-content-center">
                                            <strong class="mr-2 mb-1">언급된 참여자</strong>                                        
                                            <div class="d-flex align-items-center">
                                                <div id="mentionListBox" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
                                                    </div>
                                                    <span>김OO</span>
                                                </div>
                                                <div id="mentionListBox" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
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
                                                        	<!-- 아무 이미지나 넣어논 것! -->
                                                            <img src='${path}/resources/images/defaultProfile.png'/> 
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
                        <!-- 수정할 때 추가 -->
                        <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->



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
                	</c:if>
                	</c:forEach>   <!-- 타입별로 forEach 닫기 -->                	                	
                	</c:if>   <!-- 타입별로 forEach 닫기 -->                	                	
                	
                	
                </div>	<!-- greyBorder -->      
			</c:forEach>
                
                
                
                
                

<!-- 모달모음 ------------------------------------------------------------------------------------------------------------------------------->   
        
                    
            
<!-- 모달모음 끝 ---------------------------------------------------------------------------------------------------------------------------->                  