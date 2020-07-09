package ReviewComment;

import java.sql.Timestamp;

public class CommentVO {
	
	private int bnum;
	private int cnum;
	private String c_id;
	private String c_content;
	private Timestamp c_date;
	
	
	public CommentVO(String c_id, String c_content, Timestamp c_date) {//한번에 저장할수있음
		
		this.c_id = c_id;
		this.c_content = c_content;
		this.c_date = c_date;
	}
	public CommentVO() {
		
	}
	public int getBnum() {
		return bnum;
	}


	public void setBnum(int bnum) {
		this.bnum = bnum;
	}


	public int getCnum() {
		return cnum;
	}


	public void setCnum(int cnum) {
		this.cnum = cnum;
	}


	public String getC_id() {
		return c_id;
	}


	public void setC_id(String c_id) {
		this.c_id = c_id;
	}


	public String getC_content() {
		return c_content;
	}


	public void setC_content(String c_content) {
		this.c_content = c_content;
	}


	public Timestamp getC_date() {
		return c_date;
	}


	public void setC_date(Timestamp c_date) {
		this.c_date = c_date;
	}
	
	

}
