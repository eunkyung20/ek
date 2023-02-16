<%@page import="java.text.SimpleDateFormat"%>
<%@page import="qna.QnaDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="qna.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>qna/qnaList.jsp</title>
</head>
<body>
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/header.jsp" />
<!-- 헤더들어가는 곳 -->
<%
//QnaDAO 객체 생성
QnaDAO dao=new QnaDAO();

//한페이지에 보여줄 글개수 설정
int pageSize=10;

//현 페이지 번호 가져오기 => 페이지 번호가 없으면 1페이지 설정
String pageNum=request.getParameter("pageNum");
if(pageNum==null){
	// => 페이지 번호가 없으면 1페이지 설정
	pageNum="1";
}
// pageNum => 숫자변경
int currentPage=Integer.parseInt(pageNum);
//시작하는 행번호 구하기
int startRow=(currentPage-1)*pageSize+1;
//끝나는 행번호 구하기
int endRow=startRow+pageSize-1;

//메서드 호출
ArrayList<QnaDTO> qnaList = dao.getQnaList(startRow, pageSize); 
SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy.MM.dd");

String qstatus = "";
%>

<article>
<h3>Q&A</h3>
	<table border="1">
		<tr><td>글번호</td><td>작성자</td><td>제목</td>
		<td>글쓴날짜</td><td>답변상태</td><td>조회수</td></tr>
<%
//배열접근 => for => 배열 한칸에 내용 가져오기 => qnaDTO 저장 => 출력
for(int i=0;i<qnaList.size();i++){
	QnaDTO dto= qnaList.get(i);

// 답변 상태
if(dto.getQstatus()==0){ 
	qstatus = "답변완료";
}else{
	qstatus="답변미등록";
}

%>
	<tr><td><%=dto.getQno() %></td>
		<td><%=dto.getNo() %></td>
		<td><a href="question.jsp?qno=<%=dto.getQno() %>"><%=dto.getQtitle() %></a></td>
		<td><%=dateFormat.format(dto.getQdate()) %></td>
		<td><%=qstatus%></td>	
		<td><%=dto.getQcount()%></td></tr>	
	<%
}
%>
</table>
<div id="table_search">
<input type="button" value="글쓰기" class="write" onclick="location.href='q_writeForm.jsp'"><br>
</div>
	<%
// 한화면에 보여줄 페이지 개수 설정
int pageBlock=10;
// 시작하는 페이지 번호 구하기
int startPage=(currentPage-1)/pageBlock*pageBlock+1;
// 끝나는 페이지 번호 구하기
int endPage=startPage+pageBlock-1;

int count = dao.getQnaCount();

// 전체페이지(pageCount) 구하기 
int pageCount=count/pageSize+(count%pageSize==0?0:1); 
if(endPage > pageCount){
	endPage = pageCount;
}

// 10페이지 이전
if(startPage > pageBlock){
	%>
 	<a href="qnaList.jsp?pageNum=<%=currentPage-pageBlock %>">[10페이지 이전]</a>
	<%
}

for(int i=startPage;i<=endPage;i++){
	%>
	<a href="qnaList.jsp?pageNum=<%=i %>"><%=i %></a>
	<%
}

// 10페이지 다음
if(endPage < pageCount){
	%>
	<a href="qnaList.jsp?pageNum=<%=startPage+pageBlock %>">[10페이지 다음]</a>
		<%
}
%>

</article>		
</body>
</html>