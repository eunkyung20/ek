<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deleteForm.jsp</title>
</head>
<body>
<h1>회원탈퇴</h1>
<%
String id=(String)session.getAttribute("id"); //다운캐스팅 형변환시켜 가져옴
%>
<form action="deletePro.jsp" method="post">
아이디 : <input type="text" name="id" value="<%=id%>" readonly><br>
비밀번호 : <input type="password" name="pass"><br>
<input type="submit" value="회원탈퇴">
</form>
</body>
</html>