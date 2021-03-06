package com.gqw.dao.zhanghuzhuanzhang;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.gqw.bean.Zhanghuzhuanzhang;

public interface ZhuanzhangMapper {
	/**
	 * 查询所有转账记录
	 * @param loginid
	 * @param allaccount
	 * @param type1
	 * @param type2
	 * @param zhuanruzhanghao
	 * @param zhanghu
	 * @param start
	 * @param pageSize
	 * @param date1
	 * @param date2
	 * @return
	 */
	public List<Zhanghuzhuanzhang> select_zhuanzhangjilu(@Param("loginid")int loginid,
			@Param("allaccount")String allaccount,@Param("type1")String type1,@Param("type2")String type2,
			@Param("zhuanruzhanghao")String zhuanruzhanghao,
			@Param("zhanghu")String zhanghu,@Param("start")int start,@Param("pageSize")int pageSize,
			@Param("date1")Date date1,@Param("date2")Date date2);
}
