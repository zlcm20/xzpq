package com.yc.biz;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.yc.bean.OrderAdmin;
import com.yc.utils.JsonModel;

public interface OrderAdminBiz {

	/**
	 * 带条件的分页查询
	 * @param map  条件
	 * @return JsonModel<OrderAdmin>
	 */
	public JsonModel<OrderAdmin> getOrderByPages(Map<String,Object> map);
	
	/**
	 * 关联查询订单所有信息      
	 * @return JsonModel<OrderAdmin>
	 */
	public JsonModel<OrderAdmin> getOrderAllInfo();
	/**
	 * 查询房东订单信息
	 * @return
	 */
	public JsonModel<OrderAdmin> getFdOrderInfo();
	/**
	 * 查询房客订单信息
	 * @return
	 */
	public JsonModel<OrderAdmin> getFkOrderInfo();
	
	/**
	 * 根据订单id  查订单
	 * @param oaid 订单id
	 * @return OrderAdmin
	 */
	public OrderAdmin findOrder(int oaid);
	
	
	/**
	 * 查 所有订单 
	 * @return List<OrderAdmin>
	 */
	public List<OrderAdmin> findAllOrder();
 	
	/**
	 * 添加订单
	 * @param orderAdmin 订单
	 * @return boolean <br/>
	 *   true 添加成功
	 */
	public boolean saveOrder(OrderAdmin orderAdmin);
	
	/**
	 * 添加订单
	 * @param orderAdmin
	 * @return
	 */
	 public boolean add(OrderAdmin orderAdmin);
	   
	   //计算日期之间的天数
	   public Integer between_days(Integer hid,Date beginDate,Date endDate);
	   
	   //判断日期是否符合格式
	   
	   public boolean DateType(OrderAdmin orderAdmin);
	   
       //根据uid查订单的所有信息
	   public List<OrderAdmin> FindAllInfoByUid(Integer uid);
	   //判断是否订单到期
	   public void isTime() throws ParseException;
	   //改变订单状态为已评论
	   public void changeCondition(Integer integer);
}
