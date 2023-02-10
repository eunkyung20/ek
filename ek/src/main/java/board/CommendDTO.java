package board;

import java.sql.Timestamp;

public class CommendDTO { // 대댓글 클래스
	private int cno; // 대댓글 번호
	private int bno; // 공지사항 번호
	private int no; // 대댓글 단 유저번호
	private int rno; // 댓글 번호
	private String commend; // 대댓글 내용
	private Timestamp cdate; // 대댓글 단 시간
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getCommend() {
		return commend;
	}
	public void setCommend(String commend) {
		this.commend = commend;
	}
	public Timestamp getCdate() {
		return cdate;
	}
	public void setCdate(Timestamp cdate) {
		this.cdate = cdate;
	}
	
	
}
