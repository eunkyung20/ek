package com.itwillbs.member.action;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itwillbs.member.db.MemberDAO;
import com.itwillbs.member.db.MemberDTO;

public class MemberInsertPro implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("MemberInsertPro execute()");
		
		// request 한글처리
		request.setCharacterEncoding("utf-8");
		
		// request 파라미터 가져오기
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		String name=request.getParameter("name");		
		Timestamp date=new Timestamp(System.currentTimeMillis());
		
		// MemberDTO 객체생성
		MemberDTO dto=new MemberDTO();
		System.out.println("MemberDTO 바구니 주소 : "+dto);
		
		// 멤버변수 파라미터값 저장
		dto.setId(id);
		dto.setPass(pass);
		dto.setName(name);
		dto.setDate(date);
		
		// MemberDAO 객체생성
		MemberDAO dao=new MemberDAO();
		
		// insertMember() 메서드 호출
		dao.insertMember(dto);
		
		// 이동 MemberLoginForm.me
		ActionForward forward=new ActionForward();
		forward.setPath("MemberLoginForm.me");
		forward.setRedirect(true);
		return forward;
	}

}
