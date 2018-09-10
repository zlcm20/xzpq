package com.yc.biz.impl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yc.bean.Admin;
import com.yc.bean.OrderAdmin;
import com.yc.biz.OrderAdminBiz;
import com.yc.dao.BaseDao;
import com.yc.utils.JsonModel;

@Service
public class OrderAdminBizImpl implements OrderAdminBiz {

	@Resource(name = "baseDaoMybatisImpl")
	private BaseDao<OrderAdmin> baseDao;
	
	
	@Override
	public JsonModel<OrderAdmin> getFdOrderInfo() {
		JsonModel<OrderAdmin> jm = new JsonModel<OrderAdmin>();
		List<OrderAdmin> list = baseDao.findAll(OrderAdmin.class, "getFdOrderInfo");
		System.out.println("999"+list);
		jm.setRows(list);
		jm.setTotal(list.size());
		return jm;
	}
	@Override
	public JsonModel<OrderAdmin> getFkOrderInfo() {
		JsonModel<OrderAdmin> jm = new JsonModel<OrderAdmin>();
		List<OrderAdmin> list = baseDao.findAll(OrderAdmin.class, "getFkOrderInfo");
		jm.setRows(list);
		jm.setTotal(list.size());
		return jm;
	}
	@Override
	public JsonModel<OrderAdmin> getOrderAllInfo() {
		JsonModel<OrderAdmin> jm = new JsonModel<OrderAdmin>();
		List<OrderAdmin> list = baseDao.findAll(OrderAdmin.class, "getOrderAllInfo");
		jm.setRows(list);
		jm.setTotal(list.size());
		return jm;
	}
	@Override
	public JsonModel<OrderAdmin> getOrderByPages(Map<String,Object> map) {
		List<OrderAdmin> list = baseDao.findAll(OrderAdmin.class, "getOrderByPages", map);
		int total = baseDao.getCount(OrderAdmin.class, "getCount");
//		System.out.println(total);
		JsonModel<OrderAdmin> jsonModel = new JsonModel<OrderAdmin>();
		jsonModel.setRows(list);
//		System.out.println(list.size());
		jsonModel.setTotal(total);
		jsonModel.setPages(Integer.parseInt(map.get("pages").toString()));
		jsonModel.setPagesize(Integer.parseInt(map.get("pagesize").toString()));
		//System.out.println(jsonModel);
		return jsonModel;
	}

	@Override
	public OrderAdmin findOrder(int oaid) {
		return baseDao.findOne(OrderAdmin.class, "findOrderByoaid", oaid);
	}

	@Override
	public List<OrderAdmin> findAllOrder() {
		return baseDao.findAll(OrderAdmin.class, "findAllOrder");
	}

	@Override
	public boolean saveOrder(OrderAdmin orderAdmin) {
		baseDao.save(orderAdmin, "saveOrder");
		return true;
	}
	

	/**
	 * 李子党
	 */

	@Override
	public boolean add(OrderAdmin orderAdmin) {
		System.out.println(orderAdmin);
		baseDao.save(orderAdmin,"addOrderAdmin");
		return true;
	}
	
	//两个日期之间的天数
	@Override
	public Integer between_days(Integer hid,Date beginDate, Date endDate) {
		//System.out.println("hid  00"+hid);
        Calendar cal = Calendar.getInstance();
        cal.setTime(beginDate);
        long time1 = cal.getTimeInMillis();
        cal.setTime(endDate);
        long time2 = cal.getTimeInMillis();      
        long between_days=(time2-time1)/(1000*3600*24);  
		
		
        return Integer.parseInt(String.valueOf(between_days));           
	}


	//判断日期是否符合格式
	public boolean DateType(OrderAdmin orderAdmin) {
			    boolean result=false;
			   
			    
			    Calendar cal = Calendar.getInstance();
			    SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    
			    Date now=cal.getTime();
			   
			    
			    String beginDateString=orderAdmin.getHindateString();
			    String endDateString=orderAdmin.getHoutdateString();
			    
			    try {
					System.out.println("现在的时间"+now+"\t"+((orderAdmin.getHindate()).after(now)));
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			    
				if(((beginDateString!=null)||(!"".equals(beginDateString)))&&((endDateString!=null)||(!"".equals(endDateString)))    ){
					try {
						if( (orderAdmin.getHindate()).before(orderAdmin.getHoutdate()) &&(   (orderAdmin.getHindate().after(now)))&&(orderAdmin.getHoutdate().after(now))   ){
		                result=true; 
		                
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				return result;
			}
	
		//根据uid查询所有的信息生成订单信息
		@Override
		public List<OrderAdmin> FindAllInfoByUid(Integer uid) {
	
			return baseDao.findAll(OrderAdmin.class, "findOrderInfo",uid);
		}
		
		
		@Override
		//判断订单上的日期是否到期
		public void isTime() throws ParseException{
			
			Calendar cal = Calendar.getInstance();
			cal.add(Calendar.DATE,0);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String now=sdf.format(cal.getTime());
	        Date now1=sdf.parse(now);
	        System.out.println(now1);
			baseDao.update(OrderAdmin.class,"updateorder",now1);
		}
		
		
		//在评论后把订单的状态改为已评论

		@Override
		public void changeCondition(Integer integer) {
			baseDao.update(OrderAdmin.class, "updateorder1", integer);
		}
			

}
