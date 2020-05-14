<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<style>
	ul{
	   list-style:none;
	   padding-left:5px;
	   }
	li{
		padding-left:9px; padding-bottom:3px;
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
</style>

<div class="col col-sm-2">
	<br>	
	<nav>
		<ul class="menu">
			<li>
				<div class="user-container">
					<button type="button" class="userBtn btn btn-light">
						<i class="far fa-user" style="font-size:40px;"></i>
						<span><i style="font-size:8px;">증명사진</i></span>
					</button><br>
					<span><strong>UserName</strong>님</span>				
				</div>
			</li>
			<hr>
<<<<<<< HEAD
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
                                        	<li><a href="${pageContext.request.contextPath}/attd/attendList.do"><i class="icon far fa-address-card"></i>근태조회</a></li>
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
											<li><a href=""><i class="icon far fa-calendar-check"></i>전체 업무</a></li>
											<li><a href=""><i class="icon far fa-calendar-alt""></i>전체 일정</a></li>
											<li><a href=""><i class="icon far fa-bookmark"></i>담아둔 글</a></li>
											<li><a href=""><i class="icon fas fa-at"></i>나를 지정</a></li>	
											<li><a href=""><i class="icon far fa-smile"></i>내 게시물</a></li>
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
									      <span class="p-3"><a href="">기안문 작성</a></span><br>
									      <span class="p-3"><a href="">결재 요청함</a></span><br>
									      <span class="p-3"><a href="">임시 문서함</a></span>
									    </div>
                                    </div>
								    <hr>
                                    <div class="card-content">
                                        <div class="p-2">
									      <h5 class="h6"><i class="icon fas fa-edit"></i><b>결재</b></h5>
									      <span class="p-3"><a href="">결재 대기함</a></span><br>
									      <span class="p-3"><a href="">결재 진행함</a></span><br>
									      <span class="p-3"><a href="">완료 문서함</a></span>
									    </div>
                                    </div>
								  	<hr>
                                    <div class="card-content">
                                        <div class="p-2">
									      <h5 class="h6"><i class="icon far fa-folder-open"></i><b>문서함</b></h5>
									      <span class="p-3"><a href="">내 문서함</a></span><br>
									      <span class="p-3"><a href="">부서 문서함</a></span><br>
									      <span class="p-3"><a href="">참조 문서함</a></span><br>
									      <span class="p-3"><a href="">개인 문서함</a></span>
									    </div>
                                    </div>
								    <hr>
                                </div>
                            </div>
                        </div>
	                </div>
			</li>
			    <!-- Elements Section End -->
<!--			        
			<li class="">
				<div class="">
				  <nav class="navbar" style="padding-left:0;" >
				    <button class="navbar-toggler dropdown-toggle text-center" style="padding-left:0;" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
				      <span class=""><b>전자결재</b></span>
				    </button>
				  </nav>
				  <div class="collapse" id="navbarToggleExternalContent">
				    <div class="p-2">
				      <h5 class="h6"><b>기안</b></h5>
				      <span class="p-3">기안문 작성</span><br>
				      <span class="p-3">결재 요청함</span><br>
				      <span class="p-3">임시 문서함</span>
				    </div>
				  <hr>
				  </div>
				  <div class="collapse" id="navbarToggleExternalContent">
				    <div class="p-2">
				      <h5 class="h6"><b>결재</b></h5>
				      <span class="p-3">결재 대기함</span><br>
				      <span class="p-3">결재 진행함</span><br>
				      <span class="p-3">완료 문서함</span>
				    </div>
				  	<hr>
				  </div>
				<div class="collapse" id="navbarToggleExternalContent">
				    <div class="p-2">
				      <h5 class="h6"><b>문서함</b></h5>
				      <span class="p-3">내 문서함</span><br>
				      <span class="p-3">부서 문서함</span><br>
				      <span class="p-3">참조 문서함</span><br>
				      <span class="p-3">개인 문서함</span>
				    </div>
				  <hr>
				</div>
				</div>
			</li>
  -->
=======
			<li>회사 공개 프로젝트</li>
			<li>전체 프로젝트</li>
			<li>즐겨찾기</li>
			<hr>
			<li><a href="${path }/task/selectTask.do">전체 업무</a></li>
			<li>전체 일정</li>
			<li>담아둔 글</li>
			<li>나를 지정</li>	
			<li>내 게시물</li>
			<hr>
			<li>숨긴 프로젝트</li>
			<hr>	
>>>>>>> branch 'dev' of https://github.com/lamaisrama/madmax.git
		</ul>
	</nav>
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






</div>