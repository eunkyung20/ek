<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/a_writeForm.jsp</title>
</head>
<body>
<%
//id값 받아오기
String id=(String)session.getAttribute("id");
int qno=Integer.parseInt(request.getParameter("qno"));
UserDAO rdao=new UserDAO();
UserDTO rdto=rdao.getUser(id);
int no = rdto.getNo();

//로그인 되어있지 않으면 로그인화면으로
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>

<h1>답변</h1>
	<form action="answer_writePro.jsp" method="post"> 
		<input type="hidden" name="no" value="<%=no%>">
		<input type="hidden" name="qno" value="<%=qno%>">
			<table border="1">
				<tr><td>작성자</td>
				<td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
				<tr><td>내용</td>
				<td><textarea name="answer" rows="10" cols="20"></textarea></td></tr>
				<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
			</table>
	</form>
</body>
</html>