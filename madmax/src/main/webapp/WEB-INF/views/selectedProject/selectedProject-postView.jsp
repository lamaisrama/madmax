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
                    
                    <div id="viewBoxDiv${pb.BOARDNO}">
                    
                    <div class="pjViewBox w-100 p-3" value="p${pb.BOARDNO}">                             
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
                                            <a class="dropdown-item text-center" onclick="fn_viewPostUpdate(${pb.BOARDNO})" style="cursor: pointer;">수정</a>
                                            <a class="dropdown-item text-center" onclick="fn_viewPostDelete(${projectInfo.PROJECTNO},${pb.BOARDNO})" style="cursor: pointer;">삭제</a>
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
                    </div>
                    
                    
                    <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                    <!-- 1. 글 수정 -->
                <div id="postUpdateFormDiv${pb.BOARDNO}" class="d-none">
	 				<form method="post" enctype="multipart/form-data" onkeydown="return captureReturnKey(event);" id="postUpdateForm${pb.BOARDNO}">
	                <!-- from 공통 hidden input모음 -->
					    <!-- 0) 게시글 번호 -->
					    <input type="hidden" name="projectBoardNo" value="${pb.BOARDNO}"/>    
					    <!-- 1) 프로젝트 번호 저장 -->
					    <input type="hidden" name="selectedProjectNo" value="${projectInfo.PROJECTNO}"/>    
	                    <!-- 2) 글 타입 -->
	                    <input type="hidden" name="boardType" id="boardType" value="${pb.BOARDTYPE}"/>
	                    <!-- 3) 게시글 번호 (ex : writingNo) -->
	                    <input type="hidden" name="postNo" value="${w.WRITINGNO}"/>
	                    <!-- 4) 작성자 -->
	                    <input type="hidden" name="writer" value="${w.WRITINGID}"/>
	                    
	                    <!-- 5) 파일 -->                
	                    <input type="file" name="newFiles" id="newFiles${pb.BOARDNO}" multiple style="display: none;" class="newFiles"
	                    	onchange="fn_handleFilesSelect_update(${pb.BOARDNO});"/>
	                    <!-- 6) 이미지파일 -->
	                    <input type="file" name="newImgFiles" id="newImgFiles${pb.BOARDNO}" multiple style="display: none;" accept="image/*" class="newImgFiles"/>
	                    <!-- 7) 태그 -->
	                    <input type="hidden" name="deleteTagListStr" id="deleteTagListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="newTagListStr" id="newTagListStr${pb.BOARDNO}"/>
	                    <!-- 8) 언급 -->
	                    <input type="hidden" name="deleteMentionListStr" id="deleteMentionListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="newMentionListStr" id="newMentionListStr${pb.BOARDNO}"/>
	                <!-- from 공통 hidden input모음 끝 -->
	
	                    <div id="pjUpdateWriteBox" class="w-100">

	                            <div id="writeCategory-board" class="row w-100 m-0">
	                                <div id="boardContainer" class="w-100 p-3">
	                                    <div id="boardTitleBox" class="col-12 d-flex justify-content-center mt-3 mb-2">
	                                        <input name="writingTitle" id="writingTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
	                                            type="text" value="${w.WRITINGTITLE}" maxlength="100" autocomplete="off" style="overflow:visible;">
	                                    </div>
	                                    <div id="boardContentBox" class="col-12 d-flex flex-column justify-content-center">
	                                        <div id="boardContentAreaDiv" class="w-100">
	                                            <textarea id="boardContentArea" name="writingContent" 
	                                            	class="w-100 border-0 contentArea" style="resize: none; visibility: visible;" >${w.WRITINGCONTENT}</textarea>
	                                        </div>
	                                    </div>                                                                 
	                                </div>
	                        	</div>     
	
	                        <!-- 공통 하단 -->                        
	                        <div class="w-100 p-3">
	                            <!-- 공통) 태그 & 언급 -->
	                            <!-- 태그 입력 -->
	                            <div class="col-12 addTagListBox mb-2">
	                                <div class="w-100 d-flex flex-column">
	                                    <strong class="mb-2">태그</strong>
	                                    <div class="w-100 d-flex flex-wrap align-items-center addTagList_update">
	                                    
	                                    <c:forEach items="${hashTag}" var="ht">
											<c:if test="${w.BOARDNO==ht.BOARDNO}">
											<input type="hidden" name="oriTags${ht.BOARDNO}" value="${ht.HASHTAGTEXT}"/>
                                                <p class='selectedTag m-0 pl-2 pr-2 font-weight-bolder d-flex align-items-center'>
													<span style='color:#25558F;'>#</span>
													<span class='tagText'>${ht.HASHTAGTEXT}</span>
													<i class='fas fa-minus-circle stoolGrey ml-2' onclick='fn_deleteTag_update(this,${ht.BOARDNO},${ht.HASHTAGNO})'></i>
												</p>
		                                    </c:if>
	                                    </c:forEach>		                                    
                                    
	                                        <div class="d-flex addTagInputDiv pl-2 pr-2 ml-2">
	                                            # <input type="text" onkeyup="fn_addTag_update(this,${w.BOARDNO})" placeholder="태그입력"/>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
	                                
	                            	<!-- 중복확인용 태그문자열 -->
	                            	<input type="hidden" id="checkTagStr${w.BOARDNO}" value=""/>
	                            	
	                                <hr class="w-100">
	                            </div>  <!-- 태그 입력 끝 -->     
	                            
	                            
	                            <!-- 언급 입력 -->
	                            <div class="col-12 addMentionListBox mb-2">                             
	                                <div class="w-100 d-flex flex-column">
	                                    <strong class="mb-1">언급할 참여자 추가</strong>
	                                    <div id="" class="w-100 d-flex flex-wrap align-items-center addMentionList_update">
	                                        <c:forEach items="${notification}" var="n">
											<c:if test="${ (w.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'writing')}">
											<input type="hidden" name="oriMentions${n.BOARDNO}" value="${n.RECEIVEID}"/>
                                                <div id="" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
                                                    </div>
                                                    <c:forEach items="${projectMember}" var="pm">
                        							<c:if test="${pm.userId eq n.RECEIVEID}">
                                                    <span><c:out value="${pm.userName}"/></span>
                                                    <button type="button" onclick="fn_deleteMentionListStr(this, ${n.BOARDNO}, '${n.RECEIVEID}');" class="p-0 ml-2">
                            							<i class='fas fa-minus-circle stoolPink'></i>
                            						</button>
                                                    </c:if>
                                                    </c:forEach>
                                                </div>
											</c:if>
											</c:forEach>
	                                        <button type="button" id="mentionModalBtn" class="btn stoolDarkBlue-outline m-1 mt-0" onclick="$('#addMentionModal_update${pb.BOARDNO}').modal('show');">언급 추가</button>                       
	                                    </div>
	                                </div>
	                                
	                            	<!-- 중복확인용 언급문자열 -->
	                            	<input type="hidden" id="checkMentionStr${w.BOARDNO}" value=""/>
	                            		                                
	                                <hr class="w-100">
	                            </div>  <!-- 언급 입력 끝 -->    
	
	                            <!-- 공통) 파일 미리보기 -->
	                            <div id="" class="col-12 mb-2">
	                                <strong class="mb-2">업로드 파일</strong>
	                                <div class="col-12 d-flex flex-column mb-2">
	                                    <p id="imgFilesPreviewTitle" class="d-none align-items-center m-0 pl-1">
	                                        <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
	                                        	첨부이미지
	                                    </p>
	                                    <div id="oriImgFilesPreview_update${pb.BOARDNO}" class="w-100 d-flex justify-content-center">
	                                        <div class="update_oriImgFileBox w-100 row">
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
	                                        
	                                        <!-- new 이미지 첨부파일 -->
	                                        <div class="update_newImgFileBox w-100 row d-none">
                                                  
	                                        </div>
	                                    </div>
	                                </div>

	                                
	                                <div class="col-12 d-flex flex-column">
	                                    <p id="updateFilesPreviewTitle" class="d-none align-items-center m-0 pl-1">
	                                        <i class="fas fa-file-upload stoolGrey" style="font-size: 20px;"></i>
	                                       	 첨부파일
	                                    </p>
	                                    <div id="oriFilesPreview_update" class="w-100 d-flex justify-content-center">
	                                        <div class="update_oriFileBox w-100 row">
                                                <c:forEach var="waf" items="${writingAttachment}">
                                       			<c:if test="${waf.WRITINGNO==w.WRITINGNO}">
                                       			<c:set var="attachmentCk" value="Y" />
                                       			<c:set var = "splitText" value = "${fn:split(waf.WRITINGRENAME,'_')}"/>
                                       			<c:if test="${splitText[0] eq 'file'}">                                       			
                                                   <div class='col-4 p-1 w-100' style='height: 46px;'>
                                                       <div class='filePreview_view w-100 h-100 pl-3 pr-3 d-flex justify-content-between align-items-center'>
                                                           <div class='d-flex align-items-center'>
                                                               <i class='fas fa-file text-info mr-2' style='font-size: 25px; color: #D0D0D4;'></i>
                                                               <span>
                                                               	<c:out value="${waf.WRITINGORINAME}"/>
                                                               </span>
                                                           </div>
                                                       </div>
                                                   </div>
												</c:if>                                
                                                   </c:if>                                
                                       			</c:forEach>
	                                        </div>
	                                        
	                                        <!-- new 첨부파일 -->
	                                        <div class="update_newFileBox w-100 row d-none">

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
	                                        <button type="button" class="btn mr-2 ml-2" id="updateFilesBtn" onclick="$('#newFiles${pb.BOARDNO}').click();">
	                                            <i class="fas fa-file-upload stoolGrey" style="font-size: 25px;"></i>
	                                        </button>
	                                        <!-- 이미지파일 업로드 -->                                    
	                                        <button type="button" class="btn" id="updateImgFilesBtn" onclick="$('#newImgFiles${pb.BOARDNO}').click();">
	                                            <i class="fas fa-images stoolGrey" style="font-size: 25px;"></i>
	                                        </button>
	                                    </div>
	                                </div>                                                                          
	                            </div>      
	                            <div class="col-7 w-100 d-flex align-items-center justify-content-end">                              
	                                <button type="button" onclick="fn_updateFormCancel(${pb.BOARDNO});" class="btn m-2 stoolDarkBlue">
	                                    	취소
	                                </button>                             
	                                <button type="submit" onclick="fn_updateSubmit(${pb.BOARDNO});" class="btn m-2 stoolDarkBlue">
	                                    	수정완료
	                                </button>    
	                            </div>                                                              
	                        </div>
						</div>
	                        
	                </form>                    
                </div>
                    <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->                    
                    
                    
                    
                	</c:if>
                	</c:forEach>   <!-- 타입별로 forEach 닫기 -->                	                	
                	</c:if>   <!-- 타입별로 forEach 닫기 -->    
                	
 <!-- ----------------------------------------------------------------------------------------------------- -->               	

					<!-- 2. 업무 -->
					<c:if test="${pb.BOARDTYPE eq 'T'}">
					<c:forEach items="${taskList}" var="t">
					<c:if test="${pb.BOARDNO==t.BOARDNO }">
					
					<div id="viewBoxDiv${pb.BOARDNO}">
					
                    <div class="pjViewBox w-100 p-3" value="p${pb.BOARDNO}">                              
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
                                            <a class="dropdown-item text-center" onclick="fn_viewPostUpdate(${pb.BOARDNO})" style="cursor: pointer;">수정</a>
                                            <a class="dropdown-item text-center" onclick="fn_viewPostDelete(${projectInfo.PROJECTNO},${pb.BOARDNO})" style="cursor: pointer;">삭제</a>
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
                                        	<button type="button" class="btn border-right" id="request" onclick="fn_progressState_viewUpdate(this, '요청',${pb.BOARDNO},${t.TASKNO});">
                                        </c:if>                                        
                                        	요청
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '진행'}">
                                        	<button type="button" class="btn border-right btn-success" disabled>
                                        </c:if>
                                     	<c:if test="${t.TASKSTATE ne '진행'}">
                                        	<button type="button" class="btn border-right" id="progress" onclick="fn_progressState_viewUpdate(this, '진행',${pb.BOARDNO},${t.TASKNO});">
                                        </c:if>                                        
                                        	진행
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '피드백'}">
                                        	<button type="button" class="btn border-right btn-danger" disabled>
                                        </c:if>  
                                     	<c:if test="${t.TASKSTATE ne '피드백'}">
                                        	<button type="button" class="btn border-right" id="feedback" onclick="fn_progressState_viewUpdate(this, '피드백',${pb.BOARDNO},${t.TASKNO});">
                                        </c:if>                                                                             	 
                                        	피드백
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '완료'}">
                                        	<button type="button" class="btn border-right btn-info" disabled>
                                        </c:if>                                        	
                                     	<c:if test="${t.TASKSTATE ne '완료'}">
                                        	<button type="button" class="btn border-right" id="end" onclick="fn_progressState_viewUpdate(this, '완료',${pb.BOARDNO},${t.TASKNO});">
                                        </c:if>
                                        	완료
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '보류'}">
                                        	<button type="button" class="btn btn-secondary" disabled>
                                        </c:if>                                        	
                                     	<c:if test="${t.TASKSTATE ne '보류'}">
                                        	<button type="button" class="btn" id="hold" onclick="fn_progressState_viewUpdate(this, '보류',${pb.BOARDNO},${t.TASKNO});">
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
                                    <div class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 mr-2'>
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
                                    <strong class="font-weight-bold">
                                    	<c:if test="${t.TASKPROIORITY eq '없음'}">
                                    		<span class="ml-3 d-flex align-items-center"><i class="fas fa-times stoolGrey mr-3" style="font-size:17px;"></i>없음</span>
                                    	</c:if>
                                    	<c:if test="${t.TASKPROIORITY eq '낮음'}">                                    	
                                            <span class="ml-3 d-flex align-items-center"><i class="fas fa-arrow-down text-success mr-3" style="font-size:17px;"></i>낮음</span>
                                        </c:if>
                                    	<c:if test="${t.TASKPROIORITY eq '보통'}"> 
                                            <span class="ml-3 d-flex align-items-center"><i class="fas fa-circle text-secondary mr-3" style="font-size:10px;"></i>보통</span>
                                        </c:if>
                                    	<c:if test="${t.TASKPROIORITY eq '높음'}">                                             
                                            <span class="ml-3 d-flex align-items-center"><i class="fas fa-arrow-up text-warning mr-3" style="font-size:17px;"></i>높음</span>
                                        </c:if>
                                    	<c:if test="${t.TASKPROIORITY eq '긴급'}">                                             
                                            <span class="ml-3 d-flex align-items-center"><i class="fas fa-arrow-up text-danger mr-3" style="font-size:17px;"></i>긴급</span>
                                        </c:if>                                            
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
											<c:if test="${ (t.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'task')}">
											<c:set var="notificationCk" value="Y" />
                                                <div id="mentionListBox" class="d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2">
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


                    </div><!-- viewBox 닫는 태그 -->
                    
                    <!--★☆★ 댓글 ------------------------------------------------------------------------------------------------------------------------->
                    <!-- 댓글 출력창 .댓글이 2개이상일경우 더보기로 보이도록 출력할것. -->
                    
                    <div class="w-100 p-3" style="background-color:#f6f7f8" id="comment">
                        <c:set var="count" value="0" />
                       	<c:forEach items="${taskComment}" var="tc">
                   	    	<c:if test="${t.TASKNO eq tc.TASKNO}">
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
                            <c:forEach items="${taskComment}" var="tc" varStatus="status">                            
                            <c:if test="${t.TASKNO eq tc.TASKNO}">
                            	<c:set var="inCount" value="${inCount + 1}" />

                            <c:if test="${count != inCount}">
                            <tr class="hiddenComment d-none">
                            <c:forEach items="${projectMember}" var="pm">
                        	<c:if test="${pm.userId eq tc.TASKCOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${tc.TASKCOMMENTTIME}"/></span>
                                            </span>
                                            
                                            <div id="commentDiv${pb.BOARDTYPE}${tc.TASKCOMMENTNO}">
                                            	<c:out value="${tc.TASKCOMMENT}"/>
                                            	<c:if test="${tc.TASKCOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${tc.TASKCOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
		                                            		onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${tc.TASKCOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${tc.TASKCOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${tc.TASKCOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${tc.TASKCOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${tc.TASKCOMMENTNO}" name="comment" class="form-control" value="${tc.TASKCOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${tc.TASKCOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${tc.TASKCOMMENTNO})">
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
                        	<c:if test="${pm.userId eq tc.TASKCOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${tc.TASKCOMMENTTIME}"/></span>
                                            </span>
                                            
                                            <div id="commentDiv${pb.BOARDTYPE}${tc.TASKCOMMENTNO}">
                                            	<c:out value="${tc.TASKCOMMENT}"/>
                                            	<c:if test="${tc.TASKCOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${tc.TASKCOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
		                                            		onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${tc.TASKCOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${tc.TASKCOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${tc.TASKCOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${tc.TASKCOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${tc.TASKCOMMENTNO}" name="comment" class="form-control" value="${tc.TASKCOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${tc.TASKCOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${tc.TASKCOMMENTNO})">
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
                        	<input type="hidden" name="receiveId" value="${t.TASKID}"/>
                        	
                        	<!-- 글 타입 -->
                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>
                        	
                        	<!-- 글 번호 -->
                        	<input type="hidden" name="postNo" value="${t.TASKNO}"/>
                        	
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
                    
                    </div> <!-- viewBoxDiv 닫는 태그 -->
                    
                    
                    
                    <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                    <!-- 2. 업무수정 -->
                <div id="postUpdateFormDiv${pb.BOARDNO}" class="d-none">
	 				<form method="post" enctype="multipart/form-data" onkeydown="return captureReturnKey(event);" id="postUpdateForm${pb.BOARDNO}">
	                <!-- from 공통 hidden input모음 -->
					    <!-- 0) 게시글 번호 -->
					    <input type="hidden" name="projectBoardNo" value="${pb.BOARDNO}"/>    
					    <!-- 1) 프로젝트 번호 저장 -->
					    <input type="hidden" name="selectedProjectNo" value="${projectInfo.PROJECTNO}"/>    
	                    <!-- 2) 글 타입 -->
	                    <input type="hidden" name="boardType" id="boardType" value="${pb.BOARDTYPE}"/>
	                    <!-- 3) 게시글 번호 (ex : writingNo) -->
	                    <input type="hidden" name="postNo" value="${t.TASKNO}"/>
	                    <!-- 4) 작성자 -->
	                    <input type="hidden" name="writer" value="${t.TASKID}"/>
	                    
	                    <!-- 5) 파일 -->                
	                    <input type="file" name="newFiles" id="newFiles${pb.BOARDNO}" multiple style="display: none;" class="newFiles"
	                    	onchange="fn_handleFilesSelect_update(${pb.BOARDNO});"/>
	                    <!-- 6) 이미지파일 -->
	                    <input type="file" name="newImgFiles" id="newImgFiles${pb.BOARDNO}" multiple style="display: none;" accept="image/*" class="newImgFiles"/>
	                    <!-- 7) 태그 -->
	                    <input type="hidden" name="deleteTagListStr" id="deleteTagListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="newTagListStr" id="newTagListStr${pb.BOARDNO}"/>
	                    <!-- 8) 언급 -->
	                    <input type="hidden" name="deleteMentionListStr" id="deleteMentionListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="newMentionListStr" id="newMentionListStr${pb.BOARDNO}"/>
	                <!-- from 공통 hidden input모음 끝 -->	                
	                                    
                    <!-- 업무 INPUT -->
	                    <!-- 담당자 -->
	                    <input type="hidden" name="newTMListStr" id="newTMListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="deleteTMListStr" id="deleteTMListStr${pb.BOARDNO}"/>
                    
	
	                    <div id="pjUpdateWriteBox" class="w-100">
	
	                        <!-- 작성 카테고리별 div -->
	                            <!-- 2) 업무 수정 -->
						<div id="writeCategory-task" class="row w-100 m-0">
                            <div id="taskBox" class="w-100 p-3">
                                <div id="taskTitleBox" class="col-12 d-flex justify-content-center mt-3 mb-3">
                                    <input name="taskTitle" id="taskTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        type="text" value="${t.TASKTITLE}" maxlength="100" autocomplete="off" style="overflow:visible;">
                                </div>
                                <div id="taskTabBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">진행상태</strong>
                                    <div id="taskTabBtns" class="btn-group border border-grey rounded overflow-hidden">                                    
                                        <input type="hidden" id="progressStateUpdate${pb.BOARDNO}" name="taskState" value="${t.TASKSTATE}"/>
                                        <c:if test="${t.TASKSTATE eq '요청'}">
                                        	<button type="button" class="btn border-right btn-primary" id="request${pb.BOARDNO}" onclick="fn_progressState_update(this, '요청', ${pb.BOARDNO});">
                                        </c:if>
                                        <c:if test="${t.TASKSTATE ne '요청'}">
                                        	<button type="button" class="btn border-right" id="request${pb.BOARDNO}" onclick="fn_progressState_update(this, '요청', ${pb.BOARDNO});">
                                        </c:if>                                        
                                        	요청
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '진행'}">
                                        	<button type="button" class="btn border-right btn-success" id="progress${pb.BOARDNO}" onclick="fn_progressState_update(this, '진행', ${pb.BOARDNO});">
                                        </c:if>
                                     	<c:if test="${t.TASKSTATE ne '진행'}">
                                        	<button type="button" class="btn border-right" id="progress${pb.BOARDNO}" onclick="fn_progressState_update(this, '진행', ${pb.BOARDNO});">
                                        </c:if>                                        
                                        	진행
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '피드백'}">
                                        	<button type="button" class="btn border-right btn-danger" id="feedback${pb.BOARDNO}" onclick="fn_progressState_update(this, '피드백', ${pb.BOARDNO});">
                                        </c:if>  
                                     	<c:if test="${t.TASKSTATE ne '피드백'}">
                                        	<button type="button" class="btn border-right" id="feedback${pb.BOARDNO}" onclick="fn_progressState_update(this, '피드백', ${pb.BOARDNO});">
                                        </c:if>                                                                             	 
                                        	피드백
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '완료'}">
                                        	<button type="button" class="btn border-right btn-info" id="end${pb.BOARDNO}" onclick="fn_progressState_update(this, '완료', ${pb.BOARDNO});">
                                        </c:if>                                        	
                                     	<c:if test="${t.TASKSTATE ne '완료'}">
                                        	<button type="button" class="btn border-right" id="end${pb.BOARDNO}" onclick="fn_progressState_update(this, '완료', ${pb.BOARDNO});">
                                        </c:if>
                                        	완료
                                       	</button>
                                     	<c:if test="${t.TASKSTATE eq '보류'}">
                                        	<button type="button" class="btn btn-secondary" id="hold${pb.BOARDNO}" onclick="fn_progressState_update(this, '보류', ${pb.BOARDNO});">
                                        </c:if>                                        	
                                     	<c:if test="${t.TASKSTATE ne '보류'}">
                                        	<button type="button" class="btn" id="hold${pb.BOARDNO}" onclick="fn_progressState_update(this, '보류', ${pb.BOARDNO});">
                                        </c:if>                                           
                                        	보류
                                       	</button>
                                    </div>
                                </div>
                                
                                
                                <!-- 중복확인용 언급문자열 -->
                            	<input type="hidden" id="checkTMStr${t.BOARDNO}" value=""/>
                                <div id="taskListBox" class="col-12 d-flex align-items-center mb-3 addTMList_update flex-nowrap">
                                    <strong class="mr-2">담당자</strong>
                                    <!-- 담당자 프로필 for문 시작 -->
                                    <c:forEach var="tm" items="${taskManager}">                                    
                                    <c:if test="${t.TASKNO==tm.TASKNO }">
                                    <c:forEach items="${projectMember}" var="pm">
                                   	<c:if test="${tm.TASKMANAGERID==pm.userId}">
                                   	
                                   	<input type="hidden" name="oriTMs${t.BOARDNO}" value="${tm.TASKMANAGERID}"/>
                                   	
                                    <div class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 mr-2'>
                                        <div class='selectedWorker_imgDiv mr-2'>
                                            <img src="${path}/resources/images/defaultProfile.png">
                                        </div>
                                      	<sapn>
                                    		<c:out value="${pm.userName}"/>
                                     	</sapn>
                                        <button type="button" onclick="fn_deleteTMListStr(this, ${t.BOARDNO},'${tm.TASKMANAGERID}');" class="p-0 ml-2">
                							<i class='fas fa-minus-circle stoolPink c-pointer'></i>
                						</button>                                     	
                                    </div>
                                    </c:if>
                                    </c:forEach>
                                    </c:if>                  
                                    </c:forEach>                  
                                    <!-- 담당자 프로필 for문 끝 -->            
                                    <button type="button" id="addWorker" class="btn stoolDarkBlue-outline m-1" onclick="$('#addWorkerModal_update${pb.BOARDNO}').modal('show');">담당자 추가</button>                       
                                </div>
                                <div id="taskStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date" name="taskStartdate" id="taskStartdate${pb.BOARDNO}" class="stoolDateInput" value="${t.TASKSTARTDATE}"/>
                                </div>   
                                <div id="taskEndDateBox" class="col-12 d-flex align-items-center mb-3 taskEndDate_update">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date" name="taskEnddate" id="taskEnddate${pb.BOARDNO}" class="stoolDateInput" value="${t.TASKENDDATE}"/>
                                </div>  
                                <div id="priorityBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">우선순위</strong>
                                    <input type="hidden" id="taskPriority${pb.BOARDNO}" name="taskProiority" value="${t.TASKPROIORITY}"/>
                                    <div class="dropdown">
                                        <button type="button" id="prioritySelectBtn${pb.BOARDNO}" class="btn dropdown-toggle" data-toggle="dropdown" style="width: 150px;">
	                                    	<c:if test="${t.TASKPROIORITY eq '없음'}">
	                                    		<i class="fas fa-times stoolGrey mr-3" style="font-size:17px;"></i>없음
	                                    	</c:if>
	                                    	<c:if test="${t.TASKPROIORITY eq '낮음'}">                                    	
	                                            <i class="fas fa-arrow-down text-success mr-3" style="font-size:17px;"></i>낮음
	                                        </c:if>
	                                    	<c:if test="${t.TASKPROIORITY eq '보통'}"> 
	                                            <i class="fas fa-circle text-secondary mr-3" style="font-size:10px;"></i>보통
	                                        </c:if>
	                                    	<c:if test="${t.TASKPROIORITY eq '높음'}">                                             
	                                            <i class="fas fa-arrow-up text-warning mr-3" style="font-size:17px;"></i>높음
	                                        </c:if>
	                                    	<c:if test="${t.TASKPROIORITY eq '긴급'}">                                             
	                                            <i class="fas fa-arrow-up text-danger mr-3" style="font-size:17px;"></i>긴급
	                                        </c:if> 
                                        </button>
                                        <div class="dropdown-menu text-center" id="taskPriority-dropItem">
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="없음" onclick="fn_priority_update(this, '없음', ${pb.BOARDNO});"><i class="fas fa-times stoolGrey mr-3" style="font-size:17px;"></i>없음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="낮음" onclick="fn_priority_update(this, '낮음', ${pb.BOARDNO});"><i class="fas fa-arrow-down text-success mr-3" style="font-size:17px;"></i>낮음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="보통" onclick="fn_priority_update(this, '보통', ${pb.BOARDNO});"><i class="fas fa-circle text-secondary mr-3" style="font-size:10px;"></i>보통</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="높음" onclick="fn_priority_update(this, '높음', ${pb.BOARDNO});"><i class="fas fa-arrow-up text-warning mr-3" style="font-size:17px;"></i>높음</p>
                                            <p class="dropdown-item m-0 d-flex align-items-center justify-content-center" id="긴급" onclick="fn_priority_update(this, '긴급', ${pb.BOARDNO});"><i class="fas fa-arrow-up text-danger mr-3" style="font-size:17px;"></i>긴급</p>
                                        </div>
                                    </div>                   
                                </div>                                  
                                <div id="taskContentBox" class="col-12 d-flex justify-content-center">
                                    <textarea name="taskContent" id="taskContentArea" class="w-100 border-0 contentArea" style="resize: none;">${t.TASKCONTENT}</textarea>
                                </div>
                            </div>
                        </div>   
	
	                        <!-- 공통 하단 -->                        
	                        <div class="w-100 p-3">
	                            <!-- 공통) 태그 & 언급 -->
	                            <!-- 태그 입력 -->
	                            <div class="col-12 addTagListBox mb-2">
	                                <div class="w-100 d-flex flex-column">
	                                    <strong class="mb-2">태그</strong>
	                                    <div class="w-100 d-flex flex-wrap align-items-center addTagList_update">
	                                    
	                                    <c:forEach items="${hashTag}" var="ht">
											<c:if test="${t.BOARDNO==ht.BOARDNO}">
											<input type="hidden" name="oriTags${ht.BOARDNO}" value="${ht.HASHTAGTEXT}"/>
                                                <p class='selectedTag m-0 pl-2 pr-2 font-weight-bolder d-flex align-items-center'>
													<span style='color:#25558F;'>#</span>
													<span class='tagText'>${ht.HASHTAGTEXT}</span>
													<i class='fas fa-minus-circle stoolGrey ml-2' onclick='fn_deleteTag_update(this,${ht.BOARDNO},${ht.HASHTAGNO})'></i>
												</p>
		                                    </c:if>
	                                    </c:forEach>		                                    
                                    
	                                        <div class="d-flex addTagInputDiv pl-2 pr-2 ml-2">
	                                            # <input type="text" onkeyup="fn_addTag_update(this,${t.BOARDNO})" placeholder="태그입력"/>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
	                                
	                            	<!-- 중복확인용 태그문자열 -->
	                            	<input type="hidden" id="checkTagStr${t.BOARDNO}" value=""/>
	                            	
	                                <hr class="w-100">
	                            </div>  <!-- 태그 입력 끝 -->     
	                            
	                            
	                            <!-- 언급 입력 -->
	                            <div class="col-12 addMentionListBox mb-2">                             
	                                <div class="w-100 d-flex flex-column">
	                                    <strong class="mb-1">언급할 참여자 추가</strong>
	                                    <div id="" class="w-100 d-flex flex-wrap align-items-center addMentionList_update">
	                                        <c:forEach items="${notification}" var="n">
											<c:if test="${ (t.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'task')}">
											<input type="hidden" name="oriMentions${n.BOARDNO}" value="${n.RECEIVEID}"/>
                                                <div id="" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
                                                    </div>
                                                    <c:forEach items="${projectMember}" var="pm">
                        							<c:if test="${pm.userId eq n.RECEIVEID}">
                                                    <span><c:out value="${pm.userName}"/></span>
                                                    <button type="button" onclick="fn_deleteMentionListStr(this, ${n.BOARDNO}, '${n.RECEIVEID}');" class="p-0 ml-2">
                            							<i class='fas fa-minus-circle stoolPink'></i>
                            						</button>
                                                    </c:if>
                                                    </c:forEach>
                                                </div>
											</c:if>
											</c:forEach>
	                                        <button type="button" id="mentionModalBtn" class="btn stoolDarkBlue-outline m-1 mt-0" onclick="$('#addMentionModal_update${pb.BOARDNO}').modal('show');">언급 추가</button>                       
	                                    </div>
	                                </div>
	                                
	                            	<!-- 중복확인용 언급문자열 -->
	                            	<input type="hidden" id="checkMentionStr${t.BOARDNO}" value=""/>
	                            		                                
	                                <hr class="w-100">
	                            </div>  <!-- 언급 입력 끝 -->    
	
	                            <!-- 공통) 파일 미리보기 -->
	                            <div id="" class="col-12 mb-2">
	                                <strong class="mb-2">업로드 파일</strong>
	                                <div class="col-12 d-flex flex-column mb-2">
	                                    <p id="imgFilesPreviewTitle" class="d-none align-items-center m-0 pl-1">
	                                        <i class="fas fa-images stoolGrey" style="font-size: 20px;"></i>
	                                        	첨부이미지
	                                    </p>
	                                    <div id="oriImgFilesPreview_update${pb.BOARDNO}" class="w-100 d-flex justify-content-center">
	                                        <div class="update_oriImgFileBox w-100 row">
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
	                                        
	                                        <!-- new 이미지 첨부파일 -->
	                                        <div class="update_newImgFileBox w-100 row d-none">
                                                  
	                                        </div>
	                                    </div>
	                                </div>

	                                
	                                <div class="col-12 d-flex flex-column">
	                                    <p id="updateFilesPreviewTitle" class="d-none align-items-center m-0 pl-1">
	                                        <i class="fas fa-file-upload stoolGrey" style="font-size: 20px;"></i>
	                                       	 첨부파일
	                                    </p>
	                                    <div id="oriFilesPreview_update" class="w-100 d-flex justify-content-center">
	                                        <div class="update_oriFileBox w-100 row">
												<c:forEach var="taf" items="${taskAttachment}">
                                       			<c:if test="${taf.TASKNO==t.TASKNO}">
                                       			<c:set var="attachmentCk" value="Y" />
                                       			<c:set var = "splitText" value = "${fn:split(taf.TASKRENAME,'_')}"/>
                                       			<c:if test="${splitText[0] eq 'file'}">
                                                   <div class='col-4 p-1 w-100' style='height: 46px;'>
                                                       <div class='filePreview_view w-100 h-100 pl-3 pr-3 d-flex justify-content-between align-items-center'>
                                                           <div class='d-flex align-items-center'>
                                                               <i class='fas fa-file text-info mr-2' style='font-size: 25px; color: #D0D0D4;'></i>
                                                               <span>
                                                               	<c:out value="${taf.TASKRENAME}"/>
                                                               </span>
                                                           </div>
                                                       </div>
                                                   </div>
												</c:if>                                
                                                </c:if>                                
                                       			</c:forEach>     
	                                        </div>
	                                        
	                                        <!-- new 첨부파일 -->
	                                        <div class="update_newFileBox w-100 row d-none">

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
	                                        <button type="button" class="btn mr-2 ml-2" id="updateFilesBtn" onclick="$('#newFiles${pb.BOARDNO}').click();">
	                                            <i class="fas fa-file-upload stoolGrey" style="font-size: 25px;"></i>
	                                        </button>
	                                        <!-- 이미지파일 업로드 -->                                    
	                                        <button type="button" class="btn" id="updateImgFilesBtn" onclick="$('#newImgFiles${pb.BOARDNO}').click();">
	                                            <i class="fas fa-images stoolGrey" style="font-size: 25px;"></i>
	                                        </button>
	                                    </div>
	                                </div>                                                                          
	                            </div>      
	                            <div class="col-7 w-100 d-flex align-items-center justify-content-end">                              
	                                <button type="button" onclick="fn_updateFormCancel(${pb.BOARDNO});" class="btn m-2 stoolDarkBlue">
	                                    	취소
	                                </button>                             
	                                <button type="submit" onclick="fn_updateSubmit(${pb.BOARDNO});" class="btn m-2 stoolDarkBlue">
	                                    	수정완료
	                                </button>    
	                            </div>                                                              
	                        </div>
						</div>
	                        
	                </form>                    
                </div>
                    <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->                    
                    
                    
                    
                    
                	</c:if>
                	</c:forEach>   <!-- 타입별로 forEach 닫기 -->                	                	
                	</c:if>   <!-- 타입별로 forEach 닫기 -->       
                	
                	

					<!-- 3. 일정 -->
					<c:if test="${pb.BOARDTYPE eq 'S'}">
					<c:forEach items="${scheduleList }" var="s">
					<c:if test="${pb.BOARDNO == s.BOARDNO}">
					
					<div id="viewBoxDiv${pb.BOARDNO}">
					
                    <div class="pjViewBox w-100 p-3" value="p${pb.BOARDNO}">                               
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
                                            <a class="dropdown-item text-center" onclick="fn_viewPostUpdate(${pb.BOARDNO})"  style="cursor: pointer;">수정</a>
                                            <a class="dropdown-item text-center" onclick="fn_viewPostDelete(${projectInfo.PROJECTNO},${pb.BOARDNO})" style="cursor: pointer;">삭제</a>
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
                                            	<fmt:formatDate value="${s.SCHEDULESTARTDATE}" dateStyle="long"/>
                                            	<c:if test="${s.SCHEDULESTARTDATE ne s.SCHEDULEENDDATE}">
                                            		<c:out value=" ~ "/>
                                            		<fmt:formatDate value="${s.SCHEDULEENDDATE}" dateStyle="long"/>
                                            	</c:if>
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
											<c:if test="${s.BOARDNO==ht.BOARDNO}">
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
											<c:if test="${ (s.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'schedule')}">
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
                                    
                                </div> <!-- collapse 닫기 -->

                            </div>
                            <!--★ 하단공통 끝  --------------------------------------------------------------------------------------------------------------------->
    

                        </div><!-- viewBundle 닫기 -->


                    </div><!-- viewBox 닫는 태그 -->
                    
                    <!--★☆★ 댓글 ------------------------------------------------------------------------------------------------------------------------->
                    <!-- 댓글 출력창 .댓글이 2개이상일경우 더보기로 보이도록 출력할것. -->
                    
                    <div class="w-100 p-3" style="background-color:#f6f7f8" id="comment">
                        <c:set var="count" value="0" />
                       	<c:forEach items="${scheduleComment}" var="sc">
                   	    	<c:if test="${s.SCHEDULENO eq sc.SCHEDULENO}">
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
                            <c:forEach items="${scheduleComment}" var="sc" varStatus="status">                            
                            <c:if test="${s.SCHEDULENO eq sc.SCHEDULENO}">
                            	<c:set var="inCount" value="${inCount + 1}" />

                            <c:if test="${count != inCount}">
                            <tr class="hiddenComment d-none">
                            <c:forEach items="${projectMember}" var="pm">
                        	<c:if test="${pm.userId eq sc.SCHEDULECOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${sc.SCHEDULECOMMENTTIME}"/></span>
                                            </span>
                                            
                                            <div id="commentDiv${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}">
                                            	<c:out value="${sc.SCHEDULECOMMENT}"/>
                                            	<c:if test="${sc.SCHEDULECOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${sc.SCHEDULECOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
		                                            		onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${sc.SCHEDULECOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${sc.SCHEDULECOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}" name="comment" class="form-control" value="${sc.SCHEDULECOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${sc.SCHEDULECOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${sc.SCHEDULECOMMENTNO})">
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
                        	<c:if test="${pm.userId eq sc.SCHEDULECOMMENTID}">
                                <td class="d-flex align-items-start">
                                    <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
                                        <img src="${path}/resources/images/defaultProfile.png" style="max-width: 100%; height: auto;"/>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center commentDiv">
                                        <div class="d-flex flex-column justify-content-center">
                                            <span style="font-size: 12px;">
                                                <strong class="mr-2"><c:out value="${pm.userName}"/></strong>
                                                <span style="color: lightgrey"><c:out value="${sc.SCHEDULECOMMENTTIME}"/></span>
                                            </span>
                                            
                                            <div id="commentDiv${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}">
                                            	<c:out value="${sc.SCHEDULECOMMENT}"/>
                                            	<c:if test="${sc.SCHEDULECOMMENTID eq loginUser.userId}">
	                                            	<button type="button" class="ml-4 commentBtn" style="background: none; border: 0px;"
															onclick="fn_updateCommentInput('${pb.BOARDTYPE}', ${sc.SCHEDULECOMMENTNO})">
		                                            	<i class="fas fa-edit" style='font-size:15px'></i>
		                                            </button>
		                                            <button type="button" class="ml-2 commentBtn" style="background: none; border: 0px;"
		                                            		onclick="fn_deleteComment('${pb.BOARDTYPE}', ${pb.BOARDNO},${sc.SCHEDULECOMMENTNO})">
		                                            	<i class="fas fa-times" style='font-size:15px'></i>
		                                            </button>
	                                        	</c:if>
                                            </div>
											<!-- 댓글 수정창 -->  
											<div id="updateCommentInput${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}" class="d-none">                     
						                        <form method="post" id="updateCommentForm${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}">
						                        	<!-- 글 타입 -->
						                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>						                        	
						                        	<!-- 댓글 번호 -->
						                        	<input type="hidden" name="commentNo" value="${sc.SCHEDULECOMMENTNO}"/>	
						                        	
						                            <div class="pt-1 pb-1 d-flex" style="width: 100%;">
						                                <input type="text" id="commentInput${pb.BOARDTYPE}${sc.SCHEDULECOMMENTNO}" name="comment" class="form-control" value="${sc.SCHEDULECOMMENT}" size="100px"/>
						                                <button type="submit" onclick="fn_updateCommentSubmit('${pb.BOARDTYPE}', ${sc.SCHEDULECOMMENTNO});" class="ml-2" style="border: none; background: none;">
						                                    <i class='fas fa-edit' style='font-size:20px'></i>
						                                </button>
						                                <button type="button" class="ml-2" style="border: none; background: none;"
																onclick="fn_formClose('${pb.BOARDTYPE}', ${sc.SCHEDULECOMMENTNO})">
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
                        	<input type="hidden" name="receiveId" value="${s.SCHEDULEID}"/>
                        	
                        	<!-- 글 타입 -->
                        	<input type="hidden" name="postType" value="${pb.BOARDTYPE}"/>
                        	
                        	<!-- 글 번호 -->
                        	<input type="hidden" name="postNo" value="${s.SCHEDULENO}"/>
                        	
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
                    
					</div> <!-- viewBoxDiv 닫는 태그 -->
                    
                    <!-- ※※※※ 수정 DIV ※※※※※※※※※※※※※※  ----------------------------------------------------------------------------------------->
                    <!-- 3. 일정 수정 -->
                <div id="postUpdateFormDiv${pb.BOARDNO}" class="d-none">
	 				<form method="post" enctype="multipart/form-data" onkeydown="return captureReturnKey(event);" id="postUpdateForm${pb.BOARDNO}">
	                <!-- from 공통 hidden input모음 -->
					    <!-- 0) 게시글 번호 -->
					    <input type="hidden" name="projectBoardNo" value="${pb.BOARDNO}"/>    
					    <!-- 1) 프로젝트 번호 저장 -->
					    <input type="hidden" name="selectedProjectNo" value="${projectInfo.PROJECTNO}"/>    
	                    <!-- 2) 글 타입 -->
	                    <input type="hidden" name="boardType" id="boardType" value="${pb.BOARDTYPE}"/>
	                    <!-- 3) 게시글 번호 (ex : writingNo) -->
	                    <input type="hidden" name="postNo" value="${s.SCHEDULENO}"/>
	                    <!-- 4) 작성자 -->
	                    <input type="hidden" name="writer" value="${s.SCHEDULEID}"/>
	                    <!-- 5) 파일 -->                
	                    <input type="file" name="newFiles" id="newFiles${pb.BOARDNO}" multiple style="display: none;" class="newFiles"
	                    	onchange="fn_handleFilesSelect_update(${pb.BOARDNO});"/>
	                    <!-- 6) 이미지파일 -->
	                    <input type="file" name="newImgFiles" id="newImgFiles${pb.BOARDNO}" multiple style="display: none;" accept="image/*" class="newImgFiles"/>
	                    
	                
	                    <!-- 7) 태그 -->
	                    <input type="hidden" name="deleteTagListStr" id="deleteTagListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="newTagListStr" id="newTagListStr${pb.BOARDNO}"/>
	                    <!-- 8) 언급 -->
	                    <input type="hidden" name="deleteMentionListStr" id="deleteMentionListStr${pb.BOARDNO}"/>
	                    <input type="hidden" name="newMentionListStr" id="newMentionListStr${pb.BOARDNO}"/>
	                <!-- from 공통 hidden input모음 끝 -->	                
	                                    
                    <!-- 일정 INPUT -->
                    
	
	                    <div id="pjUpdateWriteBox" class="w-100">
	
						<div id="writeCategory-schedule" class="row w-100 m-0">
                            <div id="scheduleBox" class="w-100 p-3">
                                <div id="scheduleTitleBox" class="col-12 d-flex justify-content-center mt-3 mb-3">
                                    <input name="scheduleTitle" id="scheduleTitle" class="w-100 border-top-0 border-left-0 border-right-0 border-bottom border-secondary" 
                                        value="${s.SCHEDULETITLE}" type="text" value="" maxlength="100" autocomplete="off" style="overflow:visible;">
                                </div>
                                <div id="scheduleStartDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">시작일</strong>
                                    <input type="date" id="scheduleStartDate_update${s.BOARDNO}" name="scheduleStartdate" class="stoolDateInput"
                                    		value="${s.SCHEDULESTARTDATE}" />
                                </div>   
                                <div id="scheduleEndDateBox" class="col-12 d-flex align-items-center mb-3">
                                    <strong class="mr-2">마감일</strong>
                                    <input type="date" id="scheduleEndDate_update${s.BOARDNO}" name="scheduleEnddate" class="stoolDateInput"
                                    	value="${s.SCHEDULEENDDATE}" />
                                </div>    
                                <div id="schedulePlaceBox" class="col-12 w-100 d-flex align-items-center mb-3">
                                    <strong class="mr-2">장소</strong>
                                    <div class="d-flex align-items-end">
                                    	<button type="button" class="btn stoolDarkBlue-outline mr-2" onclick="execDaumPostcode_update(${s.BOARDNO});">주소 검색</button>
                                    	<div id="schedulePlaceText_update${s.BOARDNO}" style="width:280px; border-bottom: 2px solid #E8E8EB;" class="ml-2">
                                    		${s.SCHEDULEPLACE}
                                    	</div>
                                    	<input type="hidden" id="schedulePlace_update${s.BOARDNO}" name="schedulePlace"
                                    		value="${s.SCHEDULEPLACE}"/>
                                    </div>
                                </div>      
                                <div id="schedulePlaceMapBox" class="col-12 d-flex w-100 align-items-center mb-3" >
									 <div id="mapBox${s.BOARDNO}" style="height:300px; display: none;" class="border w-100">
									 	<div id="map${s.BOARDNO}" style="height:300px;" class="w-100"></div>
									 </div>
                                </div>                                                                                        
                                <div id="scheduleContentBox" class="col-12 d-flex justify-content-center">
                                    <i class="far fa-sticky-note mr-2 stoolGrey" style="font-size: 24px;"></i>
                                    <textarea id="scheduleContentArea" name="scheduleMemo" class="w-100 border-0 contentArea" style="resize: none;">${s.SCHEDULEMEMO}</textarea>
                                </div>
                            </div>
                        </div>
	
	                        <!-- 공통 하단 -->                        
	                        <div class="w-100 p-3">
	                            <!-- 공통) 태그 & 언급 -->
	                            <!-- 태그 입력 -->
	                            <div class="col-12 addTagListBox mb-2">
	                                <div class="w-100 d-flex flex-column">
	                                    <strong class="mb-2">태그</strong>
	                                    <div class="w-100 d-flex flex-wrap align-items-center addTagList_update">
	                                    
	                                    <c:forEach items="${hashTag}" var="ht">
											<c:if test="${s.BOARDNO==ht.BOARDNO}">
											<input type="hidden" name="oriTags${ht.BOARDNO}" value="${ht.HASHTAGTEXT}"/>
                                                <p class='selectedTag m-0 pl-2 pr-2 font-weight-bolder d-flex align-items-center'>
													<span style='color:#25558F;'>#</span>
													<span class='tagText'>${ht.HASHTAGTEXT}</span>
													<i class='fas fa-minus-circle stoolGrey ml-2' onclick='fn_deleteTag_update(this,${ht.BOARDNO},${ht.HASHTAGNO})'></i>
												</p>
		                                    </c:if>
	                                    </c:forEach>		                                    
                                    
	                                        <div class="d-flex addTagInputDiv pl-2 pr-2 ml-2">
	                                            # <input type="text" onkeyup="fn_addTag_update(this,${s.BOARDNO})" placeholder="태그입력"/>
	                                        </div>
	                                        
	                                    </div>
	                                </div>
	                                
	                            	<!-- 중복확인용 태그문자열 -->
	                            	<input type="hidden" id="checkTagStr${s.BOARDNO}" value=""/>
	                            	
	                                <hr class="w-100">
	                            </div>  <!-- 태그 입력 끝 -->     
	                            
	                            
	                            <!-- 언급 입력 -->
	                            <div class="col-12 addMentionListBox mb-2">                             
	                                <div class="w-100 d-flex flex-column">
	                                    <strong class="mb-1">언급할 참여자 추가</strong>
	                                    <div id="" class="w-100 d-flex flex-wrap align-items-center addMentionList_update">
	                                        <c:forEach items="${notification}" var="n">
											<c:if test="${ (s.BOARDNO==n.BOARDNO) and (n.NOTTYPE eq 'schedule')}">
											<input type="hidden" name="oriMentions${n.BOARDNO}" value="${n.RECEIVEID}"/>
                                                <div id="" class='d-flex justify-content-between align-items-center selectedWorker p-1 pl-2 pr-2 ml-2 mr-2'>
                                                    <div class='selectedWorker_imgDiv mr-2'>
                                                        <img src="${path}/resources/images/defaultProfile.png">
                                                    </div>
                                                    <c:forEach items="${projectMember}" var="pm">
                        							<c:if test="${pm.userId eq n.RECEIVEID}">
                                                    <span><c:out value="${pm.userName}"/></span>
                                                    <button type="button" onclick="fn_deleteMentionListStr(this, ${n.BOARDNO}, '${n.RECEIVEID}');" class="p-0 ml-2">
                            							<i class='fas fa-minus-circle stoolPink'></i>
                            						</button>
                                                    </c:if>
                                                    </c:forEach>
                                                </div>
											</c:if>
											</c:forEach>
	                                        <button type="button" id="mentionModalBtn" class="btn stoolDarkBlue-outline m-1 mt-0" onclick="$('#addMentionModal_update${pb.BOARDNO}').modal('show');">언급 추가</button>                       
	                                    </div>
	                                </div>
	                                
	                            	<!-- 중복확인용 언급문자열 -->
	                            	<input type="hidden" id="checkMentionStr${s.BOARDNO}" value=""/>
	                            </div>  <!-- 언급 입력 끝 -->    

	                        </div>
	
	
	                        <!-- 공통) 하단 버튼 -->
	                        <div id="writeCategory-bordBtns" class="row w-100 border-top border-light m-0 justify-content-between align-items-center">
	                            <div class="col-5 w-100 d-flex align-items-center"> 
	                                <div id="fileUploadBtns" class="">
	                                </div>                                                                          
	                            </div>      
	                            <div class="col-7 w-100 d-flex align-items-center justify-content-end">                              
	                                <button type="button" onclick="fn_updateFormCancel(${pb.BOARDNO});" class="btn m-2 stoolDarkBlue">
	                                    	취소
	                                </button>                             
	                                <button type="submit" onclick="fn_updateSubmit(${pb.BOARDNO});" class="btn m-2 stoolDarkBlue">
	                                    	수정완료
	                                </button>    
	                            </div>                                                              
	                        </div>
						</div>
	                        
	                </form>                    
                </div>
                    <!-- ※※※※ 수정 DIV 끝 ※※※※※※※※※※※※※※  --------------------------------------------------------------------------------------->                    
                                        
                    
                	</c:if>
                	</c:forEach>   <!-- 타입별로 forEach 닫기 -->                	                	
                	</c:if>   <!-- 타입별로 forEach 닫기 -->                	                	
                	
                	
                </div>	<!-- greyBorder -->   
                
                
<!-- 모달모음 -------------------------------------------------------------------------------------------------------------------------------> 
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ] -->
    <div class="modal fade" id="addMentionModal_update${pb.BOARDNO}">
        <div class="modal-dialog modal-dialog-centered modal-lg">
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
                        <input type="text" name="addWorker_search" placeholder="참여자 이름 검색" class="w-100 searchProjectMember"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100 overflow-auto" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName">
                                	<c:out value="${pm.userName}">
                                </c:out></p>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addMention_update(this,${pb.BOARDNO},'${pm.userId}','${pm.userName}');">
                                	선택
                            </button>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 공통 - 언급할 참여자 추가 ]  끝 -->     
    
    
    <!-- 게시글 작성 [ 업무 - 담당자 추가 ] -->
    <div class="modal fade" id="addWorkerModal_update${pb.BOARDNO}">
        <div class="modal-dialog modal-dialog-centered modal-lg">
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
                        <input type="text" name="addWorker_search" placeholder="참여자 이름 검색" class="w-100 searchProjectMember"/>
                    </div>
                    <div class="memberListH d-flex flex-column pl-2 pr-2 w-100 overflow-auto" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        <c:forEach items="${projectMember}" var="pm">
                        <div class="pjMemberList d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <img src="${path}/resources/images/defaultProfile.png">
                                </div>
                                <p class="m-0 searchName">
                                	<c:out value="${pm.userName}"/>
                                </p>
                                <span class="d-none">
                                	<c:out value="${pm.userId}"/>
                                </span>
                            </div>
                            <button type="button" class="btn stoolDarkBlue-outline align-self-end" onclick="fn_addWorker_update(this, ${pb.BOARDNO},'${pm.userId}','${pm.userName}');">
                                	선택
                            </button>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
    <!-- 게시글 작성 [ 업무 - 담당자 추가 ]  끝 -->                    
            
<!-- 모달모음 끝 ---------------------------------------------------------------------------------------------------------------------------->                 
                
                   
			</c:forEach><!-- pb forEach문 끝 -->
                
                
                
                
                

                 