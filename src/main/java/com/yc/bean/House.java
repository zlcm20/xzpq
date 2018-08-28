package com.yc.bean;

import java.io.Serializable;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class House implements Serializable {

	private static final long serialVersionUID = -474214978059639576L;
	
	private Integer hid;        //房屋id
	private Peizhi peizhi;//房屋配置
	private Integer pzid;
	private Addr addr;//地址id
	private Integer addrid;//地址id
	private String hname;  //房屋名字
	private User user;
	private Integer uid;   //用户id
	private  Double hprice;   //价格
	private Date hpubdate=new Date(new java.util.Date().getTime());      //日期
	private String hdescription;   //房屋具体描述
	private String hpic;      //图片
	private  Integer hfloorage;   //面积
	private  Integer hsum;  
	private String hcondition;
	private String hpubdateString;      //日期
	public House() {
		super();
	}

	public Integer getHid() {
		return hid;
	}


	public void setHid(Integer hid) {
		this.hid = hid;
	}


	public Peizhi getPeizhi() {
		return peizhi;
	}


	public void setPeizhi(Peizhi peizhi) {
		this.peizhi = peizhi;
	}


	public Integer getPzid() {
		return pzid;
	}


	public void setPzid(Integer pzid) {
		this.pzid = pzid;
	}


	public Addr getAddr() {
		return addr;
	}


	public void setAddr(Addr addr) {
		this.addr = addr;
	}


	public Integer getAddrid() {
		return addrid;
	}


	public void setAddrid(Integer addrid) {
		this.addrid = addrid;
	}


	public String getHname() {
		return hname;
	}


	public void setHname(String hname) {
		this.hname = hname;
	}


	public Integer getUid() {
		return uid;
	}


	public void setUid(Integer uid) {
		this.uid = uid;
	}


	public Double getHprice() {
		return hprice;
	}


	public void setHprice(Double hprice) {
		this.hprice = hprice;
	}


	public Date getHpubdate() throws ParseException {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.hpubdate=new Date(df.parse(this.hpubdateString).getTime());
		return this.hpubdate;
	}


	public void setHpubdate(Date hpubdate) {
		this.hpubdate = hpubdate;
		this.getHpubdateString();
	}


	public String getHdescription() {
		return hdescription;
	}


	public void setHdescription(String hdescription) {
		this.hdescription = hdescription;
	}


	public String getHpic() {
		return hpic;
	}


	public void setHpic(String hpic) {
		this.hpic = hpic;
	}


	public Integer getHfloorage() {
		return hfloorage;
	}


	public void setHfloorage(Integer hfloorage) {
		this.hfloorage = hfloorage;
	}


	public Integer getHsum() {
		return hsum;
	}


	public void setHsum(Integer hsum) {
		this.hsum = hsum;
	}


	public String getHcondition() {
		return hcondition;
	}


	public void setHcondition(String hcondition) {
		this.hcondition = hcondition;
	}





	public String getHpubdateString() {
		DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
		this.hpubdateString=df.format(new java.util.Date(this.hpubdate.getTime()));
		return this.hpubdateString;
	}


	public void setHpubdateString(String hpubdateString) {
		this.hpubdateString = hpubdateString;
	}






	@Override
	public String toString() {
		return "House [hid=" + hid + ", peizhi=" + peizhi + ", pzid=" + pzid
				+ ", addr=" + addr + ", addrid=" + addrid + ", hname=" + hname
				+ ", user=" + user + ", uid=" + uid + ", hprice=" + hprice
				+ ", hpubdate=" + hpubdate + ", hdescription=" + hdescription
				+ ", hpic=" + hpic + ", hfloorage=" + hfloorage + ", hsum="
				+ hsum + ", hcondition=" + hcondition + ", hpubdateString="
				+ hpubdateString + "]";
	}






	public House(Integer hid, Peizhi peizhi, Integer pzid, Addr addr,
			Integer addrid, String hname, User user, Integer uid,
			Double hprice, Date hpubdate, String hdescription, String hpic,
			Integer hfloorage, Integer hsum, String hcondition,
			String hpubdateString) {
		super();
		this.hid = hid;
		this.peizhi = peizhi;
		this.pzid = pzid;
		this.addr = addr;
		this.addrid = addrid;
		this.hname = hname;
		this.user = user;
		this.uid = uid;
		this.hprice = hprice;
		this.hpubdate = hpubdate;
		this.hdescription = hdescription;
		this.hpic = hpic;
		this.hfloorage = hfloorage;
		this.hsum = hsum;
		this.hcondition = hcondition;
		this.hpubdateString = hpubdateString;
	}






	public User getUser() {
		return user;
	}






	public void setUser(User user) {
		this.user = user;
	}








	
    
}
