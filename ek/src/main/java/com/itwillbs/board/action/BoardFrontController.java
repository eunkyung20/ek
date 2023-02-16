package com.itwillbs.board.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class BoardFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doGet()");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doPost()");
		doProcess(request,response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BoardFrontController doProcess()");
		
		// 가상주소 뽑아오기
		System.out.println("뽑은 가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		//---------------------------------------------
		// 가상주소 비교 => 실제주소 매핑
		Action action=null;
		ActionForward forward=null;
		if(sPath.equals("/BoardList.bo")) {
			action=new BoardList();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(sPath.equals("/BoardWriteForm.bo")) {
			forward=new ActionForward();
			forward.setPath("center/write.jsp");
			forward.setRedirect(false);
		
		}else if(sPath.equals("/BoardWritePro.bo")) {
			action=new BoardWritePro();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//---------------------------------------------
		// 이동
		if(forward!=null) {
			if(forward.isRedirect()==true) {
				response.sendRedirect(forward.getPath());
			}else {
			//	forward.isRedirect()==false
				RequestDispatcher dispatcher=
				request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
		
	}
	
}// BoardFrontController
