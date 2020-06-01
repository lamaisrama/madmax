<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!-- Latest compiled and minified CSS -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"> -->
<!-- jQuery library -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- Popper JS -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script> -->
<!-- Latest compiled JavaScript -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script> -->


<!-- aside.jsp에 대한 css -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/asidebar.css"/>
<!-- aside.jsp에 대한 js -->
<script type="text/javascript" src="${path}/resources/js/asidebar.js"></script>
<script type="text/javascript" src="${path}/resources/js/asidebar.js"></script>
<jsp:include page="/resources/js/selectedProject-Ajax.jsp" />


<div class="col-sm-3">
	<!-- <div class="row"> -->
		<!--이전화면 버튼을 클릭하면 이전에 보았던 페이지로 이동함-->
		<div>
			<button id="beforePage" type="button" class="btn bg-white border border-grey rounded" onclick="fn_goBack()">
				<span>이전화면</span>
			</button>
		</div>
		<p></p>
		<div class="btn-group bg-white" style="border 1; border-radius: 0.2rem;">
			<button type="button" id="threeBtn" class="btn bg-white border border-grey rounded" data-toggle="modal" data-target="#fileListModal">
				<span>파일함</span>
			</button>
			<button type="button" id="threeBtn" class="btn bg-white border border-grey rounded" 
			onclick="location.replace('${path }/task/selectTask.do');">
				<span>업무</span>
			</button>
			<button type="button" id="threeBtn" class="btn bg-white border border-grey rounded" 
			onclick="('${path }/calendar/calendar.do');">
				<span>일정</span>
			</button>
		</div> <!-- btn-group -->
		<p></p>
		<c:if test="${projectInfo.USERID eq loginUser.userId }">
			<div>
				<button id="beforePage" type="button"
					class="btn bg-white border border-grey rounded"
					onclick="fn_inviteModal();">
					<span>초대하기</span>
				</button>
			</div>
			<p></p>
		</c:if>
		<c:if test="${projectInfo.USERID ne loginUser.userId }">
			<div style="display:none;">
				<button id="beforePage" type="button"
					class="btn bg-white border border-grey rounded"
					onclick="fn_inviteModal();">
					<span>초대하기</span>
				</button>
			</div>
			<p></p>
		</c:if>

	<script>
				//초대하기 모달창 띄우기
					function fn_inviteModal(){
				    	$("#inviteModal").modal("show");
					}
				</script>
			
	<!-- </div> -->
	<!--row-->
	

		
		<!--전체참여자 확인박스-->
		<div class="allMemberListBox bg-white border border-grey rounded" >
			<div class="allMemberListCount">
				<span>전체 참여자&nbsp;${projectMember.size()}&nbsp;명</span> 
					<a 
					href="#" 
					style="text-decoration: none;"
					data-toggle="modal" 
					data-target="#chatAllMemberModal">
						<span id="allMember">전체보기</span>
					</a>
			</div>
			<hr>
			<!--기본은 스크롤 안보이게하고 마우스 오버시 스크롤바 생기게 해야하는데 실패함.., 스크롤바 ui 찾아보기, -->
			<div class="memberListbox">
				<div class="adminList">
					<p>관리자</p>
					<ul class="detailedList">
					<c:forEach var="pm" items="${projectMember}">
					<c:if test="${pm.userId eq projectInfo.USERID }">
						<li>
							<div
							class="member d-flex align-items-center"
							data-toggle="modal"
							data-target="#member${pm.userId}"
							data-profile="${pm.profile }"
							data-userName="${pm.userName }">
								<div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
										<img 
										id="profileImg"
										src="${path}/resources/upload/profile${pm.profile}"
										alt="프로필사진">
									</div>	
								<span id="memberName">
									<c:out value="${pm.userName}"/> <!-- 플젝 생성자 이름 -->
								</span>
							</div>
						</li>
						
						<!-- 멤버별 프로필 Modal : 멤버 리스트 클릭시 뜨는 프로필 카드-->
    <!-- 카드 모달 도전 -->
<div class="modal fade" id="member${pm.userId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 10000;">
	<div
		class="modal-dialog modal-dialog-centered d-flex justify-content-center"
		role="document">
		<div class="modal-content" style="width: 400px; height: 700px;">
			<div id="profileBox">
				<img id="cardProfileImg"
					src="${path}/resources/upload/profile/${pm.profile}"
					alt="cardProfileImg"
					style="object-fit: cover; height: 400px; width: 398px;">
			</div>
		
			<div>
				<div style="padding: 25px 40px;">
					<div>
						<strong id="userName">
							${pm.userName}
						</strong> 
						<span>
							${pm.jobName}
						</span>
						
						<p style="color:#25558F;">${pm.deptName}</p>
					</div>
					<hr>
					<div style="margin-bottom: 20px;">
						<p class="" style="color:#595959;">이메일</p>	
						<p id="email">
							${pm.email }
						</> 
						<hr> 
						<p class="" style="color:#595959;">연락처</p>
						<p id="phoneNo">
							${pm.phone }
						</p> 
						<br> 
						<!-- <span id="officeNO">02-567-8901</span> -->
					</div>
					<!-- <div style="padding-top: 15px;" align="center">
						<button type="button" class="btn btn-sm btn bg-white border border-grey rounded">
						프로필 수정하기</button>
					</div> -->
				</div>
			</div>
		</div>
		<!-- modal-content 끝 -->
	</div>
	<!-- modal-dialog 끝 -->
</div>
<!-- 카드 모달 도전 끝 -->
						</c:if>
						</c:forEach>
					</ul>
				</div>
				<!--관리자-->
				<hr>
				<div class="memberList">
					<p>참여자(
					<c:out value="${projectMember.size()-1}"/>
					)
					</p>
					
					<ul class="detailedList">
						<c:forEach var="pm" items="${projectMember}">
							<c:choose>
								<c:when test="${pm.userId eq projectInfo.USERID}">
								<li style="display:none">
									<div
									class="member"
									data-toggle="modal"
									data-target="#member${pm.userId}"
									data-profile="${pm.profile }"
									data-userName="${pm.userName }" 
									>
									<div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
										<img 
										id="profileImg"
										src="${path}/resources/upload/profile${pm.profile}"
										alt="프로필사진">
									</div>	
										<span id="memberName"> 
											<c:out value="${pm.userName}"/> <!-- 셀렉문 가져와서 객체 하나 만들어야하는거 ㅠㅠ -->
										</span>
									</div>
								</li>
								</c:when>
								<c:otherwise>
									<li>
									<div
									class="member d-flex align-items-center"
									data-toggle="modal"
									data-target="#member${pm.userId}"
									data-profile="${pm.profile }"
									data-userName="${pm.userName }" 
									>
									<div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
										<img 
										id="profileImg"
										src="${path}/resources/upload/profile/${pm.profile}"
										alt="프로필사진">
									</div>	
										<span id="memberName"> 
											<c:out value="${pm.userName}"/> <!-- 셀렉문 가져와서 객체 하나 만들어야하는거 ㅠㅠ -->
										</span>
										<%-- <input type="hidden" name="jobName" id="jobName" value="${pm.jobName }"/>
										<input type="hidden" name="deptName" id="deptName" value="${pm.deptName }"/>
										<input type="hidden" name="phone" id="phone" value="${pm.phone }"/>
										<input type="hidden" name="email" id="email" value="${pm.email }"/> --%>
									</div>
								</li>
								</c:otherwise>
								</c:choose>
								<!-- 멤버별 프로필 Modal : 멤버 리스트 클릭시 뜨는 프로필 카드-->
    <!-- 카드 모달 도전 -->
<div class="modal fade" id="member${pm.userId}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 10000;">
	<div
		class="modal-dialog modal-dialog-centered d-flex justify-content-center"
		role="document">
		<div class="modal-content" style="width: 400px; height: 700px;">
			<div id="profileBox">
				<img id="cardProfileImg"
					src="${path}/resources/upload/profile/${pm.profile}"
					alt="cardProfileImg"
					style="object-fit: cover; height: 400px; width: 398px;">
			</div>
		
			<div>
				<div style="padding: 25px 40px;">
					<div>
						<strong id="userName">
							${pm.userName}
						</strong> 
						<span>
							${pm.jobName}
						</span>
						
						<p style="color:#25558F;">${pm.deptName}</p>
					</div>
					<hr>
					<div style="margin-bottom: 20px;">
						<p class="" style="color:#595959;">이메일</p>	
						<p id="email">
							${pm.email }
						</> 
						<hr> 
						<p class="" style="color:#595959;">연락처</p>
						<p id="phoneNo">
							${pm.phone }
						</p> 
						<br> 
						<!-- <span id="officeNO">02-567-8901</span> -->
					</div>
					<!-- <div style="padding-top: 15px;" align="center">
						<button type="button" class="btn btn-sm btn bg-white border border-grey rounded">
						프로필 수정하기</button>
					</div> -->
				</div>
			</div>
		</div>
		<!-- modal-content 끝 -->
	</div>
	<!-- modal-dialog 끝 -->
</div>
<!-- 카드 모달 도전 끝 -->
								
								
						</c:forEach>
					</ul>
					
				</div>
				<!--참여자-->
			</div>
			<!--모든멤버리스트-->
			<hr> 
		<!-- </div> -->
		<!--row-->
			<script>
				$(function(e){
		            $("#member").on("click",function(){
		                console.log($(e).nextAll().val());
		                   
		            });
		        });
			</script>
	</div>
	</div>
	<!--col-sm-3-->

<!-- </div> -->
<!--row-->

<!-- ----------------------------------------- 모달창 --------------------------------------------------------- -->

<!-- 모달 스타일-->
<style>
/*파일함 모달 스타일*/
.has-search .form-control {
	padding-left: 2.375rem;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}
/*프로필 카드 */
img#cardProfileImg {
	object-fit: cover;
	height: 400px;
	width: 399px;
}
</style>


<!-- 파일함 Modal -->
<div class="modal fade" id="fileListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-dialog modal-lg " role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">프로젝트 파일</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<div class="container">

					<div class="row">
						<div class="col-sm-12">
							<!-- Actual search box -->
							<div class="form-group has-search">
								<span class="fa fa-search form-control-feedback"></span> 
								<input type="text" 
								id="searchFileName" 
								class="form-control" 
								placeholder="파일명으로 검색이 가능합니다.">
							</div>
							<!--search 끝-->
						</div>
						<!--col-sm-12 끝-->
					</div>
					<!--row 끝-->
					<div class="row">
						<div class="col-sm-12"></div>
					</div>
					<p></p>
					<!--파일 리스트 보여줌-->
					<div class="row">
						<div class="col-sm-12" style="height: 500px;">
							<table id="fileListTable" class="table">
								<thead>
									<tr>
										<th>파일명</th>
										<th>등록정보</th>
										<th>올린이</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="afl" items="${allFileList }">
									<tr>
										<td class="fileName">${afl.writingoriname}</td>
										<td>
											<fmt:formatDate type="date" value="${afl.writingtime}" />
										</td>
										<!-- 파일 올린 날짜 -->
										<td>
											<c:out value="${afl.username }"/>
										</td>
										<!-- 파일 올린 사람 이름-->
										<td>
											<button type="button" 
											class="btn btn-sm btn-outline-dark"
											onclick="fn_fileDownload(${projectInfo.PROJECTNO},'${afl.writingoriname}','${afl.writingrename }')">
												<span class="material-icons" style="font-size: smaller;">
													save_alt 
												</span>
											</button>
										</td>
										<!--버튼을 누르면 파일을 자동으로 다운받음 -->
									</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<!-- col-sm-12 끝 -->
					</div>
					<!-- row 끝 -->
				</div>
				<!--modal container 끝-->
			</div>
			<!--modal body 끝-->
			<div class="modal-footer" style="height: 70px;"></div>
			<!-- footer 끝 -->
		</div>
		<!-- modal-content 끝 -->
	</div>
	<!-- modal-dialog 끝 -->
</div>
<!-- 파일함 Modal 끝 -->

<!-- 참여인원 전체보기 클릭시 보여지는 리스트에 대한 Modal -->
<div class="modal fade" id="chatAllMemberModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
	<div class="modal-dialog modal-dialog-scrollable modal-dialog-centered" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalScrollableTitle">프로젝트 참여자</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<!--modal header-->
			<div class="modal-body">
				<!-- Actual search box -->
				<div class="form-group has-search">
					<span class="fa fa-search form-control-feedback"></span> 
					<input type="text" id="searchMember" class="form-control" placeholder="Search">
				</div>
				<!--search-->
				<div class="row">
					<div class="col-sm-12" style="height: 500px;">
						<div class="projectJoinMember">
							<p>프로젝트 참여자</p>
							<c:forEach var="pm" items="${projectMember}">
							<div class="pjJoinAllMemberList d-flex align-items-center" 
							data-toggle="modal"
							data-target="#member${pm.userId }">
									<div class="mr-2 overflow-hidden" style="border-radius: 25px;width: 45px; height: 45px;">
										<img 
										id="profileImg"
										src="${path}/resources/upload/profile/${pm.profile}"
										alt="프로필사진">
									</div>				
								<span>
									<c:out value="${pm.userName}"/>
								</span>
								<c:if test="${pm.userId eq projectInfo.USERID  }">
									<b>|</b> 
									<span>관리자</span>
								</c:if>
							
								<hr>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			<!--modal body-->
		</div>
	</div>
</div>
<!-- 전체보기 리스트 모달창 끝-->

<script>
	
</script>




<!-- 멤버별 프로필 Modal : 멤버 리스트 클릭시 뜨는 프로필 카드-->
    <!-- 카드 모달 도전 -->
<div class="modal fade" id="member" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 10000;">
	<div
		class="modal-dialog modal-dialog-centered d-flex justify-content-center"
		role="document">
		<div class="modal-content" style="width: 400px; height: 672px;">
			<div id="profileBox">
				<img id="cardProfileImg"
					src="${path}/resources/images/defaultProfile.png"
					alt="cardProfileImg"
					style="object-fit: cover; height: 400px; width: 398px;">
			</div>
		
			<div>
				<div style="padding: 25px 40px;">
					<div>
						<span id="userName"></span> <span>과장</span>
						<p>항공업무부</p>
					</div>
					<hr>
					<div style="margin-bottom: 20px;">
						<span id="email">
							<%-- <c:out value="${user.EMAIL }"/> --%>
						</span> 
						<br> 
						<span id="phoneNo">
							<%-- <c:out value="${user.PHONE }"/> --%>
						</span> 
						<br> 
						<!-- <span id="officeNO">02-567-8901</span> -->
					</div>
					<!-- <div style="padding-top: 15px;" align="center">
						<button type="button" class="btn btn-sm btn bg-white border border-grey rounded">
						프로필 수정하기</button>
					</div> -->
				</div>
			</div>
		</div>
		<!-- modal-content 끝 -->
	</div>
	<!-- modal-dialog 끝 -->
</div>
<!-- 카드 모달 도전 끝 -->

<!-- 초대하기 모달 -->

    <div class="modal fade" id="inviteModal">
        <div class="modal-dialog modal-dialog-centered modal-lg d-flex justify-content-center">
            <div class="modal-content addWorkerModal">                
                <!-- Modal Header -->
                <div class="modal-header p-2 pl-3 pr-3">
                    <h4 class="modal-title">프로젝트 참여자 추가하기</h4>
                    <button type="button" class="close" data-dismiss="modal">×</button>
                </div>                
                <!-- Modal body -->
                <div class="modal-body">
                    <div class="d-flex w-100 p-2 align-items-center mb-5 addWorkerModal_searchBox">
                        <i class="fas fa-search mr-3 stoolGrey"></i>
                        <input type="text" id="invitationSearch" name="addWorker_search" placeholder="초대할 멤버 이름 검색" class="w-100 addWorker_search"/>
                    </div>
                    <div id="invitationMember" class="d-flex flex-column pl-2 pr-2 w-100 overflow-auto" style="max-height: 500px;">
                        <!-- 프로젝트 참여자 데이터 넣기 -->
                        
                        
                        <c:forEach items="${user}" var="u">
                        <div class="d-flex w-100 align-items-center justify-content-between mt-2 mb-2">
                            <div class="d-flex align-items-center">
                                <div class="addWorker_profile_div mr-2">
                                    <c:choose>
									<c:when test="${u.PROFILE eq null}"> <!-- 프로필이 널이면 -->
										<img 
										id="profileImg"
										src="${path}/resources/images/defaultProfile.png"
										alt="프로필사진">
									</c:when>
									<c:otherwise>
										<img 
										id="profileImg"
										src="${path}/resources/upload/profile${u.PROFILE}"
										alt="프로필사진">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     진">
									</c:otherwise>
								</c:choose>
                                </div>
                                <p class="m-0"><c:out value="${u.USERNAME}"></c:out></p>
                              <%--   <p class="m-0"><c:out value="${u.USERID}"></c:out></p> --%>
                            </div> 
                           
                                <input type="hidden" name="userid" id="userid" value="${u.USERID}"/> <!-- 아이디 -->
                               	<input type="hidden" name="pjno" id="pjno" value="${projectInfo.PROJECTNO }"  /><!-- 프로젝트 넘버 -->
                            	
                            	
                            	
	                            <button type="button" id="choose" class="btn stoolDarkBlue-outline pull-right" onclick="insertPjMember(this);">
	                            	선택
	                            </button>
	                           
	                            
                        </div>
                        </c:forEach>
					                           
                    </div>
                    
                    
                    <script>
	                    function insertPjMember(e){
	                    	//console.log($("#userid").val());
	                    	//console.log(e);
	                    	//console.log($(e).("#pjno").val());
	                    	//console.log($(e).prevAll().val());
	                    	//console.log($(e).prevAll().val());
	                    	console.log('userId');
	                    	console.log($(e).prev().prev().val());
	                    	
	                    	$.ajax({
	                    		url:"${path}/aside/insertProjectMember.do",
	                    		data: {userid:$(e).prev().prev().val(),
	                    			pjno:$(e).prev().val()},
	                    		type: "post",
	                    		success : function(data){
	                    			console.log(data);
	                    			if(data == -1){
	                    				alert("이미 초대된 멤버입니다.")
	                    			}else if(data > 0){
	                    				alert("프로젝트 초대 성공!");	
	                    			}else{
	                    				alert("초대하기에 실패하였습니다. 관리자에게 문의해주세요.");
	                    			}
	                    		}
	                    	}); 
	                    }

                    </script>
                </div>
                <div class="modal-footer border-0">
                </div>            
            </div>
        </div>
    </div> 
      

