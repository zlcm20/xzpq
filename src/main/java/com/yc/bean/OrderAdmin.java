package com.yc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class OrderAdmin  implements Serializable  {

	private static final long serialVersionUID = 1982516377402271852L;

	private Integer oaid;
	private Integer uid; //客户id
	private User fk;    //客户信息   
	
	private User user;
	private Integer hid;   //房屋id
	private House house;   //房屋信息
	private String ocondition;//状态   未发布 审核中   已审核   已发布 ....
	private Date hindate=new Date(new java.util.Date().getTime());
	private Date houtdate=new Date(new java.util.Date().getTime());
	private Double money;
	
	public User getFk() {
		return fk;
	}
	public void setFk(User fk) {
		this.fk = fk;
	}
	public House getHouse() {
		return house;
	}
	public void setHouse(House house) {
		this.house = house;
	}
	private String hindateString;

	private String houtdateString;
	
	public OrderAdmin() {
		super();
	}
	public Integer getOaid() {
		return oaid;
	}
	public void setOaid(Integer oaid) {
		this.oaid = oaid;
	}

	public Integer getHid() {
		return hid;
	}
	public void setHid(Integer hid) {
		this.hid = hid;
	}

	public String getOcondition() {
		return ocondition;
	}
	public void setOcondition(String ocondition) {
		this.ocondition = ocondition;
	}
	public Date getHindate() throws ParseException {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.hindate=new Date(df.parse(this.hindateString).getTime());
		return this.hindate;
	}
	public void setHindate(Date hindate) {
		this.hindate = hindate;
		this.getHindateString();
	}
	public Date getHoutdate() throws ParseException {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		if(this.houtdateString!=null&&!this.houtdateString.equals("")) {
			this.houtdate=new Date(df.parse(this.houtdateString).getTime());
			return this.houtdate;
		}
		return null;
	}
	public void setHoutdate(Date houtdate) {
		this.houtdate = houtdate;
		this.getHoutdateString();
	}
	
	
	public String getHindateString() {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.hindateString=df.format(new java.util.Date(this.hindate.getTime()));
		return this.hindateString;
	}
	public void setHindateString(String hindateString) {
		this.hindateString = hindateString;
	}
	public String getHoutdateString() {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.houtdateString=df.format(new java.util.Date(this.houtdate.getTime()));
		return this.houtdateString;
	}
	public void setHoutdateString(String houtdateString) {
		this.houtdateString = houtdateString;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Double getMoney() {
		return money;
	}
	public void setMoney(Double money) {
		this.money = money;
	}

	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "OrderAdmin [oaid=" + oaid + ", uid=" + uid + ", fk=" + fk
				+ ", user=" + user + ", hid=" + hid + ", house=" + house
				+ ", ocondition=" + ocondition + ", hindate=" + hindate
				+ ", houtdate=" + houtdate + ", money=" + money
				+ ", hindateString=" + hindateString + ", houtdateString="
				+ houtdateString + "]";
	}
	public OrderAdmin(Integer oaid, Integer uid, User fk, User user,
			Integer hid, House house, String ocondition, Date hindate,
			Date houtdate, Double money, String hindateString,
			String houtdateString) {
		super();
		this.oaid = oaid;
		this.uid = uid;
		this.fk = fk;
		this.user = user;
		this.hid = hid;
		this.house = house;
		this.ocondition = ocondition;
		this.hindate = hindate;
		this.houtdate = houtdate;
		this.money = money;
		this.hindateString = hindateString;
		this.houtdateString = houtdateString;
	}
	
	
	
	
	
}
