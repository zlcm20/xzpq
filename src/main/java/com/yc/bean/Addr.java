package com.yc.bean;

import java.io.Serializable;

public class Addr implements Serializable  {

	private static final long serialVersionUID = -2989372126877747133L;
	
	private Integer addrid;
	private String province;
	private String city;
	private String town;

	private String xxaddr;
	private String doornumber;


	public String getXxaddr() {
		return xxaddr;
	}
	public void setXxaddr(String xxaddr) {
		this.xxaddr = xxaddr;
	}
	
	public String getDoornumber() {
		return doornumber;
	}
	public void setDoornumber(String doornumber) {
		this.doornumber = doornumber;
	}
	public Addr(Integer addrid, String province, String city, String town,
			 String xxaddr, String doornumber) {
		super();
		this.addrid = addrid;
		this.province = province;
		this.city = city;
		this.town = town;
		
		this.xxaddr = xxaddr;
		this.doornumber = doornumber;
	}
	public Addr() {
		super();
	}
	public Integer getAddrid() {
		return addrid;
	}
	public void setAddrid(Integer addrid) {
		this.addrid = addrid;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getTown() {
		return town;
	}
	public void setTown(String town) {
		this.town = town;
	}
	@Override
	public String toString() {
		return "Addr [addrid=" + addrid + ", province=" + province + ", city="
				+ city + ", town=" + town + ", xxaddr=" + xxaddr
				+ ", doornumber=" + doornumber + "]";
	}


	

}
