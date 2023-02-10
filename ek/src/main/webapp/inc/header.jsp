<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	%>
	<div id="login">♥<%=id %> 님♥ |
					<a href="../member/logout.jsp">로그아웃</a>	|
					<a href="../member/update.jsp">회원정보수정</a></div>		
	<% 
}else{
	%>
	<div id="login"><a href="../member/login.jsp">로그인</a> |
					<a href="../member/join.jsp">회원가입</a></div>	
	<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo">
	<a href="../main.jsp"><h1>섬집</h1></a>
			</div>
<!-- 로고들어가는 곳 -->
<nav id="topmenu">
<ul>
	<li><a href="../.jsp">지역별 조회</a></li>
	<li><a href="../.jsp">테마별 조회</a></li>
	<li><a href="../.jsp">추천펜션</a></li>
	<li><a href="../board/BoardDetail.jsp">공지사항</a></li>
</ul>
</nav>
</header>