package com.itwillbs.board.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class BoardDAO {
	public Connection getConnection() throws Exception {
		Context init=new InitialContext();
		DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con=ds.getConnection();
		return con;
	}
	// 리턴할형없음 insertBoard(BoardDTO dto) 메서드 정의
	public void insertBoard(BoardDTO dto) {
		System.out.println("Boarddao insertBoard()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		try {
			// 1~2단계
			con = getConnection();
			// num 구하기
			int num=1;
			// 3 최대 num + 1
			String sql = "select max(num) from board";
			pstmt = con.prepareStatement(sql);
			// 4
			rs=pstmt.executeQuery();
			// 5
			if(rs.next()) {
				num=rs.getInt("max(num)")+1;
			}
			
			// 3단계
			sql = "insert into board(num,name,subject,content,readcount,date,file) values(?,?,?,?,?,?,?);";
			pstmt = con.prepareStatement(sql);
			// ?채워넣기
			pstmt.setInt(1, num);
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getSubject());
			pstmt.setString(4, dto.getContent());
			pstmt.setInt(5, dto.getReadcount());
			pstmt.setTimestamp(6, dto.getDate());
			// 파일추가
			pstmt.setString(7, dto.getFile());
			
			// => 4단계 SQL구문을 실행(insert,update,delete)
			pstmt.executeUpdate();
			// => 세션값 초기화
		} catch (Exception e) {
			e.printStackTrace(); // 에러처리
		} finally {
			// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
		return;
	}
	public ArrayList<BoardDTO> getBoardList(int startRow, int pageSize) {
		System.out.println("BoardDAO getBoardList()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<BoardDTO> boardList = new ArrayList<>();// 형변환하지않고 dto로 저장할 때
		try {
			// 1,2 디비연결 메서드
			con = getConnection();

			// 3단계 sql 
			// 기본 num기준으로 오름차순 정렬(db에서는 primary key 기준으로 오름차순이 기본) 
			// => 최근글 위로 올라오게 정렬(num 기준으로 내림차순)
			// select * from board by num desc limit(자름) 시작행-1(시작행 포함x), 몇개
			String sql = "select * from board order by num desc limit ?, ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, startRow-1); //시작하는 행을 포함하지 않는 문법이라 -1을 해줘야함
			pstmt.setInt(2, pageSize);

			// 4단계 SQL구문을 실행(select) => 결과 저장
			rs = pstmt.executeQuery();
			// 5단계 조건이 true 실행문 => 다음행 데이터 있으면 true
			// => 열접근 => 한 명 접근 MemberDTO 저장 => 배열한칸 저장

			while (rs.next()) { 
				// 하나의 글의 바구니에 저장
				BoardDTO dto = new BoardDTO();
				System.out.println("회원정보저장 주소 : " + dto);
				// set메서드 호출 <= 열접근
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getNString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setDate(rs.getTimestamp("date"));
				// 바구니의 주소값을 배열 한칸에 저장
				boardList.add(dto);
						}
				} catch (Exception e) {
						e.printStackTrace(); // 에러처리
				} finally {
				// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
				}
				return boardList;
	}
	// 리턴할형 BoardDTO getBoard(int num) 메서드 정의
	public BoardDTO getBoard(int num) { // 기준값 num
		System.out.println("BoardDAO getBoard()");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		BoardDTO dto=null;
		try {
			// 1~2단계
			con = getConnection();
			// 3 sql
			String sql = "select * from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4
			rs=pstmt.executeQuery();
			// 5
			while (rs.next()) { 
				// 하나의 글의 바구니에 저장
				dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setName(rs.getString("name"));
				dto.setSubject(rs.getString("subject"));
				dto.setContent(rs.getNString("content"));
				dto.setReadcount(rs.getInt("readcount"));
				dto.setDate(rs.getTimestamp("date"));
				//file 추가
				dto.setFile(rs.getString("file"));
						}
				} catch (Exception e) {
						e.printStackTrace(); // 에러처리
				} finally {
				// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
				if (rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return dto;
	}
	// 리턴할형 없음 updateBoard(BoardDTO dto) 메서드 정의
	public void updateBoard(BoardDTO dto) {
		System.out.println("BoardDAO updateBoard()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1~2단계
			con = getConnection();
			// 3 sql
			String sql = "update board set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getSubject());
			pstmt.setString(2, dto.getContent());
			pstmt.setInt(3, dto.getNum());
			// 4단계 SQL구문을 실행(insert,update,delete)
			pstmt.executeUpdate();		
		} catch (Exception e) {
			e.printStackTrace(); // 에러처리
		} finally {
			// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}
	}
	
	// 리턴할형 없음 updateBoard(BoardDTO dto) 메서드 정의
		public void fupdateBoard(BoardDTO dto) {
			System.out.println("BoardDAO fupdateBoard()");
			Connection con = null;
			PreparedStatement pstmt = null;
			try {
				// 1~2단계
				con = getConnection();
				// 3 sql
				String sql = "update board set subject=?, content=?, file=? where num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, dto.getSubject());
				pstmt.setString(2, dto.getContent());
				// file 추가
				pstmt.setString(3, dto.getFile());
				pstmt.setInt(4, dto.getNum());
				// 4단계 SQL구문을 실행(insert,update,delete)
				pstmt.executeUpdate();		
			} catch (Exception e) {
				e.printStackTrace(); // 에러처리
			} finally {
				// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
				if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
			}
		}
	
	// 리턴할형 없음 deleteBoard(int num) 메서드 정의
	public void deleteBoard(int num) {
		System.out.println("BoardDAO deleteBoard()");
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			// 1~2단계
			con = getConnection();
			// 3 sql
			String sql = "delete from board where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			// 4단계 SQL구문을 실행(insert,update,delete)
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace(); // 에러처리
		} finally {
			// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
		}	
	}
	// int 리턴할형 getBoardCount() 메서드 정의
	public int getBoardCount() {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int count=0;
		try {
			// 1~2단계
			con = getConnection();
			// 3 sql
			String sql = "select count(*) from board";
			pstmt = con.prepareStatement(sql);
			// 4
			rs=pstmt.executeQuery();
			// 5
			if(rs.next()) { 
			count=rs.getInt("count(*)");
			}			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (Exception e2) {}
			if (con != null) try {con.close();} catch (Exception e2) {}
			if (rs != null) try {rs.close();} catch (Exception e2) {}
		}
		return count;
	}
}
	
