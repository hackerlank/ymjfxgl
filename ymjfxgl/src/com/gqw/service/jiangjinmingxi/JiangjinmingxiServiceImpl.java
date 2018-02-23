package com.gqw.service.jiangjinmingxi;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gqw.bean.Jiangjinmingxi;
import com.gqw.dao.jiangjinmingxi.JiangjinmingxiMapper;
@Service
public class JiangjinmingxiServiceImpl implements JiangjinmingxiService {

	@Autowired
	private JiangjinmingxiMapper jMapper;

	public List<Jiangjinmingxi> select_jiangjinmingxi(int loginid,
			String type, String shunxu, int start, int pageSize,
			@Param("date1")Date date1,@Param("date2")Date date2) {
		// TODO Auto-generated method stub
		return jMapper.select_jiangjinmingxi(loginid, type, shunxu, start, pageSize,date1,date2);
	}
	

}
