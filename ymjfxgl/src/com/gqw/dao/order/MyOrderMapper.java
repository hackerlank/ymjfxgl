package com.gqw.dao.order;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Commodity;
import com.gqw.bean.Order;

public interface MyOrderMapper {
	/**
	 * 创建一条订单
	 * @param order
	 * @return
	 */
	public Boolean insertOrder(Order order);
	
	/**
	 * 条件分页查询
	 */
	public List<Order> conditionPageOrder(@Param("start")int start,@Param("pageSize")int pageSize,@Param("loginId")String loginId,@Param("ordernumber")String ordernumber,@Param("status")String status,@Param("date1")String date1,@Param("date2")String date2);
	/**
	 * 一共多少条订单
	 * @return
	 */
	public int countOrders();
}