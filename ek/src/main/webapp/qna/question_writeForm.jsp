<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/q_writeForm.jsp</title>
</head>
<body>

<!-- 헤더파일들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />

<%
// id값 받아오기
String id=(String)session.getAttribute("id");

UserDAO rdao=new UserDAO();
UserDTO rdto=rdao.getUser(id);
int no = rdto.getNo();

//로그인 되어있지 않으면 로그인화면으로
if(id==null){
	response.sendRedirect("MemberLogin.me");
}

%>

<h1>질문</h1>
<form action="QuestionWritePro.qa" method="post"> 
<input type="hidden" name="no" value="<%=no%>">
	<table border="1">
		<tr><td>작성자</td>
			<td><input type="text" name="name" value="<%=id %>" readonly></td></tr>
		<tr><td>제목</td>
			<td><input type="text" name="qtitle"></td></tr>
		<tr><td>내용</td>
			<td><textarea name="qcontent" rows="10" cols="20"></textarea></td></tr>
		<tr><td colspan="2"><input type="submit" value="글쓰기"></td></tr>
	</table>
	
	<!-- 푸터 들어가는 곳 -->
<%-- <jsp:include page="../inc/footer.jsp" /> --%>
	
</form>
</body>
</html>