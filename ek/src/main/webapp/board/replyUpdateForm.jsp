<%@page import="board.ReplyDTO"%>
<%@page import="board.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글수정</title>
</head>
<body>
<%
int bno=1;
int no=1;
// int rno=6;
int rno=Integer.parseInt(request.getParameter("rno"));
ReplyDAO dao=new ReplyDAO();
ReplyDTO dto=dao.getReply(rno);
%>
 
<h2>댓글수정</h2>
<form action="replyUpdatePro.jsp?rno=<%=rno%>" method ="post">
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="bno" value="<%=dto.getBno()%>">
<textarea rows="3" cols="80" name="riply" ><%=dto.getRiply() %></textarea>
<input type="submit" value="댓글수정">
</form>
</body>
</html>
