<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="Stool" />
</jsp:include>
<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>




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
                        수정요청
                    </button>
                    
                    <!-- Modal -->
                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
                                    <input type="radio" name="options" id="option1" checked> 출근
                                    </label>
                                    <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="option2"> 휴가
                                    </label>
                                    <label class="btn btn-secondary">
                                    <input type="radio" name="options" id="option3"> 결근
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                            <button type="button" class="btn btn-primary" style="background-color: #233C61; border-color: #233C61;">요청완료</button>
                            </div>
                        </div>
                        </div>
                    </div>
                </td>
            </tr>
            <%-- </c:forEach> --%>
            <!-- <tr class="">
                <th scope="row">4</th>
                <td>2020-05-12</td>
                <td>9:00</td>
                <td>18:00</td>
                <td>출근</td>
                <td><button type="button" class="btn btn-outline-secondary">수정요청</button></td>
            </tr>
            <tr>
                <th scope="row">3</th>
                <td>2020-05-11</td>
                <td>9:00</td>
                <td>18:00</td>
                <td>출근</td>
                <td><button type="button" class="btn btn-outline-secondary">수정요청</button></td>
            </tr>
            <tr>
                <th scope="row">2</th>
                <td>2020-05-10</td>
                <td>-</td>
                <td>-</td>
                <td>결근</td>
                <td><button type="button" class="btn btn-outline-secondary">수정요청</button></td>
            </tr>
            <tr>
                <th scope="row">1</th>
                <td>2020-05-09</td>
                <td>-</td>
                <td>-</td>
                <td>휴가</td>
                <td><button type="button" class="btn btn-outline-secondary">수정요청</button></td>
            </tr> -->
            </tbody>
        </table>	
        
        <div id="page-container">
        	${pageBar}
        </div>  
       
</div>	



<jsp:include page="/WEB-INF/views/common/footer.jsp"/>