<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteForm.jsp</title>
</head>
<body>
		<!-- 헤더들어가는 곳 -->
		<jsp:include page="../inc/header.jsp" />
		<!-- 헤더들어가는 곳 -->
<h1>회원탈퇴</h1>
<%
String id=(String)session.getAttribute("id"); 
%>
<form action="deletePro.jsp" method="post" id="delete" name="deleteform">
아이디 : <input type="text" name="id" value="<%=id%>" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="회원탈퇴">
</form>
<!-- 푸터 들어가는 곳 -->
<jsp:include page="../inc/footer.jsp" />
<!-- 푸터 들어가는 곳 -->
</body>
</html> 