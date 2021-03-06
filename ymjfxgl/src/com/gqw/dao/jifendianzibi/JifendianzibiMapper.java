package com.gqw.dao.jifendianzibi;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Integral;
import com.gqw.bean.JifendianzibiOrder;
import com.gqw.bean.Order;

public interface JifendianzibiMapper {
	/**
	 * 插入一条积分电子币订单
	 * @return
	 */
	public Boolean insertJifendianzibi(JifendianzibiOrder jifendianzibiOrder);
	/**
	 * 条件分页查询
	 * @param start
	 * @param pageSize
	 * @param loginId
	 * @param ordernumber
	 * @param status
	 * @param date1
	 * @param date2
	 * @return
	 */
	public List<JifendianzibiOrder> conditionPageOrder(@Param("start")int start,
			@Param("pageSize")int pageSize,@Param("loginId")String loginId,
			@Param("number")String number,@Param("date1")Date date1,
			@Param("date2")Date date2);
	/**
	 * 查询订单编号
	 * @param loginid
	 * @return
	 */
	public String selectLogin_username(String loginid);
	/**
	 * 查询一共多少订单
	 * @return
	 */
	public int countsOrder(@Param("loginid")int loginid);
	/**
	 * 我的账户
	 * @param loginid
	 * @return
	 */
	public Integral selectMycount(@Param("loginid")String loginid);
	
}
