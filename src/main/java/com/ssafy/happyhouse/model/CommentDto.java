package com.ssafy.happyhouse.model;

import java.util.Date;

public class CommentDto {
	private int cno;
	private int qno;
	private String userid;
	private String title;
	private String content;
	private Date regtime;

	public CommentDto(int cno, int qno, String userid, String title, String content, Date regtime) {
		super();
		this.cno = cno;
		this.qno = qno;
		this.userid = userid;
		this.title = title;
		this.content = content;
		this.regtime = regtime;
	}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getQno() {
		return qno;
	}

	public void setQno(int qno) {
		this.qno = qno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CommentDto [cno=");
		builder.append(cno);
		builder.append(", qno=");
		builder.append(qno);
		builder.append(", userid=");
		builder.append(userid);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", regtime=");
		builder.append(regtime);
		builder.append("]");
		return builder.toString();
	}
	
}