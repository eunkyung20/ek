package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardContent implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardContent execute()");
		
		// num 가져오기
		int num=Integer.parseInt(request.getParameter("num"));
		
		// BoardDAO 객체생성
		BoardDAO dao = new BoardDAO();
		
		// BoardDTO dto = getBoard(num) 메서드 호출
		BoardDTO dto = dao.getBoard(num);
		
		// request "dto", dto 담기
		request.setAttribute("dto", dto);
		
		// center/content.jsp 이동
		ActionForward forward=new ActionForward();
		forward.setPath("center/content.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
