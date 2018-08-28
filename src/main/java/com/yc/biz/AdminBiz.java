package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.Admin;
import com.yc.bean.House;
import com.yc.bean.OrderAdmin;
import com.yc.utils.JsonModel;

public interface AdminBiz {
	
	
	//查看有几个管理员
	public int getCount();
	
	
	//查看管理员  分页
	public JsonModel<Admin> getAdminByPages(Map<String,Object> map);
	
	/**
	 * 管理员登录
	 * @param admin
	 * @return  Object
	 */
	public Admin login(Admin admin);
	/**
	 * 查看用户名是否已使用
	 * @param admin
	 * @return boolean <br />
	 * true 已使用
	 */
	public boolean validate(Admin admin);
	
	/**
	 * 注册  
	 * @param admin
	 * @return boolean <br/>
	 * true 注册成功
	 */
	public boolean reg(Admin admin);
	

}
