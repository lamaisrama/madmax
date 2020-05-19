<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />





<div class="col col-sm-10">	
		<h4><i class="far fa-address-card"></i>&nbsp;근태현황</h4>	
		<hr>
	 	<br>
	 	<!-- Search -->
        기간검색&nbsp;
        <input type="date" class="dateInput" />&nbsp;~&nbsp;<input type="date" class="dateInput" />
        <button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="button" aria-pressed="false">
        검색
        </button>
        <br><br>
        <!-- AttendanceList -->
        <table class="table text-center">
            <thead style="background-color: #233C61; color:#F1F0F5;">
            <tr>
                <th scope="col">#</th>
                <th scope="col">근무일자</th>
                <th scope="col">출근시각</th>
                <th scope="col">퇴근시각</th>
                <th scope="col">상태</th>
                <th scope="col">요청</th>
            </tr>
            </thead>
            <tbody>
            <%-- <c:forEach items="${ }" var=""> --%>
            <tr>
                <th scope="row" style="vertical-align: middle;">1</th>
                <!-- <th scope="row">5</th> -->
                <td style="vertical-align: middle;">2020-05-13</td>
                <td style="vertical-align: middle;">09:00</td>
                <td style="vertical-align: middle;">18:00</td>
                <td style="vertical-align: middle;">출근</td>
                <td>
                
                    <button type="button" class="btn btn-outline-secondary" data-toggle="modal" data-target="#exampleModalCenter">
                        		수정
                    </button>
                    
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                       	<form id="modifyForm">
                        <div class="modal-dialog modal-dialog-centered" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalCenterTitle">상태수정요청</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                            </div>
                            <div class="modal-body">
                  			
                            	수정할 상태 : 
                                <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                    <label class="btn btn-secondary active">
                                    <input type="radio" name="requestCategory" id="option1" value="출근" checked> 출근
                                    </label>
                                    <label class="btn btn-secondary">
                                    <input type="radio" name="requestCategory" id="option2" value="휴가 "> 휴가
                                    </label>
                                    <label class="btn btn-secondary">
                                    <input type="radio" name="requestCategory" id="option3" value="결근"> 결근
                                    </label>
                                </div>
                            <br><br>    
                            사유 : <input type="text" id="requestReason" name="requestReason"/>    
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            <button  type="button" class="btn btn-primary" style="background-color: #233C61; border-color: #233C61;" onclick="allim();">요청완료</button>
                            </div>
                         
                        </div>
                        </div>
                        </form>
                    </div>
                </td>
            </tr>

            </tbody>
        </table>	
        
        <div id="page-container">
        	${pageBar}
        </div>  
       
</div>	




<jsp:include page="/WEB-INF/views/common/footer.jsp"/>