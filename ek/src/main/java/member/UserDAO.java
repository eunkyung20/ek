package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class UserDAO {
		public Connection getConnection() throws Exception{			
			Context init=new InitialContext();
			DataSource ds=(DataSource)init.lookup("java:comp/env/jdbc/MysqlDB");
			Connection con=ds.getConnection();
			return con;
			
		}
		
		public UserDTO userCheck(String id, String pass) {
			// 바구니 주소가 저장되는 변수에 null 초기화
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2단계 디비연결 메서드 호출
				con = getConnection();
				// 3단계 SQL구문 만들어서 실행할 준비(select    where id=? and pass=?)
				String sql="select * from users where id=? and pass=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, pass);
				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				//5단계 결과를 출력, 데이터 담기 (select)
				// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
//				                 => 세션값 생성 "id",id , main.jsp 이동
//				                         데이터 없으면 false => 아이디 비밀번호 틀림
//				                 => script   "아이디 비밀번호 틀림" 뒤로이동
				if(rs.next()){
					//next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
				    // => 세션값 생성 "id",id(페이지 상관없이 값을 유지) , main.jsp 이동
					// dto 바구니 객체생성 => 기억장소 할당
					dto=new UserDTO();
					dto.setNo(rs.getInt("no"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setUname(rs.getString("uname"));
					dto.setJoindate(rs.getTimestamp("joindate"));
				}else{
					
				}	
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//userCheck()
		
		public void insertUser(UserDTO dto) {
			System.out.println("MemberDAO insertMember()");
			System.out.println("MemberDTO 바구니 전달받은 주소 : " + dto);
			System.out.println("바구니주소에서 가져온 아이디 : " + dto.getId());
			System.out.println("바구니주소에서 가져온 비밀번호 : " + dto.getPass());
			System.out.println("바구니주소에서 가져온 이름 : " + dto.getUname());
			System.out.println("바구니주소에서 가져온 생년월일 : " + dto.getBirth());
			System.out.println("바구니주소에서 가져온 이메일 : " + dto.getEmail());
			System.out.println("바구니주소에서 가져온 주소1 : " + dto.getAddress1());
			System.out.println("바구니주소에서 가져온 주소2 : " + dto.getAddress2());
			System.out.println("바구니주소에서 가져온 휴대폰번호 : " + dto.getTel());
			System.out.println("바구니주소에서 가져온 포스트 : " + dto.getPostnum());
			System.out.println("바구니주소에서 가져온 번호 : " + dto.getNo());
			System.out.println("바구니주소에서 가져온 가입날짜 : " + dto.getJoindate());
			System.out.println("바구니주소에서 가져온 유형 : " + dto.getUtype());
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs=null;
			try {
				con = getConnection();
				int no=1;
				String sql = "select max(no) from users";
				pstmt = con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				if(rs.next()) {
					no=rs.getInt("max(no)")+1;
				}
				sql = "insert into users(no,id,pass,uname,birth,email,address1,address2,postnum,tel,joindate,utype) values(?,?,?,?,?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
								
				pstmt.setInt(1, no);
				pstmt.setString(2, dto.getId());
				pstmt.setString(3, dto.getPass());
				pstmt.setString(4, dto.getUname());
				pstmt.setString(5, dto.getBirth());
				pstmt.setString(6, dto.getEmail());
				pstmt.setString(7, dto.getAddress1());
				pstmt.setString(8, dto.getAddress2());
				pstmt.setInt(9, dto.getPostnum());
				pstmt.setString(10, dto.getTel());
				pstmt.setTimestamp(11, dto.getJoindate());
				pstmt.setInt(12, dto.getUtype());
				pstmt.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null)try {rs.close();} catch(Exception e2) {}
				if (pstmt != null)try {pstmt.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
				
			}
		}	//insertUser
		
		public UserDTO getUser(String id) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				
				//3단계 SQL구문 만들어서 실행할 준비(select 조건 where id=?)
				String sql="select * from users where id=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, id);

				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				//5단계 결과를 출력, 데이터 담기 (select)
				// next() 다음행 => 리턴값 데이터 있으면 true/ 데이터 없으면 false
				//조건이 true 실행문=> 다음행 데이터 있으면 true =>  열접근 출력
				if(rs.next()){
					//next() 다음행 => 리턴값 데이터 있으면 true/ 아이디 일치
					// 바구니 객체생성 => 기억장소 할당
					dto=new UserDTO();
					// set메서드호출 바구니에 디비에서 가져온 값 저장
					dto.setNo(rs.getInt("no"));
					dto.setUname(rs.getString("uname"));
					dto.setId(rs.getString("id"));
					dto.setPass(rs.getString("pass"));
					dto.setBirth(rs.getString("birth"));
					dto.setTel(rs.getString("tel"));
					dto.setAddress1(rs.getString("address1"));
					dto.setAddress2(rs.getString("address2"));
					dto.setPostnum(rs.getInt("postnum"));
					dto.setEmail(rs.getString("email"));
					dto.setJoindate(rs.getTimestamp("joindate"));
					dto.setUtype(rs.getInt("utype"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				// 예외 상관없이 마무리작업 => 객체생성한 기억장소 해제
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}//getUser()
		
		public UserDTO findId(String uname, String email) {
			UserDTO dto=null;
			Connection con =null;
			PreparedStatement pstmt=null;
			ResultSet rs=null;
			
			try {
				//1,2 디비연결 메서드
				con=getConnection();
				
				//3단계 SQL구문 만들어서 실행할 준비(select 조건 where id=?)
				String sql="select * from users where uname=? and email=? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, uname);
				pstmt.setString(2, email);
				

				//4단계 SQL구문을 실행(select) => 결과 저장
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto=new UserDTO();
		
					dto.setUname(rs.getString("uname"));
					dto.setEmail(rs.getString("email"));
				}
					
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				if(rs!=null) try { rs.close();} catch (Exception e2) {}
				if(pstmt!=null) try { pstmt.close();} catch (Exception e2) {}
				if(con!=null) try { con.close();} catch (Exception e2) {}
			}
			return dto;
		}// findId
		
		public void deleteUser(String id) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
			try {
				// 1,2 디비연결 메서드
				con = getConnection();
				// 3단계
				String sql2 = "delete from members where id=?";
				pstmt2 = con.prepareStatement(sql2);
				// ?채워넣기
				pstmt2.setString(1, id); // set 문자열(1번째 물음표, 값 id)
				// => 4단계 SQL구문을 실행(insert,update,delete)
				pstmt2.executeUpdate();
				// => 세션값 초기화
			} catch (Exception e) {
				e.printStackTrace(); // 에러처리
			} finally {
				// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
				if (pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
				if (con != null) try {con.close();} catch (Exception e2) {}
			}
		} // deleteUser()
		
		public void updateUser(UserDTO updateDto) {
			Connection con = null;
			PreparedStatement pstmt2 = null;
			// 1,2단계 디비연결 메서드 호출
			try {
				con = getConnection();

				// if next() 다음행 => 리턴값 데이터 있으면 true => 아이디 비밀번호 일치
				// => 3단계 pstmt2 SQL구문 만들어서 실행할 준비 (update set name=? where id=?)
				// => 4단계 SQL구문을 실행(update)
				String sql2 = "update members set pass=? uname=?, email=?, address1=?, address2=?, tel=? where id=?";
				pstmt2 = con.prepareStatement(sql2);
				//? 채워넣기
				pstmt2.setString(1, updateDto.getId());
				pstmt2.setString(2, updateDto.getPass());
				pstmt2.setString(3, updateDto.getUname());
				pstmt2.setString(4, updateDto.getBirth());
				pstmt2.setString(5, updateDto.getEmail());
				pstmt2.setString(6, updateDto.getAddress1());
				pstmt2.setString(7, updateDto.getAddress2());
				pstmt2.setString(8, updateDto.getTel());
				

				
				// 4단계 SQL구문을 실행(insert,update,delete)
				pstmt2.executeUpdate();

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 예외 상관없이 마무리 작업 => 객체생성한 기억장소 해제
				if (pstmt2 != null) try {pstmt2.close();} catch (Exception e2) {}
				if (con != null)try {con.close();} catch (Exception e2) {}
			}
		}// updateUser()

}
