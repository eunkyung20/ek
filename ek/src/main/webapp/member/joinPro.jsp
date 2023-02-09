<%@page import="member.UserDAO"%>
<%@page import="member.UserDTO"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

String id=request.getParameter("id");
String pass=request.getParameter("pass");
String uname=request.getParameter("uname");
String birth = request.getParameter("birth");
Timestamp joindate=new Timestamp(System.currentTimeMillis());
String email=request.getParameter("email");
String address1=request.getParameter("address1");
String address2=request.getParameter("address2");
String tel=request.getParameter("tel");
UserDTO dto = new UserDTO();
 
dto.setId(id);
dto.setPass(pass);
dto.setUname(uname);
dto.setBirth(birth);
dto.setJoindate(joindate);
dto.setEmail(email);
dto.setAddress1(address1);
dto.setAddress2(address2);
dto.setTel(tel);

UserDAO dao = new UserDAO();
dao.insertUser(dto);

response.sendRedirect("login.jsp"); 
%>