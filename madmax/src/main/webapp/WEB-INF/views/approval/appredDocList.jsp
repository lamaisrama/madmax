<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
       <div class="modal-dialog">
           <div class="modal-content">
               <!-- Modal Header -->
               <div class="modal-header">
                   <h4 class="modal-title">기결재첨부</h4>
                   <button type="button" class="close" data-dismiss="modal">&times;</button>
               </div>

               <!-- Modal body -->
               <div class="modal-body" style="font-size:12px;">
                   <table class="table table-hover" id="approvedDocList">
                       <tr>
                           <th>기안양식</th>
                           <th>제목</th>
                           <th>기안자</th>
                           <th>기안일</th>
                           <th>선택</th>
                       </tr>
                       <c:forEach items="${list }" var="l">
                       <tr>
                       		<td>${l.typeTitle }</td>
                       		<td><a href="javascript:void(0)" 
							onclick="window.open('${path}/appr/openApprDoc?apprNo=${l.apprNo }',
							'_blank','width = 1000, height = 600, top = 120px, left = 400px')">
							${l.apprTitle }</a></td>
                       		<td>${l.userName }</td>
                       		<td><fmt:formatDate value="${l.writeDate }" pattern="yyyy-MM-dd" /> </td>
                       		<td><button type="button" class="btn btn-light btn-sm" onclick="addAppredDoc('${l.apprNo}', '${l.apprTitle }')">선택</button></td>
                       </tr>
                       </c:forEach>
                   </table>
               </div>

               <!-- Modal footer -->
               <div class="modal-footer">
                   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
               </div>
           </div>
       </div>

<script>
	function addAppredDoc(e1, e2){
		console.log(e1, e2);
		$("#input-hidden-container").append($("<input>").attr('type','hidden').attr('name','appredDoc').attr('value',e1));
		var appred_content ="<span class='badge mr-2'><b>"+e2+"</b>";
		appred_content +="<input type='hidden' name='appredDoc' value='" +e1 +"'/>";
		appred_content +="</span>";

		var btn_del=$("<button>").html("x").attr('type','button').addClass('badge').addClass('btn').addClass('btn-light').addClass('btn-sm').on("click",removeAppredDoc);
		$(appredDoc).append(btn_del);
		document.getElementById("appredDoc").innerHTML+=appred_content;
		$("#add-approved-doc").modal('hide');
	}
	
	$('#appred_del').on('click',removeAppredDoc);
	function removeAppredDoc(){
		console.log($(event.target).parent());
		$(event.target).parent().remove();
		
		
		/* td_appred.children().remove();
		td_appred.html("");
		$("#add-approved-doc").modal('hide'); */
	}
</script>
</body>
</html>