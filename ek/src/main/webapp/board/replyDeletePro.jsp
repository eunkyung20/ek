<%@page import="board.ReplyDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

int rno=Integer.parseInt(request.getParameter("rno"));

ReplyDAO dao=new ReplyDAO();
 
dao.deleteReply(rno);

response.sendRedirect("BoardDetail.jsp");
%>