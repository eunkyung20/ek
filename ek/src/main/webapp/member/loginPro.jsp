<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
request.setCharacterEncoding("utf-8");
String id=request.getParameter("id");
String pass=request.getParameter("pass");

UserDAO dao=new UserDAO();

UserDTO dto=dao.userCheck(id, pass);
                         
if(dto !=null){
	session.setAttribute("id",id);
	response.sendRedirect("../main/main.jsp");
}else{
// dto null 이면 아이디 비밀번호 틀림 => 자바스크립트 "아이디 비밀번호 틀림"
//                                          뒤로이동
	%>
	<script type="text/javascript">
 		alert("아이디 또는 비밀번호를 잘 못 입력했습니다");
 		history.back();
	</script>
	<% 
}
%>		 