<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="qna.QnaDTO"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<%
//request에 저장된 qno 파라미터값 가져오기
int qno=Integer.parseInt(request.getParameter("qno"));

//QnaDAO 객체생성
QnaDAO dao=new QnaDAO();

QnaDTO dto = dao.getQna(qno);  

//id 세션값 가져오기
String id=(String)session.getAttribute("id");
int no=dto.getNo();
UserDAO udao = new UserDAO();
UserDTO udto = udao.getUserNo(no);
//로그인 되어있지 않으면 로그인화면으로
if(id==null){
	response.sendRedirect("../member/login.jsp");
}
%>

<h4>answer</h4>

<table border="1">
	<tr><td>글번호</td><td><%=dto.getQno() %></td></tr>
	<tr><td>글쓴날짜</td><td><%=dto.getQadate() %></td></tr> 
	<tr><td>글내용</td><td><%=dto.getAnswer() %></td></tr>
	</table>
	
	
	<input type="button" value="글입력" 
	onclick="location.href='answer_writeForm.jsp?qno=<%=dto.getQno()%>'">
	<input type="button" value="글삭제" 
	onclick="location.href='answer_delete.jsp?qno=<%=dto.getQno()%>'">
	<input type="button" value="글목록" 
	onclick="location.href='qnaList.jsp'">
	</form>

</body>
</html>