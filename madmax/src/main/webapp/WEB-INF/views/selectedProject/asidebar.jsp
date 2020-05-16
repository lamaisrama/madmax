<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>


<!-- aside.jsp에 대한 css -->
<link rel="stylesheet" type="text/css" href="${path}/resources/css/asidebar.css"/>
<!-- aside.jsp에 대한 js -->
<script type="text/javascript" src="${path}/resources/js/asidebar.js"></script>



<div class="col-sm-3">
	<div class="row">
		<!--이전화면 버튼을 클릭하면 이전에 보았던 페이지로 이동함-->
		<div>
			<button id="beforePage" type="button" class="btn btn-outline-primary">
				<span>이전화면</span>
			</button>
		</div>
	</div>
	<!--row-->
	<p></p>
	<div class="row">
		<!--각 버튼을 누르면 해당하는 모달창이 뜸-->
		<!--버튼 css 수정 되는지 확인해보고 안되면 다른 방법으로 찾아보기 ㅠㅠ-->
		<div class="btn-group">
			<button type="button" id="threeBtn" class="btn btn-outline-primary" data-toggle="modal" data-target="#fileListModal">
				<span>파일함</span>
			</button>
			<button type="button" id="threeBtn" class="btn btn-outline-primary">
				<span>업무</span>
			</button>
			<button type="button" id="threeBtn" class="btn btn-outline-primary">
				<span>일정</span>
			</button>
		</div>
		<!-- btn-group -->
	</div>
	<!--row-->
	<br>
	<div class="row">
		<!--전체참여자 확인박스-->
		<div class="allMemberListBox">
			<div class="allMemberListCount">
				<span>전체 참여자 4명</span> 
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
					<p>관리자(1)</p>
					<ul class="detailedList">
						<li>
							<div
							class="member"
							data-toggle="modal"
							data-target="#member">
								<img 
								id="profileImg"
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
								alt=""> 
								<span id="memberName"> 홍길동 </span>
							</div>
						</li>
					</ul>
				</div>
				<!--관리자-->
				<hr>
				<div class="memberList">
					<p>참여자(3)</p>
					<ul class="detailedList">
						<li>
							<div 
							class="member"
							data-toggle="modal"
							data-target="#member">
								<img 
								id="profileImg"
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
								alt=""> 
								<span id="memberName"> 홍길동 </span>
							</div>
						</li>
						<li>
							<div 
							class="member"
							data-toggle="modal"
							data-target="#member">
								<img 
								id="profileImg"
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
								alt=""> 
								<span id="memberName"> 홍길동 </span>
							</div>
						</li>
						<li>
							<div 
							class="member"
							data-toggle="modal"
							data-target="#member">
								<img 
								id="profileImg"
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
								alt=""> 
								<span id="memberName"> 홍길동 </span>
							</div>
						</li>
					</ul>
				</div>
				<!--참여자-->
			</div>
			<!--모든멤버리스트-->
			<hr>
		</div>
		<!--row-->

		<div class="row"></div>
	</div>
	<!--col-sm-3-->

</div>
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
<div class="modal fade" id="fileListModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered" role="document">
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
								<span class="fa fa-search form-control-feedback"></span> <input
									type="text" class="form-control" placeholder="파일명으로 검색이 가능합니다.">
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
							<table class="table">
								<thead>
									<tr>
										<th>파일명</th>
										<th>등록정보</th>
										<th>올린이</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>파일이름.jpg</td>
										<td>2020.05.01</td>
										<!-- 파일 올린 날짜 -->
										<td>홍길동</td>
										<!-- 파일 올린 사람 -->
										<td>
											<button type="button" class="btn btn-sm btn-outline-dark">
												<span class="material-icons" style="font-size: smaller;">
													save_alt </span>
											</button>
										</td>
										<!--버튼을 누르면 파일을 자동으로 다운받음 -->
									</tr>
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
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<!--search-->
				<div class="row">
					<div class="col-sm-12" style="height: 500px;">
						<div class="projectJoinMember">
							<p>프로젝트 참여자</p>
							<div class="pjJoinAllMemberList" data-toggle="modal"
								data-target="#member">
								<img 
								id="profileImg"
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
								alt=""> 
								<span>홍길동</span> 
								<b>|</b> 
								<span>관리자</span>
								<hr>
							</div>

							<div class="pjJoinAllMemberList">
								<img 
								id="profileImg"
								src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
								alt=""> 
								<span>강수진 (나)</span>
								<button 
								class="btn" 
								id="exitBtn" 
								onclick="exitFunction()"
								data-toggle="tooltip" 
								data-placement="bottom" 
								title="나가기">
									<span class="material-icons" style="font-size: 24pt;">
										exit_to_app 
									</span>
								</button>
								<hr>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--modal body-->
		</div>
	</div>
</div>
<!-- 전체보기 리스트 모달창 끝-->




<!-- 멤버별 프로필 Modal : 멤버 리스트 클릭시 뜨는 프로필 카드-->
    <!-- 카드 모달 도전 -->
<div class="modal fade" id="member" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" style="z-index: 10000;">
	<div
		class="modal-dialog modal-dialog-centered d-flex justify-content-center"
		role="document">
		<div class="modal-content" style="width: 400px; height: 672px;">
			<div id="profileBox">
				<img id="cardProfileImg"
					src="https://img.hani.co.kr/imgdb/resize/2018/0313/00500561_20180313.JPG"
					alt="cardProfileImg"
					style="object-fit: cover; height: 400px; width: 398px;">
			</div>
			
			<div>
				<div style="padding: 25px 40px;">
					<div>
						<span id="">이시은</span> <span>과장</span>
						<p>test | 항공업무부</p>
					</div>
					<hr>
					<div style="margin-bottom: 20px;">
						<span id="email">koaenging@gmail.com</span> 
						<br> 
						<span id="phoneNo">010-9876-5432</span> 
						<br> 
						<span id="officeNO">02-567-8901</span>
					</div>
					<div style="padding-top: 15px;" align="center">
						<button type="button" class="btn btn-sm btn-outline-dark center">
						프로필 수정하기</button>
					</div>
				</div>
			</div>
		</div>
		<!-- modal-content 끝 -->
	</div>
	<!-- modal-dialog 끝 -->
</div>
<!-- 카드 모달 도전 끝 -->

