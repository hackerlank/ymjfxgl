package com.gqw.dao.order;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Order;

public interface MyOrderMapper {
	/**
	 * 创建一条订单
	 * @param order
	 * @return
	 */
	public Boolean insertOrder(@Param("Order")Order order);
}
