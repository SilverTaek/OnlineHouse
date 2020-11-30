package com.ssafy.happyhouse.model;

public class PersonDto {
	private int userno;
	private String userid;
	private String userpwd;
	private String username;
	private String email;
	private String address;
	private String phone;
	
	public PersonDto(int userno, String userid, String userpwd, String username, String email, String address,
			String phone) {
		super();
		this.userno = userno;
		this.userid = userid;
		this.userpwd = userpwd;
		this.username = username;
		this.email = email;
		this.address = address;
		this.phone = phone;
	}

	public PersonDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUserno() {
		return userno;
	}

	public void setUserno(int userno) {
		this.userno = userno;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUserpwd() {
		return userpwd;
	}

	public void setUserpwd(String userpwd) {
		this.userpwd = userpwd;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "PersonDto [userno=" + userno + ", userid=" + userid + ", userpwd=" + userpwd + ", username=" + username
				+ ", email=" + email + ", address=" + address + ", phone=" + phone + "]";
	}

	


	
}
