package com.cambio.org.member;

public class MemberDTO {

	private String id;
	private String pwd;
	private String cpwd;
	private String name;
	private String birth;
	private String gender;
	private String pnumber;
	private String mail;
	
	public MemberDTO() {} 
		
	public MemberDTO(String id, String pwd, String cpwd, String name, String birth, String gender, String pnumber,
			String mail) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.cpwd = cpwd;
		this.name = name;
		this.birth = birth;
		this.gender = gender;
		this.pnumber = pnumber;
		this.mail = mail;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", cpwd=" + cpwd + ", name=" + name + ", birth=" + birth
				+ ", gender=" + gender + ", pnumber=" + pnumber + ", mail=" + mail + "]";
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getCpwd() {
		return cpwd;
	}
	public void setCpwd(String cpwd) {
		this.cpwd = cpwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPnumber() {
		return pnumber;
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}	
}
