package com.yc.biz;

import java.util.List;




import com.yc.bean.House;
import com.yc.bean.Peizhi;
public interface PeizhiBiz {

	/**
	 * 查询所有的Peizhi
	 * @return
	 */
	public List<Peizhi> getPeizhiList();
	/**
	 * 根据pzid查配置
	 * @return
	 */
	public Peizhi getPeizhiById(Integer pzid);
	
	public boolean addPeizhi( Peizhi peizhi);
	
	
	public boolean updatepeizhi(Peizhi peizhi);
	
	
	public boolean delPeizhi(int pzid);
}
