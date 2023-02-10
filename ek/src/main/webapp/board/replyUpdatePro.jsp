<%@page import="board.ReplyDAO"%>
<%@page import="board.ReplyDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");

int rno=Integer.parseInt(request.getParameter("rno"));

String riply=request.getParameter("riply");

ReplyDTO dto=new ReplyDTO();

dto.setRno(rno);
dto.setRiply(riply);

ReplyDAO dao=new ReplyDAO();
// 리턴할형 없음 updateBoard(BoardDTO dto) 메서드 정의
// updateBoard(dto) 메서드 호출
dao.updateReply(dto);

%> 
 
<script>
window.close();

</script>