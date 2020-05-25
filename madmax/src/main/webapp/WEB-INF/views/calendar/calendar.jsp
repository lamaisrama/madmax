<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

	<!-- <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet"> -->
 	<link href='${path}/resources/mainresources/calendar/core/main.css' rel='stylesheet' /> 
<%-- 	<link href='${path}/resources/mainresources/calendar/daygrid/main.css' rel='stylesheet' />
 --%>
	<link href='${path}/resources/mainresources/calendar/list/main.css' rel='stylesheet' />
	<script src='${path}/resources/mainresources/calendar/core/main.js'></script>
	<script src='${path}/resources/mainresources/calendar/interaction/main.js'></script>
	<script src='${path}/resources/mainresources/calendar/google-calendar/main.js'></script>
	<script src='${path}/resources/mainresources/calendar/daygrid/main.js'></script>
	<script src='${path}/resources/mainresources/calendar/timegrid/main.js'></script>
	<script src='${path}/resources/mainresources/calendar/list/main.js'></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
	<link href="${path}/resources/css/fullcalendar.css" rel="stylesheet">
<script src="${path}/resources/js/fullcalendar.js" type="text/javascript"></script>
<!-- 전체일정 -->
<div class="col col-sm-7">	
<div id='wrap'>
	<h4><i class="far fa-calendar-alt"></i>&nbsp;전체일정</h4>	
	<hr>
	<br>
	<div id='calendar'></div>
	<div style='clear:both'></div>
</div>
</div>


<div class="col col-sm-3">

</div> 

	
<script>



		/* initialize the calendar
		-----------------------------------------------------------------*/
		
		document.addEventListener('DOMContentLoaded', function() {
		var calendarEl = document.getElementById('calendar');

	    var calendar = new FullCalendar.Calendar(calendarEl,{
		/* var calendar =  $('#calendar').fullCalendar({  */
			plugins: [ 'dayGrid', 'timeGrid', 'list', 'interaction',  'googleCalendar' ],
			googleCalendarApiKey:'AIzaSyDL2TuMBMjldVwSFT5zvntlpQRrbndMhDk',
			header: {//실행된 달력화면에서 
				left: 'title',//현재 출력된 month에 대한 정보
				center: 'agendaDay,agendaWeek,month',
				right: 'prev,next today'//이전달,다음달 ,오늘(이번달 )로 이동하는 기능
			},
			defaultDate: new Date(),
			editable: false,//일정을 마우스로 이동시킴
			firstDay: 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
			selectable: true,
			defaultView: 'dayGridMonth', 

			axisFormat: 'h:mm',
			columnFormat: {
                month: 'ddd',    // Mon
                week: 'ddd d', // Mon 7
                day: 'dddd M/d',  // Monday 9/7
                agendaDay: 'dddd d'
            },
          
			allDaySlot: false,
			selectHelper: true,
		
			select: function(start, end, allDay) {//window창으로 보이는 부분!!
				var title = open('','_blank','width=500,height=500');
				var js = '<script>';
				js+='function viewScd(){';
				js+='location.href="//.do?no="';
				js+='}';
				js+='</';
				js+='script>';
				var content = '<html><body>';
				content+='<h1>Title</h1>';
				content+='<p>subtitle</p>';
				content+='<hr>';
				content+='<h5>일자</h5>';
				content+='<h5>장소</h5>';
				content+='<button onclick="viewScd();">상세보러가기</button>';
				content+=js+'</body>';
				content+='</html>';
				title.document.write(content);
				calendar.fullCalendar('unselect'); 
			},
		
			//일정데이터 넣는 객체 events
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
<style>
	#wrap {
		width: 100%;
		margin: 20px auto;
		} 

	#external-events {
		float: left;
		width: 150px;
		padding: 0 10px;
		text-align: left;
		}

	#external-events h4 {
		font-size: 16px;
		margin-top: 0;
		padding-top: 1em;
		}

	.external-event {
		margin: 10px 0;
		padding: 2px 4px;
		background: #3366CC;
		color: #fff;
		font-size: .85em;
		cursor: pointer;
		}

	#external-events p {
		margin: 1.5em 0;
		font-size: 11px;
		color: #666;
		}

	#external-events p input {
		margin: 0;
		vertical-align: middle;
		}

	#calendar {
/* 		float: right; */
        margin: 0 auto;
		width: 100%;
		background-color: #FFFFFF;
		border-radius: 6px;
        box-shadow: 0 1px 2px #C3C3C3;
		}
	.fc-event{//공휴일 글씨색 설정
	color:#FFFFFF;
	background-color:#cc3333;
	}
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>