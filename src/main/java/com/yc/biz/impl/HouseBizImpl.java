package com.yc.biz.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.House;
import com.yc.biz.HouseBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.JsonModel;

@Service
public class HouseBizImpl implements HouseBiz{

	@Resource(name="baseDaoMybatisImpl")
	private BaseDao baseDao;
	
	@Override
	public House getHouseBean(House house) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("hid", house.getHid()+"");
		List<House> list=this.baseDao.findAll(House.class, "findHouseCondition", map);
		if( list!=null&&list.size()>0){
	    	return list.get(0);
	    }else{
	    	return null;
	    }
	}
	
	@Override
	public House getAllHouseBean(House house) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("hid", house.getHid()+"");
		List<House> list=this.baseDao.findAll(House.class, "findAllHouse", map);
		if( list!=null&&list.size()>0){
	    	return list.get(0);
	    }else{
	    	return null;
	    }
	}

	@Override
	public boolean addHouse(House house) {
			baseDao.save(house,"saveHouse");
			return true;
	}

	@Override
	public boolean updateHouse(House house) {
			baseDao.update(house, "updateHouse");
			return true;
	}

	@Override
	public boolean delHouse(int hid) {
			baseDao.del(House.class,hid+"","delSingleHouse");
		    return true;
	}

	@Override
	public boolean delHouses(List<Integer> hids) {
		baseDao.del(House.class,hids,"delMutilHouse");
		return true;
	}

	@Override
	public JsonModel<House> searchHouse(Map<String, Object> map) {
		List<House> list=baseDao.findAll(House.class, "findHouseCondition", map);
		int total=baseDao.getCount(House.class, map,"findHouseConditionCount");
		JsonModel<House> jsonModel=new JsonModel<House>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		jsonModel.setPages(Integer.parseInt(map.get("pages").toString()));
		jsonModel.setPagesize(Integer.parseInt(map.get("pagesize").toString()));
		return jsonModel;
	}

	@Override
	public JsonModel<House> getAllHouse(Map<String, Object> map) {
		List<House> list=baseDao.findAll(House.class, "findAllHouse", map);
		int total=baseDao.getCount(House.class, map,"findHouseConditionCount");
		JsonModel<House> jsonModel=new JsonModel<House>();
		jsonModel.setRows(list);
		jsonModel.setTotal(total);
		jsonModel.setPages(Integer.parseInt(map.get("pages").toString()));
		jsonModel.setPagesize(Integer.parseInt(map.get("pagesize").toString()));
		return jsonModel;
	}

	@Override
	public House getHouseById(Integer hid) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("hid",hid+"");
		List<House> list=this.baseDao.findAll(House.class, "findHouseById", map);
		System.out.println(list);
		if( list!=null&&list.size()>0){
	    	return list.get(0);
	    }else{
	    	return null;
	    }
	}



	@Override
	public List<House> getHouse(String hcondition) {
		Map<String,String> map=new HashMap<String,String>();
		map.put("hcondition",hcondition);
		List list=this.baseDao.findAll(House.class, "findAllHouses", map);
		//System.out.println(list);
		if( list!=null&&list.size()>0){
	    	return list;
	    }else{
	    	return null;
	    }
	}
		@Override
		public List<House> getLiulan(String hcondition) {
			Map<String,String> map=new HashMap<String,String>();
			map.put("hcondition",hcondition);
			List list=this.baseDao.findAll(House.class, "findLiulan", map);
			//System.out.println(list);
			if( list!=null&&list.size()>0){
		    	return list;
		    }else{
		    	return null;
		    }	
	
			
			
	}

	@Override
	public boolean updatezt(Integer hid,String hcondition) {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("hid", hid);
		map.put("hcondition", hcondition);
		this.baseDao.update( House.class,"updatezt",map);
		return true;
	}

/**
 * 李子党
 */

	@Override
	public House findHouseInfo(Integer hid) {
		House house=baseDao.findOne(House.class,hid,"findHouseInfo");
		return house;
	}
	

}







































































