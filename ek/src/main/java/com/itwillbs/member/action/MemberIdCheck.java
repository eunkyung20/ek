package com.itwillbs.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberIdCheck implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberIdCheck execute()");
		
		// request id파라미터 가져오기
		String id=request.getParameter("id");
		
		// MemberDAO 객체생성
		MemberDAO dao=new MemberDAO();
		
		// MemberDTO dto = getMember() 메서드 호출
		MemberDTO dto = dao.getMember(id);
		String result=""; //결과값을 result변수에 담음
		
		// dto null 아니면 아이디 있음, 아이디 중복
		// dto null 이면  아이디 없음, 아이디 사용가능
		if(dto!=null){
			// 아이디 있음, 아이디 중복
			result="아이디 중복";
		}else{
			// 아이디 없음, 아이디 사용가능
			result="아이디 사용가능";
		}
		
		// 출력 <%= result%> 웹으로 출력
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out=response.getWriter();
		out.println(result); // html으로 result값을 출력만 함
		out.close(); // 이동은 하지 않음
		return null; 
	}

}
