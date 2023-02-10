<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp3/updateForm.jsp</title>
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 본문메인이미지 -->
<div id="sub_img_member"></div>
<!-- 본문메인이미지 -->
<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Join us</a></li>
<li><a href="#">Privacy policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->
<!-- 본문내용 -->
<%
// 세션값 가져오기 
String id=(String)session.getAttribute("id");
// MemberDAO 객체생성
UserDAO dao=new UserDAO();
// 리턴할형 MemberDTO dto =  getMember(id) 메서드 호출
UserDTO dto=dao.getUser(id);
%>
<article>
<h1>Update Us</h1>
<form action="updatePro.jsp" id="join" method="post">
<fieldset>
<legend>Basic Info</legend>
<label>User ID</label>
<input type="text" name="id" class="id" value="<%=id%>" readonly>
<input type="button" value="dup. check" class="dup"><br>
<label>Password</label>
<input type="password" name="pass"><br>
<label>Uname</label>
<input type="text" name="name" value="<%=dto.getUname()%>"><br>
<label>E-Mail</label>
<input type="email" name="email" value="<%=dto.getEmail()%>"><br>
</fieldset>

<fieldset>
<legend>Optional</legend>
<label>Address</label>
<input type="text" name="address" value="<%=dto.getAddress1()%>"><br>
<label>Phone Number</label>
<input type="text" name="tel" value="<%=dto.getTel()%>"><br>
<label>Mobile Phone Number</label>
<input type="text" name="mobile" value="<%=dto.getTel()%>"><br>
</fieldset>
<div class="clear"></div>
<div id="buttons">
<input type="submit" value="Submit" class="submit">
<input type="reset" value="Cancel" class="cancel">
</div>
</form>
</article>
<!-- 본문내용 -->
<!-- 본문들어가는 곳 -->

<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>