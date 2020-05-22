<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호찾기</title>
	<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   <!--  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script> -->
   	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>    
</head>
<body>
	<style>
		body{ 
			background-color:#233C61;
		}
	</style>
	<!-- 
	<h1>까먹은 ID를 찾아봅시다</h1>
	
		이름 <input type="text" name="userName" id="name"><br>
		핸드폰 번호 <input type="text" name="phone" id="phone"><br>
	
	<button id="findId">아이디 찾기</button>
	<br>
	<br>
	<span id="printId"></span>
	 -->
	
	
	
	<div class="full">
		<div class="container col-4">
			<div class="area_inputs wow fadeIn">
				<div class="sub_title font-weight-bold text-white text-center mt-4 mb-4">
					<h3>아이디/비밀번호 찾기</h3>
				</div>
				<div class="text-center">
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="search_1" name="search_total" onclick="search_check(1)" checked="checked">
						<label class="custom-control-label font-weight-bold text-white"	for="search_1">아이디 찾기</label>
					</div>
					<div class="custom-control custom-radio custom-control-inline">
						<input type="radio" class="custom-control-input" id="search_2" name="search_total" onclick="search_check(2)"> 
						<label class="custom-control-label font-weight-bold text-white" for="search_2">비밀번호 찾기</label>
					</div>
				</div>
				<br>
				
				<!--id 찾기 start -->
				
				<div id="searchI">
					<div class="form-group">
						<label class="font-weight-bold text-white" for="name">이름</label>
						<div>
							<input type="text" class="form-control" name="userName" id="name" placeholder="ex) 유승호" required>
						</div>
					</div>
					<div class="form-group">
						<label class="font-weight-bold text-white" for="phone">휴대폰번호</label>
						<div>
							<input type="text" class="form-control" id="phone" name="phone" placeholder="ex) 01012345678" required>
						</div>
					</div>
					
					<!-- 아이디 출력 -->
					<div id="printId" class="text-white text-center"></div>
					<br>
					
					<div class="form-group">
						<button id="findId" type="button" onclick="idSearch_click()" class="btn btn-primary btn-block">확인</button>
					<a class="btn btn-danger btn-block"	href="${path}">취소</a>
					</div>
				</div>
				<!--id 찾기 end -->
				
				<!-- pw 찾기 start -->
				
				<div id="searchP" style="display: none;">
						<div class="form-group">
							<label class="font-weight-bold text-white" for="userId">아이디</label>
							<div>
								<input type="text" class="form-control" id="userId" name="userId" placeholder="ex) madmax" required>
							</div>
						</div>
						<div class="form-group">
							<label class="font-weight-bold text-white" for="email">이메일</label>
							<div>
								<input type="email" class="form-control" id=email	name="email" placeholder="ex) madmax@gmail.com" required>
							</div>
						</div>
						<div class="form-group">
							<button id="findPw" type="button" class="btn btn-primary btn-block">확인</button>
							<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
						</div>
				</div>
				<!-- pw 찾기 end -->
			</div>
		</div>
	</div>
	
	  
	<script>
		function search_check(num) {
			if (num == '1') {
				document.getElementById("searchP").style.display = "none";
				document.getElementById("searchI").style.display = "";	
			} else {
				document.getElementById("searchI").style.display = "none";
				document.getElementById("searchP").style.display = "";
			}
		}
	
		// 아이디찾기
		$(document).one('click','#findId',function(){
			var name = $('#name').val();
		 	var phone = $('#phone').val();
		
		 	var postData = {'userName' : name , 'phone' : phone};
		
			$.ajax({
		        url:'${path}/user/findingId',
		        type:'POST',
		        data: postData,
		        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		        dataType : "json",
		
		        success:function(data){
		       		/* console.log(data.User.userId); */
	       	 		$("#printId").append("<h5>"+"회원님의 정보로 등록된 ID는 [ <b>"+ data.User.userId +"</b> ]입니다.</h5>");
		        },
		        error: function (XMLHttpRequest, textStatus, errorThrown){
		        	alert('정보를 다시 입력해주시길 바랍니다.' );
		        }
		        
		    });
		});
	
		// pw 찾기
		$(function(){
			$("#findPw").click(function(){
				$.ajax({
					url : "${path}/user/findingPw.do",
					type : "POST",
					data : {
						userId : $("#userId").val(),
						email : $("#email").val()
					},
					success : function(data) {
						/* console.log(data); */
						alert(data.msg);
						if(data.flag){
							location.replace("${path}/user/updatePw?userId="+$("#userId").val());						
						}else{
							$("#userId").val("");
							$("#email").val("");
							$("#userId").focus();
							return;
						}
					},
			        
				})
			});
		})
	</script>
	
	
    
</body>
</html>