package com.yc.utils;

import java.io.Serializable;
import java.util.List;



public class JsonModel<T> implements Serializable {

	private static final long serialVersionUID = -7445862318270892686L;
	private int code;
	private String msg;
	private Object obj;

	private Integer total;//总记录数
	private Integer pages;//当前为第几页
	private Integer pagesize;//每页几条
	private List<T> rows;//记录集合
	
	private String beginDate;

	



	public JsonModel(int code, String msg, Object obj, String beginDate) {
		super();
		this.code = code;
		this.msg = msg;
		this.obj = obj;
		this.beginDate = beginDate;
	}



	public JsonModel() {
		super();
	}



	public int getCode() {
		return code;
	}



	public void setCode(int code) {
		this.code = code;
	}



	public String getMsg() {
		return msg;
	}



	public void setMsg(String msg) {
		this.msg = msg;
	}



	public Object getObj() {
		return obj;
	}



	public void setObj(Object obj) {
		this.obj = obj;
	}



	public Integer getTotal() {
		return total;
	}



	public void setTotal(Integer total) {
		this.total = total;
	}



	public Integer getPages() {
		return pages;
	}



	public void setPages(Integer pages) {
		this.pages = pages;
	}





	public List<T> getRows() {
		return rows;
	}



	public void setRows(List<T> rows) {
		this.rows = rows;
	}



	public Integer getPagesize() {
		return pagesize;
	}



	public void setPagesize(Integer pagesize) {
		this.pagesize = pagesize;
	}



	@Override
	public String toString() {
		return "JsonModel [code=" + code + ", msg=" + msg + ", obj=" + obj
				+ ", total=" + total + ", pages=" + pages + ", pagesize="
				+ pagesize + ", rows=" + rows + ", beginDate=" + beginDate
				+ "]";
	}



	public String getBeginDate() {
		return beginDate;
	}



	public void setBeginDate(String beginDate) {
		this.beginDate = beginDate;
	}



	

	
	
}
