package com.gqw.controller.caiwutongji;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gqw.bean.Caiwutongji;
import com.gqw.bean.Integral;
import com.gqw.bean.User;
import com.gqw.dao.LoginMapper;
import com.gqw.service.caitutongji.CaiwutongjiServiceImpl;
import com.gqw.service.tixian.TixianServiceImpl;
import com.gqw.util.PublicParameters;

@Controller
public class CaiwutongjiController {
	@Autowired
	private LoginMapper loginMapper;
	@Autowired
	private CaiwutongjiServiceImpl caiwutongjiServiceImpl;
	@RequestMapping("financeStatistics")
	 public String yanzhengfinanceStatistics(Map<String,Object> map,HttpServletRequest request,String username,
			 String password,String pwd,String thirdpwd,int start,int pageSize,String loginId,
			 String type,String date1,String date2){
		if(date1!=null && (Object)date1!=""){
			PublicParameters.date1=PublicParameters.StringToDate(date1,"yyyy-MM-dd");
			PublicParameters.date2=PublicParameters.StringToDate(date2,"yyyy-MM-dd");
		}else{
			PublicParameters.date1=null;
			PublicParameters.date2=null;
		}
		List<Caiwutongji> caiwutongjis=new ArrayList<Caiwutongji>();
		caiwutongjis=caiwutongjiServiceImpl.select_caiwutongji(PublicParameters.id, type,
				(start-1)*pageSize, pageSize,PublicParameters.date1, PublicParameters.date2);
		if(caiwutongjis!=null){
			map.put("caiwutongjis", caiwutongjis);
		}
		Integral account=caiwutongjiServiceImpl.select_integral(PublicParameters.id);
		map.put("account", account);
		 User user=loginMapper.login(PublicParameters.username, PublicParameters.password, pwd, thirdpwd);
		 if(user!=null){
			 map.put("user", user);
			 return "financeStatistics";
		 }else{
			 request.setAttribute("jspName", "financeStatistics");
			 return "secondPassword"; 
		 }
	 }
}
