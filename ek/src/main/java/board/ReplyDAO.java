package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;



public class ReplyDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	} // 디비연결
	
	public void insertReply(ReplyDTO dto) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = getConnection();
			int rno=1;
			String sql = "select max(rno) from reply";
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				rno=rs.getInt("max(rno)")+1;
			}
			
			sql = "insert into reply values(?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, rno);
			pstmt.setInt(2, dto.getNo());
			pstmt.setInt(3, dto.getBno());
			pstmt.setString(4, dto.getRiply());
			pstmt.setTimestamp(5, dto.getRdate());
			
			pstmt.executeUpdate();
			
			System.out.println("insert 성공");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
			if(rs != null) try {rs.close();} catch (SQLException e) {}
		}
		
	} // 댓글 입력

	public ArrayList<ReplyDTO> getReplyList(int bno){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<ReplyDTO> replylist = new ArrayList<>();
		try {
			con = getConnection();
			String sql = "select * from reply where bno =? order by rno desc";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				ReplyDTO dto = new ReplyDTO();
				dto.setRno(rs.getInt("rno"));
				dto.setNo(rs.getInt("no"));
				dto.setBno(rs.getInt("bno"));
				dto.setRiply(rs.getString("riply"));
				dto.setRdate(rs.getTimestamp("rdate"));
				// 바구니의 주소값을 배열 한칸에 저장
				replylist.add(dto);
			}
			
		} catch (Exception e) {
			e.printStackTrace();;
		} finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
			
		}
		return replylist;
	} // 댓글 리스트
	
	public ReplyDTO getReply(int rno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ReplyDTO dto = null;
		try {
			con = getConnection();
			String sql = "select * from reply where rno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			rs=pstmt.executeQuery();
			while(rs.next()) {
			dto = new ReplyDTO(); 
			dto.setRno(rs.getInt("rno"));
			dto.setNo(rs.getInt("no"));
			dto.setBno(rs.getInt("bno"));
			dto.setRiply(rs.getString("riply"));
			dto.setRdate(rs.getTimestamp("rdate"));
			} // while
			}catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
			if(rs!=null)try {rs.close();} catch (Exception e2) {}
		}
		return dto;
	} // getReply

	public void updateReply(ReplyDTO dto) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "update reply set riply = ? where rno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getRiply());
			pstmt.setInt(2, dto.getRno());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
		}
		
	} // 댓글 수정
	
	public void deleteReply(int rno) {
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = getConnection();
			String sql = "delete from reply where rno = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, rno);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			if(con!=null)try {con.close();} catch (Exception e2) {}
			if(pstmt!=null)try {pstmt.close();} catch (Exception e2) {}
		}
		
	} // 댓글 삭제
	

}
