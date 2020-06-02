<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>

<style>
	.eadmin-index{
		background-color:rgba(37, 36, 36, 1);
		color:white;
	}

</style>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.js" integrity="sha256-8zyeSXm+yTvzUN1VgAOinFgaVFEFTyYzWShOy9w7WoQ=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.bundle.min.js" integrity="sha256-TQq84xX6vkwR0Qs1qH5ADkP+MvH0W+9E7TdHJsoIQiM=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js" integrity="sha256-nZaxPHA2uAaquixjSDX19TmIlbRNCOrf5HO1oHl5p70=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js" integrity="sha256-R4pqcOYV8lt7snxMQO/HSbVCFRPMdrhAFMH+vr9giYI=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.css" integrity="sha256-IvM9nJf/b5l2RoebiFno92E5ONttVyaEEsdemDC6iQA=" crossorigin="anonymous" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" integrity="sha256-aa0xaJgmK/X74WM224KMQeNQC2xYKwlAt08oZqjeF0E=" crossorigin="anonymous" />



<jsp:include page="/WEB-INF/views/admin/adminSidebar.jsp" />




<div class="col col-sm-10 admin-index">
<br>	
<br>	
<br>	
       
       <div class="col-sm-9">
	     <canvas id="reportArea" style=""></canvas>
       </div>
     
</div>	


 <script>
 	
 	var jsonData=${json};
 	var jsonObject=JSON.stringify(jsonData);
 	var jData=JSON.parse(jsonObject);
 	
 	var deptNameList = new Array();
 	var cntList=new Array();
 	var colorList=new Array();
 	
 	for(var i=0;i<jData.length;i++){
 		var d=jData[i];
 		deptNameList.push(d.deptName);
 		cntList.push(d.count);
 		colorList.push(colorize());
 	}
 	/* $.each(jsonData, function(i, e){
 		cntList.push(e.count);
 		}); */
 	var data={
 			labels:deptNameList,
 			datasets:[{
 					backgroundColor:colorList,
 					data:cntList
 			}],
 			options:{
 				title:{
 					display:true,
 					text:'부서 별 인원 수'
 				}
 			}
 	};
 
	var ctx=document.getElementById('reportArea').getContext('2d');
	new Chart(ctx,{
		type:'polarArea',
		data:data
	});
 
	function colorize() {
		var r = Math.floor(Math.random()*200);
		var g = Math.floor(Math.random()*200);
		var b = Math.floor(Math.random()*200);
		var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
		return color;
	}
 
 </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>