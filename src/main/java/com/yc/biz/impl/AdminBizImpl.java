package com.yc.biz.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Admin;
import com.yc.bean.House;
import com.yc.biz.AdminBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.JsonModel;

@Service
public class AdminBizImpl implements AdminBiz {

	@Resource(name = "baseDaoMybatisImpl")
	private BaseDao<Admin> baseDao;
	
	@Override
	public JsonModel<Admin> getAdminByPages(Map<String,Object> map) {
		List<Admin> list = baseDao.findAll(Admin.class, "getAdminByPages", map);
		int total = baseDao.getCount(Admin.class, "getCount");
		//System.out.println(total);
		JsonModel<Admin> jsonModel = new JsonModel<Admin>();
		jsonModel.setRows(list);
		//System.out.println(list.size());
		jsonModel.setTotal(total);
		jsonModel.setPages(Integer.parseInt(map.get("pages").toString()));
		jsonModel.setPagesize(Integer.parseInt(map.get("pagesize").toString()));
		//System.out.println(jsonModel);
		return jsonModel;
	}
	
	@Override
	public int getCount(){
		return (int) baseDao.getCount(Admin.class, "getCount");
	}
	
	@Override
	public Admin login(Admin admin) {
		List<Admin> list=baseDao.findAll(admin, "findAdmin");
		if(list!=null  &&list.size()>0){
			return list.get(0);
		}
		return null;
	}

	@Override
	public boolean reg(Admin admin) {
		baseDao.save(admin, "insertAdmin");
		return true;
	}
	
	@Override
	public boolean validate(Admin admin){
		int r = baseDao.getCount(admin, "isAdminExists");
		if(r>0){
			return true;
		}
		return false;
	}


//	@Override
//	public boolean isHouseOk(House house) {
//		User u = (User) baseDao.findOne(User.class,"findUserByuid",house.getUid());
//		if(house.getHname()!=null && house.getHprice()!=null && u != null ){
//			return true;
//		}
//		return false; 
//	}
//
//	@Override
//	public OrderAdmin findOrder(int oaid) {
//		OrderAdmin orderAdmin = (OrderAdmin) baseDao.findOne(OrderAdmin.class, "findOrderByoaid",oaid);
//		return orderAdmin;
//	}
//
//	@Override
//	public List<House> findAllHouse() {
//		List<House> list = baseDao.findAll(House.class, "findAllHouse");
//		return list;
//	}
}
