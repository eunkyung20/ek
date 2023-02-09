package member;

import java.sql.Timestamp;

public class ReviewDTO {
	
	private int rno;		// 리뷰번호
	private int no;			// 유저번호
	private int pno;		// 상품번호
	private String rtitle;		// 리뷰제목
	private String rcontent;	// 리뷰내용
	private String rstar;		// 별점
	private Timestamp rdate;	// 등록날짜
	private int rcount;		// 뷰카운트
	private String rpic1;		// 리뷰사진1
	private String rpic2;		// 리뷰사진2
	private String rpic3;		// 리뷰사진3
	
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRstar() {
		return rstar;
	}
	public void setRstar(String rstar) {
		this.rstar = rstar;
	}
	public Timestamp getRdate() {
		return rdate;
	}
	public void setRdate(Timestamp rdate) {
		this.rdate = rdate;
	}
	public int getRcount() {
		return rcount;
	}
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	public String getRpic1() {
		return rpic1;
	}
	public void setRpic1(String rpic1) {
		this.rpic1 = rpic1;
	}
	public String getRpic2() {
		return rpic2;
	}
	public void setRpic2(String rpic2) {
		this.rpic2 = rpic2;
	}
	public String getRpic3() {
		return rpic3;
	}
	public void setRpic3(String rpic3) {
		this.rpic3 = rpic3;
	}
	
	
}
