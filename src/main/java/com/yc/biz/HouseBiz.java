package com.yc.biz;

import java.util.List;
import java.util.Map;

import com.yc.bean.House;
import com.yc.utils.JsonModel;


public interface HouseBiz {
	
	/**
	 * 根据id查某个房子的信息
	 * @param house
	 * @return
	 */
	public House getHouseBean(House house);
	
	public House getAllHouseBean(House house);

	public boolean addHouse( House house);
	
	public boolean updateHouse(House house);
	
	public boolean delHouse(int hid);
	
	public boolean delHouses(List<Integer> hids);
	
	public JsonModel<House> searchHouse(Map<String,Object>map);
	
	public JsonModel<House> getAllHouse(Map<String,Object>map);
	
	//筛选城市
	public JsonModel<House> getHouseProvince(Map<String, Object> map);
	
	
	public House getHouseById(Integer hid);
	
	public List<House>  getHouse(String hcondition);

	public boolean updatezt(Integer hid,String hcondition);

	public List<House> getLiulan(String hcondition);
	
	
	
	
	/**
	 * 李子党
	 */
	public Map<String,Object> findHouseInfo(Integer hid);
	
	//个人信息
	List<House> getHouseAndUser(Integer uid);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
