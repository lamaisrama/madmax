<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

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

	<div class="col-sm-7 row" id="area">

                  <br>
                  
                    <div class="row justify-content-around">
                    <!-- 달력출력하는 부분 -->
                       	<div class="column col-sm-6" id="calendar" ></div>
					<!-- 날씨 -->
                        <div class="" style="">
                           <h5 class="modal-title">날씨</h5>
                                    <div id="">
										<table border=1>
											<tr>
												<td colspan="3" id="weatherArea"></td>					
												<td colspan="3" id="weatherTemp"></td>
											</tr>
											<tr >
												<td>습도</td>
												<td id="weatherHum"></td>
												<td>바람</td>
												<td id="weatherSp"></td>
												<td>구름</td>
												<td id="weatherCl"></td>
											</tr>
											<tr >
												<td>위치</td>
												<td  colspan="2" id="weatherCity"></td>
												<td>설명</td>
												<td colspan="2" id="weatherDesc"></td>
											</tr>
										</table>									
									</div>
                                    <script>
                                    var apiURI = "";
                                    
                                    let latitude, longitude;
                                    navigator.geolocation.getCurrentPosition(position => {
                                    	latitude = position.coords.latitude;	
                                    	longitude = position.coords.longitude;
                                    	console.log(latitude);
                                    	console.log(longitude);
										apiURI = "http://api.openweathermap.org/data/2.5/weather?lat="+latitude+"&lon="+longitude+"&appid=eff8dc2d4e17c75db816ed11e4456e57";
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
								                console.log(resp);
								                console.log("현재온도 : "+ (resp.main.temp- 273.15) );
								                console.log("현재습도 : "+ resp.main.humidity);
								                console.log("날씨 : "+ resp.weather[0].main );
								                console.log("상세날씨설명 : "+ resp.weather[0].description );
								                console.log("날씨 이미지 : "+ resp.weather[0].icon );
								                console.log("바람   : "+ resp.wind.speed );
								                console.log("나라   : "+ resp.sys.country );
								                console.log("도시이름  : "+ resp.name );
								                console.log("구름  : "+ (resp.clouds.all) +"%" );                 
								                var imgURL = "<img src='http://openweathermap.org/img/wn/" + resp.weather[0].icon + ".png'>";
								                var temp = Math.round(resp.main.temp- 273.15)+'<i class="wi wi-celsius"></i>';
								                var hum = resp.main.humidity;
								                var speed = resp.wind.speed;
								                var clouds = resp.clouds.all+"%";
								                var city = resp.name;
								                var desc = resp.weather[0].description;
								                
									    		var sky = "";
									        	switch(resp.weather[0].main){
													case "맑음": sky='<i class="wi wi-day-sunny"></i>'; break;
													case "구름 조금": sky='<i class="wi wi-day-sunny-overcast"></i>'; break;
													case "Clouds": sky='<i class="wi wi-day-cloudy"></i>'; break;
													case "흐림": sky='<i class="wi wi-cloudy"></i>'; break;
													case "Rain": sky='<i class="wi wi-rain"></i>'; break;
													case "눈": sky='<i class="wi wi-snow"></i>'; break;
													case "눈/비": sky='<i class="wi wi-hail"></i>'; break;
												} 
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
                          
                         
                        </div>
                        
                    </div>
                    
                    <div class="container p-5">
                      <h5><i class="fas fa-star" style="color: #ffd700;"></i>&nbsp;즐겨찾기 프로젝트</h5>                    
						<br>
                      <div class="flex-row justify-content-around row-nw d-flex flex-wrap">
							<c:forEach items="${list }" var="f" begin="0" end="3">
	                            <div class="item p-3 bookmarkProject">
	                            	<a href="${path }/selectedProject/selectedProject.do?pjNo=${f.projectNo}&loginId=${loginUser.userId}">
	                            		<c:out value="${f.projectTitle}"/>
	                            	</a>
	                            </div>
                            </c:forEach>
                      </div>
                    </div>
                </div>

   <style>
     .list{
       width: 180px;
      height: 300px;
      
     }

		ddiv{
			border:1px solid black;
		}
       .item{

         height: 160px;
         width: 150px;
         
         border-radius: 30px;
         border: #2C3E50;
         background-color:  #2C3E50;
         color: black;
         cursor: pointer;
       }
       .item:hover{

        height: 160px;
        width: 150px;

        border-radius: 30px;
        border:  rgb(35, 60, 97);
        background-color: rgb(35, 60, 97);
        color: white;
        }

       #area{
        height: 768px;
       }
       .fc-event{//공휴일 글씨색 설정
		color:#FFFFFF;
		background-color:#cc3333;
		border:1px solid #cc3333;
		}
	
   </style>

<script>

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
        defaultDate: new Date(),
        //navLinks: true, // can click day/week names to navigate views
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        eventSources:['ko.south_korea#holiday@group.v.calendar.google.com']
		,events:[
			'ko.south_korea#holiday@group.v.calendar.google.com',
		 	<c:forEach items="${schedule}" var="s" varStatus="status">
			{"title":'<c:out value="${s.scheduleTitle}"/>'
				,"start":'<c:out value="${s.scheduleStartDate}"/>'
				,"end":'<c:out value="${s.scheduleEndDate}"/>'
				,"className":'info'
			},
			
		</c:forEach>  	
		]
      });
  
      calendar.render();
    });

  </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>