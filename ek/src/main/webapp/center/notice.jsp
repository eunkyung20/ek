<%@page import="com.itwillbs.board.db.BoardDTO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
<link href="css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="#">Notice</a></li>
<li><a href="#">Public News</a></li>
<li><a href="#">Driver Download</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<%
//BoardDAO 객체 생성
// BoardDAO dao=new BoardDAO();

// // 한페이지에 보여줄 글개수 설정
// int pageSize=10;
// // 현 페이지 번호 가져오기 => 페이지 번호가 없으면 1페이지 설정
// // http://localhost:8080/webProject/board/list.jsp 
// // http://localhost:8080/webproject/board/list.jsp?pageNum=1
// String pageNum=request.getParameter("pageNum");
// if(pageNum==null){
// 	// => 페이지 번호가 없으면 1페이지 설정
// 	pageNum="1";
// }
// // apgeNum => 숫자변경
// int currentPage=Integer.parseInt(pageNum);
// // 시작하는 행번호 구하기
// // pageNum(currentPage)	pageSize	=>   startRow		  	  endRow
// //		   1			   10		=>(1-1)*10+1=> 0+1 => 1	 	~	10
// //		   2			   10		=>(2-1)*10+1=> 10+1=> 11	~	20
// //		   3			   10		=>(3-1)*10+1=> 10+1=> 21	~	30
// int startRow=(currentPage-1)*pageSize+1;
// // 끝나는 행번호 구하기
// // startRow		pageSize	=>  endRow
// //	  1				10		=>	1+10-1   =>10
// //	  11			10		=>	11+10-1  =>20
// //	  21			10		=>	21+10-1  =>30
// int endRow=startRow+pageSize-1;

// // select * from board by num desc limit(자름) 시작행-1(시작행 포함x), 몇개
// // 리턴할형 ArrayList<BoardDTO> getBoardList(int startRow, int pageSize) 메서드 정의
// // ArrayList<BoardDTO> boardList = dao.getBoardList() 메서드 호출

SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");//날짜 문자열

ArrayList<BoardDTO> boardList = (ArrayList<BoardDTO>)request.getAttribute("boardList"); 

int currentPage=(Integer)request.getAttribute("currentPage");
int startPage=(Integer)request.getAttribute("startPage");
int pageBlock=(Integer)request.getAttribute("pageBlock");
int endPage=(Integer)request.getAttribute("endPage");
int pageCount=(Integer)request.getAttribute("pageCount");
%>
<article>
<h1>Notice</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
<%
for(int i=0;i<boardList.size();i++){
	BoardDTO dto=boardList.get(i);
	%>
	<tr><td><%=dto.getNum() %></td>
	<td class="left"><%=dto.getSubject() %></td>
    <td><%=dto.getName() %></td>
    <td><%=dateFormat.format(dto.getDate()) %></td>
    <td><%=dto.getReadcount() %></td></tr>
	<%
}
%>

</table>
<!-- 로그인한사람만 글쓰기버튼보이게 -->
<div id="table_search">
<%
String id=(String)session.getAttribute("id");
if(id!=null){
	%>
	<input type="button" value="글쓰기" class="btn" 
	onclick="location.href='BoardWriteForm.bo'"> 
	<%
}
%>
</div>


<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">

<%
// 한화면에 보여줄 페이지 개수 설정
// int pageBlock=10;
// // 시작하는 페이지 번호 구하기
// // currentPage		pageBlock	=> 	      startPage (java에서는 정수/정수는 정수 값)
// // 	 1 ~ 10(0~9)	   10		=>	(10-1)/10*10+1=>0*10+1=> 0+1=>1
// // 	11 ~ 20(10~19)	   10		=>	(20-1)/10*10+1=>1*10+1=>10+1=>11
// // 	21 ~ 30(20~29)	   10		=>	(30-1)/10*10+1=>2*10+1=>20+1=>21
// int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// // 끝나는 페이지 번호 구하기
// // startPage	pageBlock	=>		endPage
// //	  1				10		=>	   1+10-1=>10
// //	  11			10		=>	  11+10-1=>20
// //	  21			10		=>	  21+10-1=>30
// int endPage=startPage+pageBlock-1;
// // 전체글 개수 select count(*) from board;
// // int 리턴할형 getBoardCount() 메서드 정의
// // getBoardCount() 메서드 호출
// int count = dao.getBoardCount();
// // 끝나는 페이지(endPage) = 10		전체페이지(pageCount) = 2 
// // 전체페이지(pageCount) 구하기 
// // => 전체글의 개수 13/10 => 1페이지 + (0.3의 글이 남아있으면 1페이지 추가)
// //삼항연산자를 적어서 나머지가 있는지 비교 (나머지없으면 0, 있으면 1)
// int pageCount=count/pageSize+(count%pageSize==0?0:1); 
// if(endPage > pageCount){
// 	endPage = pageCount;
// }
//10페이지 이전
if(startPage > pageBlock){
	%>
	<a href="BoardList.bo?pageNum=<%=currentPage-pageBlock %>">Prev</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="BoardList.bo?pageNum=<%=i %>"><%=i %></a>
	<%
}

//10페이지 다음
if(endPage < pageCount){
	%>
	<a href="BoardList.bo?pageNum=<%=startPage+pageBlock %>">Next</a>
		<%
}
%>

</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp" />
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>