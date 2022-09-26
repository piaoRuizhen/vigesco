package org.pyj.model;

public class ReplyDTO {
	private int rno;
	private String reply;
	private String replyer;
	private String replydate;
	private int bno;
	
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getReplydate() {
		return replydate;
	}
	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	@Override
	public String toString() {
		return "ReplyDTO [rno=" + rno + ", reply=" + reply + ", replyer=" + replyer + ", replydate=" + replydate
				+ ", bno=" + bno + "]";
	}
	
}
