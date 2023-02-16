<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/a_update_Form.jsp</title>
</head>
<body>
<%
int qno=Integer.parseInt(request.getParameter("qno"));

QnaDAO dao=new QnaDAO();
QnaDTO dto = dao.getQna(qno); 
%>

<h1>답변수정</h1>
<form action="answer_updatePro.jsp" method="post"> 
		<input type="hidden" name="qno" value="<%=qno %>">
	<table border="1">
			<td colspan="2"><input type="checkbox" name="qstate" value="0" checked>답변완료</td>
			<tr><td>작성자번호</td>
			<td><input type="text" name="no" value="<%=dto.getNo() %>" readonly></td></tr>
			<tr><td>내용</td>
			<td><textarea name="answer" rows="10" cols="20"><%=dto.getAnswer() %></textarea></td></tr>
			<tr><td colspan="2"><input type="submit" value="글수정"></td></tr>
	</table>
</form>
</body>
</html>