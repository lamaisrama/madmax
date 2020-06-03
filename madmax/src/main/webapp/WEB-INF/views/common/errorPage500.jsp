<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%-- <jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<div class="col col-sm-10"> --%>
	
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>

<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@700&display=swap" rel="stylesheet">	
	
<style>
        @import url(https://fonts.googleapis.com/css?family=Raleway);
        
        html, body{
          height: 100%;
          font-family: 'Noto Sans KR', sans-serif;
          /* font-weight: 800; */
          text-align: center;
        }
        
        body{
          background: #030321;
          margin-bottom : 150px;
        }
        
        svg {
            font-family: 'Raleway';
            display: block;
            font: 10.5em 'Raleway';
            width: 60%;
            height: 60%;
            margin: 0 auto;
        }
        
        .text-copy {
            fill: none;
            stroke: white;
            stroke-dasharray: 6% 29%;
            stroke-width: 5px;
            stroke-dashoffset: 0%;
            animation: stroke-offset 5.5s infinite linear;
        }
        
        .text-copy:nth-child(1){
            stroke: #FFE3E3;
            animation-delay: -1;
        }
        
        .text-copy:nth-child(2){
            stroke: #233C61;
            animation-delay: -2s;
        }
        
        .text-copy:nth-child(3){
            stroke: #FFE3E3;
            animation-delay: -3s;
        }
        
        .text-copy:nth-child(4){
            stroke: #D0D0D4;
            animation-delay: -4s;
        }
        
        .text-copy:nth-child(5){
            stroke: #FFE3E3;
            animation-delay: -5s;
        }
        
        a:link{
            text-decoration: none;
        }
        a:visited{
            color: #7b7b7b; 
            text-decoration: none;
        }
        a:hover{
            color: #FFE3E3;
            font-weight: 700;
        }
        
        @keyframes stroke-offset{
            100% {stroke-dashoffset: -35%;}
        }

        .errorBtn {
		margin: 20px 0 100px 10px; 
		width:270px;
        height: 3em;
		font-weight : 600;
		border: 2px solid #FFE3E3; 
		border-radius:50px;
		color : #FFE3E3;
        background-color: #030321;
	    }      
        .errorBtn:hover{
        background-color: #FFE3E3;
        color : #030321;
        }
        </style>
        
        <svg viewBox="0 0 1200 300">
            <symbol id="s-text">
                <text text-anchor="middle" x="50%" y="80%">500ErrorPage</text>
            </symbol>
        
            <g class = "g-ants">
                <use xlink:href="#s-text" class="text-copy"></use>
                <use xlink:href="#s-text" class="text-copy"></use>
                <use xlink:href="#s-text" class="text-copy"></use>
                <use xlink:href="#s-text" class="text-copy"></use>
                <use xlink:href="#s-text" class="text-copy"></use>
            </g>
        </svg>
        <h4 style="color: #FFE3E3;">관리자에게 문의하세요</h4>
        <a href="${path }"><button class="errorBtn">메인으로 돌아가기</button></a>
	
	
	



