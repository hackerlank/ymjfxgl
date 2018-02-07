package com.gqw.dao;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.User;

public interface LoginMapper {
	/**
	 * ��ѯ
	 * @param username
	 * @param password
	 * @param pwd
	 * @param thirdpwd
	 * @return
	 */
	public User login(@Param("username")String username,@Param("password")String password,@Param("pwd")String pwd,@Param("thirdpwd")String thirdpwd);
	
	/**
	 * ����һ������
	 * @param user
	 * @return
	 */
	public Boolean insertOrder(User user);
	
	public User personalMessage(@Param("id")int id);
}
