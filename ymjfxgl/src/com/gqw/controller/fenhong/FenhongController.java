package com.gqw.controller.fenhong;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.mapper.MapperFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gqw.bean.JifendianzibiOrder;
import com.gqw.bean.OrderPager;
import com.gqw.bean.User;
import com.gqw.dao.LoginMapper;
import com.gqw.service.fenhong.FenhongServiceImpl;
import com.gqw.util.PublicParameters;
@Controller
public class FenhongController {
	@Autowired
	private FenhongServiceImpl fenhongServiceImpl;
	@Autowired
	private LoginMapper loginMapper;
	 @RequestMapping("reinvestmentAndBonusList")
	 public String yanzhengreinvestmentAndBonusList(Map<String,Object> map,HttpServletRequest request,
			 String username,String password,String pwd,String thirdpwd,int start,int pageSize,String loginId,
			 String number,String date1,String date2){
		
		 if(date1!=null && (Object)date1!=""){
				PublicParameters.date1=PublicParameters.StringToDate(date1,"yyyy-MM-dd");
				PublicParameters.date2=PublicParameters.StringToDate(date2,"yyyy-MM-dd");
			}else{
				PublicParameters.date1=null;
				PublicParameters.date2=null;
			}
		 User user=loginMapper.login(PublicParameters.username, PublicParameters.password, pwd, thirdpwd);
		 if(user!=null){
			 if((Object)start==null){
				 start=1;
				 pageSize=9;
			 }
			 loginId=String.valueOf(PublicParameters.id);
			
			 List<JifendianzibiOrder> fenhongOrders=new ArrayList<JifendianzibiOrder>();
			 fenhongOrders= fenhongServiceImpl.conditionPageOrder((start-1)*pageSize, pageSize, loginId, number, PublicParameters.date1, PublicParameters.date2);
			 map.put("ordernumber", fenhongServiceImpl.selectLogin_username(loginId));
			 map.put("fenhongOrders", fenhongOrders);
			 //分页
			 OrderPager pager=new OrderPager();
			 pager.setDate1(PublicParameters.date1);
			 pager.setDate2(PublicParameters.date2);
			 pager.setPageIndex(start);
			 pager.setPrev(start-1);
			 pager.setNext(start+1);
			 int counts=fenhongServiceImpl.countsOrder(Integer.parseInt(loginId));
			 pager.setTotalPage(counts/pageSize==0?counts/pageSize:counts/pageSize+1);
			 map.put("pager", pager);
			 return "reinvestmentAndBonusList";
		 }else{
			 request.setAttribute("jspName", "reinvestmentAndBonusList");
			 return "secondPassword"; 
		 }
	 }
	 @RequestMapping("insertFenhongOrder")
	 public String insertFenhongOrder(String RvClass,int num){
		 JifendianzibiOrder fenhongOrder=new JifendianzibiOrder();
		 String number=fenhongServiceImpl.selectLogin_username(String.valueOf(PublicParameters.id));
		 fenhongOrder.setOrdernumber(number);
		 StringBuilder a=new StringBuilder(number);
		 a.append("-");
		 a.append(fenhongServiceImpl.countsOrder(PublicParameters.id)+1);
		 fenhongOrder.setNumber(a.toString());
		 fenhongOrder.setFutounumber(num);
		 fenhongOrder.setFutoumoney(100*num);
		 fenhongOrder.setAllfenhong(100*num);
		 fenhongOrder.setTruefenhong(90*num);
		 fenhongOrder.setLoginid(PublicParameters.id);
		 Date day=new Date();    
		 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 String now=df.format(day);
		 fenhongOrder.setTime(PublicParameters.StringToDate(now,"yyyy-MM-dd HH:mm:ss"));
		 fenhongOrder.setStatus("分红中");
		 Boolean bool=fenhongServiceImpl.insertJifendianzibi(fenhongOrder);
		 return "reinvestmentAndBonusList";
	 }
}
