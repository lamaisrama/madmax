<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Message Page</title>
</head>
<body>
	<script>
		alert("${msg}");
		location.replace('${pageContext.request.contextPath}${loc}');
		<c:if test="${script !=null}">
			${script}
		</c:if>
	</script>
</body>
</html>