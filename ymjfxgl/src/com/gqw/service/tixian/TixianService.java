package com.gqw.service.tixian;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Integral;
import com.gqw.bean.Tixian;

public interface TixianService {
	
	public Boolean tixian(Tixian tixian);
	
	public List<Tixian> select_tixian(@Param("start")int start,
			@Param("pageSize")int pageSize,@Param("loginid")int loginid,
			@Param("date1")Date date1,
			@Param("date2")Date date2);
	
	public Float select_jiangjinbi(@Param("loginid")int loginid); 
	
	public Boolean update_jiangjinbi(@Param("loginid")int loginid,@Param("jiangjinbi")float jiangjinbi);
	
	public Integral select_integral(@Param("loginid")int loginid);
}
