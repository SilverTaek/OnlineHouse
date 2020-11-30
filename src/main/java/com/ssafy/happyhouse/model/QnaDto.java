package com.ssafy.happyhouse.model;

import java.util.Date;

public class QnaDto {
	private String qno;
	private String qtitle;
	private String qcontent;
	private String qwriter;
	private Date qregtime;
	
	public QnaDto(String qno, String qtitle, String qcontent, String qwriter, Date qregtime) {
		super();
		this.qno = qno;
		this.qtitle = qtitle;
		this.qcontent = qcontent;
		this.qwriter = qwriter;
		this.qregtime = qregtime;
	}

	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getQno() {
		return qno;
	}

	public void setQno(String qno) {
		this.qno = qno;
	}

	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}

	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public String getQwriter() {
		return qwriter;
	}

	public void setQwriter(String qwriter) {
		this.qwriter = qwriter;
	}

	public Date getQregtime() {
		return qregtime;
	}

	public void setQregtime(Date qregtime) {
		this.qregtime = qregtime;
	}

	@Override
	public String toString() {
		return "QnaDTO [qno=" + qno + ", qtitle=" + qtitle + ", qcontent=" + qcontent + ", qwriter=" + qwriter
				+ ", qregtime=" + qregtime + "]";
	}
	
	
	

}
