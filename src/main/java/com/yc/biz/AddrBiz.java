package com.yc.biz;

import java.util.List;

import com.yc.bean.Addr;
import com.yc.bean.House;
import com.yc.bean.Peizhi;
public interface AddrBiz {

	/**
	 * 查询所有的addr
	 * @return
	 */
	public List<Addr> getAddrList();
	
	
	
	/**
	 * 根据addrid查配置
	 * @return
	 */
	public Addr getAddrById(Integer addrid);
	
	
	public boolean addAddr( Addr addr);
	
	public boolean updateaddr(Addr addr);
	
	public boolean delAddr(int addrid);
}
