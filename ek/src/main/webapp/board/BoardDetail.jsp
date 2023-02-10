
<%@page import="member.UserDTO"%>
<%@page import="member.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>댓글/대댓글</title>
<style type="text/css">
span#rno{
	font-weight: bold;
}
</style>

<script type="text/javascript" src="../script/jquery-3.6.3.js"></script>
<script type="text/javascript">

 $(document).ready(function(){

	 $.ajax({
			url:"replyJsonarr.jsp",
			dataType:"json",
			success:function(arr){
				
				$.each(arr,function(index,item){
					$('.reply1').append('<span id="rno">'+item.id+
					'</span><span id="rdate"> '+item.rdate+'</span><br><span id="riply" style="display:inline-block; width:600px;">'
					+item.riply+'</span><span> <a href="replyUpdateForm.jsp?rno='+item.rno+
					'" target="blank">수정</a> | <a href="replyDeletePro.jsp?rno='+item.rno+'">삭제<a> </span><br><br>');
					
				});// each
			}// success
		}); //ajax	// 댓글 리스트

 }); // ready

 </script>



</head>
<body>
<%
//int bno = Integer.parseInt(request.getParameter("bno"));
int bno=1;
//String id=(String)session.getAttribute("id");
// UserDAO dao = new UserDAO();
// UserDTO dto = dao.getUser(id);
// int no = dto.getNo();
int no=1;



%>



<!-- 댓글쓰기 폼 -->

<h2>댓글쓰기</h2>
<form action="replyInsertpro.jsp" method ="post">
<input type="hidden" name="no" value="<%=no%>">
<input type="hidden" name="bno" value="<%=bno%>">
<textarea rows="3" cols="80" name="riply" ></textarea>
<input type="submit" value="댓글쓰기">
</form>

<!-- 댓글쓰기 폼 -->

<!-- 댓글 리스트 영역 -->
<div class="reply">
		<div class ="reply1">
		</div>
		<div class="rereply">
		</div>
</div>
<!-- 댓글 리스트 영역 -->
</body>
</html>