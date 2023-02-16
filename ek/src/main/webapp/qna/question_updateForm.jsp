<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/answer_updateForm.jsp</title>
</head>
<body>
<%
int qno=Integer.parseInt(request.getParameter("qno"));

QnaDAO dao=new QnaDAO();

QnaDTO dto = dao.getQna(qno); 
%>
<h1>글수정</h1>
<form action="q_updatePro.jsp" method="post"> 
	<table border="1">
		<input type="hidden" name="qno" value="<%=qno %>">
			<tr><td>작성자번호</td>
			<td><input type="text" name="no" value="<%=dto.getNo() %>" readonly></td></tr>
			<tr><td>제목</td>
			<td><input type="text" name="qtitle" value=<%=dto.getQtitle() %>></td></tr>
			<tr><td>내용</td>
			<td><textarea name="qcontent" rows="10" cols="20"><%=dto.getQcontent() %></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
	</table>
</form>
</body>
</html>