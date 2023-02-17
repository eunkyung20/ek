package com.itwillbs.qna.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class QnaFrontController extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaFrontController doGet()");
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaFrontController doPost()");
		doProcess(request,response);
	}
		
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("QnaFrontController doProcess()");		
		
		// 가상주소 뽑아오기
		System.out.println("뽑은 가상주소 : "+request.getServletPath());
		String sPath=request.getServletPath();
		
		// 가상주소 비교
		Action action=null; 
		ActionForward forward=null;
		
	if(sPath.equals("/QnaList.qa")) {
		action = new QnaList();
		try {
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
	}else if(sPath.equals("/QnaQuestion.qa")) {
		action = new QnaQuestion();
		try {
			forward=action.execute(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}else if(sPath.equals("/QuestionWriteForm.qa")) {
		forward=new ActionForward();
		forward.setPath("qna/question_writeForm.jsp");
		forward.setRedirect(false);
	
	}else if(sPath.equals("/QuestionWritePro.qa")) {
		action = new QuestionWritePro();
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
	}

	

