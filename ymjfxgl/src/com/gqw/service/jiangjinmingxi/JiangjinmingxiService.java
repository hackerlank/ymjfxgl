package com.gqw.service.jiangjinmingxi;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Jiangjinmingxi;

public interface JiangjinmingxiService {
	public List<Jiangjinmingxi> select_jiangjinmingxi(@Param("loginid")int loginid,@Param("type")String type,
			@Param("shunxu")String shunxu,@Param("start")int start,@Param("pageSize")int pageSize,
			@Param("date1")Date date1,@Param("date2")Date date2);
}
