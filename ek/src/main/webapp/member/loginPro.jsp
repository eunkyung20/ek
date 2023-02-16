<%@page import="member.MemberDTO"%>
<%@page import="member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// member/loginPro.jsp
// 폼에서 입력한 내용을 서버에 전달하면 request내장객체 저장
// request에 저장된 id,pass 파라미터값을 가져와서 변수에 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");

// MemberDAO 객체생성
MemberDAO dao=new MemberDAO();
// 리턴받은값을 저장하는 변수 MemberDTO dto = userCheck(id,pass) 메서드호출
MemberDTO dto=dao.userCheck(id,pass);

// dto null 아니면 아이디 비밀번호 일치 => 페이지 상관없이 값을 유지 세션값 생성
//								=> "이름",값	"id",id
//								=> main폴더 main.jsp 이동
// dto null 이면 아이디 비밀번호 틀림 => 자바스크립트 "아이디 비밀번호 틀림"
// 							   	  뒤로 이동(web->member->loginPro.jsp참조)
if(dto!=null){
	session.setAttribute("id", id);
    response.sendRedirect("../main/main.jsp");
}else{
	%>
	<script type="text/javascript">
	alert("아이디 비밀번호 틀림");
	history.back();
	</script>
	<%
}
%>
