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

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

	<div class="col-sm-7 row" id="area">

                  <br>
                  
                  
                    <div class="row justify-content-around">
                        <div class="colum col-sm-6" id="calendar" >

                        </div>

                        <div class="colum col-sm-3" style="margin-top: 50px;">
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

                          

                            <div class="item p-3"></div>
                
                            <div class="item p-3"></div>
                
                            <div class="item p-3"></div>
                
                            <div class="item p-3"></div>
                
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
   </style>

<script>

    document.addEventListener('DOMContentLoaded', function() {
      var calendarEl = document.getElementById('calendar');
  
      var calendar = new FullCalendar.Calendar(calendarEl, {
        plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
        header: {
          //left: 'prev,next today',
          //center: 'title',
          //right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        defaultDate: '2020-02-12',
        //navLinks: true, // can click day/week names to navigate views
        editable: true,
        eventLimit: true, // allow "more" link when too many events
        events: [
          {
            title: 'All Day Event',
            start: '2020-02-01',
          },
          {
            title: 'Long Event',
            start: '2020-02-07',
            end: '2020-02-10'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2020-02-09T16:00:00'
          },
          {
            groupId: 999,
            title: 'Repeating Event',
            start: '2020-02-16T16:00:00'
          },
          {
            title: 'Conference',
            start: '2020-02-11',
            end: '2020-02-13'
          },
          {
            title: 'Meeting',
            start: '2020-02-12T10:30:00',
            end: '2020-02-12T12:30:00'
          },
          {
            title: 'Lunch',
            start: '2020-02-12T12:00:00'
          },
          {
            title: 'Meeting',
            start: '2020-02-12T14:30:00'
          },
          {
            title: 'Happy Hour',
            start: '2020-02-12T17:30:00'
          },
          {
            title: 'Dinner',
            start: '2020-02-12T20:00:00'
          },
          {
            title: 'Birthday Party',
            start: '2020-02-13T07:00:00'
          },
          {
            title: 'Click for Google',
            url: 'http://google.com/',
            start: '2020-02-28'
          }
        ]
      });
  
      calendar.render();
    });
  
  </script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>