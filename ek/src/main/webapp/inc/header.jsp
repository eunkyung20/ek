<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	%>
	<div id="login">♥<%=id %> 님♥ |
					<a href="../member/logout.jsp">logout</a>	|
					<a href="../member/update.jsp">update</a></div>		
	<% 
}else{
	%>
	<div id="login"><a href="../member/login.jsp">login</a> |
					<a href="../member/join.jsp">join</a></div>	
	<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="60" height="60" alt="house"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="../main/main.html">HOME</a></li>
	<li><a href="../.html">지역별 조회</a></li>
	<li><a href="../.html">테마별 조회</a></li>
	<li><a href="../.html">추천펜션</a></li>
	<li><a href="../board/notice.html">공지사항</a></li>
</ul>
</nav>
</header>