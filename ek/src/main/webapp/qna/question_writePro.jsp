<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");

String id=(String)session.getAttribute("id");
UserDAO udao=new UserDAO();
UserDTO udto=udao.getUser(id);

//request qpw, qtitle, qcount, qdate, qcontent 가져와서 변수에 저장
int qpw=0000;
String qtitle=request.getParameter("qtitle");
int qcount=0;
Timestamp qdate=new Timestamp(System.currentTimeMillis());
String qcontent=request.getParameter("qcontent");

//QnaDTO 객체생성 
QnaDTO dto=new QnaDTO();

//set메서드 호출해서 값 저장
dto.setNo(udto.getNo());
dto.setQtitle(qtitle);
dto.setQtype("1");
dto.setQstatus(0);
dto.setQcount(qcount);
dto.setQpw(qpw);
dto.setQdate(qdate);
dto.setQcontent(qcontent);

//QnaDAO 객체생성
QnaDAO dao=new QnaDAO();
//insertQna(dto) 메서드 호출
dao.insertQna(dto);

//글목록 qnaList.jsp
response.sendRedirect("qnaList.jsp");
%>

