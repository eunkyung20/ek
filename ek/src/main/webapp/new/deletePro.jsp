<%@page import="java.sql.Timestamp"%>
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member/deletePro.jsp</title>
</head>
<body>
<h1>member/deletePro.jsp</h1>
<%
String id=request.getParameter("id");
String pass=request.getParameter("pass");

UserDAO dao=new UserDAO();
UserDTO dto = dao.userCheck(id,pass);

if(dto!=null){	
	dao.deleteUser(id); 
	session.invalidate();
	response.sendRedirect("../main/main.jsp"); 
}else{
%>
    <script type="text/javascript">
    		alert("아이디 또는 비밀번호를 잘 못 입력했습니다");
			history.back();
    </script>
    <%
}
%>
</body>
</html>