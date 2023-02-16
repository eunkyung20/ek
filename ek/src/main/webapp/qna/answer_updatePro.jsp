<%@page import="java.sql.Timestamp"%>
<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");

//request => qno, answer 파라미터 => 변수저장
int qno=Integer.parseInt(request.getParameter("qno"));
String answer=request.getParameter("answer");
Timestamp qadate=new Timestamp(System.currentTimeMillis());

// QnaDTO 객체생성
QnaDTO dto=new QnaDTO();
// set메서드 호출 qno,qcontent 저장
dto.setQno(qno);
dto.setAnswer(answer);
dto.setQadate(qadate);
//QnaDAO 객체생성 
QnaDAO dao=new QnaDAO();
// 메서드 호출
dao.updateAnswer(dto); 
// qnaList.jsp 이동
response.sendRedirect("qnaList.jsp");
%>