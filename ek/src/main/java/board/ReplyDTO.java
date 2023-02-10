package board;

import java.sql.Timestamp;

public class ReplyDTO { // 댓글 클래스
   private int rno; // 댓글번호
   private int no; // 댓글 단 유저번호
   private int bno; // 공지사항번호
   private String riply; // 댓글 내용
   private Timestamp rdate; // 댓글 단 시간
   
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
   public int getBno() {
	   return bno;
   }
   public void setBno(int bno) {
	   this.bno = bno;
   }
   public String getRiply() {
	   return riply;
   }
   public void setRiply(String riply) {
	   this.riply = riply;
   }
   public Timestamp getRdate() {
	   return rdate;
   }
   public void setRdate(Timestamp rdate) {
	   this.rdate = rdate;
   }
  
}
