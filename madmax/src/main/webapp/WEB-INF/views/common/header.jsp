<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${param.title }</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<!-- fontawesome -->
<script src="https://kit.fontawesome.com/b5f4d53f14.js" crossorigin="anonymous"></script>
<!-- google icon-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<!-- 카카오지도 api&services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dd85c7c19c3d45f5bedf296de1914e7f&libraries=services,clusterer,drawing"></script>
<style>	
	.navBtn{
		font-weight:bolder; font-size:13px; color: white; 
		width: 6em; height:3em; border-radius: 30px; 
		background-color: #25558F; margin-right:1em;
	}
	.navBtn:hover{ background-color: #233C61; color: white; font-weight:bolder; }	
	
	
	.checkBtn{
	 	width:90px;
		font-size : 17px;
		font-weight : 600;
		color : #233C61; 
		border: 3px solid #233C61; 
		border-radius:50px;
		margin-right:12px;
	}
	.changeBtn{
		width:90px;
		font-size : 17px;
		font-weight : 600;
		background-color:#233C61;
		border: 3px solid #233C61; 
		border-radius:50px;
		color:white;
		margin-right:12px;
	
	}
</style>
</head>
<body>
	<div class="header-container">
		<header>
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand" href="${path }/main.do">
					<img src="${path }/resources/images/logo.png" alt="logo" width="180px;"/>
				</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"></li>
				</ul>
				<button type="button" class="btn checkBtn" data-toggle="modal" data-target="#checkState" >출/퇴근</button>
				
				<!-- 모달창 -->
				
				 <div class="modal fade" id="checkState">
				    <div class="modal-dialog">
				      <div class="modal-content">
				      
					      <form id="checkForm">
					        <div class="modal-header">
					        <!-- Modal Header -->
					          <h4 class="modal-title">⏱️ 출/퇴근</h4>
					          <button type="button" class="close" data-dismiss="modal">×</button>
					        </div>
				        
					        <!-- Modal body -->
					        <div class="modal-body">
					        	<div class="row justify-content-center">
					        	 
						        		<label class="btn btn-secondary">
								          <input type="radio" class="btn checkBtn changeBtn" name="timeState" id="come" value="출근" >출근
								        </label>
								        <label class="btn btn-secondary">
								          <input type="radio" class="btn checkBtn changeBtn" name="timeState" id="go" value="퇴근">퇴근
								        </label>
						            
						        </div>
							</div>
				        	<!-- Modal footer -->
					        <div class="modal-footer">
					            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
	                            <button  type="button" class="btn btn-primary" style="background-color: #233C61; border-color: #233C61;" >요청완료</button>
					        </div>
				        </form>
				      </div>
				    </div>
				  </div>
				
				
				
				
				
				<button type="button" class="btn navBtn" onclick="location.replace('${path}/attd/attendList.do')">근태현황</button>
				<button class="btn my-2 my-sm-0" type="button" data-toggle="modal" data-target="#">
					<i class="far fa-bell"></i>
				</button>&nbsp;&nbsp;
				<button class="btn  my-2 my-sm-0"  type="button" data-toggle="modal" data-target="#">
					<i class="far fa-comment-alt"></i>
				</button>&nbsp;&nbsp;
				<c:if test="${loginMember==null }">
					<button class="btn  my-2 my-sm-0"  type="button" onclick="location.replace('${path}/user/logout.do');">
						<i class="fas fa-running"></i><!-- <i class="fas fa-door-open"></i><i class="fas fa-sign-out-alt"></i><i class="fas fa-person-booth"></i> -->
					</button>
				</c:if>
			</div>
		</nav>
		</header>
	</div>	
	<div class="container-fluid">
		<div class="row">	
		
		
		<script>
		$(document).ready(function() {

			$("#come").click(function() { 
				//console.log("!!!");
				$.ajax({
					url : '${path}/attd/checkCometime.do',
					type:"post",
					data:$("#checkForm").serialize(),
					success : function(data) { 
						console.log(data);
						if(data){
							alert("출근 시간이 이미 입력되었습니다.");
							//$('#checkState').modal("hide");
						}else if(data==false) {
							// 출근 시간이 있으면 true,없으면 false;
							
							
							//console.log(stateRequest());
							//$('#checkState').modal("hide");
							stateRequest();
						}
					}
				});
			});
		});
		
 		$(document).ready(function() {

			$("#go").click(function() { 
				$.ajax({
					url : '${path}/attd/checkGotime.do',
					type:"post",
					data:$("#checkForm").serialize(),
					success : function(data) { 
						console.log(data);
						// 있으면 true,없으면 false;
						if(data){
							alert("퇴근 했습니다.");
							return ;
						}else if(data==false){
							stateRequest();
						}
					}
				});
			});
		}); 
		
		
		

 		 	function stateRequest(){
				
				alert("요청 완료됐습니다.");
		
				
				$('#checkState').modal("hide");
				
				$("#checkForm").attr("action","${path}/attd/stateRequest.do");
				$("#checkForm").submit();	

			} 
		 	
		 	
	        $(function(){
	        	
                $(".checkBtn").click(function(){
                    
                    // 클래스 제거 
                    $('.checkBtn').removeClass("changeBtn");
                    $(".checkBtn").addClass("checkBtn");
                    $(this).removeClass("checkBtn");
                    //클래스 추가
                    $(this).addClass("changeBtn");
                    
                })
            }) 
		
		
		</script>	
		
		
		
		