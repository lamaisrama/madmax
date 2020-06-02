<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

<link href='${path}/resources/css/main.css' rel='stylesheet' />
<link href='${path}/resources/css/weather-icons.css' rel='stylesheet' />
<link href='${path}/resources/css/weather-icons.min.css' rel='stylesheet' />
<link href='${path}/resources/font/weathericons-regular-webfont.woff' rel='stylesheet' />
<link href='${path}/resources/font/weathericons-regular-webfont.woff2' rel='stylesheet' />
<link href='${path}/resources/mainresources/calendar/core/main.css' rel='stylesheet' />
<link href='${path}/resources/mainresources/calendar/daygrid/main.css' rel='stylesheet' />
<link href='${path}/resources/mainresources/calendar/timegrid/main.css' rel='stylesheet' />
<link href='${path}/resources/mainresources/calendar/list/main.css' rel='stylesheet' />
<script src='${path}/resources/mainresources/calendar/core/main.js'></script>
<script src='${path}/resources/mainresources/calendar/interaction/main.js'></script>
<script src='${path}/resources/mainresources/calendar/daygrid/main.js'></script>
<script src='${path}/resources/mainresources/calendar/timegrid/main.js'></script>
<script src='${path}/resources/mainresources/calendar/list/main.js'></script>
<script src='${path}/resources/mainresources/calendar/google-calendar/main.js'></script>

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<div class="maincontainer col-sm-10" id="area"> <!-- style="border:1px solid green;" -->
	<div class="row mt-4" id="area"> 
    	<div class="row justify-content-around" style="background-color: transparent;">
                  
                    <!-- 달력출력하는 부분 -->
                    <div class="col-sm-6" id="calendar" style="background-color: #fff; padding: 15px 15px; border:1px solid #F1F0F5;"></div>
                       	
					<!-- 날씨 & 공지 -->
                    <div class="col-sm-4" style="border-bottom:1px solid #E8E8EB;">
                    
                    	<!-- 날씨 -->
                           <h5 class="modal-title mb-2"><i class="wi wi-day-cloudy"></i>&nbsp;WEATHER</h5>
                               <div id="">
								<table class="weathertbl text-center">
									<tr>
										<td class="weathertd" rowspan="3" colspan="3"><div id="weatherArea"></div></td>					
										<td colspan="3" class="display-4 text-right pr-3 pb-2 pt-2 weathertd text-white" id="weatherTemp" width="50%;"></td>
									</tr>
									<tr >
										<!-- 상세설명 -->
										<td colspan="3" class="text-right pr-3 pb-2 weathertd text-white" id="weatherDesc"></td>
									</tr>
									<tr>
										<!-- 위치 -->
										<td colspan="3" class="text-right pr-3 pb-2 weathertd text-muted" id="weatherCity"></td>
									</tr>
									<tr><td class="weathertd text-white" colspan="6">&nbsp;</td></tr>
									<tr>
										<td colspan="2" class="pt-2"><i class="wi wi-humidity"></i></td>
										<td colspan="2" class="pt-2"><i class="wi wi-sandstorm"></i></td>
										<td colspan="2" class="pt-2"><i class="wi wi-cloudy"></i></td>
									</tr>
									<tr>
										<td colspan="2" class="pb-2" id="weatherHum"></td>
										<td colspan="2" class="pb-2" id="weatherSp"></td>
										<td colspan="2" class="pb-2" id="weatherCl"></td>
									</tr>
									<!-- <tr><td colspan="6">&nbsp;</td></tr> -->
								</table>									
								</div>
								<br><br>
					<!-- 공지사항 -->	
					<h4><i class="fab fa-codepen"></i>&nbsp;MADMAX NOTICE</h4>
					<div class="text-right">
						<a href="${path}/board/boardList.do"><small>Notice All</small></a>
					</div>	
					<div class="notice mb-3">
						<ul class="rolling">
							<c:forEach items="${blist }" var="b" >
								<li style="border:none; border-bottom:1px dotted lightgray; padding: 2px 2px;">
									<a href="${path }/board/boardView.do?no=${b.boardNo}">${b.boardTitle}</a>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="h6 text-right">
						<a href="#" class="rolling_stop"><i class="far fa-pause-circle"></i></a>&nbsp;
						<a href="#" class="rolling_start"><i class="far fa-play-circle"></i></a>
					</div>
					<script>
					$(document).ready(function(){
						var height =  $(".notice").height();
						var num = $(".rolling li").length-3;
						var max = height*num;
						console.log(max);
						var move = 0;
						/* function noticeRolling(){
							move += height;
							$(".rolling").animate({"top":-move},600,function(){
								if( move >= max ){
									$(this).css("top",800);
									move = 0;
								};
							});
						}; */
						function noticeRolling(){
							$(".rolling").append($(".rolling>li").first());
						}
						noticeRollingOff = setInterval(noticeRolling,1000);
						/* $(".rolling").append($(".rolling li").first().clone()); */
						/* $(".rolling").append($(".rolling li").clone()); */
						/* console.log($(".rolling li").first().clone()); */
						$(".rolling_stop").click(function(){
							clearInterval(noticeRollingOff);
						});
						$(".rolling_start").click(function(){
							noticeRollingOff = setInterval(noticeRolling,1000);
						});
					});		
					</script>
                    </div>
                   
             <!-- 즐겨찾기 프로젝트 ! -->
			 <div class="col-sm-12 mt-4">
		        <h5 class="ml-4"><i class="fas fa-star" style="color: #ffd700;"></i>&nbsp;Favourite Project</h5>                    
				<div class="container">
					
			        <div class="d-flex justify-content-start">
						<c:forEach items="${list }" var="f" begin="0" end="3">
					     	<div class="favoriteBox ml-4">
						       	<a href="${path }/selectedProject/selectedProject.do?pjNo=${f.projectNo}&loginId=${loginUser.userId}">
						       		<c:out value="${f.projectTitle}"/>
						       	</a>
					     	</div>
					    </c:forEach>
					</div>
		    	</div>
		    </div>
		     
					</div>
		
                    <script>
                                  var apiURI = "";
                                  
                                  let latitude, longitude;
                                  navigator.geolocation.getCurrentPosition(position => {
                                  	latitude = position.coords.latitude;	
                                  	longitude = position.coords.longitude;
                                  	console.log(latitude);
                                  	console.log(longitude);
									apiURI = "https://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&appid=eff8dc2d4e17c75db816ed11e4456e57";
                                  	weatherF(apiURI);
                                  });

                                  /* var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"내APIKEY"; */
						     	   function weatherF(apiURI){
							        	$.ajax({
								            url: apiURI,
								            dataType: "json",
								            type: "GET",
								            async: "false",
								            success: function(resp) {
								                /* console.log(resp);
								                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
								                console.log("현재습도 : "+ resp.main.humidity);
								                console.log("날씨 : "+ resp.weather[0].main );
								                console.log("상세날씨설명 : "+ resp.weather[0].description );
								                console.log("날씨 이미지 : "+ resp.weather[0].icon );
								                console.log("바람   : "+ resp.wind.speed );
								                console.log("나라   : "+ resp.sys.country );
								                console.log("도시이름  : "+ resp.name );
								                console.log("구름  : "+ (resp.clouds.all) +"%" );  */                
								                var imgURL = "<img src='http://openweathermap.org/img/wn/" + resp.weather[0].icon + ".png' width='40%'>";
								                var temp = Math.round(resp.main.temp- 273.15)+'<i class="wi wi-celsius"></i>';
								                var hum = resp.main.humidity+"%";
								                var speed = resp.wind.speed+"m/s";
								                var clouds = resp.clouds.all+"%";
								                var city = '<i>'+resp.name+'</i>';
								                var desc = resp.weather[0].description;
								                
									    		/* var sky = "";
									        	switch(resp.weather[0].main){
													case "맑음": sky='<i class="wi wi-day-sunny"></i>'; break;
													case "구름 조금": sky='<i class="wi wi-day-sunny-overcast"></i>'; break;
													case "Clouds": sky='<i class="wi wi-day-cloudy"></i>'; break;
													case "흐림": sky='<i class="wi wi-cloudy"></i>'; break;
													case "Rain": sky='<i class="wi wi-rain"></i>'; break;
													case "눈": sky='<i class="wi wi-snow"></i>'; break;
													case "눈/비": sky='<i class="wi wi-hail"></i>'; break;
												}  */
												$("#weatherArea").html(imgURL);
												$("#weatherTemp").html(temp);
												$("#weatherHum").html(hum);
												$("#weatherSp").html(speed);
												$("#weatherCl").html(clouds);
												$("#weatherCity").html(city);
												$("#weatherDesc").html(desc);
												
												/* $("#weatherArea").html(sky); */
								            	}
							        		})
						        	}
					        </script>
						
									        

<script>

//캘린더 api*************
    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
  
      var calendar = new FullCalendar.Calendar(calendarEl, {
    	contentHeight:430,
    	plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction',  'googleCalendar' ],
		googleCalendarApiKey:'AIzaSyDL2TuMBMjldVwSFT5zvntlpQRrbndMhDk',
        header: {
          //left: 'prev,next today',
          //center: 'title',
          //right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        eventClick: function(info) {//window창으로 보이는 부분!!
			console.log(info);
		
			var title = open('','_blank','width=500,height=300');
			var js = '<script>';
			js+='function viewScd(){';
			js+="opener.parent.location='${path}/selectedProject/selectedProject.do?pjNo="+info.event.extendedProps.projectNo+'&loginId=';
			js+='${loginUser.userId}&boardNo='+info.event.extendedProps.boardNo+"';";
			js+='window.close();';
			js+='}';
			js+='</';
			js+='script>';
			var content = '<html>';
			content+='<head>';
			content+='<script';
			content+="src='https://kit.fontawesome.com/b5f4d53f14.js'";
			content+="crossorigin='anonymous'>";
			content+='</';
			content+='script>';
			content+='</';
			content+='head>';
			content+='<body>';
			content+="<div style='text-align:center;'>";
			content+='<h1 style="color:#25558F;">'+info.event.title+'</h1>';
			content+='<hr>';
			content+='<h4><i class="far fa-sticky-note mr-2 stoolGrey" style="font-size: 25px;"></i>&nbsp;'+info.event.extendedProps.scheduleMemo+'</h4>';
			content+='<h4>주소:'+info.event.extendedProps.schedulePlace+'</h4>';
			content+="<a href='javascript:viewScd();' class='btn btn-primary'>상세보러가기</a>";
			content+='</div>'
			content+=js+'</body>';
			content+='</html>';
			title.document.write(content);
			//calendar.fullCalendar('unselect'); 
		},
        defaultDate: new Date(),
        //navLinks: true, // can click day/week names to navigate views
        editable: false,
        eventLimit: true, // allow "more" link when too many events
        eventSources:['ko.south_korea#holiday@group.v.calendar.google.com']
		,events:[
			{"googleCalendarId":'ko.south_korea#holiday@group.v.calendar.google.com',
				},
		 	<c:forEach items="${schedule}" var="s" varStatus="status">
			{"title":'<c:out value="${s.scheduleTitle}"/>'
				,"start":'<c:out value="${s.scheduleStartDate}"/>'
				,"end":'<c:out value="${s.scheduleEndDate}"/>'
				,"className":'info'
				,"color":'#25558F'
				,"textColor" : 'white'
				,"schedulePlace":'<c:out value="${s.schedulePlace}"/>'
				,"scheduleMemo":'<c:out value="${s.scheduleMemo}"/>'
				,"projectNo":'<c:out value="${s.projectNo}"/>'
				,"boardNo":	'<c:out value="${s.boardNo}"/>'
			},
			
		</c:forEach>  	
		]
      });
  
      calendar.render();
    });

  </script>
  		
  			<!-- 예전 즐겨찾기 영역 -->
  			
  		<br><br>	
  		</div>
  </div>
  
  	

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>