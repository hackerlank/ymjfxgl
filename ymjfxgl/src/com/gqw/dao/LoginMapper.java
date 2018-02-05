package com.gqw.dao;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.User;

public interface LoginMapper {
	/**
	 * 查询
	 * @param username
	 * @param password
	 * @param pwd
	 * @param thirdpwd
	 * @return
	 */
	public User login(@Param("username")String username,@Param("password")String password,@Param("pwd")String pwd,@Param("thirdpwd")String thirdpwd);
	
	/**
	 * 插入一条订单
	 * @param user
	 * @return
	 */
	public Boolean insertOrder(User user);
}
