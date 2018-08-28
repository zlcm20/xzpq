package com.yc.bean;

import java.io.Serializable;

public class Peizhi implements Serializable {

	private static final long serialVersionUID = -1325071813579740658L;
	
	private Integer pzid;
	private String bed;
	private String rent;
	private Integer shi;
	private Integer ting;
	private Integer chu;
	private Integer yangtai;
	private Integer toilet;
	private Integer floor;
	private String towards;
	public Integer getPzid() {
		return pzid;
	}
	public void setPzid(Integer pzid) {
		this.pzid = pzid;
	}
	public String getBed() {
		return bed;
	}
	public void setBed(String bed) {
		this.bed = bed;
	}
	public String getRent() {
		return rent;
	}
	public void setRent(String rent) {
		this.rent = rent;
	}
	public Integer getShi() {
		return shi;
	}
	public void setShi(Integer shi) {
		this.shi = shi;
	}
	public Integer getTing() {
		return ting;
	}
	public void setTing(Integer ting) {
		this.ting = ting;
	}
	public Integer getChu() {
		return chu;
	}
	public void setChu(Integer chu) {
		this.chu = chu;
	}
	public Integer getYangtai() {
		return yangtai;
	}
	public void setYangtai(Integer yangtai) {
		this.yangtai = yangtai;
	}
	public Integer getToilet() {
		return toilet;
	}
	public void setToilet(Integer toilet) {
		this.toilet = toilet;
	}
	public Integer getFloor() {
		return floor;
	}
	public void setFloor(Integer floor) {
		this.floor = floor;
	}
	public String getTowards() {
		return towards;
	}
	public void setTowards(String towards) {
		this.towards = towards;
	}
	public Peizhi(Integer pzid, String bed, String rent, Integer shi,
			Integer ting, Integer chu, Integer yangtai, Integer toilet,
			Integer floor, String towards) {
		super();
		this.pzid = pzid;
		this.bed = bed;
		this.rent = rent;
		this.shi = shi;
		this.ting = ting;
		this.chu = chu;
		this.yangtai = yangtai;
		this.toilet = toilet;
		this.floor = floor;
		this.towards = towards;
	}
	public Peizhi() {
		super();
	}
	@Override
	public String toString() {
		return "Peizhi [pzid=" + pzid + ", bed=" + bed + ", rent=" + rent
				+ ", shi=" + shi + ", ting=" + ting + ", chu=" + chu
				+ ", yangtai=" + yangtai + ", toilet=" + toilet + ", floor="
				+ floor + ", towards=" + towards + "]";
	}
	
	
	
}