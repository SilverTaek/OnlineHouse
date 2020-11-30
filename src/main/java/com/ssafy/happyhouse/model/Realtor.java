package com.ssafy.happyhouse.model;
/*
 rno
int AI PK
rid
varchar(20)
rpwd
varchar(20)
raddress
varchar(100)
remail
varchar(100)
rphone
varchar(13)
rgrade
 
 */
public class Realtor {
	private int rno;
	private String rid;
	private String rpwd;
	private String raddress;
	private String remail;
	private String rphone;
	private int rgrade;
	private String rname;
	private String rcontent;
	private String ceo;
	private int license;
	public Realtor() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Realtor(int rno, String rid, String rpwd, String raddress, String remail, String rphone, int rgrade, String rname, String rcontent, int license, String ceo) {
		super();
		this.rno = rno;
		this.rid = rid;
		this.rpwd = rpwd;
		this.raddress = raddress;
		this.remail = remail;
		this.rphone = rphone;
		this.rgrade = rgrade;
		this.rname = rname;
		this.rcontent = rcontent;
		this.license = license;
		this.ceo = ceo;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getRid() {
		return rid;
	}
	public void setRid(String rid) {
		this.rid = rid;
	}
	public String getRpwd() {
		return rpwd;
	}
	public void setRpwd(String rpwd) {
		this.rpwd = rpwd;
	}
	public String getRaddress() {
		return raddress;
	}
	public void setRaddress(String raddress) {
		this.raddress = raddress;
	}
	public String getRemail() {
		return remail;
	}
	public void setRemail(String remail) {
		this.remail = remail;
	}
	public String getRphone() {
		return rphone;
	}
	public void setRphone(String rphone) {
		this.rphone = rphone;
	}
	public int getRgrade() {
		return rgrade;
	}
	public void setRgrade(int rgrade) {
		this.rgrade = rgrade;
	}
	
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public int getLicense() {
		return license;
	}
	public void setLicense(int license) {
		this.license = license;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	@Override
	public String toString() {
		return "Realtor [rno=" + rno + ", rid=" + rid + ", rpwd=" + rpwd + ", raddress=" + raddress + ", remail="
				+ remail + ", rphone=" + rphone + ", rgrade=" + rgrade + ", rname=" + rname + ", rcontent=" + rcontent
				+ ", ceo=" + ceo + ", license=" + license + "]";
	}
	
	
}
