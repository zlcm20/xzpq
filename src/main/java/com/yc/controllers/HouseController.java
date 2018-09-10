package com.yc.controllers;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.DDIV;
import com.yc.bean.Addr;
import com.yc.bean.House;
import com.yc.bean.OrderAdmin;
import com.yc.bean.Peizhi;
import com.yc.bean.User;
import com.yc.biz.AddrBiz;
import com.yc.biz.HouseBiz;
import com.yc.biz.PeizhiBiz;
import com.yc.utils.JsonModel;

//@RestController
@Controller
public class HouseController {
	@Resource(name = "houseBizImpl")
	private HouseBiz houseBiz;
	@Resource(name = "addrBizImpl")
	private AddrBiz addrBiz;
	@Resource(name = "peizhiBizImpl")
	private PeizhiBiz peizhiBiz;

	@RequestMapping("house_list.action")
	public String houseList(HttpServletRequest request, HttpSession session,
			@RequestParam(name = "pages") Integer pages,
			@RequestParam(name = "pagesize") Integer pagesize) {
		Map<String, Object> map = new HashMap<String, Object>();
		Integer start = (pages - 1) * pagesize;
		map.put("start", start);
		map.put("pages", pages);
		map.put("pagesize", pagesize);	
		map.put("hcondition", "已审核");
		if( session.getAttribute("city")!=null){
		String city=(String) session.getAttribute("city");
		map.put("city", city);
		}
		JsonModel jsonModel = houseBiz.searchHouse(map);
		request.setAttribute("jsonModel", jsonModel);
		session.setAttribute("list", jsonModel.getRows());
		
		return "/page/showList";
	}

	@RequestMapping("/user/house_toAdd.action")
	public String houseToAdd() {
		return "/page/add";
	}

	@RequestMapping("/user/house_toUpdate.action")
	public String houseToUpdate(@RequestParam Integer hid,
		HttpSession session, HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		House house=houseBiz.getHouseById(hid);
		Peizhi peizhi=peizhiBiz.getPeizhiById(house.getPzid());
	    session.setAttribute("peizhi", peizhi);
	    Addr addr=addrBiz.getAddrById(house.getAddrid());
	    session.setAttribute("addr", addr);
		// 查出hid代表 House对象
		List<House> list = (List<House>) session.getAttribute("list");
		for (House h : list) {
			if (h.getHid().intValue() == hid.intValue()) {
				session.setAttribute("house", h);
				break;
			}
		}
		return "/page/update";
	}

	@RequestMapping("/user/house_doUpdate.action")
	public String houseDoUpdate(HttpSession session,
			Addr addr,
			House house,
			Peizhi peizhi ,HttpServletRequest request) {
		User user = (User) session.getAttribute("user");
		boolean resultaddr = addrBiz.updateaddr(addr);
		boolean resultpeizhi = peizhiBiz.updatepeizhi(peizhi);
		house.setUid(user.getUid());
		house.setAddr(addr);
		house.setPeizhi(peizhi);
		boolean resulthouse = houseBiz.updateHouse(house);
		return "/page/list";
		
	}

	@RequestMapping("/user/house_doAdd.action")
	public String houseDoAdd(House house, Addr addr, Peizhi peizhi,
			HttpSession session) {
		String[] hpics = house.getHpic().split(" ");
		String hpic = hpics[2].split("=")[1];
		hpic = hpic.substring(1, hpic.length()-1);
		house.setHpic(hpic);
		User user = (User) session.getAttribute("user");
		boolean resultaddr = addrBiz.addAddr(addr);
		boolean resultpeizhi = peizhiBiz.addPeizhi(peizhi);
		house.setUid(user.getUid());
		house.setAddr(addr);
		house.setPeizhi(peizhi);
		boolean resulthouse = houseBiz.addHouse(house);
		return "/page/house";
	}

	
	@RequestMapping("/user/house_del.action")
	@ResponseBody
	public JsonModel houseDel(@RequestParam Integer hid,HttpSession session) {
		JsonModel jsonModel = new JsonModel();
		User user = (User) session.getAttribute("user");
		House house=houseBiz.getHouseById(hid);
		boolean peizhi=peizhiBiz.delPeizhi(house.getPzid());
	    boolean addr=addrBiz.delAddr(house.getAddrid());
		boolean r = houseBiz.delHouse(hid);
		if (r && peizhi   &&addr ) {
			jsonModel.setCode(1);
		} else {
			jsonModel.setCode(0);
		}
		return jsonModel;
	}
	
	
	
	@RequestMapping("/house_detail.action/{hid}")
	public String houseToShow(@PathVariable Integer hid,
			HttpSession session, HttpServletRequest request) {
		if(session.getAttribute("user")!=null  &&"".equals(session.getAttribute("user"))){
			System.out.println("阿斯顿法国会籍考虑");
		User user = (User) session.getAttribute("user");
		}
		House house=houseBiz.getHouseById(hid);
		Peizhi peizhi=peizhiBiz.getPeizhiById(house.getPzid());
	    session.setAttribute("peizhi", peizhi);
	    Addr addr=addrBiz.getAddrById(house.getAddrid());
	    session.setAttribute("addr", addr);
		// 查出hid代表 House对象
		List<House> list = (List<House>) session.getAttribute("list");
		for (House h : list) {
			if (h.getHid().intValue() == hid.intValue()) {
				session.setAttribute("house", h);
				break;
			}
		}
		return "/page/show";
	}

	
	@RequestMapping("/house_show.action")
	public String houseShow() {
		return "/page/show";
	}
	
	
//	
//	@RequestMapping("/house_dingdan.action")
//	public String houseDingdan(Integer uid,
//			HttpSession session, HttpServletRequest request) {
//		//System.out.println("uid:"+uid);
//		User user = (User) session.getAttribute("user");
//		return "/page/dingdan";
//	}
	
	@RequestMapping("/shenhe.action")
	@ResponseBody
	public JsonModel<House> shenhe(){
		String hcondition="待审核";
		List<House> house=houseBiz.getHouse(hcondition);
		JsonModel<House> jsonModel = new JsonModel<House>();
		jsonModel.setRows(house);
		jsonModel.setTotal(house.size());
		return jsonModel;
	}
	
	@RequestMapping("/liulan.action")
	@ResponseBody
	public JsonModel<House> liulan(String hcondition){
		List<House> house=houseBiz.getLiulan(hcondition);
		JsonModel<House> jsonModel = new JsonModel<House>();
		jsonModel.setRows(house);
		jsonModel.setTotal(house.size());
		return jsonModel;
	}
	
	@RequestMapping("/zhuangtai.action")
	@ResponseBody
	public JsonModel<House> zhuangtai(Integer hid,String hcondition){
		JsonModel jsonModel=new JsonModel();
		boolean r=houseBiz.updatezt(hid,hcondition);
		if( r  ){
			if(hcondition.equals("已审核")){
			jsonModel.setCode(1);
			}else if(hcondition.equals("未通过")){
				jsonModel.setCode(1);
			}
		}else{
			jsonModel.setCode(0);
			jsonModel.setMsg("更新状态失败");
		}
		return jsonModel;
	}
	
	
	
    @RequestMapping("/house_reserve.action")
	public String house_reserve(Integer hid,HttpSession session,HttpServletRequest request ) throws Exception{
		session.setAttribute("hid", hid);
		Map<String,Object> map=houseBiz.findHouseInfo(hid);//根据hid查询房东和房子的信息
		House house=(House) map.get("house");
		
		List<OrderAdmin> list=(List<OrderAdmin>) map.get("oa");
		
		List<Object> dates = new ArrayList<Object>();
		Date din=null;
		Date dout = null;
		Date dio = null;
		for( OrderAdmin oa:list){
			din=oa.getHindate();
			dout = oa.getHoutdate();
			int days  = dout.getDate() -din.getDate();
			dates.add("'"+ din +"'");
			for(int i=1;i<days;i++){
				din.setDate(din.getDate()+1);
				dates.add("'"+ din +"'");
			}

			
		}
		request.setAttribute("dates", dates);
		
		session.setAttribute("hprice",house.getHprice() );
		session.setAttribute("oalist", list);
		request.setAttribute("house", house);
		
		return "/page/reserve";

	}
	
    //筛选城市
    @RequestMapping("/shaixuan.action")
	public ModelAndView xianshi(String city,HttpServletRequest request,HttpSession session) {
    	ModelAndView mav=new ModelAndView();
    	//System.out.println("444"+city);
    	if(city!=null){
    	session.setAttribute("city", city);
    	}
    	mav.setViewName("page/list");
		return mav;
	}
    

  	@RequestMapping("/house_personcenter.action")
  	public String houseToDingdan( Integer uid,
  			HttpSession session, HttpServletRequest request) {
  		User user = (User) session.getAttribute("user");
  		List<House> list=  houseBiz.getHouseAndUser(uid);
  		for (House house : list) {
  				session.setAttribute("house", house);
  			}
  		return "/page/person";
  	}
  	
  	
	
	
}
