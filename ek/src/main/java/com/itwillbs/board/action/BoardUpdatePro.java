package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;
import com.itwillbs.board.db.BoardDTO;

public class BoardUpdatePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardUpdatePro execute()");
		
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		
		// request => num, name, subject, content 파라미터 => 변수저장
		int num=Integer.parseInt(request.getParameter("num"));
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");

		
		// BoardDTO 객체생성
		BoardDTO dto=new BoardDTO();
		
		// set메서드호출 num, name, subject, content 저장
		dto.setNum(num);
		dto.setName(name);
		dto.setSubject(subject);
		dto.setContent(content);
		
		// BoardDAO 객체생성
		BoardDAO dao=new BoardDAO();
		
		// updateBoard(dto) 메서드 호출
		dao.updateBoard(dto); 
		
		// BoardList 이동
		ActionForward forward=new ActionForward();
		forward.setPath("BoardList.bo");
		forward.setRedirect(true);
		return forward;
	}

}
