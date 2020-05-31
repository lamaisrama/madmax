<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />

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

	<div class="col-sm-9 row" id="area">

                  <br>
                  
                    <div class="row justify-content-around">
                    <!-- 달력출력하는 부분 -->
                        <div class="column col-sm-6" id="calendar" >

                        </div>
					<!-- 날씨 출력하는 부분 -->
						<div class="column col-sm-4">
						</div>
						
                    </div>
                    
                    <!-- 즐겨찾기 프로젝트 ! -->
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
		#calendar{
			width:800px;
		}
   </style>

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


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>