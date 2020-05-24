<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<style>
	ul{
	   list-style:none;
	   padding-left:5px;
	   }
	li{
		padding-left:9px; 
		padding-bottom:3px;
		cursor:pointer;
	}
	.userBtn{
		border:1px solid lightgrey;
		border-radius: 50%;
		width: 70px;
		height: 70px;
	}
	
	.menu a{cursor:pointer;}
    .menu .hide{display:none;}
    
    .icon {
    	text-align:center;
    	width:35px; 
    }
    
    /* Accordion Styles */
	.accordin-elem {
		width:80%;
		/* margin-bottom: 45px; */
	}
	
	.accordin-elem .card {
		border: none;
		margin-bottom: 20px;
	}
	
	.accordin-elem .card .card-heading {
		padding-left: 15px;
	 	width:100%;
	 	line-height: 40px;
		/* background: #EBEDF8; */
		/* padding: 22px 30px 22px 35px; */
	}
	
	.accordin-elem .card .card-heading a {
		font-size: 18px;
		font-weight: 700;
		letter-spacing: 0.5px;
		cursor: pointer;
		display: block;
		text-align: left;
	}
	
	.accordin-elem .card .card-content {
		color: #7b7b7b;
		font-size: 16px;
		font-weight: 400;
		line-height: 30px;
		padding : 15px 0px 0 20px;
	}
	
	.accordin-elem .card .card-content a:link{
		text-decoration: none;
	}
	.accordin-elem .card .card-content a:visited{
		color: #7b7b7b; 
		text-decoration: none;
	}
	.accordin-elem .card .card-content a:hover{
		color: #233C61;
		font-weight: 700;
	}
	
	/* .accordin-elem .card:first-of-type {
		border-top-left-radius: 0;
		border-top-right-radius: 0;
	}
	
	.accordin-elem .card:last-of-type {
		border-bottom-left-radius: 0;
		border-bottom-right-radius: 0;
	} */
	
	.accordin-elem .card-heading a:after,
	.accordin-elem .card-heading>a.active[aria-expanded=false]:after {
		content: "+";
		float: right;
		font-size: 14px;
		font-weight: 700;
		color: #060a0f;
	}
	
	.accordin-elem .card-heading a[aria-expanded=true]:after,
	.accordin-elem .card-heading>a.active:after {
		content: "-";
		float: right;
		font-size: 14px;
		font-weight: 700;
		color: #060a0f;
	}
	
	.accordin-elem .card-heading.active {
		background: #233EDE;
		color: #fff;
	}
	
	.accordin-elem .card-heading.active a:after {
		color: #fff;
	}
	
	.newProjectBtn {
		width:100%;
		font-size : 17px;
		font-weight : 600;
		color : #233C61; 
		border: 3px solid #233C61; 
		border-radius:50px;
	}
	
	.imgbox{
            display: flex;
            justify-content: center;
        }
        
    .img2{
            /* width: 100px;
            height: 100px;
            border: 1px solid #233C61;
            border-radius: 500px; */
            /* background-size: cover; */
        }    
        
</style>

<div class="col col-sm-2">
	<br>	
	<nav>
		<ul class="menu">
			<li>
				<div class="user-container text-center">
					<div class="imgbox">
		                <div class="img2">
		                	<img src="${path }/resources/upload/profile/${loginUser.profile }" 
		                		style="border: 3px solid #233C61; 
					            border-radius: 500px; width:130px; height:130px; overflow:hidden;">
            			</div> 
			        </div>   
					<br>
					<c:if test="${loginUser!=null}">
						<div><strong><c:out value="${loginUser.userName }"/></strong>님, 안뇽!</div>
					</c:if>				
				</div>
			</li>
			<hr>
			<li>
				<!-- Elements Section Begin -->
	            <div class="row">
                    <div class="accordin-elem">
                        <div class="accordion" id="accordionExample">
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseOne">
                                        근태관리
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
                                        <ul>
                                        	<li><a href="${path}/attd/attendList.do"><i class="icon far fa-address-card"></i>근태조회</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">
                                        프로젝트
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
                                        <ul>
                                        	<li><button type="button" class="btn mb-4 text-center newProjectBtn" style=""  data-toggle="modal" data-target="#myModal">
                                        	+&nbsp;&nbsp;새 프로젝트</button></li>                                        	
											<li><a href="${path }/project/projectList.do"><i class="icon fas fa-project-diagram"></i>전체 프로젝트</a></li>
											<li><a href="${path }/project/bookmarkProjectList.do"><i class="icon fas fa-star"></i>즐겨찾기 프로젝트</a></li>
                                        	<hr>
											<li><a href="${path }/task/selectTask.do"><i class="icon far fa-calendar-check"></i>전체 업무</a></li>
											<li><a href="${path }/calendar/calendar.do"><i class="icon far fa-calendar-alt"></i>전체 일정</a></li>
											<li><a href="${path }/project/bookmarkList.do"><i class="icon far fa-bookmark"></i>담아둔 글</a></li>
											<li><a href="${path }/project/myNoti.do"><i class="icon fas fa-at"></i>나를 지정</a></li>	
											<li><a href="${path }/project/myBoard.do"><i class="icon far fa-smile"></i>내 게시물</a></li>
											<hr>
											<li><a href=""><i class="icon far fa-eye-slash"></i>숨긴 프로젝트</a></li>
											<hr>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">
                                        전자결재
                                    </a>
                                </div>
                                <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
                                        <div class="p-2">
									      <h5 class="h6"><i class="icon far fa-edit"></i><b>기안</b></h5>
									      <span class="p-3"><a href="${path }/appr/approval.do">기안문 작성</a></span><br>
									      <span class="p-3"><a href="${path }/appr/apprReqBox.do">결재 요청함</a></span><br>
									      <span class="p-3"><a href="${path }/appr/apprTempBox.do">임시 문서함</a></span>
									    </div>
                                    </div>
								    <hr>
                                    <div class="card-content">
                                        <div class="p-2">
									      <h5 class="h6"><i class="icon fas fa-edit"></i><b>결재</b></h5>
									      <span class="p-3"><a href="${path }/appr/apprWaitBox.do">결재 대기함</a></span><br>
									      <span class="p-3"><a href="${path }/appr/apprProgBox.do">결재 진행함</a></span><br>
									      <span class="p-3"><a href="${path }/appr/apprDoneBox.do"">완료 문서함</a></span>
									    </div>
                                    </div>
								  	<hr>
                                    <div class="card-content">
                                        <div class="p-2">
									      <h5 class="h6"><i class="icon far fa-folder-open"></i><b>문서함</b></h5>
									      <span class="p-3"><a href="${path }/appr/myDocBox">내 문서함</a></span><br>
									      <span class="p-3"><a href="${path }/appr/deptDocBox">부서 문서함</a></span><br>
									      <span class="p-3"><a href="${path }/appr/referedDocBox">참조 문서함</a></span><br>
									      <span class="p-3"><a href="${path }/appr/myStorageBox">개인 문서함</a></span>
									    </div>
                                    </div>
								    <hr>
                                </div>
                            </div>
                        </div>
	                </div>
			</li>
			
		</ul>
	</nav>
	<!-- 
	<div>
        <ul>
            <li class="menu">
                <a>메뉴1</a>
                <ul class="hide">
                    <li>메뉴1-1</li>
                    <li>메뉴1-2</li>
                    <li>메뉴1-3</li>
                    <li>메뉴1-4</li>
                    <li>메뉴1-5</li>
                    <li>메뉴1-6</li>
                </ul>
            </li>
     
            <li class="menu">
                <a>메뉴2</a>
                <ul class="hide">
                    <li>메뉴2-1</li>
                    <li>메뉴2-2</li>
                    <li>메뉴2-3</li>
                    <li>메뉴2-4</li>
                    <li>메뉴2-5</li>
                    <li>메뉴2-6</li>
                </ul>
            </li>
        </ul>
    </div>
	<script>
		/* html dom이 다 로딩된 후 실행 */
		$(document).ready(function(){
		    // menu 클래스 바로 아래 a 태그를 클릭했을때
		    $(".menu>a").click(function(){
		        var submenu = $(this).next("ul");
		
		        // submenu 부드럽게
		        if(submenu.is(":visible") ){
		            submenu.slideUp();
		        }else{
		            submenu.slideDown();
		        }
		    });
		});
	</script>
 -->
<!-- 새프로젝트 만들기 -->
<div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header" style="background-color: #F1F0F5">
                    <h6 class="modal-title">프로젝트 만들기</h6>
                    <button type="button" class="close" id="mainClose">&times;</button>
                </div>
                <!--Modal Body-->
                <div class="modal-body d-block ml-3">
                    <ul class="list-unstyled">
                    	<form action="${path }/project/insertProject.do" method="post">
                        <li class="mb-2">
                            <input type="text" class="form-control" name="projectTitle" placeholder="프로젝트 제목을 입력하세요" 
                            style="font-size: 25px; font-weight: bolder;">
                        </li>
                        <hr>
                        <li>
                            <p><b>옵션 설정</b></p>
                        </li>
                        <li class="d-flex mb-3">
                            <div class="mr-3">
                            <i class='fas fa-globe-asia' style='font-size:24px'></i>
                            </div>
                           		 프로젝트 전체공개 여부 &nbsp;
                            <div class="custom-control custom-switch">
                                <input type="checkbox" class="custom-control-input"  name="projectType" id="projectType" checked>
                                <label class="custom-control-label" for="projectType"></label>
                            </div>
                        </li>
                      
                       
                    </ul>
                </div>
                <!-- Modal footer -->
                <div class="modal-footer d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary" >프로젝트 생성</button>
                </div>
                </form>
            </div>
        </div>
    </div>


</div>

<script>
/* $('#openProject').on( 'click', function() {
    if($("#openProject").is(":checked")){
    	$(".custom-control-label").text('공개');
    }else{
    	
    }
}); */
$("#moreOption").click(()=>{
    $("#myModal").hide();
    $("#moreOptionModal").show();
});
$("#mainClose").click(()=>{
$("#myModal").modal('hide');
});
/* $("#optionClose").click(()=>{
$("#myModal").hide();
$("#moreOptionModal").modal("hide");
}); */

</script>