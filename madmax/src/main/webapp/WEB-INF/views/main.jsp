<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="path" value="${pageContext.request.contextPath }" />

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
                        <div class="column col-sm-6" id="calendar" >

                        </div>

                        <div class="column col-sm-3" style="margin-top: 50px;">
                          <span>✔️ 진행중인 업무</span>
<!--                           <button type="button" class="btn btn-outline-dark" data-toggle="modal" data-target="#myModal">
                            더보기
                           </button> -->
                          <div class="row list" >
                          </div>
                          <div>
                            

                            <div class="modal fade" id="myModal">
                              <div class="modal-dialog">
                                <div class="modal-content">
                                
                                  <!-- Modal Header -->
                                  <div class="modal-header">
                                    <h5 class="modal-title">✅ 진행중인 업무</h5>
                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                  </div>
                                  
                                  <!-- Modal body -->
                                  <div class="modal-body">
                                    Modal body..
                                  </div>
                                  
                                  <!-- Modal footer -->
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-outline-light text-dark" data-dismiss="modal">Close</button>
                                  </div>
                                  
                                </div>
                              </div>
                            </div>
                            


                          </div>
                        </div>
                        
                    </div>
                    
                    <div class="container p-5">
                      <p>🔖 즐겨찾기 프로젝트</p>                    
                      
                      <div class="row-vh d-flex flex-row justify-content-around row-nw d-flex flex-wrap">

                          

                            <div class="item p-3 bookmarkProject"><a href="">여기에 즐겨찾는제목</a></div>
                
                            <div class="item p-3 bookmarkProject"></div>
                
                            <div class="item p-3 bookmarkProject"></div>
                
                            <div class="item p-3 bookmarkProject"></div>
                
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