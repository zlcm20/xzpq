package com.yc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class User implements Serializable {

	private static final long serialVersionUID = 1580042080015532771L;

	private Integer uid;
	private String uname;
	private String upassword;
	private String usex;
	private String uidcard;
	private String utel;
	private String uaccount;
	private Integer isfkorfd;
	private Date regdate=new Date(new java.util.Date().getTime()); 
	private String regdateString;
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUsex() {
		return usex;
	}
	public void setUsex(String usex) {
		this.usex = usex;
	}
	public String getUidcard() {
		return uidcard;
	}
	public void setUidcard(String uidcard) {
		this.uidcard = uidcard;
	}
	public String getUtel() {
		return utel;
	}
	public void setUtel(String utel) {
		this.utel = utel;
	}
	public String getUaccount() {
		return uaccount;
	}
	public void setUaccount(String uaccount) {
		this.uaccount = uaccount;
	}
	public Integer getIsfkorfd() {
		return isfkorfd;
	}
	public void setIsfkorfd(Integer isfkorfd) {
		this.isfkorfd = isfkorfd;
	}
	
	public Date getRegdate() throws ParseException {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.regdate=new Date(df.parse(this.regdateString).getTime());
		return this.regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
		this.getRegdateString();
	}
	public String getRegdateString() {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.regdateString=df.format(new java.util.Date(this.regdate.getTime()));
		return this.regdateString;
	}
	public void setRegdateString(String regdateString) {
		this.regdateString = regdateString;
	}
	@Override
	public String toString() {
		return "User [uid=" + uid + ", uname=" + uname + ", upassword="
				+ upassword + ", usex=" + usex + ", uidcard=" + uidcard
				+ ", utel=" + utel + ", uaccount=" + uaccount + ", isfkorfd="
				+ isfkorfd + ", regdate=" + regdate + ", regdateString="
				+ regdateString + "]";
	}
	public User() {
		super();
	}
	public User(Integer uid, String uname, String upassword, String usex,
			String uidcard, String utel, String uaccount, Integer isfkorfd,
			Date regdate, String regdateString) {
		super();
		this.uid = uid;
		this.uname = uname;
		this.upassword = upassword;
		this.usex = usex;
		this.uidcard = uidcard;
		this.utel = utel;
		this.uaccount = uaccount;
		this.isfkorfd = isfkorfd;
		this.regdate = regdate;
		this.regdateString = regdateString;
	}

	
	
}
