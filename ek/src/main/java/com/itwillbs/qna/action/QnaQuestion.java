package com.itwillbs.qna.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.UserDAO;
import member.UserDTO;
import qna.QnaDAO;
import qna.QnaDTO;

public class QnaQuestion implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("QnaQuestion execute()");
		
		// qno 가져오기
		int qno=Integer.parseInt(request.getParameter("qno"));
		
		QnaDAO qdao=new QnaDAO();
		QnaDTO qdto=qdao.getQna(qno);
		
		HttpSession session = request.getSession();	
		
		String id=(String)session.getAttribute("id");
		
		if(id==null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('로그인 후에 보실 수 있습니다');");
			out.println("location.href='MemberLogin.me';");
			out.println("</script>");
			out.close();	
		}
		
		int no=qdto.getNo();
		UserDAO udao = new UserDAO();
		UserDTO udto = udao.getUserNo(no);	
		
		int status=qdto.getQstatus(); // 답변 상태
		
		request.setAttribute("qdto", qdto);
		request.setAttribute("udto", udto);
		request.setAttribute("qno", qno);
		
		ActionForward forward = new ActionForward();
		forward.setPath("qna/question.jsp");
		forward.setRedirect(false);		

		
		return forward;
	}

}
