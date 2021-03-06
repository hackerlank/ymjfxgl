package com.gqw.service.caitutongji;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Caiwutongji;
import com.gqw.bean.Integral;
import com.gqw.bean.Jiangjinmingxi;

public interface CaiwutongjiService {

	public List<Caiwutongji> select_caiwutongji(@Param("loginid")int loginid,@Param("type")String type,
			@Param("start")int start,@Param("pageSize")int pageSize,
			@Param("date1")Date date1,@Param("date2")Date date2);
	public Integral select_integral(@Param("loginid")int loginid);
}
