<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// request => qno 피라미터 => 변수저장
int qno=Integer.parseInt(request.getParameter("qno"));

// QnaDAO 객체생성
QnaDAO dao=new QnaDAO();

dao.deleteQna(qno);
// list.jsp 이동
response.sendRedirect("qnaList.jsp");
%>