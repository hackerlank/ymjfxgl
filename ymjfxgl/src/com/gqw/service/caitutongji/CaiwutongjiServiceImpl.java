package com.gqw.service.caitutongji;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gqw.bean.Caiwutongji;
import com.gqw.bean.Integral;
import com.gqw.bean.Jiangjinmingxi;
import com.gqw.dao.caiwutongji.CaiwutongjiMapper;
@Service
public class CaiwutongjiServiceImpl implements CaiwutongjiService {

	@Autowired
	private CaiwutongjiMapper mapper;
	public List<Caiwutongji> select_caiwutongji(int loginid, String type,
			int start, int pageSize, Date date1, Date date2) {
		// TODO Auto-generated method stub
		return mapper.select_caiwutongji(loginid, type, start, pageSize, date1, date2);
	}
	public Integral select_integral(int loginid) {
		// TODO Auto-generated method stub
		return mapper.select_integral(loginid);
	}

}
