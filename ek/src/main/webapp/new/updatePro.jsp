<%@page import="java.sql.Timestamp"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("pass");
String uname=request.getParameter("uname");
String email=request.getParameter("email");
int postnum=Integer.parseInt(request.getParameter("postnum"));
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");
String tel=request.getParameter("tel");

UserDTO updateDto=new UserDTO();

updateDto.setId(id);
updateDto.setPass(pass);
updateDto.setUname(uname);
updateDto.setEmail(email);
updateDto.setPostnum(postnum);
updateDto.setAddress1(address1);
updateDto.setAddress2(address2);
updateDto.setTel(tel);

UserDAO dao=new UserDAO();

UserDTO dto=dao.userCheck(id,pass);

if(dto!=null){
	dao.updateUser(updateDto); 
    response.sendRedirect("../main/main.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("아이디 비밀번호가 일치하지 않습니다.");
	history.back();
	</script>
	<%
}
%>
