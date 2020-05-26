<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정</title>
<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
   	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</head>
<body>
<style>
	body{ 
		background-color:#233C61;
		}
	.mBtn {
		background-color:#233C61;
		margin: 30px 0 100px 10px; 
		width:270px;
		height:40px;		
		font-size : 17px;
		font-weight : 600;
		color :white; 
		border: 2px solid #FFE3E3; 
		border-radius:50px;
	}
    
    .mBtn:hover{
    	background-color: #FFE3E3;
    	color : #233C61;
    }
</style>  
   <section class="section overfree text-center">
      <div class="area_inputs wow fadeIn">
			<div class="sub_title font-weight-bold text-white text-center mt-4 mb-4">
      			<h3>비밀번호 수정</h3>
	  		</div>
	  </div>
      <div class="container">
         <div class="row">
            <div class="col-md-4"></div>

            <div class="col-md-4">
               <form action="${path}/user/updatePw.do" method="post" role="form" class="contactform">
                  <input type="hidden" name="userId" value="${ param.userId }"/>
                  <div class="form-group">
                     <input type="password" class="form-control" id="password" name="password" placeholder="임시 비밀번호를 입력해주세요." required/>
                        <div class="alert alert-success" id="alert-success1">임시 비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger1">임시 비밀번호가 일치하지 않습니다.</div>
                  </div>
                  <br>
                  <div class="form-group">
                     <input type="password" class="form-control" id="password1" name="password1" placeholder="새 비밀번호를 입력해주세요." required/>
                  </div>
                  <div class="form-group">
                     <input type="password" class="form-control" id="password2" name="password2" placeholder="새 비밀번호를 다시 입력해주세요." required/>
                        <div class="alert alert-success" id="alert-success2">비밀번호가 일치합니다.</div>
                        <div class="alert alert-danger" id="alert-danger2">비밀번호가 일치하지 않습니다.</div>
                  </div>
                  
                  <input type="submit" id="check" class="mBtn" value="수정완료!"/>
               </form>
            </div>
            <script>
            $(function(){
               $("#alert-success1").hide();
               $("#alert-danger1").hide();
               $("input").keyup(function(){
                  var pwd1 = $("#password").val();
                  $.ajax({
               	   url:"${path}/checkTemp.do",
               	   data:{id:"${param.userId}",pw:pwd1},
               	   success:function(data){
               		   if(data){
                              $("#alert-success1").show();
                              $("#alert-danger1").hide();
                              $("#check").removeAttr("disabled");
                           } else {
                              $("#alert-success1").hide();
                              $("#alert-danger1").show();
                              $("#check").attr("disabled","disabled");
                           }
               	   		}
                  })
               });
            });

             $(function(){
               $("#alert-success2").hide();
               $("#alert-danger2").hide();
               $("input").keyup(function(){
                  var pwd1 = $("#password1").val();
                  var pwd2 = $("#password2").val();
                  if(pwd1 != "" || pwd2 != ""){
                     if(pwd1 == pwd2){
                        $("#alert-success2").show();
                        $("#alert-danger2").hide();
                        $("#check").removeAttr("disabled");
                     } else {
                        $("#alert-success2").hide();
                        $("#alert-danger2").show();
                        $("#check").attr("disabled","disabled");
                     }
                  }
               });
           }); 
             
         </script>
      
            <!-- end col -->

            <div class="col-md-4"></div>
            <!-- end col -->
         </div>
         <!-- end row -->
      </div>
      <!-- end container -->
   </section>
</body>
</html>