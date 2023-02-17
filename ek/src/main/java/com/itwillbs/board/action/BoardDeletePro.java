package com.itwillbs.board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.board.db.BoardDAO;

public class BoardDeletePro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("BoardDeletePro execute()");
		
		// request => num 피라미터 => 변수저장
		int num=Integer.parseInt(request.getParameter("num"));
		
		
		// BoardDAO 객체생성
		BoardDAO dao=new BoardDAO();
		// 리턴할형 없음 deleteBoard(int num) 메서드 정의
		// deleteBoard(num) 메서드 호출
		dao.deleteBoard(num);
		
		// list.jsp 이동
		ActionForward forward=new ActionForward();
		forward.setPath("BoardList.bo");
		forward.setRedirect(true);
		return forward;
}

}
