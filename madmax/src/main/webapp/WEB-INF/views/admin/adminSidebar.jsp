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
        
        
      #adminSidebar{
       	background-color: #4f545d;
       	
      }

</style>

<div class="col col-sm-2" >
	<br>	
	<nav>
		<ul class="menu">
			<li>
				<div class="user-container text-center">
					<div class="imgbox">
		                <div class="img2">
		                	<img src="${path}/resources/upload/profile/${loginUser.profile}" 
		                		style="border: 3px solid #233C61; 
					            border-radius: 500px; width:150px; height:150px; overflow:hidden;">
            			</div> 
			        </div>   

					<%-- <button type="button" class="userBtn btn btn-light">
						<img src="${path }/resources/upload/profile/${loginUser.profile }" style="width: 100px; height: auto;">
					</button> --%>
					<br><br>
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
                                        회원관리
                                    </a>
                                </div>
                                <div id="collapseOne" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
                                        <ul>
                                        	<li><a href="${path}/admin/signupApproval.do"><i class="fas fa-user-plus"> 가입 승인</i></a></li>
                                        	<li><a href="${path}/admin/userManagement.do"><i class="fas fa-user-times"> 회원 관리</i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseTwo">
                                        근태관리
                                    </a>
                                </div>
                                <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
	                                        <div class="p-2">
										      <span class="p-3"><a href="${path}/admin/adminAttendManagement.do">근태관리</a></span><br>
										    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseThree">
                                        프로젝트관리
                                    </a>
                                </div>
                                <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
                                        <div class="p-2">
									      <span class="p-3"><a href="">프로젝트 삭제</a></span><br>
									      <span class="p-3"><a href="">프로젝트 관리자 변경</a></span><br>
									    </div>
                                    </div>
                                </div>
                            </div>
                            <div class="card">
                                <div class="card-heading">
                                    <a data-toggle="collapse" data-target="#collapseFour">
                                        전자결재관리
                                    </a>
                                </div>
                                <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                    <div class="card-content">
                                        <div class="p-2">
									      <span class="p-3"><a href="">양식 작성</a></span><br>
									      <span class="p-3"><a href="">자가 결재 권한 부여</a></span><br>
									    </div>
                                    </div>
                                </div>
                            </div>
                        </div>
	                </div>
			</li>
		</ul>
	</nav>



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
$("#myModal").modal("hide");
});
$("#optionClose").click(()=>{
$("#myModal").modal("hide");
$("#moreOptionModal").modal("hide");
});

</script>