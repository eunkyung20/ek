<%@page import="qna.QnaDAO"%>
<%@page import="qna.QnaDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//request 한글처리
request.setCharacterEncoding("utf-8");

//request => qno, qtitle, qcontent 파라미터 => 변수저장
int qno=Integer.parseInt(request.getParameter("qno"));
String qtitle=request.getParameter("qtitle");
String qcontent=request.getParameter("qcontent");

// QnaDTO 객체생성
QnaDTO dto=new QnaDTO();
// set메서드 호출 qno, qtitle, qcontent 저장
dto.setQno(qno);
dto.setQtitle(qtitle);
dto.setQcontent(qcontent);

//QnaDAO 객체생성
QnaDAO dao=new QnaDAO();

//updateQna(dto) 메서드 호출
dao.updateQna(dto); 
// qnaList.jsp 이동
response.sendRedirect("qnaList.jsp");
%>