package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewDAO {
	
	private Connection getConnection() throws Exception {
		
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection con = ds.getConnection();
		return con;
	}
	
	// insertReview()
	public void insertReview(ReviewDTO dto) {
		System.out.println("ReviewDAO insertReview()");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = getConnection();
			
			String sql = "insert into review(rno, no, pno, rtitle, rstar, rcontent, rcount, rdate, rpic1, rpic2, rpic3) "
					   + "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, dto.getRno());	// 리뷰번호
			pstmt.setInt(2, dto.getNo()); // 유저번호
			pstmt.setInt(3, dto.getPno()); // 상품번호
			pstmt.setString(4, dto.getRtitle());
			pstmt.setString(5, "*****");	// 별점 길이 값 받아오기...
			pstmt.setString(6, dto.getRcontent());
			pstmt.setInt(7, dto.getRcount());
			pstmt.setTimestamp(8, dto.getRdate());
			pstmt.setString(9, dto.getRpic1());
			pstmt.setString(10, dto.getRpic2());
			pstmt.setString(11, dto.getRpic3());
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(con != null) try {con.close();} catch (Exception e2) {}
			if(pstmt != null) try {pstmt.close();} catch (SQLException e) {}
		}
		
	} // insertReview()
	

}
