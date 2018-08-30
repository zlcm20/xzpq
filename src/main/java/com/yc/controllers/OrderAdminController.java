package com.yc.controllers;


import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.yc.bean.Admin;
import com.yc.bean.House;
import com.yc.bean.OrderAdmin;
import com.yc.biz.AdminBiz;
import com.yc.biz.OrderAdminBiz;
import com.yc.utils.JsonModel;


@Controller      //类注解  同时使用@Controller  和@ResponseBody
public class OrderAdminController {
	@Resource(name="orderAdminBizImpl")
	private OrderAdminBiz orderAdminBiz;
	
	@RequestMapping("showfkorder.action")
	@ResponseBody
	public JsonModel<OrderAdmin> showFkorderAllInfo(HttpServletRequest request,HttpServletResponse response,
				
					@RequestParam(name="order") String orderway,
					@RequestParam(name="sort") String order,
					@RequestParam(name="page") Integer page,
					@RequestParam(name="rows") Integer pagesize){

		JsonModel<OrderAdmin> jsonModel=orderAdminBiz.getFkOrderInfo();
		return jsonModel;
	}
	
	@RequestMapping("showfdorder.action")
	@ResponseBody
	public JsonModel<OrderAdmin> showFdorderAllInfo(HttpServletRequest request,HttpServletResponse response,
					@RequestParam(name="order") String orderway,
					@RequestParam(name="sort") String order,
					@RequestParam(name="page") Integer page,
					@RequestParam(name="rows") Integer pagesize){

		JsonModel<OrderAdmin> jsonModel=orderAdminBiz.getFdOrderInfo();
		return jsonModel;
	}
	
	@RequestMapping("showorder.action")
	@ResponseBody
	public JsonModel<OrderAdmin> showOrder(HttpServletRequest request,HttpServletResponse response,
					@RequestParam(name="ocondition") String ocondition,
					@RequestParam(name="order") String orderway,
					@RequestParam(name="sort") String order,
					@RequestParam(name="page") Integer page,
					@RequestParam(name="rows") Integer pagesize){
		Map<String,Object> map=new HashMap<String,Object>();
		Integer start=(page-1)*pagesize;
		map.put("start", start);
		map.put("pages", page);
		map.put("pagesize", pagesize);
		map.put("order", order);
		map.put("orderway", orderway);
		
		if(ocondition.equals("全部")){
			ocondition = null;
		}
		map.put("ocondition", ocondition);
		JsonModel<OrderAdmin> jsonModel=orderAdminBiz.getOrderByPages(map);
//		Gson g = new Gson();
//		String jsonString = g.toJson(jsonModel);
		return jsonModel;
	}
	
	@RequestMapping("reserve.action")
	@ResponseBody
	public boolean order_reserve(OrderAdmin orderAdmin,HttpSession session) throws ParseException{
		boolean result=false;
		Date beginDate=orderAdmin.getHindate();
		Date endDate=orderAdmin.getHoutdate();
		
		if(orderAdminBiz.DateType(orderAdmin)){	
		 result=orderAdminBiz.add(orderAdmin); 
		}
		return result;
		
	}
	
	@RequestMapping("reserve1.action")
	@ResponseBody
	public JsonModel order_reserve1(OrderAdmin orderAdmin,HttpSession session) throws ParseException{
		JsonModel jsonModel=new JsonModel();
		
		boolean result=false;
		
		Date beginDate=orderAdmin.getHindate();
		Date endDate=orderAdmin.getHoutdate();
        
		if(orderAdminBiz.DateType(orderAdmin)){
		    int days=orderAdminBiz.between_days(beginDate,endDate);
		    double hprice=(double) session.getAttribute("hprice");
		    
		    double paymoney=hprice*days;
		    orderAdmin.setMoney(paymoney);
		    jsonModel.setObj(orderAdmin);
		    jsonModel.setCode(1);
		}else{
			jsonModel.setCode(0);
		}
		return jsonModel;
		
	}
	@RequestMapping("order_back.action")
	public String house_reserve(){	
		return "/page/list";
	}
	
	
}
