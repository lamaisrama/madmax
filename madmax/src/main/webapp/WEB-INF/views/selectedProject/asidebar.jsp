<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
/*이전화면 버튼*/
#beforePage {
	width: 285px; 
	height: 60px;
}

/*파일함,업무,일정 버튼*/
#threeBtn {
	width: 95px; 
	height: 70px;
}

/*프로젝트 모든 참여자 박스*/
div.allMemberListBox {
	border: 1px solid; 
	width: 285px; 
	height: auto; 
	min-height: auto; 
	max-height: auto; 
	padding: 15px 12px; 
	border-radius: 0.2rem;

}

/*전체보기 a태그*/
span#allMember{
	float: right;
}

/*모든 참여자 리스트 프로필이미지,이름 */
div.memberListbox{
	overflow-y: scroll; 
	overflow-x: hidden; 
	height: auto; 
	min-height: auto; 
	max-height: 590px;
}

div.member{
	margin-bottom: 10px;
}

/*참여자 리스트 정렬*/
ul.detailedList{
	list-style-type: none;
	padding-left: 0px;
}

img#prfileImg{
	width: 35px; 
	height: 35px;
}

span#mName{
	padding-left: 10px;
}


/*참여자 목록에서 확인 시*/
div.member:hover {
	background-color: lightgray;
}

</style>


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
			<button type="button"
				id="threeBtn"
				class="btn btn-outline-primary"
				data-toggle="modal" 
				data-target="#fileListModal">
				<span>파일함</span>
			</button>
			<button type="button"
				id="threeBtn"
				class="btn btn-outline-primary">
				<span>업무</span>
			</button>
			<button type="button"
				id="threeBtn"
				class="btn btn-outline-primary">
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
					<a href="#" style="text-decoration: none;"
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
							<div class="member">
								<img id="profileImg"
									src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
									alt=""> <span> 홍길동 </span>
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
							<div class="member">
								<img id="profileImg"
									src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
									alt=""> 
								<span> 홍길동 </span>
							</div>
						</li>
						<li>
							<div class="member">
								<img id="profileImg"
									src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
									alt=""> <span> 홍길동 </span>
							</div>
						</li>
						<li>
							<div class="member">
								<img id="profileImg"
									src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Circle-icons-profile.svg/1200px-Circle-icons-profile.svg.png"
									alt=""> <span> 홍길동 </span>
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
</style>


<!-- 파일함 Modal -->
    <div class="modal fade" id="fileListModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">프로젝트 파일</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
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
                    <input type="text" class="form-control" placeholder="파일명으로 검색이 가능합니다.">
                  </div>
                  <!--search 끝-->
                </div>
                <!--col-sm-12 끝-->
              </div>
              <!--row 끝-->
              
              <div class="row">
                <div class="col-sm-12">
                </div>
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
                        <td>홍길동</td>
                        <td><button type="button" class="btn btn-sm btn-outline-dark">받기</button></td>
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
          <div class="modal-footer" style="height:70px;">
            
          </div>
          <!-- footer 끝 -->
        </div>
        <!-- modal-content 끝 -->
      </div>
      <!-- modal-dialog 끝 -->
    </div>
    <!-- 파일함 Modal 끝 -->
