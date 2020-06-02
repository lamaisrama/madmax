<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<c:set var="path" value="${pageContext.request.contextPath }" />    

       
<!-- 상단 고정글 -->
<div class="w-100 d-flex flex-column border p-3 mb-3 mt-3">	
    
    
    <div class="d-flex align-items-center mb-3">
        <i class="fas fa-thumbtack stoolDarkBlue-text selectPinIcon" style="font-size: 25px;"></i>
        <p class="m-0 ml-2 mr-1">상단고정글</p>
        <span>1</span> <!-- 상단고정글 갯수 넣기 -->
    </div><c:forEach items="${projectBoardList}" var="pb">
	    <c:if test="${pb.PINPOST eq 'Y'}">
	
			<c:set var="bookmark" value="N" />
			<c:forEach var="b" items="${bookmarkList}">
			  <c:if test="${pb.BOARDNO eq b.BOARDNO}">
			    <c:set var="bookmark" value="Y" />
			  </c:if>
			</c:forEach>    
	    
		    <!-- 상단고정글 > 게시물[글] -->
			<c:if test="${pb.BOARDTYPE eq 'W'}">
				<c:forEach items="${writingList }" var="w">
					<c:if test='${pb.BOARDNO==w.BOARDNO}'>
					    <div class="w-100 d-flex flex-column align-items-center">
					        <button type="button" class="btn btn-pinPost w-100 d-flex align-items-center" data-toggle="collapse" data-target="#pinPost-${pb.BOARDNO}" id="reportBoxBtn">
								<strong>[글]</strong>
					            <p class="m-0 ml-2">${w.WRITINGTITLE}</p>
					        </button>      
					        
					        <div id="pinPost-${pb.BOARDNO}" class="collapse p-2 w-100">
			
			                    <div id="viewBoxDiv${pb.BOARDNO}">
			                    
				                    <div class="pjViewBox w-100 p-3" value="p${pb.BOARDNO}">                             
				                        <div class="viewBundle w-100 bg-white rounded p-3">
				
				                            <!--★ 상단공통  ----------------------------------------------------------------------------------------------------------------------->      
				                            <div class="pjViewBox-header w-100 d-flex justify-content-between mb-5">
				                                <div class=" w-100 d-flex align-items-center">
				                                   	<c:forEach items="${projectMember}" var="pm">
				                                   	<c:if test="${w.WRITINGID==pm.userId}">
				                                    <div class="profileImgDiv">
				                                        <img src="${path}/resources/upload/profile/${pm.profile}" alt="프로필사진"/>
				                                    </div>
				                                    <div class="d-flex flex-column ml-2">
				                                        <strong>
				                                        		<c:out value="${pm.userName}"/>
				                                       	</strong>
				                                    </c:if>
				                                    </c:forEach>
				                                        <p class="m-0" style="font-size: small;">
				                                        	<fmt:formatDate value="${w.WRITINGTIME}" pattern="yyyy-MM-dd KK:mm:ss"/>
				                                        </p>
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
				                                                    <c:forEach items="${projectMember}" var="pm">
				                        							<c:if test="${pm.userId eq n.RECEIVEID}">
				                                                    <div class='selectedWorker_imgDiv mr-2'>
				                                                        <img src="${path}/resources/upload/profile/${pm.profile}">
				                                                    </div>
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
				                                    </div>  <!-- 공통) 파일 미리보기 끝 -->
				
				                                </div> <!-- collapse 닫기 -->
				
				                            </div>
				                            <!--★ 하단공통 끝  --------------------------------------------------------------------------------------------------------------------->
				    
				
				                        </div><!-- viewBundle 닫기 -->
				                    </div><!-- pjViewBox 닫는 태그 -->
				                    
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
					                            <p onclick="fn_displayHiddenComment(this,${count});" class="m-0 font-weight-bolder stoolDarkBlue-text" style="cursor: pointer;">
					                                	이전 댓글 더보기  <span class="font-weight-light ml-2" style="color:#000000;">총 </span><c:out value="${count}"/>개<span class="font-weight-light" style="color:#000000;">의 댓글이 있습니다.</span>
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
				                                        <img src="${path}/resources/upload/profile/${pm.profile}" style="max-width: 100%; height: auto;"/>
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
				                                        <img src="${path}/resources/upload/profile/${pm.profile}" style="max-width: 100%; height: auto;"/>
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
					                            <c:forEach items="${projectMember}" var="pm">
					                            <c:if test="${loginUser.userId eq pm.userId}">
						                            <div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
						                                <img src="${path}/resources/upload/profile/${pm.profile}" style="max-width: 100%; height: auto;"/>
						                            </div>
				                                </c:if>
				                                </c:forEach>
					                            <div class="pt-1 pb-1 d-flex" style="width: 95%;">
					                                <input type="text" name="comment" class="form-control" placeholder="댓글을 입력하세요" size="100px;"/>
					                                <button type="submit" onclick="fn_insertCommentSubmit(${pb.BOARDNO});" class="ml-2" style="border: none; background: none;">
					                                    <i class='fas fa-edit' style='font-size:28px'></i>
					                                </button>
					                            </div>   
					                        </div> 
				                        </form>  
				                    </div>
				                    <!--★☆★ 댓글 끝 ----------------------------------------------------------------------------------------------------------------------->
			                    </div> <!-- viewBoxDiv${pb.BOARDNO} 닫기 -->
			                    
			                    
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
				                                                    <c:forEach items="${projectMember}" var="pm">
				                        							<c:if test="${pm.userId eq n.RECEIVEID}">
				                                                    <div class='selectedWorker_imgDiv mr-2'>
				                                                        <img src="${path}/resources/upload/profile/${pm.profile}">
				                                                    </div>
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
			                    					        
					        </div>
					    </div>
		    		</c:if>
		    	</c:forEach>
		    </c:if>
		    <!-- 상단고정글 > 게시물[글] 끝 -->
		    
	    </c:if> <!-- test="${pb.PINPOST eq 'Y' -->
    </c:forEach> <!-- c:forEach items="${projectBoardList}" var="pb" 닫기 -->


	<hr class="w-100 mt-2 mb-2"/> <!-- if문으로 마지막 글은 반복하지 않기 -->
	
</div><!-- 상단고정글 박스 끝 -->