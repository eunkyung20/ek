<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<header>
<%
String id=(String)session.getAttribute("id"); // 다운캐스팅 : 원래형으로 형변환시켜 되돌림
if(id!=null){
	// 로그인성공 => 세션값 "id" 있음 => ...님 로그인 , 회원정보수정
	%>
	<div id="login"><%=id %> 님 |
					<a href="MemberLogout.me">logout</a>	|
					<a href="MemberUpdateForm.me">update</a></div>		
	<% 
}else{
	// 로그인실패(로그인 하지 않은 상태) => 세션값 "id" 없음 => 로그인, 회원가입
	%>
	<div id="login"><a href="MemberLoginForm.me">login</a> |
					<a href="MemberInsertForm.me">join</a></div>	
	<%
}
%>
<div class="clear"></div>
<!-- 로고들어가는 곳 -->
<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
<!-- 로고들어가는 곳 -->
<nav id="top_menu">
<ul>
	<li><a href="MemberMain.me">HOME</a></li>
	<li><a href="CompanyWelcome.co">회사소개</a></li>
	<li><a href="#">SOLUTIONS</a></li>
	<li><a href="BoardList.bo">CUSTOMER CENTER</a></li>
	<li><a href="#">CONTACT US</a></li>
</ul>
</nav>
</header>