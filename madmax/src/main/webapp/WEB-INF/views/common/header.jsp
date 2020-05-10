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
<style>	
	.navBtn{
		font-weight:bolder; font-size:13px; color: white; 
		width: 6em; height:3em; border-radius: 30px; 
		background-color: #25558F; margin-right:1em;
	}
	.navBtn:hover{ background-color: #233C61; color: white; font-weight:bolder; }	
</style>
</head>
<body>
	<div class="header-container">
		<header>
			<nav class="navbar navbar-expand-lg">
				<a class="navbar-brand" href="#">
					<img src="${path }/resources/images/logo.png" alt="logo" width="100px"/>
				</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active"></li>
				</ul>
				<button type="button" class="btn navBtn">조직도</button>
				<button type="button" class="btn navBtn" onclick="location.assign('${path}/appr/approval.do')">전자결재</button>
				<button type="button" class="btn navBtn" onclick="">근태현황</button>
				<button type="button" class="btn navBtn">일정</button>
				<button class="btn my-2 my-sm-0" type="button" data-toggle="modal" data-target="#">
					<i class="far fa-bell"></i>
				</button>&nbsp;&nbsp;
				<button class="btn  my-2 my-sm-0"  type="button" data-toggle="modal" data-target="#">
					<i class="far fa-comment-alt"></i>
				</button>&nbsp;&nbsp;
			</div>
		</nav>
		</header>
	</div>	
	<div class="container-fluid">
		<div class="row">		
		