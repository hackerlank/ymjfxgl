package com.gqw.controller.jiangjinmingxi;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gqw.bean.Jiangjinmingxi;
import com.gqw.service.jiangjinmingxi.JiangjinmingxiServiceImpl;
import com.gqw.util.PublicParameters;

@Controller
public class JiangjinmingxiController {
	
	@Autowired
	private JiangjinmingxiServiceImpl jiangjinmingxiServiceImpl;
	@RequestMapping("bonusDetails")
	public String showJiangjinmingxi(Map<String,Object> map,HttpServletRequest request,
			 int start,int pageSize,String loginid,
			 String shunxu,String type,String date1,String date2){
		if(date1!=null && (Object)date1!=""){
			PublicParameters.date1=PublicParameters.StringToDate(date1,"yyyy-MM-dd");
			PublicParameters.date2=PublicParameters.StringToDate(date2,"yyyy-MM-dd");
		}else{
			PublicParameters.date1=null;
			PublicParameters.date2=null;
		}
		List<Jiangjinmingxi> jiangjinmingxis=new ArrayList<Jiangjinmingxi>();
		jiangjinmingxis=jiangjinmingxiServiceImpl.select_jiangjinmingxi(PublicParameters.id, type, shunxu, (start-1)*pageSize, pageSize, PublicParameters.date1, PublicParameters.date2);
		if(jiangjinmingxis!=null){
			map.put("jiangjinmingxis", jiangjinmingxis);
			map.put("name", PublicParameters.username);
		}
		return "bonusDetails";
	}
}
