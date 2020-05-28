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
<link rel="stylesheet" href="${path }/resources/css/header.css">
</head>
<body>
	<div class="header-container">
		<header>
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand" href="${path }/project/favList.do">
					<img src="${path }/resources/images/logo.png" alt="logo" width="180px;"/>
				</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"></li>
				</ul>
				<c:if test="${loginUser.userId=='admin'}">
					<button type="button" class="btn headerBtn" onclick="location.replace('${path}/admin/adminIndex.do')">관리자</button>
				</c:if>
				<button type="button" class="headerBtn" data-toggle="modal" data-target="#checkState" >출/퇴근</button>
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
					        <div class="modal-footer" style="height:50px;">
					        </div>
				        </form>
				      </div>
				    </div>
				  </div>
				

				    <!-- Notification 모달창 -->
				    <!-- The Modal -->
				    <div class="modal fade" id="notificationModal">
					</div><!-- Notification 모달 창 끝 -->

				<%-- <button type="button" class="btn navBtn" onclick="location.replace('${path}/attd/attendList.do')">근태현황</button> --%>
				&nbsp;&nbsp;
				<!-- data-badge 안에 안 읽은 알람 추가 -->
				<button class="headerBtn badge1" type="button" id="btnNoti"
						data-badge="" onclick="openNotification('${loginUser.userId}');">
					<i class="far fa-bell"></i>
				</button>&nbsp;&nbsp;
				<c:if test="${loginUser!=null}">
					<button class="headerBtn" type="button" onclick="location.replace('${path}/user/logout.do');">로그아웃</button>
				</c:if>
			</div>
		</nav>
		</header>
	</div>
	
	<!-- 알림 메시지 표시 구역 -->
	<div id="snackbar"></div>	
	
	<div class="container-fluid">
		<div class="row">	
		
		
<script>
	//소켓 서버와 연결
	var socket = new WebSocket('ws://localhost:9090/${path}/notification');
	
	socket.onopen=function(){
		console.log('info : connection opend');
		sendLoginMessage();
		//sendTest();
	}

	socket.onmessage=function(data){
		const msg = JSON.parse(data.data);
		if(msg.type=="count"){
			$("#btnNoti").addClass("badge1").attr("data-badge", msg.msg);
		}else{
			//새로 알림이 추가이 됬으니까 개수 변경여부 업데이트
			getUnreadNotificationCount();
			//sanckbar로 알림 내용 보여주기
			$("#snackbar").html(msg.msg);
			showSnackbar();
		}  		
	}
	
	function sendLoginMessage(){
		
		var loginMsg=new SocketMessage('login', '${loginUser.userId}', '${loginUser.userId}', '');
		socket.send(JSON.stringify(loginMsg));
		
	}
	
	function getUnreadNotificationCount(){
		var countMsg = new SocketMessage('count', '${loginUser.userId}', '${loginUser.userId}', '');
		socket.send(JSON.stringify(countMsg));
	}

	
	function sendTest(){
		var title='테스트에용'
		socket.send(JSON.stringify(new SocketMessage('newNoti','${loginUser.userId}','user5',
				'글'+title+'에서 ${loginUser.userName}님이 회원님을 언급했습니다.' )));
	}

    function showSnackbar() {
        // Get the snackbar DIV
        var x = document.getElementById("snackbar");

        // Add the "show" class to DIV
        x.className = "show";

        // After 3 seconds, remove the show class from DIV
        setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
    }  
	 
	function SocketMessage(type, sender, receiver, msg){
		this.type=type; // 'login', 'writing', 'task', 'schedule', 'comment'
		this.sender=sender;
		this.receiver=receiver;
		this.msg=msg;
	}

	function openNotification(userId){
       	$.ajax({
       		url:"${path}/noti/notification.do?userId="+userId,
       		dataType:"html",
       		success:(data)=>{
       			$("#notificationModal").html(data);
       			$("#notificationModal").modal('show');
       		}	
       	});

    }
	
	
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
					$('#checkState').modal("hide");
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
			url:'${path}/attd/checkCometime.do',
			type:"post",
			data:$("#checkForm").serialize(),
			success : function(data) {
				// 출근 시간이 있으면 true,없으면 false;
				console.log(data);
				if(data){
					
					$.ajax({
						url : '${path}/attd/checkGotime.do',
						type:"post",
						data:$("#checkForm").serialize(),
						success : function(data) { 
							console.log(data);
							// 있으면 true,없으면 false;
							if(!data){
								confirm("이미 퇴근시간이 찍혀있습니다. 수정하시겠습니까? ");
								//return;
								$("#checkForm").attr("action","${path}/attd/updateGoTime.do");
								$("#checkForm").submit();	
							}else{
								alert("퇴근 시간이 입력되었습니다.");
								stateRequest();
							}
						}
					});
					
				}else{
					
					$.ajax({
						
						url:'${path}/attd/noComeTime.do',
						type:"post",
						data:$("#checkForm").serialize(),
						success:function(date){
							alert("출근시간이 입력되지 않아 지각처리 됩니다 !");
							$('#checkState').modal("hide");
						}
					});
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
		
		
		
		